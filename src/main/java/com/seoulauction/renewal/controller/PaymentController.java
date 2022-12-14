package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.auth.Cryptography;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.kt.PaymentMapper;
import com.seoulauction.renewal.service.AuctionService;
import com.seoulauction.renewal.service.PaymentService;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang.ObjectUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
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

    @Value("${nicepay.mobile.base.return.url}")
    String nicePayMobileBaseReturnUrl;

    private final PaymentService paymentService;
    private final AuctionService auctionService;

    private final PaymentMapper paymentMapper;

    private Integer DUMMY_PRICE = 500;

    @GetMapping("/member")
    public String member(HttpServletRequest request , Locale locale) {

        String goodsName = "정회원"; 					// 결제상품명
        Integer price = DUMMY_PRICE; 						// 결제상품금액
        String moid = "mnoid1234567890"; 			// 상품주문번호
        String returnURL = nicePayMobileBaseReturnUrl + "/payment/memberProcess"; // 결과페이지(절대경로) - 모

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        String cust_name = saUserDetails.getUserNm();						// 구매자명
        String hp = saUserDetails.getHp();			// 구매자연락처
        String email = saUserDetails.getEmail();		// 구매자메일주소
        String address  = saUserDetails.getAddr();

        String ediDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String signData = Cryptography.encrypt(ediDate + nicePayMerchantId + price + nicePaymerchantKey);

        /* attribute */
        request.setAttribute("goodsName" , goodsName);

        request.setAttribute("price" , price);

        request.setAttribute("moid" , moid);
        request.setAttribute("returnURL" , returnURL);

        request.setAttribute("cust_name" , cust_name);
        request.setAttribute("hp" , hp);
        request.setAttribute("email" , email);
        request.setAttribute("address" , address);

        request.setAttribute("mId" , nicePayMerchantId);
        request.setAttribute("signData" , signData);
        request.setAttribute("ediDate" , ediDate);

        request.setAttribute("uuid", UUID.randomUUID().toString().replace("-", ""));
        request.setAttribute("pay_kind", SAConst.PAYMENT_KIND_MEMBERSHIP);

        request.setAttribute("formProcessUrl" , "/payment/memberProcess");

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "member" , locale);
    }

    @PostMapping("/memberProcess")
    public String memberProcess(HttpServletRequest request , RedirectAttributes attr) {

        request.setAttribute("pay_kind", SAConst.PAYMENT_KIND_MEMBERSHIP);
        CommonMap resultMap = paymentService.paymentProcess(request);

        attr.addAttribute("payId", resultMap.get("pay_no"));
        attr.addAttribute("payMethod", resultMap.get("pay_method"));

        return "redirect:/payment/memberResult";
    }

    @GetMapping("/memberResult")
    public String memberResult(
             HttpServletRequest request
            ,@RequestParam(value = "payMethod") String payMethod
            ,@RequestParam(value = "payId") String payId
            ,Locale locale) {

        CommonMap resultMap = paymentService.getPaymentForPayResult(payMethod, payId);
        request.setAttribute("resultMap", resultMap);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "memberResult" , locale);
    }

    @GetMapping("/academy/{id}")
    public String academy(@PathVariable("id") int id, HttpServletRequest request, Locale locale) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("academy_no", id);

        CommonMap resultMap = paymentService.selectAcademyByAcademyNo(paramMap); //TODO: 아카데미 조회 조건을 더 강화해야함
