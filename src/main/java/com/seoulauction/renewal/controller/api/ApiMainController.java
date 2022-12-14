package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.MainService;
import com.seoulauction.renewal.service.S3Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/main")
public class ApiMainController {

    private final MainService mainService;
    private final LoginService loginService;

    private final S3Service s3Service;

    @RequestMapping(value = "/topNotice", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> topNotice(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectTopNotice()));
    }

    @RequestMapping(value = "/beltBanners", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> beltBanners(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectBeltBanners()));
    }

    /*Newsletter*/
    @GetMapping(value="/newsletters")
    public ResponseEntity<RestResponse> newsletters(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size) {

        CommonMap map = new CommonMap();
        map.putPage(page, size);

        List<CommonMap> resultMap = mainService.selectNewsletters(map);
        resultMap.forEach(item -> {
            List<CommonMap> imageListMap = s3Service.getS3FileDataAll("content_newsletter",  item.get("id"));
            CommonMap newMap = new CommonMap();
            imageListMap.forEach(c-> newMap.put(c.getString("tag")+"_url",c.getString("cdn_url")));
            item.put("image", newMap);
        });

        return ResponseEntity.ok(RestResponse.ok(resultMap));
    }

    @GetMapping(value="/newsletters/{id}")
    public ResponseEntity<RestResponse> newsletters(@PathVariable("id") int id) {
        CommonMap map = new CommonMap();
        map.put("id", id);

        return ResponseEntity.ok(RestResponse.ok(mainService.selectNewsletterById(map)));
    }

    /*popup*/
    @GetMapping(value="/popup")
    public ResponseEntity<RestResponse> popup(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectMainPopup()));
    }
    @PostMapping(value="/newsletters")
    public ResponseEntity<RestResponse> insertNewsletter(
            @RequestBody CommonMap map) {

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

    @RequestMapping(value="/ingAuctions", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> ingAuctions() {

        return ResponseEntity.ok(RestResponse.ok(mainService.selectIngAuctions()));
    }

    @RequestMapping(value="/ingMenuCount", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> ingMenuCount() {

        return ResponseEntity.ok(RestResponse.ok(mainService.selectIngMenuCount()));
    }

    @RequestMapping(value="/isHaveToPayWorkExist", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> isHaveToPayWorkExist(Principal principal) {

        return ResponseEntity.ok(RestResponse.ok(mainService.selectHaveToPayWorkCount(principal)));
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
			throw new SAException("???????????? ???????????????."); 
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
			throw new SAException("???????????? ???????????????."); 
		}
    	
        return ResponseEntity.ok(RestResponse.ok());
    }

    @GetMapping(value="/sleepAlarmNow")
    public ResponseEntity<RestResponse> sleepAlarmNow(Principal principal, HttpServletRequest request) {
        CommonMap paramMap = new CommonMap();
        if(principal != null) {
            request.getSession().removeAttribute("PASSWD_MOD_NECESSARY_YN");
        }else {
            throw new SAException("???????????? ???????????????.");
        }

        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value = "/bigBanners", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> bigBanners(){
        return ResponseEntity.ok(RestResponse.ok(mainService.selectBigBanners()));
    }

    @PostMapping(value="/addReadCount/{id}")
    public ResponseEntity<RestResponse> addReadCount(
            @PathVariable("id") int id,
            @RequestParam(value = "type" , required = false) String type
            ) {

        CommonMap map = new CommonMap("table_name", type);
        map.put("id",id);
        mainService.addReadCount(map);
        return ResponseEntity.ok(RestResponse.ok());
    }

}
