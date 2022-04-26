package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;

@Controller
@Log4j2
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
    
    @GetMapping("/login")
    public String login(Model model, HttpServletRequest request, HttpServletResponse response, Principal principal, Authentication authentication) {
        // 로그인 이전페이지 기억
    	String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("prevPage", referrer);
    	
    	if(principal != null) {
    		//Principal (CUST_NO)
    		log.info("===== CUST_NO : " + principal.getName() + "\t=====");
    		
    		//SAUserDetails
    		SAUserDetails userDetails = (SAUserDetails) authentication.getDetails();
    		log.info("===== LOGIN_ID : " + userDetails.getLoginId() + " \t=====");
    		log.info("===== JOIN_KIND_CD : " + userDetails.getUserKind() + " =====");
    		log.info("===== CUST_NAME : " + userDetails.getUserNm() + " \t=====");
    		log.info("===== Auth : " + userDetails.getAuthorities() + " =====");
    		log.info("===== Ip : " + userDetails.getIp() + " \t=====");

            return "redirect:/";
    	}

        return "customer/login";
    }

}
