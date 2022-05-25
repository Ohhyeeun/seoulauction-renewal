package com.seoulauction.renewal.mapper.kt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface MypageMapper {
	
	List<CommonMap> selectCustomerCustpayList(CommonMap commonMap);
	
    List<CommonMap> selectAcademyList(CommonMap commonMap);
    
    int selectAcademyCnt(CommonMap commonMap);
 
    CommonMap selectAcademyPayInfo(CommonMap commonMap);

    List<CommonMap> selectPayListByCustNo(CommonMap commonMap);

    List<CommonMap> selectSaleListByCustNo(CommonMap commonMap);

    CommonMap selectPayCountByCustNo(CommonMap commonMap);

    CommonMap selectCustomerByCustNo(CommonMap commonMap);
    

    CommonMap selectSaleCertByCustHp(CommonMap commonMap);
    
    CommonMap selectAuthNumber(CommonMap commonMap);

    int inertSaleCert(CommonMap commonMap);
   
    int updateSaleCertHp(CommonMap commonMap);

    List<CommonMap> selectInquiryList(CommonMap commonMap);
    
    int selectInquiryListCnt(CommonMap commonMap);

    CommonMap selectInquiryInfo(CommonMap commonMap);
    
    CommonMap selectInquiryReply(CommonMap commonMap);
    
    List<CommonMap> selectFileList(CommonMap commonMap);

    List<CommonMap> selectInquiryCategory(CommonMap commonMap);
    
    CommonMap selectInquiryCustomerInfo(CommonMap commonMap);
   
    int insertInquiryWriteFile(CommonMap commonMap);
   
    int insertInquiryWrite(Map commonMap);

}
