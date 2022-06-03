package com.seoulauction.renewal.service;


import java.io.IOException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seoulauction.renewal.component.AddressFinder;
import com.seoulauction.renewal.component.FileManager;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.CertificationMapper;
import com.seoulauction.renewal.mapper.kt.MypageMapper;

import lombok.RequiredArgsConstructor;

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
    	return certificationMapper.selectAuthNumber(commonMap);
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
