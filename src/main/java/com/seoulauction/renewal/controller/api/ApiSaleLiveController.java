package com.seoulauction.renewal.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.CurrencyDataManager;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.form.OfflineBiddingForm;
import com.seoulauction.renewal.service.AuctionService;
import com.seoulauction.renewal.service.S3Service;
import com.seoulauction.renewal.service.SaleLiveService;
import com.seoulauction.renewal.service.SaleService;
import com.seoulauction.renewal.util.SecurityUtils;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/auction/live")
public class ApiSaleLiveController {

    private final SaleService saleService;

    private final SaleLiveService saleLiveService;

    private final S3Service s3Service;

    private final AuctionService auctionService;

    private final CurrencyDataManager currencyDataManager;

    @Value("${image.root.path}")
    private String IMAGE_URL;


    @RequestMapping(value="/sale_info/{sale_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> saleInfo(@PathVariable("sale_no") int saleNo) {
        CommonMap c = new CommonMap();
        c.put("sale_no", saleNo);

        CommonMap saleInfoMap = saleService.selectSaleInfo(c);

        String[] mapKeys = {"TITLE_JSON", "NOTICE_DTL_JSON"};

        // ??? ?????? ??????
        ObjectMapper mapper  = new ObjectMapper();
        try{
            // ??? ??????
            for(var item : mapKeys) {
                saleInfoMap.put(item, mapper.readValue(String.valueOf(saleInfoMap.get(item)), Map.class));
                Map<String,Object> m = (Map<String,Object>)saleInfoMap.get(item);
            }
        } catch (JsonMappingException e) {

        } catch (JsonProcessingException e) {

        }
        return ResponseEntity.ok(RestResponse.ok(saleInfoMap));
    }

