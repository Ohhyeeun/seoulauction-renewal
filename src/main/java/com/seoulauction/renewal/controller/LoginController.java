package com.seoulauction.renewal.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.CertificationService;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.util.SecurityUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequiredArgsConstructor
public class LoginController {

	@Value("${social.service.domain}")
	String currentUrl;
	
    private final LoginService loginService;
    
    private final CertificationService certificationService;
    
    @GetMapping(SAConst.SERVICE_LOGIN)
    public String login(Locale locale, Model model
    		, HttpServletRequest request, HttpServletResponse response
    		, Principal principal, Authentication authentication
    		,@RequestParam(value = "error", required = false) String error) {
    	
    	// 로그인 이전페이지 기억
    	String referrer = "";
    	
    	// .authenticated() 경로 접근 시 springsecurity에서 session에 저장해준 request로부터 이전페이지GET
    	DefaultSavedRequest dsr = (DefaultSavedRequest) request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
    	if(dsr != null) {
    		referrer = dsr.getRequestURL();
    		log.info("=========== DefaultSavedRequest referrer : {} ===========", referrer);
    	}
    	// .permitAll() 경로 접근 시 request header로부터 이전페이지GET
    	if(referrer == null || referrer.equals("")) {
    		referrer = request.getHeader("Referer");
    		log.info("=========== request.getHeader referrer : {} ===========", referrer);
    	}
    	//session에 이전페이지attribute SET
    	if(referrer != null 
    		&& !referrer.contains("/login") 
    		&& !referrer.contains("/join") 
    		&& !referrer.contains("/findId")
    		&& !referrer.contains("/findPassword")
    		&& !referrer.contains("/mypage/custLeave")) {
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
				}else if(be.getMessage().equals("Not Certify User")) {
					model.addAttribute("error", "Not Certify User");
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
	    
		String socialEmail = request.getParameter("email");
		if(socialType.equals("AP")) {
			socialEmail = request.getParameter("sub");
		}
		
		String socialLoginId = loginService.checkDuplSocialLoginId(socialType);
		
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("email", request.getParameter("email"));
		model.addAttribute("socialLoginId", socialLoginId);
		model.addAttribute("socialEmail", socialEmail);
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "joinForm" , locale);
    }
    
    @GetMapping("/social/naver/callback")
	public String socialNaverCallback(Locale locale, HttpServletRequest request, HttpServletResponse response) {
	    log.debug("===== naverCallback =====");
	    return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "naverCallback" , locale);
    }
    
    @GetMapping("/joinDone")
    public String joinDone(Locale locale) {
    	log.debug("===== joinDone =====");
    	
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "joinDone" , locale);
    }


    @GetMapping(value = "/join/{uuid}")
    public String joinAuthCode(Locale locale, @PathVariable(value = "uuid") String uuid, HttpServletResponse response) throws IOException{
    	CommonMap paramMap = new CommonMap();
    	paramMap.put("fore_cert_code", uuid);
        int result = certificationService.updateCustForForeAuth(paramMap);
        if(result == 1){
        	return "redirect:/login";
        }
        else{
        	response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
    		return "";
        }
    }
    
  	@RequestMapping(value="/kakaoRedirect/{type}", method=RequestMethod.GET)
  	public String kakaoRedirect(Model model, HttpServletRequest request, HttpServletResponse response
  			,RedirectAttributes redirect
  			,@RequestParam (value="code", required = false)String code
  			,@PathVariable("type") String type) throws Exception {

  	    log.info("===========kakaoRedirect : type : {} ===========", type);
  	    log.info(code);
  	    
  	    StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=adbdfe931311a01731a0161175701a42"); // 본인이 발급받은 key
		sb.append("&redirect_uri=" + currentUrl + "/kakaoRedirect/" + type); // 본인이 설정한 주소
		sb.append("&code=" + code);
		
		//토큰발급
		JsonElement tokenJson = loginService.postRestful(sb, "https://kauth.kakao.com/oauth/token");
		String accessToken = tokenJson.getAsJsonObject().get("access_token").getAsString();
		String refreshToken = tokenJson.getAsJsonObject().get("refresh_token").getAsString();
		log.info("access_token : {}", accessToken);
		log.info("refresh_token : {}", refreshToken);
		
		//사용자정보조회
		JsonElement userJson = loginService.getRestful(accessToken, "https://kapi.kakao.com/v2/user/me");
		JsonObject properties = userJson.getAsJsonObject().get("properties").getAsJsonObject();
		JsonObject kakao_account = userJson.getAsJsonObject().get("kakao_account").getAsJsonObject();
		String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		String email = kakao_account.getAsJsonObject().get("email").getAsString();
		log.info("nickname : {}", nickname);
		log.info("email : {}", email);
		
  	    if(type.equals("login")) {
  			model.addAttribute("name", nickname);
  	    }else if(type.equals("custConfirm")) {
  	    	log.info("SecurityUtils.getAuthenticationPrincipal().getSocialEmail() : " ,SecurityUtils.getAuthenticationPrincipal().getSocialEmail());
  	    	model.addAttribute("custSocialEmail", SecurityUtils.getAuthenticationPrincipal().getSocialEmail());
  	    }
  	    model.addAttribute("email", email);
  	    model.addAttribute("type", type);
  	    return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "kakaoCallback" , new Locale(Locale.KOREA.getLanguage()));
  	}
}
