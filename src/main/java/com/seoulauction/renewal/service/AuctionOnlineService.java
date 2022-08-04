package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.AuctionOnlineMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class AuctionOnlineService {
    private final AuctionOnlineMapper auctionOnlineMapper;

    private final MainMapper mainMapper;

    public CommonMap selectSaleInfoList(CommonMap commonMap) {
        CommonMap resultMap = auctionOnlineMapper.selectSaleInfoList(commonMap);
        resultMap.put("buttonList", mainMapper.selectBrochures(commonMap));
        resultMap.put("categoryList", auctionOnlineMapper.selectCategoryList(commonMap));
        resultMap.put("lotTagList", auctionOnlineMapper.selectLotTagList(commonMap));
        return resultMap;
    }

    public CommonMap selectLotList(CommonMap commonMap) {
        CommonMap map = new CommonMap();
        map.put("list", auctionOnlineMapper.selectLotListPaging(commonMap));
        map.put("cnt", auctionOnlineMapper.selectLotListCount(commonMap));

        return map;
    }
}
