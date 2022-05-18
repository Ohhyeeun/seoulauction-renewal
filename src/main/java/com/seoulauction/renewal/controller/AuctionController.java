package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.auth.PasswordEncoderAESforSA;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.seoulauction.renewal.common.SAConst.SERVICE_LOGIN;

import java.security.Principal;
import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
    
    @GetMapping(SAConst.SERVICE_LOGIN)
    public String login(Locale locale, Model model
    		, HttpServletRequest request, HttpServletResponse response
    		, Principal principal, Authentication authentication
    		,@RequestParam(value = "error", required = false) String error) {
    	
    	// 로그인 이전페이지 기억
    	String referrer = request.getHeader("Referer");
    	if(referrer != null && !referrer.endsWith("/login")) {
    		log.info("referrer : {}",referrer);
    		request.getSession().setAttribute("prevPage", referrer);
    	}

    	if(principal != null) {
    		//Principal (CUST_NO)
    		log.info("===== CUST_NO : {} \t=====", principal.getName());
    		
    		//SAUserDetails
    		SAUserDetails userDetails = (SAUserDetails) authentication.getDetails();
    		log.info("===== LOGIN_ID : {} \t=====", userDetails.getLoginId());
    		log.info("===== JOIN_KIND_CD : {} =====", userDetails.getUserKind());
    		log.info("===== CUST_NAME : {} \t=====", userDetails.getUserNm());
    		log.info("===== Auth : {} =====", userDetails.getAuthorities());
    		log.info("===== Ip : {} \t=====", userDetails.getIp());

            return "redirect:/";
    	}

    	if (error != null) {
			if(request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null 
				&& request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION)  instanceof BadCredentialsException){
				
				BadCredentialsException be = (BadCredentialsException) request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
				log.info("ERROR MSG : {}", be.getMessage());
				if(be.getMessage().equals("Stop User")) {
					model.addAttribute("error", "Stop User");
				}else if(be.getMessage().equals("User not found.") || be.getMessage().equals("Wrong password")) {
					model.addAttribute("error", "Bad credentials");
				}
				
				request.getSession().setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, null);
			}
		}
    	
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "login" , locale);
    }
    
    @GetMapping("/findId")
    public String findId(Locale locale) {
    	return SAConst.getUrl(SAConst.SERVICE_CUSTOMER, "findId" , locale);
    }

    
    @GetMapping("/findPassword")
    public String findPassword(Locale locale) {
    	return SAConst.getUrl(SAConst.SERVICE_CUSTOMER, "findPassword" , locale);
    }
    

    @GetMapping("/join")
    public String join(Locale locale, Principal principal) {
    	log.debug("===== join =====");
    	
    	if(principal != null) {
            return "redirect:/";
    	}
    	
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "join" , locale);
    }

    @GetMapping("/joinForm")
    public String joinForm(Locale locale) {
    	log.debug("===== joinForm =====");
    	
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "joinForm" , locale);
    }
    
    @PostMapping("/joinForm")
    public String joinFormPost(Locale locale, Model model, @RequestParam(value = "socialType") String socialType
    		, HttpServletRequest request, HttpServletResponse response) {
    	log.debug("===== joinFormPost =====");
    	
    	String socialLoginId = "";
		
		boolean duplIdCheck = true;
		while(duplIdCheck) {
			socialLoginId = socialType + "_" + Double.toString(Math.random() * 10).replace(".", "").substring(0, 8);
			log.info(socialLoginId);
			CommonMap paramMap = new CommonMap();
			paramMap.put("socialLoginId", socialLoginId);
	        CommonMap resultMap = loginService.selectCustSocialBySocialLoginId(paramMap);
	        if(resultMap == null) {
	        	duplIdCheck = false;
	        }
		}
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("mobile", request.getParameter("mobile"));
		model.addAttribute("email", request.getParameter("email"));
		model.addAttribute("socialLoginId", socialLoginId);
		model.addAttribute("socialEmail", request.getParameter("email"));
		if(socialType.equals("AP")) {
			model.addAttribute("socialEmail", request.getParameter("sub"));
		}
    	
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "joinForm" , locale);
    }
    
    @GetMapping("/social/naver/callback")
	public String socialNaverCallback(Locale locale, HttpServletRequest request, HttpServletResponse response) {
	    log.debug("===== naverCallback =====");
	    return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "naverCallback" , locale);
    }


}
