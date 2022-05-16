package com.seoulauction.renewal.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.auth.Cryptography;
import com.seoulauction.renewal.common.PaymentType;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.NicePayModule;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.PaymentService;
import kr.co.nicevan.nicepay.adapter.web.NicePayHttpServletRequestWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.collections4.MapUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_PAYMENT)
public class PaymentController {

    @Value("${nicepay.merchant.key}")
    String nicePaymerchantKey;

    @Value("${nicepay.merchant.id}")
    String nicePayMerchantId;

    @Value("${nipcepay.mobile.base.return.url}")
    String nicePayMobileBaseReturnUrl;

    private final PaymentService paymentService;


    @GetMapping("/member")
    public String paymentMember(HttpServletRequest request , Locale locale) {

        String goodsName = "정회원"; 					// 결제상품명
        Integer price = 1234; 						// 결제상품금액
        String moid = "mnoid1234567890"; 			// 상품주문번호
        String returnURL = nicePayMobileBaseReturnUrl + "/payment/memberResult"; // 결과페이지(절대경로) - 모

        String name = "김융훈"; 						// 구매자명
        String tel = "01000000000"; 				// 구매자연락처
        String email = "happy@day.co.kr"; 			// 구매자메일주소
        String address  = "(02123) 경기도 부천시 양지로 234-38";

        String eDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String signData = Cryptography.encrypt(eDate + nicePayMerchantId + price + nicePaymerchantKey);

        /* attribute */
        request.setAttribute("goodsName" , goodsName);
        request.setAttribute("price" , price);
        request.setAttribute("de_price" , SAConst.DECIMAL_FORMAT.format(price));
        request.setAttribute("moid" , moid);
        request.setAttribute("returnURL" , returnURL);

        request.setAttribute("name" , name);
        request.setAttribute("tel" , tel);
        request.setAttribute("email" , email);
        request.setAttribute("address" , address);

        request.setAttribute("mKey" , nicePaymerchantKey);
        request.setAttribute("mId" , nicePayMerchantId);
        request.setAttribute("signData" , signData);
        request.setAttribute("eDate" , eDate);
        request.setAttribute("signData" , signData);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentMember" , locale);
    }

    @PostMapping("/memberResult")
    public String payResult(HttpServletRequest request , Locale locale) {

        log.info("request : {}" , request.getParameterMap());

        paymentService.paymentProcess(PaymentType.CUST_REGULAR , request);

        String address  = "(02123) 경기도 부천시 양지로 234-38";
        request.setAttribute("address" , address);
        request.setAttribute("name", request.getParameter("BuyerName"));
        request.setAttribute("tel" , request.getParameter("BuyerTel"));
        request.setAttribute("method" , request.getParameter("PayMethod"));
        request.setAttribute("price" , request.getParameter("Amt"));
        request.setAttribute("dePrice" , SAConst.DECIMAL_FORMAT.format(Integer.parseInt(request.getParameter("Amt"))));

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentMemberResult" , locale);
    }

