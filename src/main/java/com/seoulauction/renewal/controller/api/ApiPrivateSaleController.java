package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.PrivateSaleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/privatesale")
public class ApiPrivateSaleController {

    private final PrivateSaleService privateSaleService;

    @RequestMapping(value = "/selectExhibitSale", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> selectExhibitSale(
            @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int size
    ){
        CommonMap commonMap = new CommonMap();
        commonMap.putPage(page, size);
        List<CommonMap> exhibitList = privateSaleService.selectExhibitSale(commonMap);
        return ResponseEntity.ok(RestResponse.ok(exhibitList));
    }



}
