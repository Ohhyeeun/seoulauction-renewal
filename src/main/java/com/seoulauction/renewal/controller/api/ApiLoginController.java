package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MessageService;
import com.seoulauction.renewal.service.MypageService;
import com.seoulauction.renewal.utill.CaptchaUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import nl.captcha.Captcha;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/login")
public class ApiLoginController {

	private final LoginService loginService;

	private final MessageService messageService;

	private final MypageService mypageService;

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
	

	  //비밀번호 찾기
	    @RequestMapping(value="/findCustPassword", method=RequestMethod.POST)
	    @ResponseBody
	    public ResponseEntity<RestResponse> findCustPassword(Locale locale, @RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
			try{
				paramMap.put("stat_cd", "normal");
	        	CommonMap custMap = loginService.selectCustomerByStatCdAndLoginId(paramMap);
	        	
	        	Map<String, Object> resultMap = new HashMap<String, Object>();
	        	
	        	//소셜로그인
	        	if(custMap.get("SOCIAL_TYPE") != null && !custMap.get("SOCIAL_TYPE").equals("")) {
	        		resultMap.put("SOCIAL_TYPE", custMap.get("SOCIAL_TYPE").toString());
	        		return ResponseEntity.ok(RestResponse.ok(resultMap));
	        	}
	        	
		        int result = loginService.updatePasswordByLoginId(paramMap);
		        
		        if(result > 0 ){
		        	if("email".equals(paramMap.get("search_type"))) {
			        	resultMap.put("PASSWD", paramMap.get("passwd").toString());
			        	resultMap.put("LOGIN_ID", paramMap.get("login_id").toString());
			        	resultMap.put("CUST_NAME", paramMap.get("cust_name").toString());
			        	
			        	String subject = locale.equals("en") ? "[SeoulAuction] Issued a temporary password reminder" : "[서울옥션] 임시 비밀번호 발급 알림";
			        	String template = locale.equals("en") ? "passwd_en.html" : "passwd.html";
				        messageService.sendMail(paramMap.get("search_value").toString(), subject, template, resultMap);
		        	} else {
			        	String msg = locale.equals("en") ? 
			        			"[SeoulAuction SMS] Issued a temporary password reminder\n temporary password : " + paramMap.get("passwd").toString()
			        			: "[서울옥션 문자발송] 임시 비밀번호 발급 알림\n 임시비밀번호 : "+ paramMap.get("passwd").toString(); 
			        	
			        	//최종 문자 발송 데이터
			        	paramMap.put("from_phone", callback.toString()); //02-395-0330
			        	paramMap.put("to_phone", paramMap.get("search_value").toString());
			        	paramMap.put("msg", msg.toString()); 
				   		resultMap = mypageService.selectAuthNumber(paramMap);
		        	}
		        	//성공
		        	return ResponseEntity.ok(RestResponse.ok(resultMap));
		        }
		        else{
		        	//실패
		        	 throw new SAException("일치하는 회원 정보가 없습니다.");
		        }
			}
			catch(Exception ex){
				//실패
				ex.printStackTrace();
				throw new SAException("오류가 발생하였습니다. 관리자에게 문의하세요."); 
			}
	    }

}
