package com.seoulauction.renewal.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.ArtistMapper;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.ArrayStack;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleService {

    private final SaleMapper saleMapper;
    private final ArtistMapper artistMapper;
    private final AuctionService auctionService;
    private final LoginService loginService;

    @Value("${image.root.path}")
    private String IMAGE_URL;

    public CommonMap selectSaleInfo(CommonMap commonMap){
        CommonMap resultMap = saleMapper.selectSaleInfo(commonMap);
        if(MapUtils.isEmpty(resultMap)) {
            throw new SAException("일치하는 경매정보가 없습니다.");
        }
        return resultMap;
    }
    public List<CommonMap> selectExchRateList(CommonMap commonMap){
        List<CommonMap> resultMaps = saleMapper.selectExchRateList(commonMap);
        return resultMaps;
    }

    public CommonMap selectLotInfo(CommonMap commonMap) {
        CommonMap resultMap = saleMapper.selectLotInfo(commonMap);
        if(MapUtils.isEmpty(resultMap)) {
            throw new SAException("일치하는 작품정보가 없습니다.");
        }
        return resultMap;
    }

    public List<CommonMap> selectLotImages(CommonMap commonMap) {
        List<CommonMap> resultMaps = saleMapper.selectLotImages(commonMap);
        return resultMaps;
    }

    public List<CommonMap> selectlotArtistOtherLots(CommonMap commonMap) {
        List<CommonMap> resultMaps = saleMapper.selectLotArtistOtherLots(commonMap);
        return resultMaps;
    }

    public CommonMap selectCustomerByCustNo(CommonMap commonMap) {
        CommonMap resultMap = saleMapper.selectCustomerByCustNo(commonMap);
        if(MapUtils.isEmpty(resultMap)) {
            throw new SAException("일치하는 고객정보가 없습니다.");
        }
        return resultMap;
    }
    public CommonMap selectSaleCertInfo(CommonMap commonMap) {
        CommonMap resultMap = saleMapper.selectSaleCertInfo(commonMap);
        if(MapUtils.isEmpty(resultMap)) {
            throw new SAException("일치하는 고객정보가 없습니다.");
        }
        return resultMap;
    }

    public List<CommonMap> selectViewScaleLotImages(CommonMap commonMap) {
        List<CommonMap> resultMap = saleMapper.selectViewScaleLotImages(commonMap);
        return resultMap;
    }

    public List<CommonMap> selectSaleLotImages(CommonMap commonMap) {
        List<CommonMap> resultMap = saleMapper.selectSaleLotImages(commonMap);
        return resultMap;
    }


    public CommonMap searchListPaging(CommonMap paramMap) {

        CommonMap map = new CommonMap();
        map.put("list", saleMapper.searchListPaging(paramMap));

        List<CommonMap> lst = saleMapper.searchListPaging(paramMap);
        //List<CommonMap> lst2 = new ArrayList<CommonMap>();

        String[] listKeys = {"LOT_SIZE_JSON", "LOT_TITLE_JSON"};
        String[] mapKeys = {"SALE_TITLE_JSON", "TITLE_JSON",
                "MAKE_YEAR_JSON", "ARTIST_NAME_JSON", "EXPE_PRICE_FROM_JSON", "EXPE_PRICE_TO_JSON"};
        ObjectMapper mapper  = new ObjectMapper();
        // 랏 디스플레이 필터
        try{
            for (var i = 0; i < lst.size(); i++) {
                lst.get(i).put("IMAGE_URL", IMAGE_URL);

                if(lst.get(i).get("END_YN").equals("N") ||
                        lst.get(i).get("CLOSE_YN").equals("N")){
                    lst.get(i).put("STATUS","진행");
                } else if(lst.get(i).get("END_YN").equals("Y") ||
                        lst.get(i).get("CLOSE_YN").equals("Y")) {
                    lst.get(i).put("STATUS","완료");
                }

                for (var item : mapKeys) {
                    lst.get(i).put(item, mapper.readValue(String.valueOf(lst.get(i).get(item)),
                            Map.class));
                }
                // 리스트 변환
                for(var item2 : listKeys) {
                    lst.get(i).put(item2,
                            mapper.readValue(String.valueOf(lst.get(i).get(item2)), List.class));
                }
            }
        } catch (JsonMappingException e) {

        } catch (JsonProcessingException e) {

        }

        map.put("cntList", saleMapper.searchListCount(paramMap));
        map.put("list", lst);
        map.put("cust_info", saleMapper.getCustomerByCustNo(paramMap));
        //검색 히스토리 적재
        if (map.get("chk") != null) {
            saleMapper.searchLog(paramMap);
        }

        return map;
    }

    public int addCustInteLot(CommonMap paramMap) {

        if(paramMap.get("action_user_no") == null){
            throw new SAException("로그인이 필요합니다.");
        }

        int result = 0;
        result = saleMapper.addCustInteLot(paramMap);

        if (result > 0) {
            log.info("add_cust_inte_lot success : " + result);
        } else {
            log.info("add_cust_inte_lot fail : " + result);
        }
        return result;
    }

    public int delCustInteLot(CommonMap paramMap) {

        if(paramMap.get("action_user_no") == null){
            throw new SAException("로그인이 필요합니다.");
        }

        int result = 0;
        result = saleMapper.delCustInteLot(paramMap);

        if (result > 0) {
            log.info("delCustInteLot success : " + result);
        } else {
            log.info("delCustInteLot fail : " + result);
        }

        return result;
    }

    public void upsertRecentlyView(CommonMap commonMap){
        saleMapper.upsertRecentlyView(commonMap);
    }

    public List<CommonMap> selectRecentlyView(CommonMap commonMap){
        List<CommonMap> resultMaps = saleMapper.selectRecentlyView(commonMap);
        return resultMaps;
    }
    public void insertSuccessBid(CommonMap map){

        if (saleMapper.selectBidForSuccessBid(map) == null){
            throw new SAException("일치하는 경매 정보가 없슴니다.");
        }

        if(saleMapper.selectSuccessBidForOverlab(map) != null ) {
            throw new SAException("이미 낙찰된 정보가 있습니다.");
        }
        saleMapper.insertSuccessBid(map);
    }

    public CommonMap selectCustInteLot(CommonMap commonMap) {
        return saleMapper.selectCustInteLot(commonMap);
    }
    public List<CommonMap> selectRecommandArtist() {
        return artistMapper.selectRecommandArtist();
    }

    public List<CommonMap> selectSaleList(CommonMap commonMap) {
        return saleMapper.selectSaleList(commonMap);
    }
    public List<CommonMap> selectLotTagList(CommonMap commonMap) {
        return saleMapper.selectLotTagList(commonMap);
    }
    public List<CommonMap> selectCategories(CommonMap commonMap) {
        return saleMapper.selectCategories(commonMap);
    }
    public CommonMap selectTopBid(CommonMap commonMap) {
        return saleMapper.selectTopBid(commonMap);
    }

    @Transactional("ktTransactionManager")
    public void insertBid(CommonMap map){

        String bidKindCd = map.getString("bid_kind_cd");

        //bidKindcd 가 오프라인 경매 일 경우.
        if(bidKindCd.equals("paper_online")
          || bidKindCd.equals("phone")
          || bidKindCd.equals("paper_phone")
        ) {


            int paddNo =  auctionService.selectSalePaddNo(map);

            //패들번호를 신경x
            map.put("padd_no", paddNo);

            CommonMap custMap = loginService.selectCustByCustNo(map);

            map.put("hp", custMap.get("HP"));
            map.put("email", custMap.get("EMAIL"));

            //임시
            map.put("memo", null);
            map.put("emp_no", null);

            //오프라인 응찰 시 자동 응찰 기록 해야함.

            if(paddNo == 0){
                map.put("padd_no", null);
            }

            saleMapper.insertAutoBid(map);
            saleMapper.insertOfflineBid(map);

        } else if (bidKindCd.equals("floor") || bidKindCd.equals("paper")) {
            saleMapper.insertOfflineBid(map);
        } else {
            saleMapper.insertBid(map);
        }

    }
    public void insertAutoBid(CommonMap map){
        saleMapper.insertAutoBid(map);
    }

    public CommonMap getCustomerByCustNo(CommonMap commonMap) {
        return saleMapper.getCustomerByCustNo(commonMap);
    }
    /*
    생년월일 , 성별 확인.
     */
    public Boolean checkCustRequired(CommonMap commonMap) {
        return saleMapper.selectCustCheckRequired(commonMap);
    }

    public CommonMap selectArtistInfo(CommonMap commonMap) {
        CommonMap resultMap = artistMapper.selectArtistInfo(commonMap);
        return resultMap;
    }
    // 오프라인비딩 저장
    public void insertOfflineBid(CommonMap map){
        saleMapper.insertOfflineBid(map);
    }

    public CommonMap selectMaxBid(CommonMap commonMap) {
        CommonMap resultMap = saleMapper.selectMaxBid(commonMap);
        return resultMap;
    }
}

