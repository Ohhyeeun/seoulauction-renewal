package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.AuctionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

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





}
