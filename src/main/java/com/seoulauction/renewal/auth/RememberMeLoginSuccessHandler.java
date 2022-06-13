package com.seoulauction.renewal.auth;

import com.seoulauction.renewal.domain.SAUserDetails;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
@Log4j2
public class RememberMeLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("loginSuccessHandler");
		
		RememberMeAuthenticationToken userPrincipal = (RememberMeAuthenticationToken) request.getUserPrincipal();
		WebAuthenticationDetails wad = (WebAuthenticationDetails) userPrincipal.getDetails();
		SAUserDetails sud = (SAUserDetails) userPrincipal.getPrincipal();
		sud.setIp(wad.getRemoteAddress());
		userPrincipal.setDetails(sud);
		
		response.sendRedirect("/");
	}
}