package com.seoulauction.renewal.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class FrontLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    public FrontLoginSuccessHandler(String defaultTargetUrl) {
        setDefaultTargetUrl(defaultTargetUrl);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
    		Authentication authentication) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            String redirectUrl = (String) session.getAttribute("prevPage");
            if (redirectUrl != null) {
            	request.removeAttribute("prevPage");
            	if(!redirectUrl.endsWith("/login")){ //이전 페이지가 로그인페이지라면 메인으로 이동
            		getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            	}
            }
        }
        super.onAuthenticationSuccess(request, response, authentication);
    }
}