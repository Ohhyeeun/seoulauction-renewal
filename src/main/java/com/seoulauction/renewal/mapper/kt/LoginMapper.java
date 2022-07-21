package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {
    CommonMap selectCustByLoginId(CommonMap paramMap);

    int insertConnHist(CommonMap paramMap);
    
    CommonMap selectCustByCustNo(CommonMap paramMap);
    
    int updateCustPwdResetByCustNo(CommonMap paramMap);
    
    int updateCustPwdModDtByCustNo(CommonMap paramMap);
    
    int updateCustLoginFailCntByCustNo(CommonMap paramMap);
    
    /*아이디 찾기*/
    List<CommonMap> selectCustLoginIdByCustName(CommonMap paramMap);

    /*비밀번호 업데이트*/
    int updatePasswordByLoginId(CommonMap commonMap);

    /*비밀번호 찾기 > 사용자 조회*/
    CommonMap selectCustomerByStatCdAndLoginId(CommonMap paramMap);

    CommonMap selectCustLoginId(CommonMap paramMap);
    
    CommonMap selectCustSocialBySocialLoginId(CommonMap paramMap);

    List<CommonMap> selectCustForIdExist(CommonMap paramMap);
    
    List<CommonMap> selectCustForExist(CommonMap paramMap);
    
    List<CommonMap> selectEmpByEmpName(CommonMap paramMap);
    
    int selectEmpByEmpNameCnt(CommonMap paramMap);
    
    List<CommonMap> selectCode(CommonMap paramMap);
    
    int insertCust(CommonMap paramMap);
    
    int insertCustSocial(CommonMap paramMap);
    
    int insertCustPushWay(CommonMap paramMap);

    CommonMap selectCustForCustSocial(CommonMap paramMap);

    CommonMap selectCustForEmpNo(CommonMap map);

}
