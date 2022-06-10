package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AuctionMapper {
    CommonMap selectLotBySaleNoAndLotNo(CommonMap map);

    Integer selectSalePaddNo(CommonMap map);

    Integer selectMaxSalePaddNo(CommonMap map);

    void insertSaleCertOff(CommonMap map);

    void insertSalePadd(CommonMap map);

    List<CommonMap> selectProgressSaleList(CommonMap commonMap);

    List<CommonMap> selectScheduledSaleList(CommonMap commonMap);

    CommonMap selectSaleInfo(CommonMap commonMap);
}
