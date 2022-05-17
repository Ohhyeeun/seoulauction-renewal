package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.auth.Cryptography;
import com.seoulauction.renewal.common.PaymentType;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

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
    public String member(HttpServletRequest request , Locale locale) {

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

        request.setAttribute("formProcessUrl" , "/payment/memberProcess");

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "member" , locale);
    }

    @PostMapping("/memberProcess")
    public String memberProcess(HttpServletRequest request , RedirectAttributes attr) {

        CommonMap resultMap = paymentService.paymentProcess(PaymentType.CUST_REGULAR , request);

        attr.addAttribute("payId", resultMap.get("pay_no"));
        attr.addAttribute("payMethod", resultMap.get("PayMethod"));

        return "redirect:/payment/memberResult";
    }

    @GetMapping("/memberResult")
    public String memberResult(
             HttpServletRequest request
            ,@RequestParam(value = "payMethod") String payMethod
            ,@RequestParam(value = "payId") String payId
            ,Locale locale) {

        String address  = "(02123) 경기도 부천시 양지로 234-38";
        String buyerTell  = "010-9999-9843";
        CommonMap resultMap = paymentService.getPaymentForPayResult(payMethod ,payId);

        request.setAttribute("address" , address);
        request.setAttribute("name", resultMap.get("PAYER"));
        request.setAttribute("tel" , buyerTell);
        request.setAttribute("method" , payMethod);
        request.setAttribute("price" , resultMap.get("PAY_PRICE"));

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "memberResult" , locale);
    }

    @GetMapping("/academy/{id}")
    public String paymentAcademy(@PathVariable("id") int id, HttpServletRequest request, Locale locale) {
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
        String returnURL 		= nicePayMobileBaseReturnUrl +"/payment/paymentTuitionProcess"; // 결과페이지(절대경로) - 모바일 결제창 전용

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
        String ediDate 			= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String hashString 		= Cryptography.encrypt(ediDate + nicePayMerchantId + price + nicePaymerchantKey);

        request.setAttribute("merchantKey", merchantKey);
        request.setAttribute("merchantID", merchantID);
        request.setAttribute("goodsName", goodsName);
        request.setAttribute("price", price);
        request.setAttribute("vat_price", vat_price);
        request.setAttribute("vat", vat);
        request.setAttribute("academy_no", id);
        request.setAttribute("no_vat_price", no_vat_price);
        request.setAttribute("buyerName", buyerName);
        request.setAttribute("buyerTel", buyerTel);
        request.setAttribute("buyerEmail", buyerEmail);
        request.setAttribute("moid", moid);
        request.setAttribute("returnURL", returnURL);
        request.setAttribute("ediDate", ediDate);
        request.setAttribute("hashString", hashString);
        request.setAttribute("uuid", UUID.randomUUID().toString().replace("-", ""));

        request.setAttribute("formProcessUrl" , "/payment/academyProcess");

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "academy" , locale);
    }

    @PostMapping("/academyProcess")
    public String academyProcess(HttpServletRequest request, Locale locale, RedirectAttributes attr) {
        log.info("academyProcess");

        CommonMap resultMap = paymentService.paymentProcess(PaymentType.ACADEMY, request);
        attr.addAttribute("payId", resultMap.get("pay_no"));
        attr.addAttribute("payMethod", resultMap.get("PayMethod"));

        return "redirect:/payment/academyResult";
    }

    @GetMapping("/academyResult")
    public String academyResult(@RequestParam("payId") String payId, @RequestParam("payMethod") String payMethod, HttpServletRequest request, Locale locale) {
        log.info("academyResult");

        CommonMap resultMap = paymentService.goPaymentResultAcademy(payMethod, payId);
        request.setAttribute("resultMap", resultMap);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "academyResult" , locale);
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
