package com.seoulauction.renewal.mapper.kt;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface LoginMapper {
    CommonMap getCustomerByLoginId(CommonMap paramMap);

    int insertConnHist(CommonMap paramMap);
    
    CommonMap getCustomerByCustNo(CommonMap paramMap);
}
