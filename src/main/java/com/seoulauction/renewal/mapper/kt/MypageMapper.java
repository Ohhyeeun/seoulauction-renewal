package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MypageMapper {
	/* 정회원 이력*/
	List<CommonMap> selectCustomerCustpayList(CommonMap commonMap);
	
	/* 회원정보*/
	CommonMap selectCustomerInfo(CommonMap commonMap);
	
	/* 아카데미 결제 이력*/
    List<CommonMap> selectAcademyList(CommonMap commonMap);
    
    /* 아카데미 결제 totalcount*/
    int selectAcademyCnt(CommonMap commonMap);
 
    /* 아카데미 결제 정보*/
    CommonMap selectAcademyPayInfo(CommonMap commonMap);

    /* 결제내역 리스트 */
    List<CommonMap> selectPayListByCustNo(CommonMap commonMap);

    /* 결제내역 select box */
    List<CommonMap> selectSaleListByCustNo(CommonMap commonMap);

    /* 결제내역 > 결제할 건수, 결제한 건수 */
    int selectPayTotalCountByCustNo(CommonMap commonMap);

    /* 결제내역 totalcount */
    CommonMap selectPayCountByCustNo(CommonMap commonMap);

    /* 결제내역 > 사용자정보*/
    CommonMap selectCustomerByCustNo(CommonMap commonMap);
    
    /* 1대1 문의 리스트*/
    List<CommonMap> selectInquiryList(CommonMap commonMap);
    
    /* 1대1 문의 totalcount*/
    int selectInquiryListCnt(CommonMap commonMap);

    /* 1대1 문의 상세*/
    CommonMap selectInquiryInfo(CommonMap commonMap);
    
    /* 1대1 문의 답변*/
    CommonMap selectInquiryReply(CommonMap commonMap);
    
    /* 1대1 문의 첨부파일*/
    List<CommonMap> selectFileList(CommonMap commonMap);

    /* 1대1 문의 상세 > 카테고리 리스트*/
    List<CommonMap> selectInquiryCategory(CommonMap commonMap);
    
    /* 1대1 문의 상세 > 사용자 정보*/
    CommonMap selectInquiryCustomerInfo(CommonMap commonMap);
   
    /* 1대1 문의 첨부파일 등록*/
    int insertInquiryWriteFile(CommonMap commonMap);
   
    /* 1대1 문의 등록*/
    int insertInquiryWrite(Map commonMap);

    /* 관심정보 리스트*/
    List<CommonMap> selectCustInteLotList(CommonMap commonMap);

    /* 관심정보 totalcount*/
    int selectCustInteLotCnt(CommonMap commonMap);

    /* 관심정보 등록*/
    int insertCustInteLot(CommonMap commonMap);

    /* 관심정보 삭제*/
    int deleteCustInteLot(CommonMap commonMap);

    /* 라이브경매관리 > 응찰신청 내역*/
    List<CommonMap> selectLiveBidReqList(CommonMap commonMap);

    /* 라이브경매관리 > 응찰신청 totalcount*/
    int selectLiveBidReqCnt(CommonMap commonMap);
    
    /* 라이브경매관리 > 응찰신청 내역 > 응찰 팝업*/
    List<CommonMap> selectLiveBidReqHistoryList(CommonMap commonMap);

    /* 라이브경매관리 > 온라인패들응찰내역*/
    List<CommonMap> selectLiveBidList(CommonMap commonMap);
    
    /* 라이브경매관리 > 온라인패들응찰내역 totalcount*/
    int selectLiveBidCnt(CommonMap commonMap);

    /* 라이브경매관리 > 온라인패들응찰내역 > 온라인패들응찰 팝업*/
    List<CommonMap> selectLiveBidHistoryList(CommonMap commonMap);
    
    /* 라이브경매관리 > 온라인패들응찰내역 > 낙찰결과통보서 팝업*/
    List<CommonMap> selectLiveBidHammerList(CommonMap commonMap);

    /* 라이브경매관리 > 온라인패들응찰내역 > 낙찰결과통보서 totalcount*/
    CommonMap selectLiveBidHammerCnt(CommonMap commonMap);

    /* 온라인경매관리 > 응찰내역 */
    List<CommonMap> selectOnlineBidList(CommonMap commonMap);
    
    /* 온라인경매관리 > 응찰내역 totalcount*/
    int selectOnlineBidCnt(CommonMap commonMap);
    
    /* 온라인경매관리 > 응찰내역 > 응찰내역 팝업*/
    List<CommonMap> selectOnlineBidHistoryList(CommonMap commonMap);
    
    /* 비밀번호확인*/
    CommonMap selectCustForChkPassword(CommonMap paramMap);
    
    /* 비밀번호변경*/
    int updateCustPasswdByCustNo(CommonMap paramMap);
    
    /* 회원번호로 소셜회원조회*/
    List<CommonMap> selectCustSocialByCustNo(CommonMap commonMap);

    /* 소셜정보삭제*/
    int deleteCustSocial(CommonMap commonMap);
    
    /* 관심작가조회*/
    List<CommonMap> selectCustInteArtist(CommonMap paramMap);
    
    /* 작가검색*/
    List<CommonMap> selectArtistByArtistName(CommonMap paramMap);

    /* 회원정보 수정*/
    int updateCust(CommonMap paramMap);
    
    /* 회원탈퇴*/
    int deleteCust(CommonMap paramMap);
    
    /* 고객발송정보 delyn y로변경*/
    int updateCustSendInfoNew(CommonMap paramMap);
    
    /* 고객수신방법 삭제*/
    int deleteCustPushWay(CommonMap paramMap);
    
    /* 고객관심작가 삭제*/
    int deleteCustInteArtist(CommonMap paramMap);
    
    /* 고객관심분야 삭제*/
    int deleteCustInteArea(CommonMap paramMap);
    
    /* 고객수신방법 등록*/
    int insertCustPushWay(CommonMap paramMap);
    
    /* 고객관심작가 등록*/
    int insertCustInteArtist(CommonMap paramMap);
    
    /* 고객관심분야 등록*/
    int insertCustInteArea(CommonMap paramMap);
    
    /* 응찰중인지 확인*/
    List<CommonMap> selectBidForCustLeave(CommonMap map);
    
    /* 자동응찰중인지 확인*/
    List<CommonMap> selectAutoBidReqForcustLeave(CommonMap map);
}
