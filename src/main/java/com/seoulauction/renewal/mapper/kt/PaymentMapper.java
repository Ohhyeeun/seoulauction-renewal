package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

    void insertPay(CommonMap map);
    CommonMap selectPayByPayNoAndCustNo(CommonMap map);
    void updateLotFeeForPayment(CommonMap map);

    int insertPayWait(CommonMap map);
    CommonMap selectPayWaitByUuid(CommonMap map);
    CommonMap selectPayWaitByPayNoAndCustNo(CommonMap map);

    void insertCustPay(CommonMap map);
    void insertLotPay(CommonMap map);

    CommonMap selectAcademyByAcademyNo(CommonMap map);
}
