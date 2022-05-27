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

    List<CommonMap> search_list_count(CommonMap paramMap);

    List<CommonMap> search_list_paging(CommonMap paramMap);

    CommonMap get_customer_by_cust_no(CommonMap paramMap);

    int search_log(CommonMap paramMap);

    int add_cust_inte_lot(CommonMap paramMap);

    int del_cust_inte_lot(CommonMap paramMap);

    void upsertRecentlyView(CommonMap commonMap);

    List<CommonMap> selectRecentlyView(CommonMap commonMap);
    /* 낙찰된 경매 관련 */
    CommonMap selectBidForSuccessBid(CommonMap map);
    CommonMap selectSuccessBidForOverlab(CommonMap map);
    void insertSuccessBid(CommonMap map);
    //

    void insertCustInteLot(CommonMap map);
    void deleteCustInteLot(CommonMap map);

    CommonMap selectCustInteLot(CommonMap map);
}
