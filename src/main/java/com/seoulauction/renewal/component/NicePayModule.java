package com.seoulauction.renewal.component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.auth.Cryptography;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.InternalServerException;
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
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Component
@Log4j2
public class NicePayModule {

    @Value("${nicepay.merchant.key}")
    String nicePaymerchantKey;

    private final String NICE_PAY_BASE_URL  = "https://webapi.nicepay.co.kr";
    private final String AUTH_SUCCESS_CODE  = "0000";
    private final String CONFIRM_FAIL_CODE  = "9999";

    //결제 요청. ( 타임아웃난경우 망취소까지 진행.)
    public CommonMap payProcess(HttpServletRequest request){

        NicePayHttpServletRequestWrapper wrapper = new NicePayHttpServletRequestWrapper(request);

        String authCode = wrapper.getParameter("AuthResultCode");
        CommonMap resultMap;


        log.info(wrapper.getMapToString());


        String eDiDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        //인증요청이 성공인경우 승인 요청 고고
        if(AUTH_SUCCESS_CODE.equals(authCode)) {

            String signData = Cryptography.encrypt(
                    wrapper.getParameter("AuthToken")
                            + wrapper.getParameter("MID")
                            + wrapper.getParameter("Amt")
                            + eDiDate
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
            formData.add("EdiDate", eDiDate);
            formData.add("SignData", signData);
            formData.add("MallReserved", wrapper.getParameter("ReqReserved"));

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
                if(CONFIRM_FAIL_CODE.equals(resultMap.getString("ResultCode"))){
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
            throw new InternalServerException("인증요청이 올바르지 않습니다.");
        }

        return resultMap;
    }

    public CommonMap receiptProcess(HttpServletRequest request){
        CommonMap resultMap = new CommonMap();
        try {
            String eDiDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

            String moid = request.getParameter("MOID");

            String receiptAmt = request.getParameter("Amt");

            String MID = request.getParameter("MID");

            String signData = Cryptography.encrypt(MID
                            + receiptAmt
                            + eDiDate
                            + moid
                            + nicePaymerchantKey);

            String TID = getReceiptTID(MID);

            MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
            formData.add("TID", TID);
            formData.add("MID", MID);
            formData.add("EdiDate", eDiDate);
            formData.add("Moid", moid);
            formData.add("ReceiptAmt", receiptAmt);
            log.info(request.getParameter("GoodsName"));
            log.info(new String(request.getParameter("GoodsName").getBytes(), "euc-kr"));
            log.info(URLEncoder.encode(request.getParameter("GoodsName"), "euc-kr"));

            formData.add("GoodsName", URLEncoder.encode(request.getParameter("GoodsName"), "euc-kr"));
            formData.add("SignData", signData);
            formData.add("ReceiptType", String.valueOf(request.getAttribute("rcpt_type")));
            formData.add("ReceiptTypeNo", String.valueOf(request.getAttribute("rcpt_type_no")));
            formData.add("ReceiptSupplyAmt", "0");
            formData.add("ReceiptVAT", "0");
            formData.add("ReceiptServiceAmt", "0");
            formData.add("ReceiptTaxFreeAmt", "0");
            formData.add("CharSet", "utf-8");

            WebClient webClient = WebClient.builder()
                    .baseUrl(NICE_PAY_BASE_URL)
                    .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_FORM_URLENCODED_VALUE)
                    .build();

            String result = webClient
                    .post()
                    .uri("/webapi/cash_receipt.jsp")
                    .body(BodyInserters
                            .fromFormData(formData))
                    .retrieve()
                    .onStatus(HttpStatus::is4xxClientError, clientResponse -> Mono.error(RuntimeException::new))
                    .onStatus(HttpStatus::is5xxServerError, clientResponse -> Mono.error(RuntimeException::new))
                    .bodyToMono(String.class).block();

            resultMap = new ObjectMapper().readValue(result, CommonMap.class);

            String resultCode = resultMap.getString("ResultCode");
            if(!resultCode.equals("7001")) {
                throw new SAException("["+resultCode+"] "+resultMap.getString("ResultMsg"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultMap;
    }

    public String connectToServer(String data, String reqUrl) throws Exception {
        HttpURLConnection conn 		= null;
        BufferedReader resultReader = null;
        PrintWriter pw 				= null;
        URL url 					= null;

        int statusCode = 0;
        StringBuffer recvBuffer = new StringBuffer();
        try{
            url = new URL(reqUrl);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(25000);
            conn.setDoOutput(true);

            pw = new PrintWriter(conn.getOutputStream());
            pw.write(data);
            pw.flush();

            statusCode = conn.getResponseCode();
            resultReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "euc-kr"));
            for(String temp; (temp = resultReader.readLine()) != null;){
                recvBuffer.append(temp).append("\n");
            }

            if(!(statusCode == HttpURLConnection.HTTP_OK)){
                throw new Exception();
            }

            return recvBuffer.toString().trim();
        }catch (Exception e){
            return "9999";
        }finally{
            recvBuffer.setLength(0);

            try{
                if(resultReader != null){
                    resultReader.close();
                }
            }catch(Exception ex){
                resultReader = null;
            }

            try{
                if(pw != null) {
                    pw.close();
                }
            }catch(Exception ex){
                pw = null;
            }

            try{
                if(conn != null) {
                    conn.disconnect();
                }
            }catch(Exception ex){
                conn = null;
            }
        }
    }
    private String getReceiptTID(String MID) {
        //TID(30byte) = MID + 지불수단(현금영수증) + 매체구분(일반) + 시간정보(yyMMddHHmmss) + 랜덤(4byte)
        StringBuilder result = new StringBuilder(MID).append("04").append("01")
                .append(new SimpleDateFormat("yyMMddHHmmss").format(new Date()))
                .append(String.format("%04d", new Random().nextInt(10000)));
        return result.toString();
    }
}
