package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MypageService;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections4.MapUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/mypage")
public class ApiMypageController {

	private final MypageService mypageService;
	
	private final LoginService loginService;

	/* 정회원 이력 */
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> member(
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectCustomerInfo(commonMap)));
	}
	
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
	
	/* 아카데미 신청 이력 */
	@RequestMapping(value = "/academies", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> academies(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonMap commonMap = new CommonMap("action_user_no", principal.getName());
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
	
	/* 결제내역 리스트 */
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
		
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 115551);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectPayListByCustNo(commonMap)));
	}
	
	/* 1대1 문의 리스트*/
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

	/* 1대1 문의 상세*/
	@RequestMapping(value = "/inquiries/{writeNo}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<RestResponse> inquiry(@PathVariable("writeNo") String writeNo, Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("action_user_no", principal.getName());
		commonMap.put("write_no", writeNo);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectInquiry(commonMap)));
	}
  
	/* 1대1 문의 상세 > 카테고리 리스트*/
	@RequestMapping(value = "/categories", method = RequestMethod.POST)
	public ResponseEntity<RestResponse> categories(@RequestBody CommonMap commonMap, Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		commonMap.put("action_user_no", principal.getName());
		commonMap.put("category", mypageService.selectInquiryCategory(commonMap));
		commonMap.put("customerInfo", mypageService.selectInquiryCustomerInfo(commonMap));
		return ResponseEntity.ok(RestResponse.ok(commonMap));
	}

	/* 1대1 문의 등록*/
	@RequestMapping(value = "/inquiry", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inquiryWirte(MultipartHttpServletRequest request, Principal principal)
			throws IOException {
		
		return ResponseEntity.ok(RestResponse.ok(mypageService.insertInquiry(request, principal)));
	}

	/* 관심정보 리스트*/
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
	
	/* 관심정보 삭제*/
	@RequestMapping(value = "/inteLotDelete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inteLotDelete(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.deleteCustInteLot(commonMap)));
	}
	
	/* 관심정보  등록*/
	@RequestMapping(value = "/inteLotInsert", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> inteLotInsert(@RequestBody CommonMap commonMap, Principal principal,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		commonMap.put("action_user_no", principal.getName());
		return ResponseEntity.ok(RestResponse.ok(mypageService.insertCustInteLot(commonMap)));
	}

	
	/* 라이브경매관리 > 응찰신청 내역*/
	@RequestMapping(value = "/liveBidReqs", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidReqs(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
		//commonMap.put("action_user_no", 23094);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectBidReqList(commonMap)));
	}
	
	/* 라이브경매관리 > 응찰신청 내역 > 응찰 팝업*/
	@RequestMapping(value = "/liveBidReqHistories/{sale_no}/{lot_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidReqHistories(
			@PathVariable("sale_no") String sale_no, @PathVariable("lot_no") String lot_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("lot_no", lot_no);
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 23094);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidReqHistoryList(commonMap)));
	}

	/* 라이브경매관리 > 온라인패들응찰내역*/
	@RequestMapping(value = "/liveBids", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBids(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 113248);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidList(commonMap)));
	}
	

	/* 라이브경매관리 > 온라인패들응찰내역 > 온라인패들응찰 팝업*/
	@RequestMapping(value = "/liveBidHistories/{sale_no}/{lot_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidHistories(
			@PathVariable("sale_no") String sale_no, @PathVariable("lot_no") String lot_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("lot_no", lot_no);
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 113248);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidHistoryList(commonMap)));
	}
	
	/* 라이브경매관리 > 온라인패들응찰내역 > 낙찰결과통보서 팝업*/
	@RequestMapping(value = "/liveBidHammers/{sale_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> liveBidHammers(
			@PathVariable("sale_no") String sale_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 113248);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectLiveBidHammerList(commonMap)));
	}
	
	/* 온라인경매관리 > 응찰내역 */
	@RequestMapping(value = "/onlineBids", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> onlineBids(
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
			@RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.putPage(page, size);
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 75396);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectOnlineBidList(commonMap)));
	}
	
	/* 온라인경매관리 > 응찰내역 > 응찰내역 팝업*/
	@RequestMapping(value = "/onlineBidHistories/{sale_no}/{lot_no}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> onlineBidHistories(
			@PathVariable("sale_no") String sale_no, @PathVariable("lot_no") String lot_no,
			Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap commonMap = new CommonMap();
		commonMap.put("sale_no", sale_no);
		commonMap.put("lot_no", lot_no);
		commonMap.put("action_user_no", principal.getName());
//		commonMap.put("action_user_no", 75396);
		return ResponseEntity.ok(RestResponse.ok(mypageService.selectOnlineBidHistoryList(commonMap)));
	}
	
	/* 비밀번호 확인*/
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
	
	/* 비밀번호 변경*/
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
	
	/* SNS연동현황*/
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
		
	/* SNS연동설정*/
	@RequestMapping(value="/snsLink", method=RequestMethod.POST, headers = {"content-type=application/json"})
	@ResponseBody
	public ResponseEntity<RestResponse> snsLink(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){

        CommonMap resultMap = loginService.selectCustForCustSocial(paramMap);
        if(resultMap != null) {
        	throw new SAException("이미 서울옥션에 가입 또는 연동된 소셜 계정입니다. 다른 계정으로 연동해 주세요.");
        }
        
	    log.info("snsLink");
	    paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
	    log.info(paramMap.toString());
	    
	    int result = loginService.insertCustSocial(paramMap);
	    log.info(paramMap.toString());
	    if(result > 0) {
			return ResponseEntity.ok(RestResponse.ok(paramMap));
		}else {
			throw new SAException("SNS연동이 실패하였습니다.");
	    }
	}

	/* SNS연동해제*/
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

	/* 회원정보조회*/
	@RequestMapping(value = "/custs/{custNo}", method = RequestMethod.GET)
	public ResponseEntity<RestResponse> cust(@PathVariable("custNo") String custNo, 
//			@RequestParam(required = false) String socialType,
//			@RequestParam(required = false) String socialEmail,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		CommonMap paramMap = new CommonMap();
		// user정보 put 공통 함수 호출 필요.
		paramMap.put("cust_no", custNo);
		paramMap.put("remember_me", 'N');
		
		CommonMap resultMap = loginService.selectCustByCustNo(paramMap);
		List<CommonMap> inteArtistList = mypageService.selectCustInteArtist(paramMap);
		if(inteArtistList.size() > 0) {
			resultMap.put("INTE_ARTIST_LIST", inteArtistList);
		}
		
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}
	
	/* 회원정보수정*/
	@RequestMapping(value = "/custs/{custNo}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> custModify(@PathVariable("custNo") String custNo, 
			@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response) throws IOException {
		paramMap.put("cust_no", custNo);
		try {
			int result = mypageService.updateCust(paramMap);
			result += mypageService.updateCustPushWay(custNo, paramMap.get("push_way") == null ? "" : paramMap.get("push_way").toString());
			result += mypageService.updateCustInteArtist(custNo, paramMap.get("inte_artist") == null ? "" : paramMap.get("inte_artist").toString());
			result += mypageService.updateCustInteArea(custNo, paramMap.get("inte_area") == null ? "" : paramMap.get("inte_area").toString());
			return ResponseEntity.ok(RestResponse.ok());
		} catch (Exception e) {
			throw new SAException("회원정보 수정이 실패하였습니다.");
		}
	}

	/* 회원탈퇴*/
	@RequestMapping(value = "/custs/leave", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> custLeave(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response) throws IOException {
		SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
		paramMap.put("cust_no", saUserDetails.getUserNo());
		
		try {
			//응찰 중이거나, 자동응찰 중이거나, 낙찰 후 결제대기 경매가 있을 경우 탈퇴불가
			int validCheck = mypageService.custLeaveValidCheck(paramMap);
			
			if(validCheck > 0) {
				throw new SAException("응찰 중이거나, 낙찰 후 결제대기 중이므로 탈퇴가 불가능합니다.");
			}else {
				log.info("========== cust Leave Available ==========");
				//회원탈퇴, 고객수신방법삭제, 고객발송정보delyn=y 처리
				int result = mypageService.deleteCust(paramMap);
				if(result > 0) {
					//탈퇴 성공 시 로그아웃
					new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SAException(e.getMessage());
		}
		
		return ResponseEntity.ok(RestResponse.ok());
	}
	
	/* 관심분야 목록조회*/
	@RequestMapping(value = "/interestAreas", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> interestAreas(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info(paramMap.toString());
		List<CommonMap> resultMap = loginService.selectCode(paramMap);
        if(resultMap != null) {
        	log.info(resultMap.toString());
        }
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}
	
	/* 작가검색*/
	@RequestMapping(value = "/artists", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RestResponse> artists(@RequestBody CommonMap paramMap, HttpServletRequest request, HttpServletResponse response){
		log.info(paramMap.toString());
		List<CommonMap> resultMap = mypageService.selectArtistByArtistName(paramMap);
        if(resultMap != null) {
        	log.info(resultMap.toString());
        }
		return ResponseEntity.ok(RestResponse.ok(resultMap));
	}
}
