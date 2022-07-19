package com.seoulauction.renewal.service;


import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.kt.CertificationMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CertificationService {
	
	private final CertificationMapper certificationMapper;
	
	/*휴대폰 번호 중복 체크*/
    public List<CommonMap> selectDuplicationForJoin(CommonMap commonMap){  
    	return certificationMapper.selectDuplicationForJoin(commonMap);
    }
    
    /*휴대폰 번호로 경매정보 조회*/
    public CommonMap selectSaleCertByCustHp(CommonMap commonMap){  
    	return certificationMapper.selectSaleCertByCustHp(commonMap);
    }
    
    /*인증번호 생성*/
    public CommonMap selectAuthNumber(CommonMap commonMap){  
    	int randNum = certificationMapper.selectAuthNumber();
    	int result = 0;
    	CommonMap resultMap = new CommonMap();
    	if(randNum > 0 ) {
    		commonMap.put("rand_num", randNum);
    		result = certificationMapper.insertAuthNumber(commonMap);	
    	}
  
    	if(result > 0) {
    		resultMap.put("AUTH_NUM", randNum);
    	}
    	
    	return resultMap;
    }
    
    /* 경매 > 온라인 휴대폰 인증 > 경매정보 등록 */
    public CommonMap insertSaleCert(CommonMap commonMap){
    	certificationMapper.insertSaleCert(commonMap);
    	return commonMap;
    }
    
    /* 경매 > 온라인 휴대폰 인증 > 사용자 정보 수정 */
    public int updateSaleCertHp(CommonMap commonMap){
    	int result = certificationMapper.updateCustHp(commonMap);
    	if(result > 0) {
    		result = certificationMapper.updateSaleCertHp(commonMap);	
    	}  	
    	return result;
    }
    
    public int updateCustForForeAuth(CommonMap commonMap){
    	return certificationMapper.updateCustForForeAuth(commonMap);
    }

    public CommonMap selectSaleCertInfo(CommonMap paramMap) {
		SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
		if (saUserDetails != null) {
			paramMap.put("cust_no", saUserDetails.getUserNo());
		} else {
			paramMap.put("cust_no", 0);
		}

		return certificationMapper.selectSaleCertInfo(paramMap);
    }
}
