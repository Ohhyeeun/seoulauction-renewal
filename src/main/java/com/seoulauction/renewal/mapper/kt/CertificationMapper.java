package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CertificationMapper {
	
    CommonMap selectSaleCertByCustHp(CommonMap commonMap);

    List<CommonMap> selectDuplicationForJoin(CommonMap commonMap);
    
    int selectAuthNumber();
  
    int insertAuthNumber(CommonMap commonMap);

    int inertSaleCert(CommonMap commonMap);
   
    int updateCustHp(CommonMap commonMap);

    int updateSaleCertHp(CommonMap commonMap);

    int updateCustForForeAuth(CommonMap commonMap);

    CommonMap selectCustHpByCustNo(CommonMap commonMap);

}
