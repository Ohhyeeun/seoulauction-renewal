package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SaleMapper {
    CommonMap selectSaleInfo(CommonMap commonMap);
    List<CommonMap> selectExchRateList(CommonMap commonMap);
    CommonMap selectLotInfo(CommonMap commonMap);
    List<CommonMap> selectLotImages(CommonMap commonMap);
    List<CommonMap> selectLotArtistOtherLots(CommonMap commonMap);
    CommonMap selectCustomerByCustNo(CommonMap commonMap);
    CommonMap selectSaleCertInfo(CommonMap commonMap);
    List<CommonMap> selectSaleLotImages(CommonMap commonMap);

    List<CommonMap> searchListCount(CommonMap paramMap);

    List<CommonMap> searchListPaging(CommonMap paramMap);

    CommonMap getCustomerByCustNo(CommonMap paramMap);

    int searchLog(CommonMap paramMap);

    int addCustInteLot(CommonMap paramMap);

    int delCustInteLot(CommonMap paramMap);
}
