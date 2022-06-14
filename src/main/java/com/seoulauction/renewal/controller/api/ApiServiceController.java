package com.seoulauction.renewal.controller.api;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.ServiceService;
import com.seoulauction.renewal.util.SecurityUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/service")
public class ApiServiceController {

	private final ServiceService serviceService;
	
	// 진행 중인 아카데미
	@RequestMapping(value = "/academies/now", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> academyNow(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
		if(saUserDetails == null) {
			commonMap.put("action_user_no", null);
		}else {
			commonMap.put("action_user_no", saUserDetails.getUserNo());
		}
		return ResponseEntity.ok(RestResponse.ok(serviceService.selectAcademyForNow(commonMap)));
	}
	
	// 아카데미 상세
	@RequestMapping(value = "/academies/{academyCd}/{academyNo}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> academyDetail(
			@PathVariable("academyNo") String academyNo,
			@PathVariable("academyCd") String academyCd,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
		if(saUserDetails == null) {
			commonMap.put("action_user_no", null);
		}else {
			commonMap.put("action_user_no", saUserDetails.getUserNo());
		}
		commonMap.put("academy_no", academyNo);
		commonMap.put("academy_cd", academyCd);
		return ResponseEntity.ok(RestResponse.ok(serviceService.selectAcademy(commonMap)));
	}
	
	// 아카데미 목록
	@RequestMapping(value = "/academies/{academyCd}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> academyList(
			@PathVariable("academyCd") String academyCd,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("왜안타냐고요");
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("academy_cd", academyCd);
		return ResponseEntity.ok(RestResponse.ok(serviceService.selectAcademyList(commonMap)));
	}
}
