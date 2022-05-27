package com.seoulauction.renewal.controller;
import static com.seoulauction.renewal.common.SAConst.SERVICE_MAIN;

import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import static com.seoulauction.renewal.common.SAConst.SERVICE_MYPAGE;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_MYPAGE)
public class MypageController {

    private final MypageService mypageService;
    
    /*아카데미*/
    @GetMapping("/academyList")
    public String academyList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "academyList" , locale);
    }

    @GetMapping("/academyPayPopup")
    public String academyPayPopup(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "popup/academyPayPopup" , locale);
    }
    
    /*결제목록*/
    @GetMapping("/onlinePayList")
    public String onlinePayList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "onlinePayList" , locale);
    }
    
    /*본인인증 TEST*/
    @GetMapping("/test")
    public String test(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "test" , locale);
    }
    /*본인인증*/
    @GetMapping("/saleCert")
    public String saleCert(@RequestParam Map<String, String> params, Locale locale, Model model) {
    	model.addAttribute("VIEW_ID", "SALE_CERT");
    	if (params.containsKey("sale_no")) model.addAttribute("SALE_NO", params.get("sale_no"));
    	return SAConst.getUrl(SERVICE_MYPAGE , "saleCert" , locale);
    }

    /*문의하기*/
    @GetMapping("/inquiryList")
    public String inquiryList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "inquiryList" , locale);
    }

    @GetMapping("/inquiryDetail")
    public String inquiryView(@RequestParam(required = true ) int writeNo, Locale locale) {
        return SAConst.getUrl(SERVICE_MYPAGE, "inquiryDetail", locale);
    }

    @GetMapping("/inquiryForm")
    public String inquiryForm(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "inquiryForm" , locale);
    }

    @GetMapping("/inteLotList")
    public String inteLotList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "inteLotList" , locale);
    }
}
