package com.seoulauction.renewal.service;


import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.CertificationMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CertificationService {
	
	private final CertificationMapper certificationMapper;
	
    public List<CommonMap> selectDuplicationForJoin(CommonMap commonMap){  
    	return certificationMapper.selectDuplicationForJoin(commonMap);
    }
    
    public CommonMap selectSaleCertByCustHp(CommonMap commonMap){  
    	return certificationMapper.selectSaleCertByCustHp(commonMap);
    }
    
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
    
    public CommonMap inertSaleCert(CommonMap commonMap){  
    	certificationMapper.inertSaleCert(commonMap);
    	return commonMap;
    }
    
    public int updateSaleCertHp(CommonMap commonMap){
    	return certificationMapper.updateSaleCertHp(commonMap);
    }
    
    public int updateCustForForeAuth(CommonMap commonMap){
    	return certificationMapper.updateCustForForeAuth(commonMap);
    }
}