    @GetMapping("/payRequest")
    public String payRequest(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "/example/payRequest_utf" , locale);
    }

    @GetMapping("/paymentAcademy/{academy_no}")
    public String paymentAcademy(@PathVariable("academy_no") int academy_no, HttpServletRequest request, Locale locale) {
        // select cust
        // select academy

        String merchantKey 		= nicePaymerchantKey; // 상점키
        String merchantID 		= nicePayMerchantId; 				// 상점아이디
        String goodsName 		= "나이스페이"; 					// 결제상품명
        int price 			= 1100; 						// 결제상품금액
        String buyerName 		= "김선진"; 						// 구매자명
        String buyerTel 		= "01033720384"; 				// 구매자연락처
        String buyerEmail 		= "sjk@seoulauction.com"; 			// 구매자메일주소
        String moid 			= "mnoid1234567890"; 			// 상품주문번호
        String returnURL 		= "https://re-dev.seoulauction.com/payment/paymentTuitionProcess"; // 결과페이지(절대경로) - 모바일 결제창 전용

        //TODO: 과세, 면세 확인
        int vat_price = (int) (price / 1.1);
        int vat = price - vat_price;
        int no_vat_price = 0;

        /*
         *******************************************************
         * <해쉬암호화> (수정하지 마세요)
         * SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
         *******************************************************
         */
        DataEncrypt sha256Enc 	= new DataEncrypt();
        String ediDate 			= getyyyyMMddHHmmss();
        String hashString 		= sha256Enc.encrypt(ediDate + merchantID + price + merchantKey);

        request.setAttribute("merchantKey", merchantKey);
        request.setAttribute("merchantID", merchantID);
        request.setAttribute("goodsName", goodsName);
        request.setAttribute("price", price);
        request.setAttribute("vat_price", vat_price);
        request.setAttribute("vat", vat);
        request.setAttribute("academy_no", academy_no);
        request.setAttribute("no_vat_price", no_vat_price);
        request.setAttribute("buyerName", buyerName);
        request.setAttribute("buyerTel", buyerTel);
        request.setAttribute("buyerEmail", buyerEmail);
        request.setAttribute("moid", moid);
        request.setAttribute("returnURL", returnURL);
        request.setAttribute("sha256Enc", sha256Enc);
        request.setAttribute("ediDate", ediDate);
        request.setAttribute("hashString", hashString);
        request.setAttribute("uuid", UUID.randomUUID().toString().replace("-", ""));

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentAcademy" , locale);
    }

    @PostMapping("/paymentAcademyProcess")
    public String paymentAcademyProcess(HttpServletRequest request, Locale locale) {
        log.info("paymentAcademyProcess");

        paymentService.paymentProcess(PaymentType.ACADEMY, request);

        request.setAttribute("name", request.getParameter("BuyerName"));
        request.setAttribute("tel" , request.getParameter("BuyerTel"));
        request.setAttribute("method" , request.getParameter("PayMethod"));
        request.setAttribute("price" , request.getParameter("Amt"));

        request.setAttribute("vbank_nm" , request.getParameter("vbankBankName"));
        request.setAttribute("vbank_num" , request.getParameter("vbankNum"));
        request.setAttribute("vbank_exp_dt" , request.getParameter("vbankExpDate"));


        /*
        *//*****************************************************************************************
         * <인증 결과 파라미터>
         *****************************************************************************************//*
        String authResultCode 	= request.getParameter("AuthResultCode"); 	// 인증결과 : 0000(성공)
        String authResultMsg 	= request.getParameter("AuthResultMsg"); 	// 인증결과 메시지
        String nextAppURL 		= request.getParameter("NextAppURL"); 		// 승인 요청 URL
        String txTid 			= request.getParameter("TxTid"); 			// 거래 ID
        String authToken 		= request.getParameter("AuthToken"); 		// 인증 TOKEN
        String payMethod 		= request.getParameter("PayMethod"); 		// 결제수단
        String mid 				= request.getParameter("MID"); 				// 상점 아이디
        String moid 			= request.getParameter("Moid"); 			// 상점 주문번호
        String amt 				= request.getParameter("Amt"); 				// 결제 금액
        String reqReserved 		= request.getParameter("ReqReserved"); 		// 상점 예약필드
        String netCancelURL 	= request.getParameter("NetCancelURL"); 	// 망취소 요청 URL
        //String authSignature = request.getParameter("Signature");			// Nicepay에서 내려준 응답값의 무결성 검증 Data

        *//*
         ****************************************************************************************
         * Signature : 요청 데이터에 대한 무결성 검증을 위해 전달하는 파라미터로 허위 결제 요청 등 결제 및 보안 관련 이슈가 발생할 만한 요소를 방지하기 위해 연동 시 사용하시기 바라며
         * 위변조 검증 미사용으로 인해 발생하는 이슈는 당사의 책임이 없음 참고하시기 바랍니다.
         ****************************************************************************************
         *//*
        DataEncrypt sha256Enc 	= new DataEncrypt();
        String merchantKey 		= nicePaymerchantKey; // 상점키

        //인증 응답 Signature = hex(sha256(AuthToken + MID + Amt + MerchantKey)
        //String authComparisonSignature = sha256Enc.encrypt(authToken + mid + amt + merchantKey);

        *//*
         ****************************************************************************************
         * <승인 결과 파라미터 정의>
         * 샘플페이지에서는 승인 결과 파라미터 중 일부만 예시되어 있으며,
         * 추가적으로 사용하실 파라미터는 연동메뉴얼을 참고하세요.
         ****************************************************************************************
         *//*
        String ResultCode 	= ""; String ResultMsg 	= ""; String PayMethod 	= "";
        String GoodsName 	= ""; String Amt 		= ""; String TID 		= "";
        //String Signature = ""; String paySignature = "";
        *//*
         ****************************************************************************************
         * <인증 결과 성공시 승인 진행>
         ****************************************************************************************
         *//*
        String resultJsonStr = "";
        System.out.println("authResultCode: "+authResultCode);
        System.out.println("authResultMsg: "+authResultMsg);
        if(authResultCode.equals("0000") *//*&& authSignature.equals(authComparisonSignature)*//*){
            *//*
             ****************************************************************************************
             * <해쉬암호화> (수정하지 마세요)
             * SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
             ****************************************************************************************
             *//*
            String ediDate			= getyyyyMMddHHmmss();
            String signData 		= sha256Enc.encrypt(authToken + mid + amt + ediDate + merchantKey);

            *//*
             ****************************************************************************************
             * <승인 요청>
             * 승인에 필요한 데이터 생성 후 server to server 통신을 통해 승인 처리 합니다.
             ****************************************************************************************
             *//*
            StringBuffer requestData = new StringBuffer();
            requestData.append("TID=").append(txTid).append("&");
            requestData.append("AuthToken=").append(authToken).append("&");
            requestData.append("MID=").append(mid).append("&");
            requestData.append("Amt=").append(amt).append("&");
            requestData.append("EdiDate=").append(ediDate).append("&");
            requestData.append("CharSet=").append("utf-8").append("&");
            requestData.append("SignData=").append(signData);

            try {
                resultJsonStr = connectToServer(requestData.toString(), nextAppURL);
                HashMap resultData = new HashMap();
                boolean paySuccess = false;
                if ("9999".equals(resultJsonStr)) {
                    *//*
                     *************************************************************************************
                     * <망취소 요청>
                     * 승인 통신중에 Exception 발생시 망취소 처리를 권고합니다.
                     *************************************************************************************
                     *//*
                    StringBuffer netCancelData = new StringBuffer();
                    requestData.append("&").append("NetCancel=").append("1");
                    String cancelResultJsonStr = connectToServer(requestData.toString(), netCancelURL);

                    HashMap cancelResultData = jsonStringToHashMap(cancelResultJsonStr);
                    ResultCode = (String) cancelResultData.get("ResultCode");
                    ResultMsg = (String) cancelResultData.get("ResultMsg");
                    *//*Signature = (String)cancelResultData.get("Signature");
                    String CancelAmt = (String)cancelResultData.get("CancelAmt");
                    paySignature = sha256Enc.encrypt(TID + mid + CancelAmt + merchantKey);*//*
                } else {
                    resultData = jsonStringToHashMap(resultJsonStr);
                    System.out.println("resultData: "+resultData);
                    ResultCode = (String) resultData.get("ResultCode");    // 결과코드 (정상 결과코드:3001)
                    ResultMsg = (String) resultData.get("ResultMsg");    // 결과메시지
                    PayMethod = (String) resultData.get("PayMethod");    // 결제수단
                    GoodsName = (String) resultData.get("GoodsName");    // 상품명
                    Amt = (String) resultData.get("Amt");        // 결제 금액
                    TID = (String) resultData.get("TID");        // 거래번호

                    // Signature : Nicepay에서 내려준 응답값의 무결성 검증 Data
                    // 가맹점에서 무결성을 검증하는 로직을 구현하여야 합니다.
                    *//*Signature = (String)resultData.get("Signature");
                    paySignature = sha256Enc.encrypt(TID + mid + Amt + merchantKey);*//*


                    CommonMap map = new CommonMap();
                    map.putAll(resultData);

                    *//** 4. 결제 결과 *//*
                    String resultCode = (String) resultData.get("ResultCode"); // 결과코드 (정상 :3001 , 그 외 에러)
                    String resultMsg = (String) resultData.get("ResultMsg");   // 결과메시지
                    String authDate = (String) resultData.get("AuthDate");   // 승인일시 YYMMDDHH24mmss
                    String authCode = (String) resultData.get("AuthCode");   // 승인번호

                    String buyerName = (String) resultData.get("BuyerName");   // 구매자명
                    String mallUserID = (String) resultData.get("MallUserID");   // 회원사고객ID
                    String goodsName = (String) resultData.get("GoodsName");   // 상품명
                    //String mid = (String) resultData.get("MID");  // 상점ID
                    String tid = (String) resultData.get("TID");  // 거래ID
                    //String moid = (String) resultData.get("Moid");  // 주문번호
                    //String amt = (String) resultData.get("Amt");  // 금액

                    String cardCode = (String) resultData.get("CardCode");   // 결제카드사코드
                    String cardName = (String) resultData.get("CardName");   // 결제카드사명
                    String cardQuota = (String) resultData.get("CardQuota");  // 카드 할부개월 (00:일시불,02:2개월)

                    String bankCode = (String) resultData.get("BankCode");   // 은행코드
                    String bankName = (String) resultData.get("BankName");   // 은행명
                    String rcptType = (String) resultData.get("RcptType"); //현금 영수증 타입 (0:발행되지않음,1:소득공제,2:지출증빙)
                    String rcptAuthCode = (String) resultData.get("RcptAuthCode"); //현금영수증 승인 번호
                    String rcptTID = (String) resultData.get("RcptTID"); //현금 영수증 TID

                    String carrier = (String) resultData.get("Carrier");       // 이통사구분
                    String dstAddr = (String) resultData.get("DstAddr");       // 휴대폰번호

                    String vbankBankCode = (String) resultData.get("VbankBankCode");   // 가상계좌은행코드
                    String vbankBankName = (String) resultData.get("VbankBankName");   // 가상계좌은행명
                    String vbankNum = (String) resultData.get("VbankNum");   // 가상계좌번호
                    String vbankExpDate = (String) resultData.get("VbankExpDate");   // 가상계좌입금예정일

                    String no_vat_price = request.getParameter("no_vat_price");
                    String vat_price = request.getParameter("vat_price");
                    String vat = request.getParameter("vat");

                    String mall_reserved = request.getParameter("MallReserved");

                    String academy_no = request.getParameter("academy_no");

                    map.put("cust_no", "117997");
                    map.put("payer", buyerName);
                    map.put("pay_price", amt);
                    map.put("pg_trans_id", tid); //paramMap.put("PG_TRANS_ID", moid);
                    map.put("reg_emp_no",  "117997");

                    map.put("academy_no", academy_no);

                    //가상결제 PAY_ WAIT 테이블 입력을 위해서
                    map.put("kind_cd", PaymentType.ACADEMY);
                    map.put("ref_no", academy_no);
                    map.put("pay_method_cd", payMethod);

                    map.put("no_vat_price", no_vat_price);
                    map.put("vat_price", vat_price);
                    map.put("vat", vat);
                    map.put("uuid", mall_reserved);

                    map.put("vbank_cd", vbankBankCode);
                    map.put("vbank_nm", vbankBankName);
                    map.put("vbank_num", vbankNum);
                    map.put("vbank_exp_dt", vbankExpDate);
                    *//*
                     *************************************************************************************
                     * <결제 성공 여부 확인>
                     *************************************************************************************
                     *//*
                    if (PayMethod != null) {
                        if (PayMethod.equals("CARD")) {
                            if (ResultCode.equals("3001")) paySuccess = true; // 신용카드(정상 결과코드:3001)
                        } else if (PayMethod.equals("BANK")) {
                            if (ResultCode.equals("4000")) paySuccess = true; // 계좌이체(정상 결과코드:4000)
                        } else if (PayMethod.equals("CELLPHONE")) {
                            if (ResultCode.equals("A000")) paySuccess = true; // 휴대폰(정상 결과코드:A000)
                        } else if (PayMethod.equals("VBANK")) {
                            if (ResultCode.equals("4100")) paySuccess = true; // 가상계좌(정상 결과코드:4100)
                        } else if (PayMethod.equals("SSG_BANK")) {
                            if (ResultCode.equals("0000")) paySuccess = true; // SSG은행계좌(정상 결과코드:0000)
                        } else if (PayMethod.equals("CMS_BANK")) {
                            if (ResultCode.equals("0000")) paySuccess = true; // 계좌간편결제(정상 결과코드:0000)
                        }
                    }

                    map.put("pg_cd", SAConst.PG_NICEPAY);
                    if(paySuccess) {
                        if (PayMethod.equals("VBANK")) {
                            paymentService.insertPayWait(map);
                        } else {

                        }
                    }
                }
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }else*//*if(authSignature.equals(authComparisonSignature))*//*{
            ResultCode 	= authResultCode;
            ResultMsg 	= authResultMsg;
        }*//*else{
            System.out.println("인증 응답 Signature : " + authSignature);
            System.out.println("인증 생성 Signature : " + authComparisonSignature);
        }*//*

        System.out.println("ResultCode: "+ResultCode);
        System.out.println("authResultMsg: "+authResultMsg);*/
        return "redirect:/payment/paymentAcademyResult";
    }

    @GetMapping("/paymentAcademyResult")
    public String paymentAcademyResult(HttpServletRequest request, Locale locale) {
        log.info("paymentAcademyResult");

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentAcademyResult" , locale);
    }

    public final synchronized String getyyyyMMddHHmmss(){
        SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
        return yyyyMMddHHmmss.format(new Date());
    }
    // SHA-256 형식으로 암호화
    public class DataEncrypt{
        MessageDigest md;
        String strSRCData = "";
        String strENCData = "";
        String strOUTData = "";

        public DataEncrypt(){ }
        public String encrypt(String strData){
            String passACL = null;
            MessageDigest md = null;
            try{
                md = MessageDigest.getInstance("SHA-256");
                md.reset();
                md.update(strData.getBytes());
                byte[] raw = md.digest();
                passACL = encodeHex(raw);
            }catch(Exception e){
                System.out.print("암호화 에러" + e.toString());
            }
            return passACL;
        }

        public String encodeHex(byte [] b){
            char [] c = Hex.encodeHex(b);
            return new String(c);
        }
    }

    //server to server 통신
    public String connectToServer(String data, String reqUrl) throws Exception{
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
            resultReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
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

    //JSON String -> HashMap 변환
    private static HashMap jsonStringToHashMap(String str) throws Exception{
        HashMap dataMap = new HashMap();
        JSONParser parser = new JSONParser();
        try{
            Object obj = parser.parse(str);
            JSONObject jsonObject = (JSONObject)obj;

            Iterator<String> keyStr = jsonObject.keySet().iterator();
            while(keyStr.hasNext()){
                String key = keyStr.next();
                Object value = jsonObject.get(key);

                dataMap.put(key, value);
            }
        }catch(Exception e){

        }
        return dataMap;
    }

    @GetMapping("work/{id}")
    public String work(HttpServletRequest request , Locale locale) {

        String goodsName = "정회원"; 					// 결제상품명
        String price = "1234"; 						// 결제상품금액
        String moid = "mnoid1234567890"; 			// 상품주문번호
        String returnURL = "http://localhost:8080/payment/payResult"; // 결과페이지(절대경로) - 모

        String name = "김융훈"; 						// 구매자명
        String tel = "01000000000"; 				// 구매자연락처
        String email = "happy@day.co.kr"; 			// 구매자메일주소
        String address  = "(02123) 경기도 부천시 양지로 234-38";

        String eDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String signData = Cryptography.encrypt(eDate + nicePayMerchantId + price + nicePaymerchantKey);

        /* attribute */
        request.setAttribute("goodsName" , goodsName);
        request.setAttribute("price" , price);
        request.setAttribute("moid" , moid);
        request.setAttribute("returnURL" , returnURL);

        request.setAttribute("name" , name);
        request.setAttribute("tel" , tel);
        request.setAttribute("email" , email);
        request.setAttribute("address" , address);

        request.setAttribute("mKey" , nicePaymerchantKey);
        request.setAttribute("mId" , nicePayMerchantId);
        request.setAttribute("signData" , signData);
        request.setAttribute("eDate" , eDate);
        request.setAttribute("signData" , signData);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentWork" , locale);
    }

    @GetMapping("/workResult")
    public String paymentWorkResult(HttpServletRequest request , Locale locale) {


        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentWorkResult" , locale);
    }

}
