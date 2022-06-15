package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.CertificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/cert")
public class ApiCertificationController {

	private final CertificationService certificationService;
	
	@Value("${mobile.msg.callback}")
	String callback;

	@Value("${mobile.msg.auth}")
	String auth;
			
	//휴대폰 인증
	@RequestMapping(value = "/sendAuthNum", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> sendAuthNumber(@RequestBody CommonMap commonMap, HttpServletRequest request,
			HttpServletResponse response) {
		Boolean bid = commonMap.get("bid_auth") != null && (Boolean) commonMap.get("bid_auth"); // 경매용 폰번호 인증시
		CommonMap existMap = new CommonMap();
		if(bid) {
			existMap = certificationService.selectSaleCertByCustHp(commonMap);
		} else {
			//기존에는 체크하지 않았지만 to-be에는 폰번호 중복체크!(list로 받는 이유는 기존 데이터의 경우 하나의 번호로 조회시 다건 조회)
			List<CommonMap> duplicationCustList = certificationService.selectDuplicationForJoin(commonMap);
			if(null != duplicationCustList && duplicationCustList.size() > 0) {
				existMap = duplicationCustList.get(0);				
			}
		}
		
		Map<String, Object> resultMap = new HashMap<>();

		//현재 폰인증한 내역이 없으면 무시.
		if (MapUtils.isEmpty(existMap)) {

			commonMap.put("from_phone", callback); // 02-395-0330
			// paramMap.put("msg", "서울옥션 인증번호는 [##rand_num##] 입니다.");
			commonMap.put("msg", auth);

			resultMap = certificationService.selectAuthNumber(commonMap);

			if (resultMap.containsKey("AUTH_NUM")) {
				BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
				request.getSession().setAttribute("AUTH_NUM", encode.encode(resultMap.get("AUTH_NUM").toString()));
			}
			resultMap.put("AUTH_NUM", "");
			resultMap.put("SEND_STATUS", true);
			resultMap.put("AUTH_EXISTS", false);
		} else { // 폰인증을 막음.
			resultMap.put("AUTH_EXISTS", true);
		}
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}

	@RequestMapping(value = "/confirmAuthNumCheck", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> confirmAuthNumCheck(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		boolean b = this.confirmAuthNumber(commonMap, request, response);
		if (b) {
			return ResponseEntity.ok(RestResponse.ok(commonMap));
		} else {
			throw new SAException("인증번호가 일치하지 않습니다."); 
		}
	}

	@RequestMapping(value = "/confirmAuthNum", method = RequestMethod.POST)
	@ResponseBody
	public boolean confirmAuthNumber(@RequestBody Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) {
		if (paramMap == null || paramMap.get("auth_num") == null || paramMap.get("auth_num").toString().equals(""))
			return false;
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		try {
			boolean result = encode.matches(paramMap.get("auth_num").toString(),
					request.getSession().getAttribute("AUTH_NUM").toString());
			return result;
		} catch (Exception ex) {
			return false;
		}
	}

	@RequestMapping(value = "/clearAuthNum", method = RequestMethod.POST)
	@ResponseBody
	public boolean clearAuthNumber(@RequestBody Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.getSession().setAttribute("AUTH_NUM", null);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@RequestMapping(value = "/inertSaleCert", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inertSaleCert(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(certificationService.inertSaleCert(commonMap)));
	}
	
	@RequestMapping(value = "/updateSaleCertHp", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> updateSaleCertHp(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(certificationService.updateSaleCertHp(commonMap)));
	}
	
}
