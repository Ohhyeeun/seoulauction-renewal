package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {
	
	/*아이디로 회원조회*/
    CommonMap selectCustByLoginId(CommonMap paramMap);

    /*회원접속이력*/
    int insertConnHist(CommonMap paramMap);
    
	/*회원번호로 회원조회*/
    CommonMap selectCustByCustNo(CommonMap paramMap);
    
	/*비밀번호초기화여부 업데이트*/
    int updateCustPwdResetByCustNo(CommonMap paramMap);
    
	/*비밀번호변경일시 업데이트*/
    int updateCustPwdModDtByCustNo(CommonMap paramMap);
    
    /*로그인실패횟수 업데이트*/
    int updateCustLoginFailCntByCustNo(CommonMap paramMap);
    
    /*아이디 찾기*/
    List<CommonMap> selectCustLoginIdByCustName(CommonMap paramMap);

    /*비밀번호 업데이트*/
    int updatePasswordByLoginId(CommonMap commonMap);

    /*비밀번호 찾기 > 사용자 조회*/
    CommonMap selectCustomerByStatCdAndLoginId(CommonMap paramMap);

    /*소셜로그인아이디로 소셜회원조회*/
    CommonMap selectCustSocialBySocialLoginId(CommonMap paramMap);

    /*아이디중복체크*/
    List<CommonMap> selectCustForIdExist(CommonMap paramMap);
    
    /*핸드폰, 사업자등록번호, 외국인인증코드, 이메일중복체크*/
    List<CommonMap> selectCustForExist(CommonMap paramMap);
    
    /*직원조회*/
    List<CommonMap> selectEmpByEmpName(CommonMap paramMap);
    
    /*직원조회 카운트*/
    int selectEmpByEmpNameCnt(CommonMap paramMap);
    
    /*코드조회*/
    List<CommonMap> selectCode(CommonMap paramMap);
    
    /*회원가입*/
    int insertCust(CommonMap paramMap);
    
    /*소셜회원가입*/
    int insertCustSocial(CommonMap paramMap);
    
    /*회원정보수신방법 등록*/
    int insertCustPushWay(CommonMap paramMap);

    /*소셜정보로 회원조회*/
    CommonMap selectCustForCustSocial(CommonMap paramMap);

    /*직원번호로 회원조회*/
    CommonMap selectCustForEmpNo(CommonMap map);

}
