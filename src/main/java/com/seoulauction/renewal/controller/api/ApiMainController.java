package com.seoulauction.renewal.controller.api;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.MainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/main")
public class ApiMainController {
    private final MainService mainService;

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



    @RequestMapping(value = "/upcomings", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> upcomings(Model model){

       return ResponseEntity.ok(RestResponse.ok(mainService.selectUpcomings()));
    }
}
