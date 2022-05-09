package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.MainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/main")
public class ApiMainController {
    private final MainService mainService;

    @GetMapping(value="/newsletters")
    public ResponseEntity<RestResponse> newsletters(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size) {

        CommonMap map = new CommonMap();
        map.putPage(page, size);

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


}
