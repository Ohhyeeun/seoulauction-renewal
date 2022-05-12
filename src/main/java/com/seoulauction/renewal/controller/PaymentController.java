package com.seoulauction.renewal.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.auth.Cryptography;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.NicePayModule;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.PaymentService;
import kr.co.nicevan.nicepay.adapter.web.NicePayHttpServletRequestWrapper;
import kr.co.nicevan.nicepay.adapter.web.NicePayWEB;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_PAYMENT)
public class PaymentController {

    @Value("${nicepay.merchant.key}")
    String nicePaymerchantKey;

    @Value("${nicepay.merchant.id}")
    String nicePayMerchantId;

    private final PaymentService paymentService;

    private final NicePayModule nicePayModule;

    @GetMapping("/paymentMember")
    public String paymentMember(HttpServletRequest request , Locale locale) {

        String goodsName = "정회원"; 					// 결제상품명
        String price = "1234"; 						// 결제상품금액
        String moid = "mnoid1234567890"; 			// 상품주문번호
        String returnURL = "http://localhost:8080/payment/payResult"; // 결과페이지(절대경로) - 모
        // 바일 결제창 전용

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

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentMember" , locale);
    }

    @PostMapping("/paymentMemberResult")
    public String payResult(HttpServletRequest request , Locale locale) {

        NicePayHttpServletRequestWrapper wrapper = new NicePayHttpServletRequestWrapper(request);
        String address  = "(02123) 경기도 부천시 양지로 234-38";

        try {
            log.info(new ObjectMapper().writeValueAsString(wrapper.getMapToString()));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        CommonMap resultMap = nicePayModule.payProcess(request);
        //추후 개인정보는 시큐리티에서 가져올듯
        resultMap.put("cust_no" , "27319"); // 로그인 한 유저 번호 가져와야함.
        resultMap.put("pay_method", wrapper.getParameter("PayMethod"));
        resultMap.put("pg_trnas_id", wrapper.getParameter("TxTid"));
        resultMap.put("name", wrapper.getParameter("BuyerName"));
        resultMap.put("pay_price", wrapper.getParameter("Amt"));
        resultMap.put("no_vat_price", 0);
        resultMap.put("vat_price", 0);
        resultMap.put("vat", 0);

        //디비 저장.
        paymentService.insertCustPay(resultMap);

        request.setAttribute("address" , address);
        request.setAttribute("name", wrapper.getParameter("BuyerName"));
        request.setAttribute("tel" , wrapper.getParameter("BuyerTel"));
        request.setAttribute("method" , wrapper.getParameter("PayMethod"));
        request.setAttribute("amt" , wrapper.getParameter("Amt"));

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentMemberResult" , locale);
    }

    @GetMapping("/payRequest")
    public String payRequest(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "/example/payRequest_utf" , locale);
    }


}
