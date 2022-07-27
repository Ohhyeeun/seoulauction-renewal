package com.seoulauction.renewal.mapper.kt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface ServiceMapper {
	
	/*진행중인 아카데미*/
    List<CommonMap> selectAcademyListForNow(CommonMap commonMap);
    
    /*진행중인 아카데미 카운트*/
    int selectAcademyCntForNow(CommonMap commonMap);
    
    /*아카데미 상세*/
    CommonMap selectAcademy(CommonMap commonMap);
    
    /*아카데미 목록*/
    List<CommonMap> selectAcademyList(CommonMap commonMap);
    
    /*아카데미 목록 카운트*/
    int selectAcademyListCnt(CommonMap commonMap);
}
