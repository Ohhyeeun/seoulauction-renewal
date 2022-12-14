package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AuctionMapper {
    CommonMap selectLotBySaleNoAndLotNo(CommonMap map);

    int selectSalePaddNo(CommonMap map);

    int selectMaxSalePaddNo(CommonMap map);

    void insertSaleCertOff(CommonMap map);

    void insertSalePadd(CommonMap map);

    List<CommonMap> selectProgressSaleListPaging(CommonMap commonMap);
    int selectProgressCount(CommonMap commonMap);

    List<CommonMap> selectUpcomingSaleListPaging(CommonMap commonMap);
    int selectUpcomingCount(CommonMap commonMap);

    List<CommonMap> selectResultSaleListPaging(CommonMap paramMap);
    int selectResultSaleListCount(CommonMap paramMap);

    CommonMap selectSaleInfo(CommonMap commonMap);

    CommonMap selectScTrans(CommonMap map);

    List<CommonMap> selectSoldInvoiceInfo(CommonMap map);
}
