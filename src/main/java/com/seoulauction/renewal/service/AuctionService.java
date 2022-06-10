package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
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
    final AuctionMapper auctionMapper;

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

        Integer paddNo = auctionMapper.selectSalePaddNo(map);
        if(paddNo != null){
            return paddNo;
        }

        paddNo = auctionMapper.selectMaxSalePaddNo(map);
        map.put("padd_no", paddNo);

        auctionMapper.insertSaleCertOff(map);
        auctionMapper.insertSalePadd(map);

        return paddNo;
    }

    public List<CommonMap> selectProgressSaleList(CommonMap commonMap) {
        return auctionMapper.selectProgressSaleList(commonMap);
    }

    public List<CommonMap> selectScheduledSaleList(CommonMap commonMap) {
        return auctionMapper.selectScheduledSaleList(commonMap);
    }

    public CommonMap selectSaleInfo(CommonMap commonMap) {
        return auctionMapper.selectSaleInfo(commonMap);
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
}
