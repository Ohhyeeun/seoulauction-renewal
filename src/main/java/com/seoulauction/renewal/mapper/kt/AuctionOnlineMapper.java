package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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

    CommonMap selectManager(int custNo);

    List<CommonMap> selectCustInteLotList(CommonMap commonMap);

    int insertCustInteLot(CommonMap commonMap);

    int deleteCustInteLot(CommonMap commonMap);

    CommonMap selectSaleCertInfo(CommonMap commonMap);

    int insertSaleCert(CommonMap commonMap);

    int updateSaleCert(CommonMap commonMap);

    List<CommonMap>  selectBidListPaging(CommonMap commonMap);

    int selectBidListCount(CommonMap commonMap);
}
