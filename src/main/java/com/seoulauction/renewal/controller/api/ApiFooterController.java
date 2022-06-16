package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
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
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getFaqList(null)));
    }

    @GetMapping(value="/boardMedias")
    public ResponseEntity<RestResponse> boardMedias(
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardMediaList(null)));
    }

    @GetMapping(value="/boardNotices")
    public ResponseEntity<RestResponse> boardNotices(
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardNoticeList(null)));
    }

    @GetMapping(value="/boardIncruit")
    public ResponseEntity<RestResponse> boardIncruit(
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardIncruitList(null)));
    }

}

