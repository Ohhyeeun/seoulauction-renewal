package com.seoulauction.renewal.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
    
    @GetMapping("/login")
    public String test(Model model, HttpServletRequest request, HttpServletResponse response, Principal principal, Authentication authentication) {
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
