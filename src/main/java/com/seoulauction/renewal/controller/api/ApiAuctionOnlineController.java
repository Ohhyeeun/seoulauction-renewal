package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.AuctionOnlineService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
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
    public ResponseEntity<RestResponse> lots(@PathVariable int saleNo, @RequestParam(required = false) int[] lotList
            , @RequestParam(required = false) String cateCd, @RequestParam(required = false) String lotTag
            , @RequestParam(required = false) String sortBy, @RequestParam(required = false) String searchText
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
            ) {
        CommonMap commonMap = CommonMap.create(page, size);
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_list", lotList);
        commonMap.put("cate_cd", cateCd);
        commonMap.put("lot_tag", lotTag);
        commonMap.put("sort_by", sortBy);
        commonMap.put("search_text", searchText);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotList(commonMap)));
    }

    @ApiOperation(value = "온라인 간단 랏 정보 조회", notes = "경매번호를 통해 간단한 랏 정보를 조회한다.")
    @GetMapping(value="/simple/sales/{saleNo}/lots")
    public ResponseEntity<RestResponse> simpleLots(@PathVariable int saleNo
            , @RequestParam(required = false) String cateCd, @RequestParam(required = false) String lotTag
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        CommonMap commonMap = CommonMap.create(page, size);
        commonMap.put("sale_no", saleNo);
        commonMap.put("cate_cd", cateCd);
        commonMap.put("lot_tag", lotTag);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectSimpleLotList(commonMap)));
    }

    @ApiOperation(value = "온라인 랏 정보 polling 조회", notes = "경매번호, 랏 번호 배열을 통해 랏 정보를 조회한다.")
    @GetMapping(value="/refresh/sales/{saleNo}/lots")
    public ResponseEntity<RestResponse> lots(@PathVariable int saleNo, @RequestParam int[] lotList) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_list", lotList);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotRefreshList(commonMap)));
    }

    @ApiOperation(value = "온라인 현재 진행중인 경매 polling 조회", notes = "경매번호를 통해 현재 진행중인 랏 정보를 조회한다.")
    @GetMapping(value="/current-lot/sales/{saleNo}")
    public ResponseEntity<RestResponse> currentLot(@PathVariable int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectCurrentLotInfo(commonMap)));
    }

    @ApiOperation(value = "온라인 랏 정보 상세 조회", notes = "경매 번호, 랏 번호를 통해 랏 정보를 조회한다.")
    @GetMapping(value="/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> lot(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotInfo(commonMap)));
    }

    @ApiOperation(value = "온라인 랏 정보 상세 polling 조회", notes = "경매번호, 랏 번호를 통해 랏의 응찰 정보를 조회한다.")
    @GetMapping(value="/refresh/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> refreshLot(@PathVariable int saleNo, @PathVariable int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLotRefreshInfo(commonMap)));
    }

    @ApiOperation(value = "온라인 작가 정보 조회", notes = "작가 번호를 통해 작가 정보를 조회한다.")
    @GetMapping(value="/artists/{artistNo}")
    public ResponseEntity<RestResponse> artist(@PathVariable("artistNo") int artistNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("artist_no", artistNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectArtistInfo(commonMap)));
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

    @ApiOperation(value = "온라인 휴대폰 인증 조회", notes = "경매번호를 통해 온라인 휴대폰 인증을 조회한다.")
    @GetMapping(value = "/sale-cert/sales/{saleNo}")
    public ResponseEntity<RestResponse> saleCert(@PathVariable("saleNo") int saleNo){
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectSaleCertInfo(commonMap)));
    }

    @ApiOperation(value = "온라인 휴대폰 인증 등록", notes = "온라인 휴대폰 인증을 등록한다.(no_modify: 변경없음 / un_modify: 변경안함)")
    @PostMapping(value = "/sale-cert/sales/{saleNo}")
    public ResponseEntity<RestResponse> insertSaleCert(@PathVariable("saleNo") int saleNo
            , @ApiParam(example = "{\n\t\"done_cd\": \"\",\n\t\"hp\": \"\"\n}") @RequestBody CommonMap commonMap) {
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.insertSaleCert(commonMap)));
    }

    @ApiOperation(value = "온라인 휴대폰 인증 상태 변경", notes = "온라인 휴대폰 인증의 상태를 변경한다.")
    @PatchMapping(value = "/sale-cert/sales/{saleNo}")
    public ResponseEntity<RestResponse> updateSaleCert(@PathVariable("saleNo") int saleNo
            , @ApiParam(example = "{\n\t\"sale_cert_no\": \"\",\n\t\"hp\": \"\"\n}") @RequestBody CommonMap commonMap) {
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.updateSaleCert(commonMap)));
    }

    @ApiOperation(value = "온라인 응찰 목록 조회", notes = "경매번호, 랏 번호를 통해 응찰 목록을 조회한다.")
    @GetMapping(value="/bid/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> bid(@PathVariable int saleNo, @PathVariable("lotNo") int lotNo
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page
            , @RequestParam(required = false, defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        CommonMap commonMap = CommonMap.create(page, size);
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectBidList(commonMap)));
    }

    @ApiOperation(value = "온라인 1회응찰 등록", notes = "경매번호, 랏 번호를 통해 온라인 1회응찰을 등록한다.")
    @PostMapping(value = "/bid/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> bid(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo
            , @ApiParam(example = "{\n\t\"bid_price\": ,\n\t\"cust_no\": \n}") @RequestBody CommonMap commonMap) {
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);
        auctionOnlineService.insertBidOnce(commonMap);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @ApiOperation(value = "온라인 자동응찰 등록", notes = "경매번호, 랏 번호를 통해 온라인 자동응찰을 등록한다.")
    @PostMapping(value = "/bid-auto/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> bidAuto(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo
            , @ApiParam(example = "{\n\t\"bid_price\": ,\n\t\"cust_no\": \n}") @RequestBody CommonMap commonMap) {
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);
        auctionOnlineService.insertBidAuto(commonMap);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @ApiOperation(value = "온라인 자동응찰 취소", notes = "경매번호, 랏 번호, 자동응찰 번호를 통해 온라인 자동응찰을 취소한다.")
    @DeleteMapping(value = "/bid-auto/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> bidAutoCancel(@PathVariable("saleNo") int saleNo, @PathVariable("lotNo") int lotNo
            , @ApiParam(example = "{\n\t\"req_no\": ,\n\t\"cust_no\": \n}") @RequestBody CommonMap commonMap) {
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);
        auctionOnlineService.updateAutoBidReqCancel(commonMap);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @ApiOperation(value = "온라인 마지막 자동응찰 조회", notes = "경매번호, 랏 번호를 통해 마지막 자동응찰을 조회한다.")
    @GetMapping(value="/last-auto-bid-req/sales/{saleNo}/lots/{lotNo}")
    public ResponseEntity<RestResponse> lastAutoBidReq(@PathVariable int saleNo, @PathVariable("lotNo") int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectLastAutoBidReq(commonMap)));
    }

    @ApiOperation(value = "회원 정보 조회", notes = "경매번호, 랏 번호를 통해 응찰 목록을 조회한다.")
    @GetMapping(value="/me")
    public ResponseEntity<RestResponse> me() {
        return ResponseEntity.ok(RestResponse.ok(auctionOnlineService.selectCustInfo()));
    }
}
