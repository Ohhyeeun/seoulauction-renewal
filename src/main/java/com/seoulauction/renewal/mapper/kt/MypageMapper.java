package com.seoulauction.renewal.mapper.kt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface MypageMapper {
	
    List<CommonMap> selectAcademyList(CommonMap commonMap);
    
    int selectAcademyCnt(CommonMap commonMap);
 
    CommonMap selectAcademyPayInfo(CommonMap commonMap);

    List<CommonMap> selectPayListByCustNo(CommonMap commonMap);

    List<CommonMap> selectSaleListByCustNo(CommonMap commonMap);

    CommonMap selectPayCountByCustNo(CommonMap commonMap);

    CommonMap selectCustomerByCustNo(CommonMap commonMap);
    
    List<CommonMap> selectInquiryList(CommonMap commonMap);
    
    int selectInquiryListCnt(CommonMap commonMap);
}
