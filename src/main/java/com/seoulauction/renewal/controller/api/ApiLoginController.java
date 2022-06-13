package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.auth.FrontAuthenticationProvider;
import com.seoulauction.renewal.auth.SocialAuthenticationProvider;
import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.*;
import com.seoulauction.renewal.util.CaptchaUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import nl.captcha.Captcha;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/login")
public class ApiLoginController {

	private final S3Service s3Service;
	
	private final LoginService loginService;
	
	private final MessageService messageService;

	private final CertificationService certificationService;

	private final MypageService mypageService;

	private final FrontAuthenticationProvider frontAuthenticationProvider;

	private final SocialAuthenticationProvider socialAuthenticationProvider;
	
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
	        	
	        	if(custMap != null) {
	        		Map<String, Object> resultMap = new HashMap<String, Object>();
		        	
		        	//소셜로그인
		        	if(custMap.get("SOCIAL_YN") != null && custMap.get("SOCIAL_YN").equals("Y")) {
		        		resultMap.put("SOCIAL_YN", custMap.get("SOCIAL_YN").toString());
		        		resultMap.put("SOCIAL_TYPE", custMap.get("SOCIAL_TYPE").toString());
		        		return ResponseEntity.ok(RestResponse.ok(resultMap));
		        	}
		        	
			        int result = loginService.updatePasswordByLoginId(paramMap);
			        
			        if(result > 0 ){
			        	if("email".equals(paramMap.get("search_type"))) {
				        	resultMap.put("PASSWD", paramMap.get("passwd").toString());
				        	resultMap.put("LOGIN_ID", paramMap.get("login_id").toString());
				        	resultMap.put("CUST_NAME", paramMap.get("cust_name").toString());
				        	
				        	String subject = locale.toString().equals("en") ? "[SeoulAuction] Issued a temporary password reminder" : "[서울옥션] 임시 비밀번호 발급 알림";
				        	String template = locale.toString().equals("en") ? "passwd_en.html" : "passwd.html";
				        	String port = request.getServerPort() == 9000 ? ":" + String.format("%d", request.getServerPort()) : "";
				        	resultMap.put("currentUrl", "http://" + request.getServerName() + port);
				        	
				        	messageService.sendMail(paramMap.get("search_value").toString(), subject, template, resultMap);
			        	} else {
				        	String msg = locale.equals("en") ? 
				        			"[SeoulAuction SMS] Issued a temporary password reminder\n temporary password : " + paramMap.get("passwd").toString()
				        			: "[서울옥션 문자발송] 임시 비밀번호 발급 알림\n 임시비밀번호 : "+ paramMap.get("passwd").toString(); 
				        	
				        	//최종 문자 발송 데이터
				        	paramMap.put("from_phone", callback.toString()); //02-395-0330
				        	paramMap.put("to_phone", paramMap.get("search_value").toString());
				        	paramMap.put("msg", msg.toString()); 

					   		resultMap = certificationService.selectAuthNumber(paramMap);
			        	}
			        	//성공
			        	return ResponseEntity.ok(RestResponse.ok(resultMap));
			        } else {
			        	throw new SAException("오류가 발생하였습니다. 관리자에게 문의하세요."); 
			        }
	        	} else {
	        		throw new SAException("일치하는 회원 정보가 없습니다.");
	        	}
			}
			catch(Exception ex){
				//실패
				ex.printStackTrace();
				throw new SAException("오류가 발생하였습니다. 관리자에게 문의하세요."); 
			}
	    }

	@RequestMapping(value="/isIdExist", method=RequestMethod.POST)
	@ResponseBody
	public List<CommonMap> isIdExist(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){

	    log.info("isIdExist");
	    log.info(paramMap.toString());
	    
	    List<CommonMap> resultMap = loginService.selectCustForIdExist(paramMap);
	    return resultMap;
	}
	
	@RequestMapping(value="/isEmailExist", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public List<CommonMap> isEmailExist(String domain, @RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){

	    log.info("isEmailExist");
	    log.info(paramMap.toString());
	    
	    List<CommonMap> resultMap = loginService.selectCustForExist(paramMap);
	    return resultMap;
	}
	
	@RequestMapping(value="/isCompNoExist", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public List<CommonMap> isCompNoExist(String domain, @RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){

	    log.info("isCompNoExist");
	    log.info(paramMap.toString());
	    
	    List<CommonMap> resultMap = loginService.selectCustForExist(paramMap);
	    return resultMap;
	}
	
	@RequestMapping(value = "/employee", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> findAddr(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info(paramMap.toString());
		CommonMap resultMap = loginService.selectEmpByEmpName(paramMap);
        if(resultMap != null) {
        	log.info(resultMap.toString());
        }
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}
	
	@RequestMapping(value = "/nations", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> nations(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info(paramMap.toString());
		List<CommonMap> resultMap = loginService.selectCode(paramMap);
        if(resultMap != null) {
        	log.info(resultMap.toString());
        }
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}

	@RequestMapping(value = "/pushWays", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> pushWays(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info(paramMap.toString());
		List<CommonMap> resultMap = loginService.selectCode(paramMap);
        if(resultMap != null) {
        	log.info(resultMap.toString());
        }
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> join(MultipartHttpServletRequest request, HttpServletResponse response){
		CommonMap paramMap = new CommonMap(mypageService.formatMapRequest(request));
		log.info(paramMap.toString());
		int result = loginService.insertCust(paramMap);
        if(result > 0) {
        	String custNo = "";
        	String socialType = paramMap.get("social_type") == null ? "" : paramMap.get("social_type").toString();
        	String localKindCd = paramMap.get("local_kind_cd") == null ? "" : paramMap.get("local_kind_cd").toString();
        	String custKindCd = paramMap.get("cust_kind_cd") == null ? "" : paramMap.get("cust_kind_cd").toString();
        	Boolean pwEmail = Boolean.parseBoolean(paramMap.get("push_way_email").toString());
        	Boolean pwSms = Boolean.parseBoolean(paramMap.get("push_way_sms").toString());
        	Boolean pwPhone = Boolean.parseBoolean(paramMap.get("push_way_phone").toString());
        	
        	CommonMap resultMap = loginService.selectCustForExist(paramMap).get(0);
        	custNo = resultMap.get("CUST_NO").toString();

        	if(socialType != "" || pwEmail || pwSms || pwPhone) {
        		paramMap.put("cust_no", custNo);
        		if(pwEmail) {
        			paramMap.put("push_way_cd", "email");
        			result += loginService.insertCustPushWay(paramMap);
        		}
        		if(pwSms) {
        			paramMap.put("push_way_cd", "sms");
        			result += loginService.insertCustPushWay(paramMap);
        		}
        		if(pwPhone) {
        			paramMap.put("push_way_cd", "phone");
        			result += loginService.insertCustPushWay(paramMap);
        		}
        		if(socialType != "") {
            		paramMap.put("push_way_cd", "email");
            		result += loginService.insertCustSocial(paramMap);
            		
            		if(localKindCd.equals("korean")) {
            			//국내회원 회원가입 완료시 로그인 처리 (국내 소셜)
            			//해외회원은 이메일 인증 후 로그인가능 (현재 STAT_CD == not_certify)
            			SAUserDetails parameterUserDetail = SAUserDetails.builder()
            					.socialType(paramMap.get("social_type").toString()) // social_type
            					.socialEmail(paramMap.get("social_email").toString()) // social_email
            					.ip(loginService.getIp(request))
            					.build();
            			
            			SecurityContext sc = SecurityContextHolder.getContext();
            			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(paramMap.get("social_login_id").toString(), null);
            			auth.setDetails(parameterUserDetail);
            			sc.setAuthentication(socialAuthenticationProvider.authenticate(auth));
            			
            			HttpSession session = request.getSession(true);
            			session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
            			
            			return ResponseEntity.ok(RestResponse.ok());
            		}
        		}
        	}
        	
        	if(localKindCd.equals("korean")) {
        		if(custKindCd.equals("company")){
        			//사업자회원 사업자등록증 s3 upload
        			try {	
        				Map<String, List<MultipartFile>> fileList = request.getMultiFileMap();
        	    		
        	    		MultipartFile compFile = fileList.get("comp_file").get(0);
        	    		if(!compFile.getOriginalFilename().equals("")) {
        	    			s3Service.insertS3FileData(true, compFile, "cust_comp", custNo);
        	    		}
        			} catch (Exception e) {
        				e.printStackTrace();
        			}
        		}
        		
	        	//국내회원 회원가입 완료시 로그인 처리 (국내 개인,사업자)
    			//해외회원은 이메일 인증 후 로그인가능 (현재 STAT_CD == not_certify)
	        	SecurityContext sc = SecurityContextHolder.getContext();
	        	UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(paramMap.get("login_id").toString(), paramMap.get("passwd").toString());
	        	auth.setDetails(loginService.getIp(request));
	        	sc.setAuthentication(frontAuthenticationProvider.authenticate(auth));
	        	
	        	HttpSession session = request.getSession(true);
	    		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
    		}else {
    			//해외회원 신분증/증빙서류 s3 upload
    			try {	
    				Map<String, List<MultipartFile>> fileList = request.getMultiFileMap();
    	    		
    	    		MultipartFile foreIdFile = fileList.get("fore_id_file").get(0);
    	    		if(!foreIdFile.getOriginalFilename().equals("")) {
    	    			s3Service.insertS3FileData(true, foreIdFile, "cust_fore_id", custNo);
    	    		}
					
    	    		
	    	    	MultipartFile foreDocFile = fileList.get("fore_doc_file").get(0);;
	    	    	if(!foreDocFile.getOriginalFilename().equals("")) {
						s3Service.insertS3FileData(true, foreDocFile, "cust_fore_doc", custNo);
    	    		}
					
	    	    	//해외회원 인증 메일 발송
	    	    	String port = request.getServerPort() == 9000 ? ":" + String.format("%d", request.getServerPort()) : "";
		        	resultMap.put("authURL", "http://" + request.getServerName() + port + "/join/" + resultMap.get("FORE_CERT_CODE").toString() + "?lang=en");
		        	resultMap.put("currentURL", "http://" + request.getServerName() + port);
	    	    	messageService.sendMail(paramMap.get("email").toString(),"Please, complete your registration." , "foreign_auth.html", resultMap);
	    	    	
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    		}
        }
        
		return ResponseEntity.ok(RestResponse.ok());
	}
	
	// 소셜 로그인
	@RequestMapping(value = "/social", method = RequestMethod.POST)
	public ResponseEntity<RestResponse> socialLogin(HttpServletRequest request
			, @RequestBody CommonMap paramMap
			, RedirectAttributes redirect) {
    	
		log.info("socialLogin");
		log.info(paramMap.toString());
		
		SAUserDetails parameterUserDetail = SAUserDetails.builder()
				.socialType(paramMap.get("social_type").toString()) // social_type
				.socialEmail(paramMap.get("social_email").toString()) // social_email
				.ip(loginService.getIp(request))
				.build();

		SecurityContext sc = SecurityContextHolder.getContext();
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(null, null);
		auth.setDetails(parameterUserDetail);
		sc.setAuthentication(socialAuthenticationProvider.authenticate(auth));

		HttpSession session = request.getSession(true);
		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);

        return ResponseEntity.ok(RestResponse.ok());
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> logout(HttpServletRequest request, HttpServletResponse response){
		log.info("logout");
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		return ResponseEntity.ok(RestResponse.ok());
	}
}
