package com.seoulauction.renewal.service;

import com.seoulauction.renewal.common.PaymentType;
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

    //가상계좌전용.
    public void insertPayWait(CommonMap map){
        //TODO 가상계좌 PAY_WAIT ㄱㄱ
    }

    @Transactional("ktTransactionManager")
    public void insertPayment(CommonMap map){

        String method = map.getString("pay_method");

        String type = map.getString("pay_type");

        insertPay(map); //공통적으로 넣기. insert 후 pay_no 가 map 안에 들어감.

        switch (PaymentType.valueOf(type)){

            case CUST_REGULAR:
                paymentMapper.insertCustPay(map);
                break;

            case ACADEMY:
                //TODO 아직해야함.

                break;

            case WORK:
                paymentMapper.insertLotPay(map);
                if(!"VBANK".equals(method)) { //가상 계좌 아닌경우에만 FEE 업데이트 ㅇㅇ. 기존레가시 참조.
                    paymentMapper.updateLotFeeForPayment(map);
                }
                break;
        }
    }

}
