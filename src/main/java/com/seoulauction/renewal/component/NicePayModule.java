package com.seoulauction.renewal.component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.auth.Cryptography;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import kr.co.nicevan.nicepay.adapter.web.NicePayHttpServletRequestWrapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;

@Component
@Log4j2
public class NicePayModule {

    @Value("${nicepay.merchant.key}")
    String nicePaymerchantKey;

    private final String NICE_PAY_BASE_URL  = "https://webapi.nicepay.co.kr";
    private final String AUTH_SUCCESS_CODE  = "0000";
    private final String CONFIRM_FAIE_CODE  = "9999";

    //결제 요청. ( 타임아웃난경우 망취소까지 진행.)
    public CommonMap payProcess(HttpServletRequest request){

        NicePayHttpServletRequestWrapper wrapper = new NicePayHttpServletRequestWrapper(request);

        String authCode = wrapper.getParameter("AuthResultCode");
        CommonMap resultMap = new CommonMap();

        //인증요청이 성공인경우 승인 요청 고고
        if(AUTH_SUCCESS_CODE.equals(authCode)) {

            String signData = Cryptography.encrypt(
                    wrapper.getParameter("AuthToken")
                            + wrapper.getParameter("MID")
                            + wrapper.getParameter("Amt")
                            + wrapper.getParameter("EdiDate")
                            + nicePaymerchantKey);

            WebClient webClient = WebClient.builder()
                    .baseUrl(NICE_PAY_BASE_URL)
                    .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_FORM_URLENCODED_VALUE)
                    .build();

            MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
            formData.add("TID", wrapper.getParameter("TxTid"));
            formData.add("AuthToken", wrapper.getParameter("AuthToken"));
            formData.add("MID", wrapper.getParameter("MID"));
            formData.add("Amt", wrapper.getParameter("Amt"));
            formData.add("EdiDate", wrapper.getParameter("EdiDate"));
            formData.add("SignData", signData);

            String result = webClient
                    .post()
                    .uri("/webapi/pay_process.jsp")
                    .body(BodyInserters
                            .fromFormData(formData))
                    .retrieve()
                    .onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.error(RuntimeException::new))
                    .onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.error(RuntimeException::new))
                    .bodyToMono(String.class).block();

            try {
                resultMap = new ObjectMapper().readValue(result, CommonMap.class);
                //타임아웃 인경우 취소망 고고
                if(CONFIRM_FAIE_CODE.equals(resultMap.getString("ResultCode"))){
                    //망취소 파라미터 ㄱㄱ
                    formData.add("NetCancel","1");
                    result = webClient
                                .post()
                                .uri("/webapi/cancel_process.jsp")
                                .body(BodyInserters
                                        .fromFormData(formData))
                                .retrieve()
                                .onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.error(RuntimeException::new))
                                .onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.error(RuntimeException::new))
                                .bodyToMono(String.class).block();

                    resultMap = new ObjectMapper().readValue(result, CommonMap.class);
                    //망취소 후 오류 처리.
                    String resultMsg = resultMap.getString("ResultMsg");
                    throw new SAException(resultMsg);
                } else {
                    //결제 성공 여부 검사!
                    String resultCode = resultMap.getString("ResultCode");
                    String payMethod = resultMap.getString("PayMethod");
                    boolean paySuccess = false;
//
                    if(payMethod != null){
                        if(payMethod.equals("CARD")){
                            if(resultCode.equals("3001")) paySuccess = true; // CARD(Success:3001)
                        }else if(payMethod.equals("BANK")){
                            if(resultCode.equals("4000")) paySuccess = true; // BANK Transfer(Success:4000)
                        }else if(payMethod.equals("CELLPHONE")){
                            if(resultCode.equals("A000")) paySuccess = true; // Phone bill (Success:A000)
                        }else if(payMethod.equals("VBANK")){
                            if(resultCode.equals("4100")) paySuccess = true; // Virtual bank account (Success:4100)
                        }else if(payMethod.equals("SSG_BANK")){
                            if(resultCode.equals("0000")) paySuccess = true; // SSG bank account(Success:0000)
                        }else if(payMethod.equals("CMS_BANK")){
                            if(resultCode.equals("0000")) paySuccess = true; // CMS bank account(Success:0000)
                        }
                    }
                    //오류 처리 ㄱㄱ
                    if(!paySuccess){
                        String resultMsg = resultMap.getString("ResultMsg");
                        throw new SAException(resultMsg);
                    }
                }

            } catch (JsonProcessingException e) {
                e.printStackTrace();
                throw new SAException(e.getMessage());
            }
        } else {
            throw new SAException("인증요청이 올바르지 않습니다.");
        }

        return resultMap;
    }
}
