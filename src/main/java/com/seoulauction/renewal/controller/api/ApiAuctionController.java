package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
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

    @RequestMapping(value = "/sale/{saleNo}/lot/{lotNo}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> lot(@PathVariable("saleNo")String saleNo, @PathVariable("lotNo")String lotNo){
        CommonMap map = new CommonMap();
        map.put("saleNo", saleNo);
        map.put("lotNo", lotNo);
        return ResponseEntity.ok(RestResponse.ok(auctionService.lot(map)));
    }


}
