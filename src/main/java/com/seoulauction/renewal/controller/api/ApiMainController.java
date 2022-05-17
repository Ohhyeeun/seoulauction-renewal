package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/main")
public class ApiMainController {
    private final MainService mainService;
    
    private final LoginService loginService;

    @RequestMapping(value = "/topNotice", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> topNotice(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectTopNotice()));
    }

    @RequestMapping(value = "/beltBanners", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> beltBanners(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectBeltBanners()));
    }

    @GetMapping(value="/newsletters")
    public ResponseEntity<RestResponse> newsletters(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size) {

        CommonMap map = new CommonMap();
        map.putPage(page, size);

        /*List<CommonMap> commonMaps = mainService.selectNewsletters(map);
        commonMaps.forEach(m -> {
            m.get("created_at")
        });*/

        return ResponseEntity.ok(RestResponse.ok(mainService.selectNewsletters(map)));
    }

    @GetMapping(value="/newsletters/{id}")
    public ResponseEntity<RestResponse> newsletters(@PathVariable("id") int id) {
        CommonMap map = new CommonMap();
        map.put("id", id);

        return ResponseEntity.ok(RestResponse.ok(mainService.selectNewsletterById(map)));
    }

    @PostMapping(value="/newsletters")
    public ResponseEntity<RestResponse> insertNewsletter(
            @RequestBody CommonMap map) {

        log.info("map : {}" , map);

        mainService.insertNewsletter(map);

        return ResponseEntity.ok(RestResponse.ok());
    }

    @GetMapping(value="/auctions")
    public ResponseEntity<RestResponse> auctions(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size) {

        return ResponseEntity.ok(RestResponse.ok(mainService.selectAuctions(CommonMap.create(page,size))));
    }

    @GetMapping("/videos")
    public ResponseEntity<RestResponse> videos(
            @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size,
            @RequestParam String media_type ) {
        CommonMap map = new CommonMap();
        map.put("size", size);
        map.put("media_type", media_type);

        return ResponseEntity.ok(RestResponse.ok(mainService.selectVideos(map)));
    }

    @RequestMapping(value = "/upcomings", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> upcomings(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectUpcomings()));
    }

    @GetMapping(value="/ingAuctions")
    public ResponseEntity<RestResponse> ingAuctions() {

        return ResponseEntity.ok(RestResponse.ok(mainService.selectIngAuctions()));
    }

    @GetMapping(value="/ingMenuCount")
    public ResponseEntity<RestResponse> ingMenuCount() {

        return ResponseEntity.ok(RestResponse.ok(mainService.selectIngMenuCount()));
    }
   
    @GetMapping(value="/resetPassword")
    public ResponseEntity<RestResponse> resetPassword(Principal principal, HttpServletRequest request) {
    	CommonMap paramMap = new CommonMap();
    	if(principal != null) {
    		paramMap.put("cust_no", principal.getName());
    		log.info("paramMap : {}" , paramMap);
    		int result = loginService.updateCustPwdResetByCustNo(paramMap);
    		if(result == 1) {
    			request.getSession().removeAttribute("PASSWD_RESET_YN");
    		}
    	}else {
			throw new SAException("로그인이 필요합니다."); 
		}
    	
        return ResponseEntity.ok(RestResponse.ok());
    }
    

    @GetMapping(value="/reAlarm")
    public ResponseEntity<RestResponse> reAlarm(Principal principal, HttpServletRequest request) {
    	CommonMap paramMap = new CommonMap();
    	if(principal != null) {
    		paramMap.put("cust_no", principal.getName());
    		log.info("paramMap : {}" , paramMap);
    		int result = loginService.updateCustPwdModDtByCustNo(paramMap);
    		if(result == 1) {
    			request.getSession().removeAttribute("PASSWD_MOD_NECESSARY_YN");
    		}
    	}else {
			throw new SAException("로그인이 필요합니다."); 
		}
    	
        return ResponseEntity.ok(RestResponse.ok());
    }

}
