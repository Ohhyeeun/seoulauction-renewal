package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MypageService;
import com.seoulauction.renewal.util.SecurityUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Locale;
import java.util.Map;

import static com.seoulauction.renewal.common.SAConst.SERVICE_MYPAGE;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_MYPAGE)
public class MypageController {

    private final MypageService mypageService;
    
    private final LoginService loginService;
    
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

    @GetMapping("/liveBidReqList")
    public String liveBidReqList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "liveBidReqList" , locale);
    }

    @GetMapping("/liveBidList")
    public String liveBidList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "liveBidList" , locale);
    }
    
    @GetMapping("/onlineBidList")
    public String onlineBidList(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "onlineBidList" , locale);
    }
    
    /*비밀번호변경*/
    @GetMapping("/passwordModify")
    public String passwordModify(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "passwordModify" , locale);
    }
    
    /*SNS연동설정*/
    @GetMapping("/snsLink")
    public String snsLink(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "snsLink" , locale);
    }
    
    /*회원정보수정 비밀번호확인*/
    @GetMapping("/custModify")
    public String custConfirm(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "custConfirm" , locale);
    }
    
    /*회원정보수정*/
    @PostMapping("/custModify")
    public String custModify(Locale locale) {
    	SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
    	CommonMap paramMap = new CommonMap();
		paramMap.put("cust_no", saUserDetails.getUserNo());
		CommonMap resultMap = loginService.selectCustByCustNo(paramMap);
		
		if(resultMap.get("LOCAL_KIND_CD").equals("korean")) {
			return SAConst.getUrl(SERVICE_MYPAGE , "custModify" , new Locale(Locale.KOREA.getLanguage()));
		}else{
			return SAConst.getUrl(SERVICE_MYPAGE , "custModify" , new Locale(Locale.ENGLISH.getLanguage()));
		}
    }

    /*회원탈퇴*/
    @GetMapping("/custLeave")
    public String custLeave(Locale locale) {
    	return SAConst.getUrl(SERVICE_MYPAGE , "custLeave" , locale);
    }
}
