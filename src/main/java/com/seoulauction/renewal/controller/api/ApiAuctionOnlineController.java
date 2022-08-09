package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.AuctionOnlineService;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<RestResponse> lots(@PathVariable int saleNo
            , @RequestParam(required = false) String cate_cd, @RequestParam(required = false) String lot_tag
            , @RequestParam(required = false) String sort_by, @RequestParam(required = false) String search_text
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
            ) {
        CommonMap commonMap = CommonMap.create(page, size);
        commonMap.put("sale_no", saleNo);
        commonMap.put("cate_cd", cate_cd);
        commonMap.put("lot_tag", lot_tag);
        commonMap.put("sort_by", sort_by);
        commonMap.put("search_text", search_text);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotList(commonMap)));
    }

    @ApiOperation(value = "온라인 랏 정보 상세 조회", notes = "경매 번호, 랏 번호를 통해 랏 정보를 조회한다.")
    @GetMapping(value="/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> lot(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotInfo(commonMap)));
    }

    @ApiOperation(value = "고객 담당자 조회", notes = "로그인 된 고객 번호를 통해 담당자 정보를 조회한다.")
    @GetMapping(value="/manager")
    public ResponseEntity<RestResponse> manager() {

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectManager()));
    }

    @ApiOperation(value = "관심 랏 조회", notes = "경매번호를 통해 관심 랏을 조회한다.")
    @GetMapping(value="/cust-inte-lot/sales/{saleNo}")
    public ResponseEntity<RestResponse> selectCustInteLotList(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectCustInteLotList(commonMap)));
    }

    @ApiOperation(value = "관심 랏 저장", notes = "경매번호, 랏 번호를 통해 관심 랏을 저장한다.")
    @PostMapping(value="/cust-inte-lot/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> insertCustInteLotList(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.insertCustInteLotList(commonMap)));
    }

    @ApiOperation(value = "관심 랏 삭제", notes = "경매번호, 랏 번호를 통해 관심 랏을 삭제한다.")
    @DeleteMapping(value="/cust-inte-lot/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> deleteCustInteLotList(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.deleteCustInteLotList(commonMap)));
    }
}
