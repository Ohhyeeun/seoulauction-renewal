package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.FooterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/footer")
public class ApiFooterController {

    private final FooterService footerService;

    @GetMapping(value="/faqs")
    public ResponseEntity<RestResponse> faqs(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getFaqList(CommonMap.create(page,size))));
    }

    @GetMapping(value="/medias")
    public ResponseEntity<RestResponse> boardMedias(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardMediaList(CommonMap.create(page,size))));
    }

    @GetMapping(value="/notice")
    public ResponseEntity<RestResponse> boardNotices(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardNoticeList(CommonMap.create(page,size))));
    }

    @GetMapping(value="/notice/{id}")
    public ResponseEntity<RestResponse> getBoardById(
            @PathVariable("id") int id
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardById(new CommonMap("id", id))));
    }

    @GetMapping(value="/incruit")
    public ResponseEntity<RestResponse> boardIncruit(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardIncruitList(CommonMap.create(page,size))));
    }

}

