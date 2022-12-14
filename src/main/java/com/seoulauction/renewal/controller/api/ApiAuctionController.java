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

    @PostMapping(value="/paddle")
    public ResponseEntity<RestResponse> paddle(@RequestBody CommonMap paramMap) {
        return ResponseEntity.ok(RestResponse.ok(auctionService.insertPaddle(paramMap)));
    }

    @GetMapping(value="/paddles/{saleNo}")
    public ResponseEntity<RestResponse> getPaddle(@PathVariable("saleNo") int saleNo) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectSalePaddNo(paramMap)));
    }

    @GetMapping(value = "/progress")
    public ResponseEntity<RestResponse> progress(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ){
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectProgressSaleList(CommonMap.create(page,size))));
    }

    @GetMapping(value = "/upcoming")
    public ResponseEntity<RestResponse> upcoming(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ){
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectUpcomingSaleList(CommonMap.create(page,size))));
    }

    @GetMapping(value="/sales/{saleNo}")
    public ResponseEntity<RestResponse> sale(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionService.selectSaleInfo(commonMap)));
    }

    @PostMapping(value="/brochure/read")
    public ResponseEntity<RestResponse> brochureRead(@RequestBody CommonMap map) {
        auctionService.addBrochureReadCount(map);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @PostMapping(value = "/results")
    public ResponseEntity<RestResponse> results(@RequestBody CommonMap map){
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectResultSaleList(map)));
    }

    @GetMapping("/sctran/{no}")
    public ResponseEntity<RestResponse> getScTran(@PathVariable("no") int no){
        CommonMap map = new CommonMap();
        map.put("tr_phone", no);
        CommonMap result = auctionService.selectScTrans(map);
        return ResponseEntity.ok(RestResponse.ok(result));
    }

    @GetMapping(value="/sold/invoice")
    public ResponseEntity<RestResponse> invoice(@RequestParam int sale_no, @RequestParam int cust_no){
        CommonMap map = new CommonMap();
        map.put("sale_no", sale_no);
        map.put("cust_no", cust_no);

        return ResponseEntity.ok(RestResponse.ok(auctionService.selectSoldInvoiceInfo(map)));
    }
}
