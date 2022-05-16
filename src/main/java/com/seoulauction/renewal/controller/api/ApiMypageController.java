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
import com.seoulauction.renewal.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/mypage")
public class ApiMypageController {

	private final MypageService mypageService;

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
}
