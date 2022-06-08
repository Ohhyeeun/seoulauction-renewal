package com.seoulauction.renewal.controller.api;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.MapUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MypageService;
import com.seoulauction.renewal.util.SecurityUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/mypage")
public class ApiMypageController {

	private final MypageService mypageService;
	
	private final LoginService loginService;

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

	
	@RequestMapping(value = "/liveBidReqs", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidReqs(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectBidReqList(commonMap)));
	}
	
	@RequestMapping(value = "/liveBidReqHistories/{sale_no}/{lot_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidReqHistories(
			@PathVariable("sale_no") String sale_no, @PathVariable("lot_no") String lot_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("lot_no", lot_no);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidReqHistoryList(commonMap)));
	}

	@RequestMapping(value = "/liveBids", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBids(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidList(commonMap)));
	}
	

	@RequestMapping(value = "/liveBidHistories/{sale_no}/{lot_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidHistories(
			@PathVariable("sale_no") String sale_no, @PathVariable("lot_no") String lot_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("lot_no", lot_no);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidHistoryList(commonMap)));
	}
	@RequestMapping(value = "/liveBidHammers/{sale_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidHistories(
			@PathVariable("sale_no") String sale_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidHammerList(commonMap)));
	}
	
	@RequestMapping(value = "/onlineBids", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> onlineBids(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectOnlineBidList(commonMap)));
	}
	
	@RequestMapping(value = "/onlineBidHistories/{sale_no}/{lot_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> onlineBidHistories(
			@PathVariable("sale_no") String sale_no, @PathVariable("lot_no") String lot_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("lot_no", lot_no);
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectOnlineBidHistoryList(commonMap)));
	}
	
	//비밀번호 확인
	@RequestMapping(value="/chkPassword", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public ResponseEntity<RestResponse> chkPassword(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
	
	    log.info("chkPassword");
	    paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
	    log.info(paramMap.toString());
	    
	    CommonMap resultMap = mypageService.selectCustForChkPassword(paramMap);
	    if(MapUtils.isEmpty(resultMap)) {
			return ResponseEntity.ok(RestResponse.builder().success(false).build());
		}else {
	    	return ResponseEntity.ok(RestResponse.ok());
	    }
	}
	
	//비밀번호 변경
	@RequestMapping(value="/modPassword", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public ResponseEntity<RestResponse> modPassword(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
	
	    log.info("modPassword");
	    paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
	    log.info(paramMap.toString());
	    
	    int result = mypageService.updateCustPasswdByCustNo(paramMap);
	    if(result > 0) {
	    	new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
			return ResponseEntity.ok(RestResponse.ok());
		}else {
			throw new SAException("비밀번호 변경이 실패하였습니다.");
	    }
	}
	
	//SNS연동현황
	@RequestMapping(value="/snsLinks", method=RequestMethod.GET)
	public ResponseEntity<RestResponse> snsLinks(HttpServletRequest request, HttpServletResponse response){
	
	    log.info("snsLinks");
	    CommonMap paramMap = new CommonMap();
	    paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
	    log.info(paramMap.toString());
	    
	    List<CommonMap> resultList = mypageService.selectCustSocialByCustNo(paramMap);
	    log.info(resultList.toString());
	    return ResponseEntity.ok(RestResponse.ok(resultList));
	}
		
	//SNS연동설정
	@RequestMapping(value="/snsLink", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public ResponseEntity<RestResponse> snsLink(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){

        CommonMap resultMap = loginService.selectCustForCustSocial(paramMap);
        if(resultMap != null) {
        	throw new SAException("이미 가입된 SNS계정입니다.");
        }
        
	    log.info("snsLink");
	    paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
	    paramMap.put("social_login_id", SecurityUtils.getAuthenticationPrincipal().getLoginId());
	    log.info(paramMap.toString());
	    
	    int result = loginService.insertCustSocial(paramMap);
	    log.info(paramMap.toString());
	    if(result > 0) {
			return ResponseEntity.ok(RestResponse.ok(paramMap));
		}else {
			throw new SAException("SNS연동이 실패하였습니다.");
	    }
	}

	//SNS연동해제
	@RequestMapping(value="/snsUnLink", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public ResponseEntity<RestResponse> snsUnLink(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
	
	    log.info("snsUnLink");
	    paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
	    log.info(paramMap.toString());
	    
	    int result = mypageService.deleteCustSocial(paramMap);
	    if(result > 0) {
			return ResponseEntity.ok(RestResponse.ok());
		}else {
			throw new SAException("SNS연동해제가 실패하였습니다.");
	    }
	}

	//네이버 연동해제
	@RequestMapping(value="/naversignOut", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public ResponseEntity<RestResponse> naversignOut(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info("naversignOut");
		log.info(paramMap.toString());
		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+paramMap.get("client_id")+
		 		"&client_secret="+paramMap.get("client_secret")+"&access_token="+paramMap.get("token")+"&service_provider=NAVER";
		log.info("apiUrl===== {}", apiUrl);
		
		String res = "";
		try {
			res = mypageService.requestToServer(apiUrl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ResponseEntity.ok(RestResponse.ok(res));
	}
}
