package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PrivateSaleMapper {

    List<CommonMap> selectExhibitSale(CommonMap commonMap);

    CommonMap selectExhibitLotInfo(CommonMap commonMap);

}