//        if(MapUtils.isEmpty(resultMap)) {
//            request.setAttribute("message", "아카데미 정보가 없습니다.");
//            request.setAttribute("returnUrl", "/"); //TODO: 아카데미 목록으로 가야함
//            return "redirect";
//        }

        // select cust

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        String goodsName 		= "서울옥션-아카데미"; 					// 결제상품명
        int price 			    = Integer.parseInt(ObjectUtils.defaultIfNull(resultMap.get("ACADEMY_PAY"), "0").toString()); 						// 결제상품금액

        String cust_name 		= saUserDetails.getUserNm(); 						// 구매자명
        String hp 		        = saUserDetails.getHp(); 				// 구매자연락처
        String email 		    = saUserDetails.getEmail(); 			// 구매자메일주소
        String moid 			= "mnoid1234567890"; 			// 상품주문번호

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(nicePayMobileBaseReturnUrl).append("/payment/academyProcess").append("?academy_no=").append(id);
        String returnURL 		= stringBuilder.toString(); // 결과페이지(절대경로) - 모바일 결제창 전용

        /*
         *******************************************************
         * <해쉬암호화> (수정하지 마세요)
         * SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
         *******************************************************
         */
        String ediDate 			= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String signData 		= Cryptography.encrypt(ediDate + nicePayMerchantId + price + nicePaymerchantKey);

        request.setAttribute("goodsName", goodsName);

        request.setAttribute("price", price);

        request.setAttribute("academy_no", id);

        request.setAttribute("cust_name", cust_name);
        request.setAttribute("hp", hp);
        request.setAttribute("email", email);
        request.setAttribute("moid", moid);
        request.setAttribute("returnURL", returnURL);

        request.setAttribute("mId" , nicePayMerchantId);
        request.setAttribute("signData" , signData);
        request.setAttribute("ediDate" , ediDate);

        request.setAttribute("uuid", UUID.randomUUID().toString().replace("-", ""));
        request.setAttribute("pay_kind", SAConst.PAYMENT_KIND_ACADEMY);

        request.setAttribute("formProcessUrl" , "/payment/academyProcess");

        request.setAttribute("resultMap", resultMap);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "academy" , locale);
    }

    @PostMapping("/academyProcess")
    public String academyProcess(HttpServletRequest request, Locale locale, RedirectAttributes attr) {
        log.info("academyProcess");

        request.setAttribute("pay_kind", SAConst.PAYMENT_KIND_ACADEMY);
        CommonMap resultMap = paymentService.paymentProcess(request);

        attr.addAttribute("payId", resultMap.get("pay_no"));
        attr.addAttribute("payMethod", resultMap.get("pay_method"));

        return "redirect:/payment/academyResult";
    }

    @GetMapping("/academyResult")
    public String academyResult(@RequestParam("payId") String payId, @RequestParam("payMethod") String payMethod, HttpServletRequest request, Locale locale) {
        log.info("academyResult");

        CommonMap resultMap = paymentService.goPaymentResultAcademy(payMethod, payId);
        request.setAttribute("resultMap", resultMap);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "academyResult" , locale);
    }


    @GetMapping("/sale/{saleNo}/lot/{lotNo}")
    public String work(HttpServletRequest request , Locale locale, Principal principal, @PathVariable("saleNo") String saleNo, @PathVariable("lotNo") String lotNo) {

        String goodsName = "서울옥션-작품결제"; 					// 결제상품명
        String moid = "mnoid1234567890"; 			// 상품주문번호

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(nicePayMobileBaseReturnUrl).append("/payment/workProcess").append("?sale_no=").append(saleNo).append("&lot_no=").append(lotNo);
        String returnURL = stringBuilder.toString();  // 결과페이지(절대경로) - 모바일

        CommonMap paramMap = new CommonMap();


        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        /* 구매자 정보 */
        paramMap.put("cust_no", saUserDetails.getUserNo());
        //CommonMap custInfoMap = paymentMapper.selectCustByCustNo(paramMap);

        //request.setAttribute("custInfo", custInfoMap);

        /* 결제작품정보 */
        paramMap.put("sale_no", saleNo);
        paramMap.put("lot_no", lotNo);

        CommonMap payWorkInfoMap = paymentService.getWorkPayInfo(paramMap);

        String ediDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String signData = Cryptography.encrypt(ediDate + nicePayMerchantId + payWorkInfoMap.get("pay_price") + nicePaymerchantKey);

        request.setAttribute("lotInfo" , payWorkInfoMap);

        /* payment attribute */
        request.setAttribute("cust_name", saUserDetails.getUserNm());
        request.setAttribute("hp", saUserDetails.getHp());
        request.setAttribute("email", saUserDetails.getEmail());
        request.setAttribute("goodsName" , goodsName);
        request.setAttribute("price", payWorkInfoMap.get("pay_price"));
        request.setAttribute("no_vat_price", payWorkInfoMap.get("no_vat_price"));
        request.setAttribute("vat_price", payWorkInfoMap.get("vat_price"));
        request.setAttribute("vat", payWorkInfoMap.get("vat"));
        request.setAttribute("moid" , moid);
        request.setAttribute("returnURL" , returnURL);
        request.setAttribute("mKey" , nicePaymerchantKey);
        request.setAttribute("mId" , nicePayMerchantId);
        request.setAttribute("ediDate" , ediDate);
        request.setAttribute("signData" , signData);
        request.setAttribute("uuid", UUID.randomUUID().toString().replace("-", ""));
        request.setAttribute("pay_kind", SAConst.PAYMENT_KIND_WORK);
        request.setAttribute("formProcessUrl" , "/payment/workProcess");


        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "work" , locale);
    }

    @PostMapping("/workProcess")
    public String workProcess(HttpServletRequest request, Locale locale, RedirectAttributes attr) {
        log.info("workProcess");

        request.setAttribute("pay_kind", SAConst.PAYMENT_KIND_WORK);
        CommonMap resultMap = paymentService.paymentProcess(request);

        attr.addAttribute("payId", resultMap.get("pay_no"));
        attr.addAttribute("payMethod", resultMap.get("pay_method"));

        return "redirect:/payment/workResult";
    }

    @GetMapping("/workResult")
    public String workResult(@RequestParam("payId") String payId, @RequestParam("payMethod") String payMethod, HttpServletRequest request, Locale locale) {
        log.info("workResult");

        CommonMap resultMap = paymentService.goPaymentResultWork(payMethod, payId);
        request.setAttribute("resultMap", resultMap);

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "workResult" , locale);
    }

}
