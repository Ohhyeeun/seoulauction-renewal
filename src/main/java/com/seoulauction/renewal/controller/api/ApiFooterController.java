package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.FooterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/footer")
public class ApiFooterController {

    private final FooterService footerService;

    @GetMapping(value="/faqs")
    public ResponseEntity<RestResponse> faqs(
            @RequestParam(value = "faq_type" , required = false , defaultValue = "customer")  String faqType,
            @RequestParam(value = "search" , required = false) String search,
            @RequestParam(value = "lang" , defaultValue = "ko" , required = false) String lang
    ) {
        //search
        CommonMap map = new CommonMap("faq_type" , faqType);
        map.put("search" , search);
        map.put("lang" , lang);

        return ResponseEntity.ok(RestResponse.ok(footerService.getFaqList(map)));
    }

    @GetMapping(value="/medias")
    public ResponseEntity<RestResponse> medias(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size,
            @RequestParam(value = "langs" , required = false , defaultValue = "KO")  String langs,
            @RequestParam(value = "search" , required = false ) String search
    ) {
        CommonMap maps = CommonMap.create(page,size);
        maps.put("langs" , langs);
        maps.put("search" , search);

        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardMediaList(maps)));
    }

    @GetMapping(value="/notices")
    public ResponseEntity<RestResponse> boardNotices(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size,
            @RequestParam(value = "search" , required = false ) String search,
            @RequestParam(value = "lang" , defaultValue = "ko" , required = false) String lang
    ) {
        CommonMap map = CommonMap.create(page,size);
        map.put("search" , search);
        map.put("lang" , lang);
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardNoticeList(map)));
    }

    @GetMapping(value="/notices/{id}")
    public ResponseEntity<RestResponse> getBoardById(
            @PathVariable("id") int id
    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getBoardById(new CommonMap("id", id))));
    }

    @GetMapping(value="/recruits")
    public ResponseEntity<RestResponse> boardIncruit(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size,
            @RequestParam(value = "search" , required = false ) String search
    ) {

        CommonMap maps = CommonMap.create(page,size);
        maps.put("search" , search);

        return ResponseEntity.ok(RestResponse.ok(footerService.getRecruitList(maps)));
    }

    @GetMapping(value="/recruits/{id}")
    public ResponseEntity<RestResponse> getRecruitById(
            @PathVariable("id") int id

    ) {
        return ResponseEntity.ok(RestResponse.ok(footerService.getRecruitById(new CommonMap("id", id))));
    }

    @PostMapping(value="/recruits/{id}/form")
    public ResponseEntity<RestResponse> forms(
            @PathVariable("id") int id,
            @RequestPart(value="key", required=false) CommonMap map,
            @RequestPart(value="file") MultipartFile file) {

        map.put("recruit_id" , id);
        footerService.saveRecruitApply(file , map);

        return ResponseEntity.ok(RestResponse.ok());
    }


}

