package com.seoulauction.renewal.component;

import com.seoulauction.renewal.domain.CommonMap;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.concurrent.atomic.AtomicReference;

/**
 * 환율 정보 가져오기
 */
@Log4j2
@Component
public class CurrencyDataManager {

    private final static String BASE_URL = "http://www.smbs.biz";

    /**
     *
     * @param date ( ex - 2020-08-05 )
     * @return jsonMap
     */
    public CommonMap getCurrency(String date){

        WebClient webClient = WebClient.builder()
                .baseUrl(BASE_URL)
                .build();

        String result = webClient
                .get()
                .uri("/Flash/TodayExRate_flash.jsp?tr_date="+date)
                .retrieve()
                .onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.error(RuntimeException::new))
                .onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.error(RuntimeException::new))
                .bodyToMono(String.class).block();

        // 1차작업  -> 필요한 데이터만 쓰기위해 데이터를 가공 ( 쓸모없는 데이터를 치환.)
        String regexp = "s|\\?test[0-9]*=test||g";
        String regexp1 = "s|&updown[0-9]*=[0-9]||g";
        String regexp2 = "s|&diff[0-9]*=([0-9]*\\.?[0-9]*)?||g";

        String res = result.replaceAll(regexp,"").replaceAll(regexp1,"").replaceAll(regexp2,"");

        // 2차작업 -> JSON 화 시키기.
        String trimStr = res.trim();

        AtomicReference<String> key = new AtomicReference<>("");
        AtomicReference<String> value = new AtomicReference<>("");

        AtomicReference<Boolean> tokenEqules = new AtomicReference<>(false);
        AtomicReference<Boolean> tokenAmpersand = new AtomicReference<>(false);
        AtomicReference<Boolean> tokenAmpersand2 = new AtomicReference<>(false);

        CommonMap jsonMap = new CommonMap();

        trimStr.substring(1).codePoints().mapToObj(c -> (char) c).forEach(ch ->{

            // tokenEqules = true 가 아닐때까지 key 값을만듬.
            if(!tokenEqules.get()){
                if(ch != '='){
                    key.updateAndGet(v -> v + ch);
                // = 를 만난경우 tokenEqules 를 true 로 설정.
                } else{
                    tokenEqules.set(true);
                }
            }

            //첫번째 & 를 만난경우.
            if(ch == '&' && !tokenAmpersand.get()){
                tokenAmpersand.set(true);
            //두번째 & 을 만난 경우.
            } else if (ch == '&' && tokenAmpersand.get() ){
                tokenAmpersand2.set(true);
            }

            // = 를 만났고 &를 만나기전.
            if(tokenEqules.get() && !tokenAmpersand.get() && !tokenAmpersand2.get() && ch != '=' ){
                value.updateAndGet(k -> k + ch);
            }

            //모든 토큰 값을 만난경우 key 와 value 가 다 만들어졌다고 가정. ( 초기화 )
            if(tokenEqules.get() && tokenAmpersand.get() && tokenAmpersand2.get() ){
                jsonMap.put(key.get() , value.get());
                tokenEqules.set(false);
                tokenAmpersand.set(false);
                tokenAmpersand2.set(false);
                key.set("");
                value.set("");
            }
        });

        return jsonMap;
    }


}
