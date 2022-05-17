package com.seoulauction.renewal.controller.api;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MessageService;
import com.seoulauction.renewal.utill.CaptchaUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import nl.captcha.Captcha;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/login")
public class ApiLoginController {

	private final LoginService loginService;

	private final MessageService messageService;
	
	@Value("${mobile.msg.callback}")
	String callback;

	
	// captcha 이미지 가져오는 메서드
	@GetMapping("/captchaImg")
	@ResponseBody
	public void captchaImg(HttpServletRequest req, HttpServletResponse res) throws Exception {
		new CaptchaUtil().getImgCaptCha(req, res);
	}

//	// 전달받은 문자열로 음성 가져오는 메서드
//	@GetMapping("/captchaAudio")
//	@ResponseBody
//	public void captchaAudio(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
//		String getAnswer = captcha.getAnswer();
//		new CaptchaUtil().getAudioCaptCha(req, res, getAnswer);
//	}

	// 사용자가 입력한 보안문자 체크하는 메서드
	@PostMapping("/chkAnswer")
	@ResponseBody
	public ResponseEntity<RestResponse> chkAnswer(@RequestBody CommonMap map, HttpServletRequest req, HttpServletResponse res) {
		String result = "";
		Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
		String ans = map.get("answer").toString();
		log.info("ans : {}", ans);
		log.info("=== captcha.getAnswer() : {}", captcha.getAnswer());
		if (ans != null && !"".equals(ans)) {
			log.info("=== captcha.isCorrect(ans) : {}", captcha.isCorrect(ans));
			if (captcha.isCorrect(ans)) {
				req.getSession().removeAttribute(Captcha.NAME);
		        result = "200";
			} else {
				result = "300";
			}
		}
		return ResponseEntity.ok(RestResponse.ok(result));
	}
	
	//아이디 찾기
	@RequestMapping(value="/findCustId", method=RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<RestResponse> findId(@RequestBody CommonMap commonMap, HttpServletRequest request, HttpServletResponse response){
			 return ResponseEntity.ok(RestResponse.ok(loginService.selectCustLoginIdByCustName(commonMap)));
		 
   	}
	
	

}
