package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KTMainMapper {

    List<CommonMap> selectUpcomings();
    List<CommonMap> selectIngAuctions();
    CommonMap selectIngMenuCount();

    CommonMap selectSaleImage(CommonMap map);

    List<CommonMap> selectHaveToPayWork(CommonMap map);
    List<CommonMap> selectLotsBySaleNo(CommonMap map);
}
