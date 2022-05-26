package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleService {
    private final SaleMapper saleMapper;

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


    public CommonMap search_list_paging(CommonMap paramMap) {

        CommonMap map = new CommonMap();
        map.put("list", saleMapper.search_list_paging(paramMap));
        map.put("cntList", saleMapper.search_list_count(paramMap));
        map.put("cust_info", saleMapper.get_customer_by_cust_no(paramMap));

        //검색 히스토리 적재
        if (map.get("chk") != null) {
            saleMapper.search_log(paramMap);
        }

        return map;
    }

    public int add_cust_inte_lot(CommonMap paramMap) {

        int result = 0;
        result = saleMapper.add_cust_inte_lot(paramMap);

        if (result > 0) {
            log.info("add_cust_inte_lot success : " + result);
        } else {
            log.info("add_cust_inte_lot fail : " + result);
        }
        return result;
    }

    public int del_cust_inte_lot(CommonMap paramMap) {

        int result = 0;
        result = saleMapper.del_cust_inte_lot(paramMap);

        if (result > 0) {
            log.info("add_cust_inte_lot success : " + result);
        } else {
            log.info("add_cust_inte_lot fail : " + result);
        }

        return result;
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

}
