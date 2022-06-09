package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.AuctionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
}
