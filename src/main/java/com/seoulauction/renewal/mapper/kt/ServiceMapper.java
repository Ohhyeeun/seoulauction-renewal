package com.seoulauction.renewal.mapper.kt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface ServiceMapper {
	
    List<CommonMap> selectAcademyListForNow(CommonMap commonMap);
    
    int selectAcademyCntForNow(CommonMap commonMap);
    
    CommonMap selectAcademy(CommonMap commonMap);
    
    List<CommonMap> selectAcademyList(CommonMap commonMap);
    
    int selectAcademyListCnt(CommonMap commonMap);
}
