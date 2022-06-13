package com.seoulauction.renewal.service;


import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.PrivateSaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class PrivateSaleService {

    private final PrivateSaleMapper privateSaleMapper;

    public List<CommonMap> selectExhibitSale(CommonMap commonMap) {
        List<CommonMap> resultMaps = privateSaleMapper.selectExhibitSale(commonMap);
        return resultMaps;
    }

    public CommonMap selectExhibitLotInfo(CommonMap commonMap) {
        CommonMap resultMap = privateSaleMapper.selectExhibitLotInfo(commonMap);
        if(MapUtils.isEmpty(resultMap)) {
            throw new SAException("일치하는 작품정보가 없습니다.");
        }
        return resultMap;
    }


}
