package com.seoulauction.renewal.auth;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.seoulauction.renewal.controller.LoginController;

import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException; 

@Log4j2
public class FrontLogoutSuccessHandler implements LogoutSuccessHandler{	

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                             Authentication authentication) throws IOException, ServletException {
    	log.info("FrontLogoutSuccessHandler - onLogoutSuccess");
    	
    	//인증이 남아있을경우 invalidate
        if (authentication != null && authentication.getDetails() != null) {
            try {
                 request.getSession().invalidate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        response.setStatus(HttpServletResponse.SC_OK);

        //로그아웃 이전 접속페이지가 있다면 redirect
        String redirectUrl = (String)request.getHeader("REFERER");
        log.info("redirectUrl : {}",redirectUrl);
        
        if(redirectUrl != null) {
        	//로그아웃 후 redirectUrl이 회원가입완료페이지면 로그인페이지로 이동
        	if(redirectUrl.contains("joinDone")) {
	        	redirectUrl = "/login";
	        	log.info("redirect to login");
        	}
        }else {
        	redirectUrl = "/";
        }
        	
        response.sendRedirect(redirectUrl);
    }
}