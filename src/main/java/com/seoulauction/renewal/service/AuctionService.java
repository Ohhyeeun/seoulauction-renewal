package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.AuctionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        // cust_no, sale_no -> padd_no
        map.put("cust_no", 117997); //TODO: set cust_no

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
}
