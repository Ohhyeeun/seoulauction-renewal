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

        //가상계좌 인서트.
        if(!"VBANK".equals(map.getString("pay_method"))){
            paymentMapper.insertPay(map);
        } else {

        }
    }

    @Transactional("ktTransactionManager")
    public void insertCustPay(CommonMap map){

        //공통 페이먼트 테이블 기록.
        insertPay(map); //pay_no 값이 map 안에 있음. ㅇㅇ;

        //가상계좌아닌경우 CUST 테이블에도 INSERT
        if(!"VBANK".equals(map.getString("pay_method"))) {
            paymentMapper.insertCustPay(map);
        }
    }

    @Transactional("ktTransactionManager")
    public void insertLotPay(CommonMap map){

        //공통 페이먼트 테이블 기록.
        insertPay(map); //pay_no 값이 map 안에 있음. ㅇㅇ;

        if(!"VBANK".equals(map.getString("pay_method"))) {
            paymentMapper.insertLotPay(map);
            paymentMapper.updateLotFeeForPayment(map);
        }
    }


}
