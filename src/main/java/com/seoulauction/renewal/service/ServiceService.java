package com.seoulauction.renewal.service;


import org.springframework.stereotype.Service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.ServiceMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class ServiceService {

	private final ServiceMapper serviceMapper;
	
    public CommonMap selectAcademyForNow(CommonMap commonMap){  
    	CommonMap map = new CommonMap();
    	map.put("list", serviceMapper.selectAcademyListForNow(commonMap));
    	map.put("cnt", serviceMapper.selectAcademyCntForNow(commonMap));
        return map;
    }
    
    public CommonMap selectAcademy(CommonMap commonMap){  
        return serviceMapper.selectAcademy(commonMap);
    }
    
    public CommonMap selectAcademyList(CommonMap commonMap){  
    	CommonMap map = new CommonMap();
    	map.put("list", serviceMapper.selectAcademyList(commonMap));
    	map.put("cnt", serviceMapper.selectAcademyListCnt(commonMap));
        return map;
    }
}
