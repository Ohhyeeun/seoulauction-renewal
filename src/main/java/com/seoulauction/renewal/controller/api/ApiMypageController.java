package com.seoulauction.renewal.controller.api;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/mypage")
public class ApiMypageController {

	private final MypageService mypageService;

	@Value("${mobile.msg.callback}")
	String callback;

	@Value("${mobile.msg.auth}")
	String auth;

	// 정회원 이력
	@RequestMapping(value = "/memberHistories", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> memberHistories(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectCustomerCustpayList(commonMap)));
	}
	
	@RequestMapping(value = "/academies", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> academies(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonMap commonMap = new CommonMap("cust_no", principal.getName());
		commonMap.putPage(page, size);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectAcademyList(commonMap)));
	}

	/* 아카데미 결제 정보 */
	@RequestMapping(value = "/academies/{academyNo}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> academyPayInfo(@PathVariable("academyNo") String academyNo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonMap commonMap = new CommonMap();
		commonMap.put("academy_no", academyNo);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectAcademyPayInfo(commonMap)));
	}
	
	/* 결제내역 select box */
	@RequestMapping(value = "/saleList", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> onlinePaies(Principal principal) throws Exception {
		CommonMap commonMap = new CommonMap();
		commonMap.put("cust_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectSaleListByCustNo(commonMap)));
	}
	
	@RequestMapping(value = "/onlinePaies", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> onlinePaies(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			@RequestParam(required = false) String searchMonth,
			@RequestParam(required = false) String searchKeyword,
			@RequestParam(required = false) String searchStartDt,
			@RequestParam(required = false) String searchEndDt,
			Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		
		commonMap.put("searchMonth", searchMonth);
		commonMap.put("searchKeyword", searchKeyword);
		commonMap.put("searchStartDt", searchStartDt);
		commonMap.put("searchEndDt", searchEndDt);
		
		commonMap.put("cust_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectPayListByCustNo(commonMap)));
	}
	

	@RequestMapping(value = "/saleCert/sendAuthNum", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> sendAuthNumber(@RequestBody CommonMap commonMap, HttpServletRequest request,
			HttpServletResponse response) {

		CommonMap existMap = mypageService.selectSaleCertByCustHp(commonMap);
		Boolean bid = commonMap.get("bid_auth") != null && (Boolean) commonMap.get("bid_auth"); // 경매용 폰번호 인증시
		Map<String, Object> resultMap = new HashMap<>();

		// 경매전용 인증이 아니고 현재 폰인증한 내역이 없으면 무시.
		if (!bid || MapUtils.isEmpty(existMap)) {

			commonMap.put("from_phone", callback); // 02-395-0330
			// paramMap.put("msg", "서울옥션 인증번호는 [##rand_num##] 입니다.");
			commonMap.put("msg", auth);

			resultMap = mypageService.selectAuthNumber(commonMap);

			if (resultMap.containsKey("AUTH_NUM")) {
				BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
				request.getSession().setAttribute("AUTH_NUM", encode.encode(resultMap.get("AUTH_NUM").toString()));
			}
			resultMap.put("AUTH_NUM", "");
			resultMap.put("SEND_STATUS", true);
			resultMap.put("AUTH_EXISTS", false);
		} else { // 둘다 해당할경우 폰인증을 막음.
			resultMap.put("AUTH_EXISTS", true);
		}
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}

	@RequestMapping(value = "/saleCert/confirmAuthNum4sale", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> confirmAuthNum4sale(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		boolean b = this.confirmAuthNumber(commonMap, request, response);
		if (b) {
//	   	   	UsernamePasswordAuthenticationToken userToken = (UsernamePasswordAuthenticationToken) request.getUserPrincipal();
//	    	SAUserDetails user = (SAUserDetails) userToken.getDetails();
//			request.getSession().setAttribute("AUTH_NUM", null);
			
			return ResponseEntity.ok(RestResponse.ok(commonMap));
//			commonMap.put("action_user_no", principal.getName());
//			return ResponseEntity.ok(RestResponse.ok(mypageService.inertSaleCert(commonMap)));
		} else {
			throw new SAException("인증번호가 일치하지 않습니다."); 
		}
	}

	@RequestMapping(value = "/saleCert/confirmAuthNum", method = RequestMethod.POST)
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

	@RequestMapping(value = "/saleCert/clearAuthNum", method = RequestMethod.POST)
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

	@RequestMapping(value = "/saleCert/inertSaleCert", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inertSaleCert(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.inertSaleCert(commonMap)));
	}
	
	@RequestMapping(value = "/saleCert/updateSaleCertHp", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> updateSaleCertHp(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.updateSaleCertHp(commonMap)));
	}
	
	@RequestMapping(value = "/inquiries", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> inquiries(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectInquiryList(commonMap)));
	}

	
	@RequestMapping(value = "/inquiries/{writeNo}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> inquiry(@PathVariable("writeNo") String writeNo, Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		// user정보 put 공통 함수 호출 필요.
		commonMap.put("action_user_no", principal.getName());
		commonMap.put("write_no", writeNo);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectInquiry(commonMap)));
	}
  
	@RequestMapping(value = "/categories", method = RequestMethod.POST)
	public ResponseEntity<RestResponse> categories(@RequestBody CommonMap commonMap, Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		commonMap.put("action_user_no", principal.getName());
		commonMap.put("category", mypageService.selectInquiryCategory(commonMap));
		commonMap.put("customerInfo", mypageService.selectInquiryCustomerInfo(commonMap));
		return ResponseEntity.ok(RestResponse.ok(commonMap));
	}

	@RequestMapping(value = "/inquiry", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inquiryWirte(MultipartHttpServletRequest request, Principal principal)
			throws IOException {
		
		return ResponseEntity.ok(RestResponse.ok(mypageService.insertInquiry(request, principal)));
	}
	
	@RequestMapping(value = "/address", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> findAddr(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info(paramMap.toString());
    	Map<String, Object> resultMap = mypageService.findAddr(paramMap);
        if(resultMap != null) {
        	log.info(resultMap.toString());
        }
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}


	@RequestMapping(value = "/inteLots", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> inteLots(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			@RequestParam(required = false) String sale_kind,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("sale_kind", sale_kind);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectInteLotList(commonMap)));
	}
	
	@RequestMapping(value = "/inteLotDelete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inteLotDelete(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.deleteCustInteLot(commonMap)));
	}
}
