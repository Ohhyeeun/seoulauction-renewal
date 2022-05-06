package com.seoulauction.renewal.service;

import java.io.IOException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seoulauction.renewal.component.FileManager;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.Test;
import com.seoulauction.renewal.mapper.kt.MypageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageService {

	private final MypageMapper mypageMapper;
	    
    public CommonMap selectAcademyList(CommonMap commonMap){  
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectAcademyList(commonMap));
    	map.put("cnt", mypageMapper.selectAcademyCnt(commonMap));
        return map;
    }
    
    public CommonMap selectAcademyPayInfo(CommonMap commonMap){  
    	return mypageMapper.selectAcademyPayInfo(commonMap);
    }
}
