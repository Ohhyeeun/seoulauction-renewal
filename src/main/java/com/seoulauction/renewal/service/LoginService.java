package com.seoulauction.renewal.service;

import org.apache.commons.collections.MapUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper loginMapper;

    
    public CommonMap selectCustByLoginId(CommonMap paramMap){
        return loginMapper.selectCustByLoginId(paramMap);
    }

    public int insertConnHist(CommonMap paramMap){
        return loginMapper.insertConnHist(paramMap);
    }
    
    public int updateCustPwdResetByCustNo(CommonMap paramMap){
        return loginMapper.updateCustPwdResetByCustNo(paramMap);
    }
    
    public int updateCustPwdModDtByCustNo(CommonMap paramMap){
        return loginMapper.updateCustPwdModDtByCustNo(paramMap);
    }
    

    public CommonMap selectCustLoginIdByCustName(CommonMap paramMap){
    	CommonMap resultMap = loginMapper.selectCustLoginIdByCustName(paramMap);
    	if(!MapUtils.isEmpty(resultMap)) {
			 throw new SAException("일치하는 회원 정보가 없습니다.");
		 }
        return resultMap;
    }

    public int updatePasswordByLoginId(CommonMap commonMap){  
    	return loginMapper.updatePasswordByLoginId(commonMap);
    }
     
    public CommonMap selectCustomerByStatCdAndLoginId(CommonMap paramMap){
        return loginMapper.selectCustomerByStatCdAndLoginId(paramMap);
    }
}
