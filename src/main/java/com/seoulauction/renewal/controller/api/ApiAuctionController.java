package com.seoulauction.renewal.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.AuctionService;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/auction")
public class ApiAuctionController {
    private final AuctionService auctionService;

    @PostMapping("/paddle")
    public ResponseEntity<RestResponse> paddle(@RequestBody CommonMap paramMap) {
        return ResponseEntity.ok(RestResponse.ok(auctionService.insertPaddle(paramMap)));
    }

    @GetMapping("/paddles/{saleNo}")
    public ResponseEntity<RestResponse> getPaddle(@PathVariable("saleNo") int saleNo) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectSalePaddNo(paramMap)));
    }

    @GetMapping(value = "/progress")
    public ResponseEntity<RestResponse> progress(){
        CommonMap map = new CommonMap();
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectProgressSaleList(map)));
    }

    @GetMapping(value = "/scheduled")
    public ResponseEntity<RestResponse> scheduled(){
        CommonMap map = new CommonMap();
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectScheduledSaleList(map)));
    }

    @GetMapping(value="/sales/{saleNo}")
    public ResponseEntity<RestResponse> sale(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionService.selectSaleInfo(commonMap)));
    }
}
