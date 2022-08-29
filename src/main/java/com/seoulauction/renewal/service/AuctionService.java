package com.seoulauction.renewal.service;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.AuctionMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class AuctionService {
    private final AuctionMapper auctionMapper;

    private final MainMapper mainMapper;

    public CommonMap lot(CommonMap map){
        log.info("sale :{}", map.get("sale_no"));
        log.info("lot :{}", map.get("lot_no"));
        return auctionMapper.selectLotBySaleNoAndLotNo(map);
    }

    @Transactional("ktTransactionManager")
    public Integer insertPaddle(CommonMap map){
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            map.put("cust_no", saUserDetails.getUserNo());
        }
        int paddNo = auctionMapper.selectSalePaddNo(map);
        if(paddNo > 0){
            return paddNo;
        }

        paddNo = auctionMapper.selectMaxSalePaddNo(map);
        map.put("padd_no", paddNo);
        auctionMapper.insertSaleCertOff(map);
        auctionMapper.insertSalePadd(map);

        return paddNo;
    }

    public CommonMap selectProgressSaleList(CommonMap paramMap) {
        CommonMap map = new CommonMap();

        map.put("list", auctionMapper.selectProgressSaleListPaging(paramMap));
        map.put("cnt", auctionMapper.selectProgressCount(paramMap));
        return map;
    }

    public CommonMap selectUpcomingSaleList(CommonMap paramMap) {
        CommonMap map = new CommonMap();

        map.put("list", auctionMapper.selectUpcomingSaleListPaging(paramMap));
        map.put("cnt", auctionMapper.selectUpcomingCount(paramMap));
        return map;
    }

    public CommonMap selectResultSaleList(CommonMap paramMap) {
        CommonMap map = new CommonMap();
        map.put("list", auctionMapper.selectResultSaleListPaging(paramMap));
        map.put("cnt", auctionMapper.selectResultSaleListCount(paramMap));

        return map;
    }

    public CommonMap selectSaleInfo(CommonMap commonMap) {
        CommonMap resultMap = auctionMapper.selectSaleInfo(commonMap);
        resultMap.put("buttonList", mainMapper.selectBrochures(commonMap));
        resultMap.settingYNValueToBoolean();
        return resultMap;
    }

    public void addBrochureReadCount(CommonMap paramMap) {
        mainMapper.addBrochureReadCount(paramMap);
    }

    public int selectSalePaddNo(CommonMap map) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            map.put("cust_no", saUserDetails.getUserNo());
        } else {
            map.put("cust_no", 0);
        }
        return auctionMapper.selectSalePaddNo(map);
    }

    public CommonMap selectScTrans(CommonMap map) {
        return auctionMapper.selectScTrans(map);
    }

    public List<CommonMap> selectSoldInvoiceInfo(CommonMap map) {
        return auctionMapper.selectSoldInvoiceInfo(map);
    }
}
