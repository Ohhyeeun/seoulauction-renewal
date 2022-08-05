package com.seoulauction.renewal.component;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

/**
 * 환율 정보 가져오기
 */
@Log4j2
@Component
public class CurrencyDataManager {

    private final static String BASE_URL = "http://www.smbs.biz";

    //tr_date=2022-08-05


    /**
     *
     * @param date ( ex - 2020-08-05 )
     * @return
     */
    public String getCurrency(String date){


        WebClient webClient = WebClient.builder()
                .baseUrl(BASE_URL)
                .build();

        String result = webClient
                .get()
                .uri("/Flash/TodayExRate_flash.jsp?tr_date=2022-08-05")
                .retrieve()
                .onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.error(RuntimeException::new))
                .onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.error(RuntimeException::new))
                .bodyToMono(String.class).block();

        log.info("result :{}" , result);


        //필요한 데이터만 쓰기위해 데이터를 가공 ( 쓸모없는 데이터를 없앤다.)
        String regexp = "s|\\?test[0-9]*=test||g";
        String regexp1 = "s|&updown[0-9]*=[0-9]||g";
        String regexp2 = "s|&diff[0-9]*=([0-9]*\\.?[0-9]*)?||g";

        String res = result.replaceAll(regexp,"").replaceAll(regexp1,"").replaceAll(regexp2,"");

        log.info("res : {}" , res);


        return result;
    }


}
