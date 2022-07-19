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

    void upsertRecentlyView(CommonMap commonMap);

    List<CommonMap> selectRecentlyView(CommonMap commonMap);
    /* 낙찰된 경매 관련 */
    CommonMap selectBidForSuccessBid(CommonMap map);
    CommonMap selectSuccessBidForOverlab(CommonMap map);
    void insertSuccessBid(CommonMap map);

    CommonMap selectCustInteLot(CommonMap map);

    int delCustInteLot(CommonMap paramMap);

    List<CommonMap> selectSaleList(CommonMap commonMap);

    List<CommonMap> selectLotTagList(CommonMap commonMap);

    List<CommonMap> selectCategories(CommonMap commonMap);

    CommonMap selectTopBid(CommonMap commonMap);
    void insertBid(CommonMap commonMap);
    void insertAutoBid(CommonMap commonMap);
    Boolean selectCustCheckRequired(CommonMap commonMap);

    void insertOfflineBid(CommonMap map);

    CommonMap selectMaxBid(CommonMap commonMap);
}
