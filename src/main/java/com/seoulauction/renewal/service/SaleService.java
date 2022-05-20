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
}
