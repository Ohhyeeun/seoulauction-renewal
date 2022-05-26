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
    void insertAcademyPay(CommonMap map);
    void insertAcademyReq(CommonMap map);

    CommonMap selectAcademyPayByPayNo(CommonMap map);
    CommonMap selectAcademyByAcademyNo(CommonMap map);
    CommonMap selectLotBidPrice(CommonMap map);
    CommonMap get_sale_fee(CommonMap map);
    CommonMap get_lot_fee(CommonMap map);

    CommonMap selectLotPayByPayNo(CommonMap map);


    CommonMap selectCustByCustNo(CommonMap map);
}
