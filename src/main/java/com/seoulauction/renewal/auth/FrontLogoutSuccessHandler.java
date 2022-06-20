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
    	log.info("onLogoutSuccess");
        if (authentication != null && authentication.getDetails() != null) {
            try {
                 request.getSession().invalidate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        response.setStatus(HttpServletResponse.SC_OK);

        String redirectUrl = (String)request.getHeader("REFERER");
        log.info("redirectUrl : {}",redirectUrl);
        response.sendRedirect(redirectUrl);
    }
}