    @RequestMapping(value="/exch_rate_list", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> exchRateList(@RequestParam CommonMap map) {
        List<CommonMap> exchRateList = saleService.selectExchRateList(map);
        return ResponseEntity.ok(RestResponse.ok());
    }


    @RequestMapping(value="/lot_info/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> lotInfo(@PathVariable("sale_no") int saleNo,
                                                @PathVariable("lot_no") int lotNo) {
        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLotInfo(map)));
    }

    @RequestMapping(value="/getViewScaleImage/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> saleViewScaleImages(@PathVariable("sale_no") int saleNo,
                                                   @PathVariable("lot_no") int lotNo) {

        // ????????? ????????? ????????? ???????????? ??????
        List<CommonMap> lotImagesNew = new ArrayList<CommonMap>();

        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        paramMap.put("lot_no", lotNo);

        Boolean isUseViewScale = true;

        // ??? ????????? ?????? ????????????
        List<CommonMap> lotImages = new ArrayList<CommonMap>();
        if(saleService.selectViewScaleLotImages(paramMap) != null){
            lotImages = saleService.selectViewScaleLotImages(paramMap);
        }else{
            isUseViewScale = false;
        }

        String[] listKeys = {"LOT_SIZE_JSON"};
        ObjectMapper mapper  = new ObjectMapper();

        //???????????? ????????? ????????????.
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //?????? ??????
        boolean isEmployee = false;
        //?????? ???????????? ?????? ?????? ??????.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        // ??? ??????????????? ??????
        try{
            for (var item : lotImages) {
                CommonMap lotImagesNewItem = new CommonMap();
                for (var k : new ArrayList<>(item.keySet())){
                    lotImagesNewItem.put(k, item.get(k));
                }
                lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
                // ????????? ??????
                for(var item2 : listKeys) {
                    lotImagesNewItem.put(item2,
                            mapper.readValue(String.valueOf(lotImagesNewItem.get(item2)), List.class));
                }

                if (item.get("IMG_DISP_YN").equals("N") && !isEmployee) {
                    lotImagesNewItem.put("IMAGE_URL", "");
                    lotImagesNewItem.put("FILE_PATH", "");
                    lotImagesNewItem.put("FILE_NAME", "images/bg/no_image.jpg");
                } else {
                    lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
                }

                lotImagesNewItem.put("isUseViewScale", isUseViewScale);

                lotImagesNew.add(lotImagesNewItem);
            }
        } catch (JsonMappingException e) {
            e.printStackTrace();

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ResponseEntity.ok(RestResponse.ok(lotImagesNew));
    }

    @RequestMapping(value="/sale_images/{sale_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> saleImages(@PathVariable("sale_no") int saleNo) {

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);

        // ??? ????????? ?????? ????????????
        List<CommonMap> lotImages = saleLiveService.selectSaleLotImages(map);

        // ????????? ????????? ????????? ???????????? ??????
        List<CommonMap> lotImagesNew = new ArrayList<>();

        //???????????? ????????? ????????????.
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //?????? ??????
        boolean isEmployee = false;
        //?????? ???????????? ?????? ?????? ??????.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        // ??? ??????????????? ??????
        for (var item : lotImages) {
            CommonMap lotImagesNewItem = new CommonMap();
            for (var k : new ArrayList<>(item.keySet())){
                lotImagesNewItem.put(k, item.get(k));
            }
            lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);

            if (item.get("IMG_DISP_YN").equals("N") && !isEmployee) {
                lotImagesNewItem.put("IMAGE_URL", "");
                lotImagesNewItem.put("FILE_PATH", "");
                lotImagesNewItem.put("FILE_NAME", "images/bg/no_image.jpg");
            } else {
                lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
            }

            lotImagesNew.add(lotImagesNewItem);
        }
        return ResponseEntity.ok(RestResponse.ok(lotImagesNew));
    }


    @RequestMapping(value="/lot_images/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> lotImages(@PathVariable("sale_no") int saleNo,
                                                  @PathVariable("lot_no") int lotNo) {

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        // ??? ?????? ????????????
        CommonMap lotInfoMap = saleService.selectLotInfo(map);
        // ??? ????????? ?????? ????????????
        List<CommonMap> lotImages = saleService.selectLotImages(map);
        // ????????? ????????? ????????? ???????????? ??????
        List<CommonMap> lotImagesNew = new ArrayList<>();

        //???????????? ????????? ????????????.
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //?????? ??????
        boolean isEmployee = false;
        //?????? ???????????? ?????? ?????? ??????.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        // ??? ??????????????? ??????
        for (var item : lotImages) {
            CommonMap lotImagesNewItem = new CommonMap();

            for (var k : new ArrayList<>(item.keySet())){
                lotImagesNewItem.put(k, item.get(k));
            }

            lotImagesNewItem.put("IMG_DISP_YN", lotInfoMap.get("IMG_DISP_YN"));
            lotImagesNewItem.put("UNIT_CD", lotInfoMap.get("UNIT_CD"));
            lotImagesNewItem.put("SIZE1", lotInfoMap.get("SIZE1"));
            lotImagesNewItem.put("SIZE2", lotInfoMap.get("SIZE2"));

            //N??????????????? No ???????????? ??????.
            if (lotInfoMap.get("IMG_DISP_YN").equals("N") && !isEmployee) {
                lotImagesNewItem.put("IMAGE_URL", "");
                lotImagesNewItem.put("FILE_PATH", "");
                lotImagesNewItem.put("FILE_NAME", "images/bg/no_image.jpg");
            } else {
                lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
            }
            lotImagesNew.add(lotImagesNewItem);
        }
        return ResponseEntity.ok(RestResponse.ok(lotImagesNew));
    }

    @RequestMapping(value="/lot_artist_other_lots", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> artistOtherLots(@RequestParam CommonMap map) {
        List<CommonMap> lotArtistOtherLots = saleService.selectlotArtistOtherLots(map);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/get_customer_by_cust_no", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> custInfo(@RequestParam CommonMap map) {
        CommonMap customerByCustNo = saleService.selectCustomerByCustNo(map);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/sale_cert_info", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> certInfo(@RequestParam CommonMap map) {

        CommonMap saleCertInfo = saleService.selectSaleCertInfo(map);
        return ResponseEntity.ok(RestResponse.ok());
    }


    @PostMapping(value="/insertRecentlyView")
    @ResponseBody
    public ResponseEntity<RestResponse> insertRecentlyView(@RequestBody CommonMap map) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            saleService.upsertRecentlyView(map);
        }
        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/recently/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> selectRecentlyView(@PathVariable("sale_no") int saleNo,
                                                  @PathVariable("lot_no") int lotNo) {

        // ????????? ????????? ????????? ???????????? ??????
        List<CommonMap> lotImagesNew = new ArrayList<>();
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        // ??????????????? ?????? ??? ????????? ?????????
        if (saUserDetails != null) {
            CommonMap map = new CommonMap();
            map.put("sale_no", saleNo);
            map.put("lot_no", lotNo);
            map.put("cust_no", saUserDetails.getUserNo());

            // ??? ????????? ?????? ????????????
            List<CommonMap> lotImages = saleService.selectRecentlyView(map);

            String[] mapKeys = {"TITLE_BLOB_JSON", "ARTIST_NAME_BLOB_JSON"};
            ObjectMapper mapper = new ObjectMapper();

            try{
                // ??? ??????
                for (var i = 0; i < lotImages.size(); i++) {
                    for (var item : mapKeys) {
                        lotImages.get(i).put(item, mapper.readValue(String.valueOf(lotImages.get(i).get(item)), Map.class));
                    }
                }
            } catch (JsonProcessingException e) {

            }

            // ??? ??????????????? ??????
            for (var item : lotImages) {
                CommonMap lotImagesNewItem = new CommonMap();
                for (var k : new ArrayList<>(item.keySet())){
                    lotImagesNewItem.put(k, item.get(k));
                }
                lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
                lotImagesNew.add(lotImagesNewItem);
            }
        }
        return ResponseEntity.ok(RestResponse.ok(lotImagesNew));
    }

    @PostMapping(value="/sale/successBid/{saleNo}/{lotNo}")
    public ResponseEntity<RestResponse> successBid(
               @RequestParam(value = "update" , required = false , defaultValue = "false") Boolean update,
               @PathVariable("saleNo") int saleNo,
               @PathVariable("lotNo") int lotNo) {

        CommonMap map = new CommonMap();

        map.put("sale_no" , saleNo);
        map.put("lot_no" , lotNo);
        map.put("update", update);

        saleService.insertSuccessBid(map);

        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/searchList" , method = RequestMethod.POST)
    public ResponseEntity<RestResponse> searchList(
            @RequestBody CommonMap map, Principal principal) throws Exception {

        if(SecurityUtils.getAuthenticationPrincipal() != null){
            map.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
        }
        map.put("list_type", "SEARCH");
        map.put("for_count", true);

        return ResponseEntity.ok(RestResponse.ok(saleService.searchListPaging(map)));
    }

    @RequestMapping(value="/addCustInteLot" , method = RequestMethod.POST)
    public ResponseEntity<RestResponse> addCustInteLot(
            @RequestBody CommonMap map, Principal principal) throws Exception {
        int c = -1;
        if (principal != null) {
            map.put("action_user_no", principal.getName());
            c = saleService.addCustInteLot(map);
        }
        return ResponseEntity.ok(RestResponse.ok(c));
    }

    @RequestMapping(value="/delCustInteLot" , method = RequestMethod.POST)
    public ResponseEntity<RestResponse> delCustInteLot(
            @RequestBody CommonMap map, Principal principal) throws Exception {
        int c = -1;
        if (principal != null) {
            map.put("action_user_no", principal.getName());
            c = saleService.delCustInteLot(map);
        }
        return ResponseEntity.ok(RestResponse.ok(c));
    }

    @RequestMapping(value = "/selectRecommandArtist", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> selectRecommandArtist(){
        return ResponseEntity.ok(RestResponse.ok(saleService.selectRecommandArtist()));
    }

    @GetMapping(value="/list/{saleNo}")
    public ResponseEntity<RestResponse> list(
            @PathVariable("saleNo") int saleNo,
            @RequestParam(value = "lotNo" , required = false) String[] lotNo,
            @RequestParam(value = "category" , required = false) String category,
            @RequestParam(value = "tag" , required = false) String tag,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size,
            @RequestParam(value = "lang" , defaultValue = "ko" , required = false) String lang,
            @RequestParam(value = "search" , required = false ) String search,
            @RequestParam(required = false) String sortBy,
            @RequestParam(value = "device" , required = false) String device
    ) {
        CommonMap commonMap = CommonMap.create(page,size);
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);
        commonMap.put("category", category);
        commonMap.put("tag", tag);
        commonMap.put("lang" , lang);
        commonMap.put("search" , search);
        commonMap.put("sort_by", sortBy);
        commonMap.put("device", device);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectSaleList(commonMap)));
   }
    @RequestMapping(value = "/lotTag/{saleNo}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> selectLotTagList(
            @PathVariable("saleNo") int saleNo
    ){
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(saleService.selectLotTagList(commonMap)));
    }

    @GetMapping(value = "/categories/{saleNo}")
    public ResponseEntity<RestResponse> selectCategories(@PathVariable("saleNo") int saleNo){
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(saleService.selectCategories(commonMap)));
    }

    @RequestMapping(value = "/insertbid", method = RequestMethod.POST)
    public ResponseEntity<RestResponse> insertBid(
            @RequestBody CommonMap map
    ){
        //map.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
        saleService.insertBid(map);

        return ResponseEntity.ok(RestResponse.ok());
    }

    @GetMapping("/cust")
    public ResponseEntity<RestResponse> cust() {
        CommonMap paramMap = new CommonMap();
        paramMap.put("cust_no", SecurityUtils.getAuthenticationPrincipal().getUserNo());
        return ResponseEntity.ok(RestResponse.ok(saleService.getCustomerByCustNo(paramMap)));
    }
    @RequestMapping(value="/artist_info/{artist_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> artistInfo(@PathVariable("artist_no") int artistNo) {
        CommonMap map = new CommonMap();
        map.put("artist_no", artistNo);

        CommonMap artistInfoMap = saleLiveService.selectArtistInfo(map);
        if(artistInfoMap != null) {
            artistInfoMap.put("images", s3Service.getS3FileDataAll("artist",  artistInfoMap.get("id")));
        }
        return ResponseEntity.ok(RestResponse.ok(artistInfoMap));
    }
    @RequestMapping(value="/sale/maxbid/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> maxBid(@PathVariable("sale_no") int saleNo,
                                                   @PathVariable("lot_no") int lotNo) {
        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        CommonMap result = saleService.selectMaxBid(map);

        return ResponseEntity.ok(RestResponse.ok(result));
    }

    @GetMapping(value="/paddles/{saleNo}")
    public ResponseEntity<RestResponse> getPaddle(@PathVariable("saleNo") int saleNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(auctionService.selectSalePaddNo(paramMap)));
    }

    @GetMapping(value="/sales/{saleNo}")
    public ResponseEntity<RestResponse> selectLiveSale(
            @PathVariable("saleNo") int saleNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLiveSale(paramMap)));
    }

    @GetMapping(value="sales/{saleNo}/lots")
    public ResponseEntity<RestResponse> selectLiveSaleLots(
            @PathVariable("saleNo") int saleNo,
            @RequestParam(value = "category" , required = false) String category,
            @RequestParam(value = "tag" , required = false) String tag
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        paramMap.put("category", category);
        paramMap.put("tag", tag);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLiveSaleLots(paramMap)));
    }
    @GetMapping(value="sales/{saleNo}/bidding-lot-now")
    public ResponseEntity<RestResponse> selectLiveSaleLotByOne(
            @PathVariable("saleNo") int saleNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLiveSaleLotByOne(paramMap)));
    }
    @GetMapping(value="sales/{saleNo}/types")
    public ResponseEntity<RestResponse> selectLiveCategories(@PathVariable("saleNo") int saleNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLiveTypes(paramMap)));
    }
    @GetMapping(value="sales/{saleNo}/my-bidding")
    public ResponseEntity<RestResponse> selectLiveMyBidding(
            @PathVariable("saleNo") int saleNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLiveMyBidding(paramMap)));
    }
    @GetMapping(value="sales/{saleNo}/lots/{lotNo}/site-bidding")
    public ResponseEntity<RestResponse> selectLiveSiteBidding(
            @PathVariable("saleNo") int saleNo
           ,@PathVariable("lotNo") int lotNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        paramMap.put("lot_no", lotNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectLiveSiteBidding(paramMap)));
    }

    @PostMapping(value="sales/{saleNo}/lots/{lotNo}/offline-bidding")
    public ResponseEntity<RestResponse> offlineBidding(
             @PathVariable("saleNo") int saleNo
            ,@PathVariable("lotNo") int lotNo
            ,@ApiParam(
            "<b>bidKindCd</b> ?????? ?????? ?????? ?????? ?????? ???????????? ??? ??????\n\n\n" +
            "<b>online</b> -> bid_price ??? ??????. ( ????????? ???????????? ?????? )\n" +
            "<b>price_change</b> -> bid_price ??? ??????. ( ????????? ????????? ?????? - ????????? ?????? )\n" +
            "<b>floor</b> -> bid_price ??? ??????.  bid_notice ?????? ??????????????? ????????? ??????.\n") @RequestBody OfflineBiddingForm offlineBiddingForm
            ) {

        log.info("offlineBiddingForm : {} " , offlineBiddingForm);

        saleLiveService.insertOfflineBidding(saleNo , lotNo , offlineBiddingForm);

        return ResponseEntity.ok(RestResponse.ok());
    }
    @GetMapping(value="sales/{saleNo}/exch-rate")
    public ResponseEntity<RestResponse> selectSaleExchRate(@PathVariable("saleNo") int saleNo
    ) {
        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectSaleExchRate(paramMap)));
    }

    @PostMapping(value="/paddle")
    public ResponseEntity<RestResponse> paddle(@RequestBody CommonMap paramMap) {
        return ResponseEntity.ok(RestResponse.ok(auctionService.insertPaddle(paramMap)));
    }

    @GetMapping(value="/sales/{saleNo}/one")
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

    @GetMapping(value="/sales/{saleNo}/bid-notice")
    public ResponseEntity<RestResponse> saleBidNotice(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectBidNotice(commonMap)));
    }


    /**
     *
     * @param saleNo
     * ???????????? sale ????????????.
     */
    @GetMapping(value="/admin/sales/{saleNo}")
    public ResponseEntity<RestResponse> adminSales(@PathVariable("saleNo") int saleNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);

        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectAdminSaleInfo(commonMap)));
    }

    /**
     *
     * @param saleNo
     * ???????????? ???????????? ???????????? ?????? ?????? ?????? ??? + ???????????? ?????? ????????? ????????????.
     */
    @GetMapping(value="/admin/sales/{saleNo}/lots/{lotNo}/sync-cu-lot")
    public ResponseEntity<RestResponse> adminSaleCurLot(
            @PathVariable("saleNo") int saleNo,
            @PathVariable("lotNo") int lotNo) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectAdminLotInfo(commonMap)));
    }

    /**
     *
     * @param saleNo
     * @param lotNo
     * ???????????? ???????????? ?????? ????????????.
     */
    @GetMapping(value="/admin/sales/{saleNo}/lots/{lotNo}/off-bids")
    public ResponseEntity<RestResponse> adminOffBidList(
            @PathVariable("saleNo") int saleNo
            , @PathVariable("lotNo") int lotNo) {
        CommonMap map = new CommonMap();
       map.put("sale_no", saleNo);
       map.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(saleLiveService.selectAdminOffBid(map)));
    }


    /**
     * ?????? ????????? ????????? ?????? ??????.
     * ??? ??????
     */
    @Secured("ROLE_EMPLOYEE_USER")
    @PostMapping(value="/admin/sales/{saleNo}/lots/{lotNo}/lot-close")
    public ResponseEntity<RestResponse> adminLotClose(
             @PathVariable("saleNo") int saleNo
            ,@PathVariable("lotNo") int lotNo) {

        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);
        saleLiveService.lotLotCloseToggle(commonMap);


        return ResponseEntity.ok(RestResponse.ok());
    }

    /**
     * ?????? ????????? ????????? ?????? ??????.
     * LOT ????????? ???????????? ??????. ( LOT ????????? ????????? ???????????? ?????? ?????? )
     * LOT ?????????
     */
    @Secured("ROLE_EMPLOYEE_USER")
    @PostMapping(value="/admin/sales/{saleNo}/lots/{lotNo}/sync")
    public ResponseEntity<RestResponse> adminLotSync(
            @PathVariable("saleNo") int saleNo,
            @PathVariable("lotNo") int lotNo
    ) {
        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("lot_no", lotNo);

        saleLiveService.lotSync(commonMap);

        return ResponseEntity.ok(RestResponse.ok());
    }

    /**
     * ?????? ?????? ???????????? ( ?????? API ?????? )
     * PARAM ?????? - YYYY-MM-DD
     */
    @ApiOperation("YYYY-DD-MM ???????????? - ???????????? ?????? ????????? ?????? ????????? ?????????.")
    @GetMapping(value="/admin/currency")
    public ResponseEntity<RestResponse> currency(
            @ApiParam(value = "EX ) YYYY-DD-MM")
            @RequestParam(value = "date" , required = false) String date) {

        if(date == null){
            date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }
        return ResponseEntity.ok(RestResponse.ok(currencyDataManager.getCurrency(date)));
    }

    /**
     * ????????????
     * ???????????? ?????? ??????.
     * ?????? ????????? ????????? ?????? ??????.
     */
    @Secured("ROLE_EMPLOYEE_USER")
    @PostMapping(value="/admin/bid/{bidNo}/off-del")
    public ResponseEntity<RestResponse> deleteBidOfflineByBidId(
            @PathVariable("bidNo") int bidNo) {

        saleLiveService.deleteBidOfflineByBidId(new CommonMap("bid_no" , bidNo));
        return ResponseEntity.ok(RestResponse.ok());
    }



}
