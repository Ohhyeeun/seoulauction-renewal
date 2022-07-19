package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CertificationMapper {
	
	/*휴대폰 번호로 경매정보 조회*/
    CommonMap selectSaleCertByCustHp(CommonMap commonMap);

    /*휴대폰 번호 중복 체크*/
    List<CommonMap> selectDuplicationForJoin(CommonMap commonMap);
    
    /*인증번호 생성*/
    int selectAuthNumber();
  
    /*인증번호 등록*/
    int insertAuthNumber(CommonMap commonMap);

    /* 경매 > 온라인 휴대폰 인증 > 경매정보 등록 */
    int insertSaleCert(CommonMap commonMap);
   
    /* 경매 > 온라인 휴대폰 인증 > 사용자 정보 수정 */
    int updateCustHp(CommonMap commonMap);

    /* 경매 > 온라인 휴대폰 인증 > 사용자 정보 수정 */
    int updateSaleCertHp(CommonMap commonMap);

    int updateCustForForeAuth(CommonMap commonMap);

    CommonMap selectSaleCertInfo(CommonMap paramMap);
}
