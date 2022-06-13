package com.seoulauction.renewal.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.PrivateSaleService;
import com.seoulauction.renewal.service.SaleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.*;


@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/privatesale")
public class ApiPrivateSaleController {

    private final PrivateSaleService privateSaleService;
    private final SaleService saleService;


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


    @RequestMapping(value="/lot_info/{sale_no}/{lot_no}", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> lotInfo(HttpServletRequest req,
                                                HttpServletResponse res,
                                                Locale locale,
                                                @PathVariable("sale_no") int saleNo,
                                                @PathVariable("lot_no") int lotNo) {

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);
        map.put("cust_no" , 1);

        // 세일 정보
        CommonMap saleInfoMap = saleService.selectSaleInfo(map);
        // 랏 정보 가져오기
        CommonMap lotInfoMap = privateSaleService.selectExhibitLotInfo(map);
        // 관심정보가져오기
        CommonMap favoriteMap = saleService.selectCustInteLot(map);

        log.info("favoriteMap");
        log.info(favoriteMap);

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

        // sub 화폐
        String subCurrCd = String.valueOf(baseCurrency.get(currCd));

        String[] mapKeys = {"ARTIST_NAME_JSON", "EXPE_PRICE_TO_JSON","EXPE_PRICE_FROM_JSON",
                "SIGN_INFO_JSON", "COND_RPT_JSON", "PROFILE_JSON"};
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
                        if (m.get(locale.getLanguage()).equals(artist)) {
                            lotInfoMap.put("IMAGE_MAGNIFY", false);
                            break;
                        }
                    }
                } else if (item.equals("EXPE_PRICE_TO_JSON")
                        || item.equals("EXPE_PRICE_FROM_JSON")) {

                    //NumberFormat formatter = NumberFormat.getCurrencyInstance();

                    /*

                    DecimalFormat formatter = new DecimalFormat("###,###");

                    String cvf = formatter.format((int)m.get(currCd));
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

                     */
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



}
