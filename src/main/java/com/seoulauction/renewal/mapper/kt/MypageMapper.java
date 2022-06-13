package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MypageMapper {
	
	List<CommonMap> selectCustomerCustpayList(CommonMap commonMap);
	
    List<CommonMap> selectAcademyList(CommonMap commonMap);
    
    int selectAcademyCnt(CommonMap commonMap);
 
    CommonMap selectAcademyPayInfo(CommonMap commonMap);

    List<CommonMap> selectPayListByCustNo(CommonMap commonMap);

    List<CommonMap> selectSaleListByCustNo(CommonMap commonMap);

    int selectPayTotalCountByCustNo(CommonMap commonMap);

    CommonMap selectPayCountByCustNo(CommonMap commonMap);

    CommonMap selectCustomerByCustNo(CommonMap commonMap);
    
    List<CommonMap> selectInquiryList(CommonMap commonMap);
    
    int selectInquiryListCnt(CommonMap commonMap);

    CommonMap selectInquiryInfo(CommonMap commonMap);
    
    CommonMap selectInquiryReply(CommonMap commonMap);
    
    List<CommonMap> selectFileList(CommonMap commonMap);

    List<CommonMap> selectInquiryCategory(CommonMap commonMap);
    
    CommonMap selectInquiryCustomerInfo(CommonMap commonMap);
   
    int insertInquiryWriteFile(CommonMap commonMap);
   
    int insertInquiryWrite(Map commonMap);

    List<CommonMap> selectCustInteLotList(CommonMap commonMap);

    int selectCustInteLotCnt(CommonMap commonMap);
    
    CommonMap insertCustInteLot(CommonMap commonMap);

    int deleteCustInteLot(CommonMap commonMap);

    CommonMap selectCustForChkPassword(CommonMap paramMap);
    
    int updateCustPasswdByCustNo(CommonMap paramMap);
    
    List<CommonMap> selectLiveBidReqList(CommonMap commonMap);

    int selectLiveBidReqCnt(CommonMap commonMap);
    
    List<CommonMap> selectLiveBidReqHistoryList(CommonMap commonMap);

    List<CommonMap> selectLiveBidList(CommonMap commonMap);
    
    int selectLiveBidCnt(CommonMap commonMap);

    List<CommonMap> selectLiveBidHistoryList(CommonMap commonMap);
    
    List<CommonMap> selectLiveBidHammerList(CommonMap commonMap);

    CommonMap selectLiveBidHammerCnt(CommonMap commonMap);

    List<CommonMap> selectOnlineBidList(CommonMap commonMap);
    
    int selectOnlineBidCnt(CommonMap commonMap);
    
    List<CommonMap> selectOnlineBidHistoryList(CommonMap commonMap);
    
    List<CommonMap> selectCustSocialByCustNo(CommonMap commonMap);

    int deleteCustSocial(CommonMap commonMap);
    
    List<CommonMap> selectCustInteArtist(CommonMap paramMap);
    
    List<CommonMap> selectArtistByArtistName(CommonMap paramMap);

    int updateCust(CommonMap paramMap);
    
    int deleteCustPushWay(CommonMap paramMap);
    
    int deleteCustInteArtist(CommonMap paramMap);
    
    int deleteCustInteArea(CommonMap paramMap);
    
    int insertCustPushWay(CommonMap paramMap);
    
    int insertCustInteArtist(CommonMap paramMap);
    
    int insertCustInteArea(CommonMap paramMap);
    
}
