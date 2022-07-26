package com.seoulauction.renewal.auth;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
public class FrontLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    public FrontLoginSuccessHandler(String defaultTargetUrl) {
        setDefaultTargetUrl(defaultTargetUrl);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
    		Authentication authentication) throws ServletException, IOException {
    	//사용자의 액션으로 로그인 성공하였을때
    	log.info("FrontLoginSuccessHandler - onAuthenticationSuccess");
        HttpSession session = request.getSession();
        Boolean flag = false;
        String redirectUrl = "";
        
        //로그인 성공 후 로그인페이지 이전 접속페이지가 있다면 redirect
        if (session != null) {
            redirectUrl = (String) session.getAttribute("prevPage"); //loginController - /login에서 셋팅
            if (redirectUrl != null) {
            	request.removeAttribute("prevPage");
            	if(!redirectUrl.endsWith("/login")){ //이전 페이지가 로그인페이지라면 메인으로 이동
            		flag = true;
            	}
            }
        }
        if(flag) {
    		getRedirectStrategy().sendRedirect(request, response, redirectUrl);
        }else {
        	super.onAuthenticationSuccess(request, response, authentication);
        }
    }
}