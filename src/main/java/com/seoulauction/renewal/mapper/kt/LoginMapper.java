package com.seoulauction.renewal.mapper.kt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface LoginMapper {
    CommonMap selectCustByLoginId(CommonMap paramMap);

    int insertConnHist(CommonMap paramMap);
    
    CommonMap selectCustByCustNo(CommonMap paramMap);
    
    int updateCustPasswdByCustNo(CommonMap paramMap);
    
    int updateCustPwdResetByCustNo(CommonMap paramMap);
    
    int updateCustPwdModDtByCustNo(CommonMap paramMap);
    
    int updateCustLoginFailCntByCustNo(CommonMap paramMap);
    
    CommonMap selectCustLoginIdByCustName(CommonMap paramMap);

    int updatePasswordByLoginId(CommonMap commonMap);

    CommonMap selectCustomerByStatCdAndLoginId(CommonMap paramMap);

    CommonMap selectCustLoginId(CommonMap paramMap);
    
    CommonMap selectCustSocialBySocialLoginId(CommonMap paramMap);

    List<CommonMap> selectCustForExist(CommonMap paramMap);
    
    List<CommonMap> selectEmpByEmpName(CommonMap paramMap);
    
    int selectEmpByEmpNameCnt(CommonMap paramMap);
    
    List<CommonMap> selectCode(CommonMap paramMap);
    
    int insertCust(CommonMap paramMap);
    
    int insertCustSocial(CommonMap paramMap);
    
    int insertCustPushWay(CommonMap paramMap);

    CommonMap selectCustForCustSocial(CommonMap paramMap);

    CommonMap selectCustForChkPassword(CommonMap paramMap);
}
