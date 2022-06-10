package com.seoulauction.renewal.service;


import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;
import com.seoulauction.renewal.mapper.kt.PrivateSaleMapper;

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


}
