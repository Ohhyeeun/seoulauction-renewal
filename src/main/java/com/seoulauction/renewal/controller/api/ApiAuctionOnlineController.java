package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.AuctionOnlineService;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/auction/online")
public class ApiAuctionOnlineController {
    private final AuctionOnlineService auctionOnlineService;

    @ApiOperation(value = "온라인 경매 정보 조회", notes = "경매번호를 통해 경매 정보, 버튼, 카테고리, 랏태그를 조회한다.")
    @GetMapping(value="/sales/{saleNo}")
    public ResponseEntity<RestResponse> sale(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectSaleInfoList(commonMap)));
    }

    @ApiOperation(value = "온라인 랏 정보 조회", notes = "경매번호를 통해 랏 정보를 조회한다.")
    @GetMapping(value="/sales/{saleNo}/lots")
    public ResponseEntity<RestResponse> lots(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotList(commonMap)));
    }
}
