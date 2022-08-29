package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SaleLiveMapper {

    CommonMap selectLiveSale(CommonMap map);
    List<CommonMap> selectLiveSaleLots(CommonMap map);
    CommonMap selectLiveSaleLotByOne(CommonMap map);
    CommonMap selectBidOfflineForLastPrice(CommonMap map);
    List<CommonMap> selectLiveCategories(CommonMap map);
    List<CommonMap> selectLiveLotTags(CommonMap map);
    List<CommonMap> selectLiveTypes(CommonMap map);
    List<CommonMap> selectLiveMyBidding(CommonMap map);
    List<CommonMap> selectLiveSiteBidding(CommonMap map);
    void insertLiveBidding(CommonMap map);
    List<CommonMap> selectSaleExchRate(CommonMap map);
    void updateLotCloseToggle(CommonMap map);
    void deleteBidOfflineByBidId(CommonMap map);
    String selectLotClose(CommonMap map);
    void updateLotSync1(CommonMap map);
    void updateLotSync2(CommonMap map);
    CommonMap selectAdminSaleInfo(CommonMap map);
    CommonMap selectAdminLotInfo(CommonMap map);
    List<CommonMap> selectAdminOffBid(CommonMap map);

    List<CommonMap> selectSaleLotImages(CommonMap commonMap);
    List<CommonMap> selectSaleList(CommonMap map);
    int selectSaleListCount(CommonMap map);
    CommonMap selectLotInfo(CommonMap map);
}
