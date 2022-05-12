package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.PaymentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Log4j2
public class PaymentService {

    private final PaymentMapper paymentMapper;

    public void insertPay(CommonMap map){
        paymentMapper.insertPay(map);
    }

    @Transactional("ktTransactionManager")
    public void insertCustPay(CommonMap map){

        //공통 페이먼트 테이블 기록.
        insertPay(map); //pay_no 값이 map 안에 있음. ㅇㅇ;
        paymentMapper.insertCustPay(map);
    }


}
