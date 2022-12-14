package com.seoulauction.renewal.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.Bid;
import com.seoulauction.renewal.domain.Bidder;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.S3Service;
import com.seoulauction.renewal.service.SaleService;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.*;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/auction")
public class ApiSaleController {

    private final SaleService saleService;

    private final S3Service s3Service;

    @Value("${image.root.path}")
    private String IMAGE_URL;

    private WebClient webClient = WebClient.builder()
            .baseUrl("http://dev-bid.seoulauction.xyz")
            .build();

    @RequestMapping(value="/bid", method = RequestMethod.POST)
    public ResponseEntity<RestResponse> bid(@RequestBody CommonMap map, HttpServletRequest req, HttpServletResponse res) {

        // 비드정보 설정
        Bid bid = new Bid();
        Bidder bidder = new Bidder();

        bidder.setSaleNo((int)map.get("sale_no"));
        bidder.setLotNo((int)map.get("lot_no"));
        bidder.setSaleType((int)map.get("sale_type"));
        bidder.setBidType((int)map.get("bid_type"));
        bidder.setToken(map.get("bid_token").toString());

        // 비딩금액 저장
        bid.setBidCost((int)map.get("bid_cost"));

        // 비더정보
        bid.setBidder(bidder);

        // 웹소켓에 데이타 전송
        webClient.post().uri("/bid")
                .bodyValue(bid)
                .retrieve()
                .bodyToMono(Bid.class)
                .block();

        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/sale_info/{sale_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> saleInfo(HttpServletRequest req, HttpServletResponse res, Locale locale,
                                                 @PathVariable("sale_no") int saleNo) {
        CommonMap c = new CommonMap();
        c.put("sale_no", saleNo);



        CommonMap saleInfoMap = saleService.selectSaleInfo(c);
        return ResponseEntity.ok(RestResponse.ok(saleInfoMap));
    }

    @RequestMapping(value="/exch_rate_list", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> exchRateList(@RequestParam CommonMap map,
                                                     HttpServletRequest req, HttpServletResponse res) {
        List<CommonMap> exchRateList = saleService.selectExchRateList(map);
        return ResponseEntity.ok(RestResponse.ok());
    }


    @RequestMapping(value="/lot_info/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> lotInfo(HttpServletRequest req,
                                                HttpServletResponse res,
                                                Locale locale,
                                                @PathVariable("sale_no") int saleNo,
                                                @PathVariable("lot_no") int lotNo) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        // 세일 정보
        CommonMap saleInfoMap = saleService.selectSaleInfo(map);
        // 랏 정보 가져오기
        CommonMap lotInfoMap = saleService.selectLotInfo(map);
        // 관심정보가져오기
        CommonMap favoriteMap = saleService.selectCustInteLot(map);

        if (favoriteMap == null) {
            lotInfoMap.put("FAVORITE_YN", "N");
        } else {
            lotInfoMap.put("FAVORITE_YN", "Y");
        }


        // 한국일때 홍콩, 홍콩일때 한국
        Map<String, String> baseCurrency = new HashMap<String, String>();
        baseCurrency.put("KRW", "HKD");
        baseCurrency.put("HKD", "KRW");

        // 현재 베이스 화폐
        String currCd = String.valueOf(saleInfoMap.get("CURR_CD"));

        //String saleTitle = saleInfoMap.getString("")

        lotInfoMap.put("SALE_TITLE_JSON" , saleInfoMap.get("TITLE_JSON"));
        lotInfoMap.put("LOT_EXPIRE_DATE_DAY" , saleInfoMap.get("LOT_EXPIRE_DATE_DAY"));
        lotInfoMap.put("LOT_EXPIRE_DATE_TIME_T" , saleInfoMap.get("LOT_EXPIRE_DATE_TIME_T"));
        lotInfoMap.put("NOTICE_DTL_JSON" , saleInfoMap.get("NOTICE_DTL_JSON"));
        lotInfoMap.put("SALE_TH" , saleInfoMap.get("SALE_TH"));
        lotInfoMap.put("SALE_KIND_CD" , saleInfoMap.get("SALE_KIND_CD"));


        //로그인한 정보를 가져온다.
        //직원 여부
        boolean isEmployee = false;
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        if (lotInfoMap.get("IMG_DISP_YN").equals("N") && !isEmployee) {
            lotInfoMap.put("IMAGE_URL", "");
            lotInfoMap.put("LOT_IMG_PATH", "");
            lotInfoMap.put("LOT_IMG_NAME", "/images/bg/no_image.jpg");
        } else {
            lotInfoMap.put("IMAGE_URL", IMAGE_URL);
        }

        // sub 화폐
        String subCurrCd = String.valueOf(baseCurrency.get(currCd));

        String[] mapKeys = {"ARTIST_NAME_JSON", "EXPE_PRICE_TO_JSON","EXPE_PRICE_FROM_JSON", "MAKE_YEAR_JSON" ,
                "SIGN_INFO_JSON", "COND_RPT_JSON", "PROFILE_JSON" ,"LITE_INFO_JSON" , "EXHI_INFO_JSON" ,
                "PROV_INFO_JSON" , "ETC_INFO_JSON" , "CMMT_JSON" ,"NOTICE_DTL_JSON"};
        String[] listKeys = {"LOT_SIZE_JSON"};

        // 맵 형태 거름
        ObjectMapper mapper  = new ObjectMapper();
        try{
            // 맵 변환
            for(var item : mapKeys) {
                lotInfoMap.put(item, mapper.readValue(String.valueOf(lotInfoMap.get(item)), Map.class));
                Map<String,Object> m = (Map<String,Object>)lotInfoMap.get(item);

                if (item.equals("ARTIST_NAME_JSON")) {

                    // artist filter DB화 필요
                    List<String> artistFilters = new ArrayList<>();
                    artistFilters.add("김환기");
                    artistFilters.add("박수근");
                    for (var artist : artistFilters) {
                        if (m !=null && m.get(locale.getLanguage()).equals(artist)) {
                            lotInfoMap.put("IMAGE_MAGNIFY", false);
                            break;
                        }else{
                            lotInfoMap.put("IMAGE_MAGNIFY", true);
                        }
                    }
                } else if (item.equals("EXPE_PRICE_TO_JSON")
                        || item.equals("EXPE_PRICE_FROM_JSON")) {

                   //NumberFormat formatter = NumberFormat.getCurrencyInstance();

                    DecimalFormat formatter = new DecimalFormat("###,###");

                    String cvf = formatter.format((int)(m.get(currCd) == null?0:m.get(currCd)));
                    String svf = formatter.format((int)(m.get(subCurrCd) == null?0:m.get(subCurrCd)));
                    String uvf = formatter.format((int)(m.get("USD") == null?0:m.get("USD")));

                    String cv = new StringBuilder().append(currCd + " ")
                            .append(cvf).toString();
                    String sv = new StringBuilder().append(subCurrCd + " ")
                            .append(svf).toString();
                    String uv = new StringBuilder().append("USD ")
                            .append(uvf).toString();

                    if (item.equals("EXPE_PRICE_TO_JSON")) {
                        lotInfoMap.put("BASE_EXPE_TO_PRICE", cv);
                        lotInfoMap.put("SUB_EXPE_TO_PRICE", sv);
                        lotInfoMap.put("USD_EXPE_TO_PRICE", uv);
                    } else if (item.equals("EXPE_PRICE_FROM_JSON")) {
                        lotInfoMap.put("BASE_EXPE_FROM_PRICE", cv);
                        lotInfoMap.put("SUB_EXPE_FROM_PRICE", sv);
                        lotInfoMap.put("USD_EXPE_FROM_PRICE", uv);
                    }
                }
            }
            // 리스트 변환
            for(var item : listKeys) {
                lotInfoMap.put(item,
                        mapper.readValue(String.valueOf(lotInfoMap.get(item)), List.class));
            }


        } catch (JsonMappingException e) {

        } catch (JsonProcessingException e) {

        }
        return ResponseEntity.ok(RestResponse.ok(lotInfoMap));
    }

    @RequestMapping(value="/getViewScaleImage/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> saleViewScaleImages(HttpServletRequest req,
                                                   HttpServletResponse res,
                                                   Locale locale,
                                                   @PathVariable("sale_no") int saleNo,
                                                   @PathVariable("lot_no") int lotNo) {

        // 필터를 적용한 새로운 랏이미지 정보
        List<CommonMap> lotImagesNew = new ArrayList<CommonMap>();

        CommonMap paramMap = new CommonMap();
        paramMap.put("sale_no", saleNo);
        paramMap.put("lot_no", lotNo);

        Boolean isUseViewScale = true;

        // 랏 이미지 정보 가져오기
        List<CommonMap> lotImages = new ArrayList<CommonMap>();
        if(saleService.selectViewScaleLotImages(paramMap) != null){
            lotImages = saleService.selectViewScaleLotImages(paramMap);
        }else{
            isUseViewScale = false;
        }

        String[] listKeys = {"LOT_SIZE_JSON"};
        ObjectMapper mapper  = new ObjectMapper();

        //로그인한 정보를 가져온다.
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //직원 여부
        boolean isEmployee = false;
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        // 랏 디스플레이 필터
        try{
            for (var item : lotImages) {
                CommonMap lotImagesNewItem = new CommonMap();
                for (var k : new ArrayList<>(item.keySet())){
                    lotImagesNewItem.put(k, item.get(k));
                }
                lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
                // 리스트 변환
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
    public ResponseEntity<RestResponse> saleImages(HttpServletRequest req,
                                                  HttpServletResponse res,
                                                  Locale locale,
                                                  @PathVariable("sale_no") int saleNo) {

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);

        // 랏 이미지 정보 가져오기
        List<CommonMap> lotImages = saleService.selectSaleLotImages(map);

        // 필터를 적용한 새로운 랏이미지 정보
        List<CommonMap> lotImagesNew = new ArrayList<>();

        String[] listKeys = {"LOT_SIZE_JSON"};
        ObjectMapper mapper  = new ObjectMapper();

        //로그인한 정보를 가져온다.
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //직원 여부
        boolean isEmployee = false;
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        // 랏 디스플레이 필터
        try{
            for (var item : lotImages) {
                CommonMap lotImagesNewItem = new CommonMap();
                for (var k : new ArrayList<>(item.keySet())){
                    lotImagesNewItem.put(k, item.get(k));
                }
                lotImagesNewItem.put("IMAGE_URL", IMAGE_URL);
                // 리스트 변환
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

                lotImagesNew.add(lotImagesNewItem);
            }
        } catch (JsonMappingException e) {
            e.printStackTrace();

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ResponseEntity.ok(RestResponse.ok(lotImagesNew));
    }


    @RequestMapping(value="/lot_images/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> lotImages(HttpServletRequest req,
                                                  HttpServletResponse res,
                                                  Locale locale,
                                                  @PathVariable("sale_no") int saleNo,
                                                  @PathVariable("lot_no") int lotNo) {

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        // 랏 정보 가져오기
        CommonMap lotInfoMap = saleService.selectLotInfo(map);
        // 랏 이미지 정보 가져오기
        List<CommonMap> lotImages = saleService.selectLotImages(map);
        // 필터를 적용한 새로운 랏이미지 정보
        List<CommonMap> lotImagesNew = new ArrayList<>();

        //로그인한 정보를 가져온다.
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //직원 여부
        boolean isEmployee = false;
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        // 랏 디스플레이 필터
        for (var item : lotImages) {
            CommonMap lotImagesNewItem = new CommonMap();

            for (var k : new ArrayList<>(item.keySet())){
                lotImagesNewItem.put(k, item.get(k));
            }

            lotImagesNewItem.put("IMG_DISP_YN", lotInfoMap.get("IMG_DISP_YN"));
            lotImagesNewItem.put("UNIT_CD", lotInfoMap.get("UNIT_CD"));
            lotImagesNewItem.put("SIZE1", lotInfoMap.get("SIZE1"));
            lotImagesNewItem.put("SIZE2", lotInfoMap.get("SIZE2"));

            //N일경우에는 No 이미지로 변경.
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
    public ResponseEntity<RestResponse> artistOtherLots(@RequestParam CommonMap map, HttpServletRequest req, HttpServletResponse res) {
        List<CommonMap> lotArtistOtherLots = saleService.selectlotArtistOtherLots(map);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/get_customer_by_cust_no", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> custInfo(@RequestParam CommonMap map,
                                                 HttpServletRequest req, HttpServletResponse res) {
        CommonMap customerByCustNo = saleService.selectCustomerByCustNo(map);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/sale_cert_info", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> certInfo(@RequestParam CommonMap map,
                                                 HttpServletRequest req, HttpServletResponse res) {

        CommonMap saleCertInfo = saleService.selectSaleCertInfo(map);
        return ResponseEntity.ok(RestResponse.ok());
    }


    @PostMapping(value="/insertRecentlyView")
    @ResponseBody
    public ResponseEntity<RestResponse> insertRecentlyView(@RequestBody CommonMap map,
                                                     HttpServletRequest req, HttpServletResponse res) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            saleService.upsertRecentlyView(map);
        }
        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/recently/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> selectRecentlyView(HttpServletRequest req,
                                                  HttpServletResponse res,
                                                  Locale locale,
                                                  @PathVariable("sale_no") int saleNo,
                                                  @PathVariable("lot_no") int lotNo) {

        // 필터를 적용한 새로운 랏이미지 정보
        List<CommonMap> lotImagesNew = new ArrayList<>();
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        // 유저정보가 있을 때 정보를 제공함
        if (saUserDetails != null) {
            CommonMap map = new CommonMap();
            map.put("sale_no", saleNo);
            map.put("lot_no", lotNo);
            map.put("cust_no", saUserDetails.getUserNo());

            // 랏 이미지 정보 가져오기
            List<CommonMap> lotImages = saleService.selectRecentlyView(map);

            String[] mapKeys = {"TITLE_BLOB_JSON", "ARTIST_NAME_BLOB_JSON"};
            ObjectMapper mapper = new ObjectMapper();

            try{
                // 맵 변환
                for (var i = 0; i < lotImages.size(); i++) {
                    for (var item : mapKeys) {
                        lotImages.get(i).put(item, mapper.readValue(String.valueOf(lotImages.get(i).get(item)), Map.class));
                    }
                }
            } catch (JsonProcessingException e) {

            }

            // 랏 디스플레이 필터
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
            @RequestParam(value = "is_live" ,defaultValue = "N") String isLive
    ) {

        boolean isEmployee = false;

        CommonMap commonMap = new CommonMap();
        commonMap.put("sale_no", saleNo);
        commonMap.put("is_live" , isLive);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null ) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        } else {
            commonMap.put("cust_no", 0);
        }

        List<CommonMap> lotImages = saleService.selectSaleList(commonMap);

        String[] mapKeys = {"SALE_TITLE_JSON", "LOT_TITLE_JSON",
                "MAKE_YEAR_JSON", "ARTIST_NAME_JSON", "EXPE_PRICE_FROM_JSON", "EXPE_PRICE_TO_JSON"};

        String[] listKeys = {"LOT_SIZE_JSON"};


        // 맵 형태 거름
        ObjectMapper mapper  = new ObjectMapper();
        try{
            // 맵 변환
            for (var i = 0; i < lotImages.size(); i++) {
                for (var item : mapKeys) {
                    lotImages.get(i).put(item, mapper.readValue(String.valueOf(lotImages.get(i).get(item)),
                            Map.class));
                }
                for(var item2 : listKeys) {
                    lotImages.get(i).put(item2,
                            mapper.readValue(String.valueOf(lotImages.get(i).get(item2)), List.class));
                }

                if (lotImages.get(i).get("IMG_DISP_YN").equals("N") && !isEmployee) {
                    lotImages.get(i).put("IMAGE_URL", "");
                    lotImages.get(i).put("FILE_PATH", "");
                    lotImages.get(i).put("FILE_NAME", "images/bg/no_image.jpg");
                }else {
                    lotImages.get(i).put("IMAGE_URL", IMAGE_URL);
                }
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }


        return ResponseEntity.ok(RestResponse.ok(lotImages));
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
    public ResponseEntity<RestResponse> artistInfo(HttpServletRequest req, HttpServletResponse res, Locale locale,
                                                 @PathVariable("artist_no") int artistNo) {
        CommonMap map = new CommonMap();
        map.put("artist_no", artistNo);

        CommonMap artistInfoMap = saleService.selectArtistInfo(map);
        if(artistInfoMap != null) {
            artistInfoMap.put("images", s3Service.getS3FileDataAll("artist",  artistInfoMap.get("id")));
        }
        return ResponseEntity.ok(RestResponse.ok(artistInfoMap));
    }
    @RequestMapping(value="/sale/maxbid/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> maxBid(HttpServletRequest req, HttpServletResponse res, Locale locale,
                                                   @PathVariable("sale_no") int saleNo,
                                                   @PathVariable("lot_no") int lotNo) {
        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        CommonMap result = saleService.selectMaxBid(map);

        return ResponseEntity.ok(RestResponse.ok(result));
    }

}
