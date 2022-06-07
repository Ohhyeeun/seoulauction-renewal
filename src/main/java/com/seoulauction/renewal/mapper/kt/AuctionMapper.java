package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuctionMapper {
    CommonMap selectLotBySaleNoAndLotNo(CommonMap map);

    Integer selectSalePaddNo(CommonMap map);

    Integer selectMaxSalePaddNo(CommonMap map);

    void insertSaleCertOff(CommonMap map);

    void insertSalePadd(CommonMap map);
}
