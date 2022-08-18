package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AuctionOnlineMapper {
    CommonMap selectSaleInfoList(CommonMap commonMap);

    List<CommonMap> selectCategoryList(CommonMap commonMap);

    List<CommonMap> selectLotTagList(CommonMap commonMap);

    List<CommonMap> selectLotListPaging(CommonMap commonMap);
    int selectLotListCount(CommonMap commonMap);

    List<CommonMap> selectLotRefreshList(CommonMap commonMap);

    CommonMap selectCurrentLotInfo(CommonMap commonMap);

    CommonMap selectLotInfo(CommonMap commonMap);
    List<CommonMap> selectLotImageList(CommonMap commonMap);

    CommonMap selectLotRefreshInfo(CommonMap commonMap);

    CommonMap selectManager(int custNo);

    List<CommonMap> selectCustInteLotList(CommonMap commonMap);

    int insertCustInteLot(CommonMap commonMap);

    int deleteCustInteLot(CommonMap commonMap);

    CommonMap selectSaleCertInfo(CommonMap commonMap);

    int insertSaleCert(CommonMap commonMap);

    int updateSaleCert(CommonMap commonMap);

    List<CommonMap>  selectBidListPaging(CommonMap commonMap);

    int selectBidListCount(CommonMap commonMap);

    CommonMap selectCustInfo(CommonMap commonMap);

    CommonMap selectBidOnce(CommonMap commonMap);
    CommonMap selectBidOnceAuto(CommonMap commonMap);
    int insertBidOnce(Map map);

    void updateLotToDt(CommonMap commonMap);

    long selectBidMaxBidPrice(CommonMap commonMap);
    void updateLotGrowPrice(CommonMap commonMap);

    void insertBidAuto(CommonMap commonMap);

    void updateAutoBidReqCancel(CommonMap commonMap);

    CommonMap selectLastAutoBidReq(CommonMap commonMap);
}
