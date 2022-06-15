package com.seoulauction.renewal.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.ArtistMapper;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleService {

    private final SaleMapper saleMapper;
    private final ArtistMapper artistMapper;
    private final AuctionService auctionService;

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

    public List<CommonMap> selectSaleLotImages(CommonMap commonMap) {
        List<CommonMap> resultMap = saleMapper.selectSaleLotImages(commonMap);
        return resultMap;
    }


    public CommonMap searchListPaging(CommonMap paramMap) {

        CommonMap map = new CommonMap();
        map.put("list", saleMapper.searchListPaging(paramMap));
        map.put("cntList", saleMapper.searchListCount(paramMap));
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

    public CommonMap selectTopBid(CommonMap commonMap) {
        return saleMapper.selectTopBid(commonMap);
    }

    public void insertBid(CommonMap map){

        String bidKindCd = map.getString("bid_kind_cd");

        //bidKindcd 가 오프라인 경매 일 경우.
        if(bidKindCd.equals("paper_offline")
          || bidKindCd.equals("phone")
          || bidKindCd.equals("floor")
        ) {
            map.put("padd_no", auctionService.selectSalePaddNo(map));

            WebClient webClient = WebClient.builder()
                    .baseUrl("http://dev-bid.seoulauction.xyz")
                    .build();

            CommonMap paramMap = new CommonMap();
            CommonMap customerMap = new CommonMap();

            customerMap.put("sale_no", map.get("sale_no"));
            customerMap.put("lot_no", map.get("lot_no"));
            customerMap.put("cust_no", map.get("cust_no"));
            customerMap.put("paddle", map.get("padd_no"));
            customerMap.put("user_id", map.get("user_id"));
            customerMap.put("sale_type", 1);
            customerMap.put("bid_type", map.get("bid_type"));

            paramMap.put("customer", customerMap);
            paramMap.put("bid_cost", map.get("bid_price"));
            //bidder.setToken(map.get("bid_token").toString());
            // 비딩금액 저장

            // 웹소켓에 데이타 전송
            String result = webClient.post().uri("/bid")
                    .bodyValue(paramMap)
                    .retrieve()
                    .bodyToMono(String.class)
                    .block();

            try {
                CommonMap resultMap = new ObjectMapper().readValue(result, CommonMap.class);

//            //웹소켓 통신을 제대로 보냇을때 디비 인서트!!
//                if (resultMap.getInteger("code") == 200) {
//                    saleMapper.insertBid(map);
//                }

            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        saleMapper.insertBid(map);
    }

    public CommonMap getCustomerByCustNo(CommonMap commonMap) {
        return saleMapper.getCustomerByCustNo(commonMap);
    }
    /*
    생년월일 , 성별 확인.
     */
    public Boolean checkCustRequired(CommonMap commonMap) {
        return saleMapper.selectCustCheckRequired(commonMap) != null;
    }
}

