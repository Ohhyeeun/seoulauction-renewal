package com.seoulauction.renewal.mapper.kt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.seoulauction.renewal.domain.CommonMap;

@Mapper
public interface CertificationMapper {
	
    CommonMap selectSaleCertByCustHp(CommonMap commonMap);

    List<CommonMap> selectDuplicationForJoin(CommonMap commonMap);
    
    CommonMap selectAuthNumber(CommonMap commonMap);

    int inertSaleCert(CommonMap commonMap);
   
    int updateSaleCertHp(CommonMap commonMap);

    int updateCustForForeAuth(CommonMap commonMap);

}
