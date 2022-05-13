package com.seoulauction.renewal.service;

import com.seoulauction.renewal.common.PaymentType;
import com.seoulauction.renewal.component.NicePayModule;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.PaymentMapper;
import kr.co.nicevan.nicepay.adapter.web.NicePayHttpServletRequestWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections4.MapUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

@Service
@RequiredArgsConstructor
@Log4j2
public class PaymentService {

    private final PaymentMapper paymentMapper;

    private final NicePayModule nicePayModule;

    public void insertPay(CommonMap map){
        paymentMapper.insertPay(map);
    }

    //가상계좌전용.
    public void insertPayWait(CommonMap map){
        //TODO 가상계좌 PAY_WAIT ㄱㄱ
    }

    @Transactional("ktTransactionManager")
    public CommonMap insertPayment(PaymentType paymentType , HttpServletRequest request){

        NicePayHttpServletRequestWrapper wrapper = new NicePayHttpServletRequestWrapper(request);

        //결제 처리 요청.
        CommonMap resultMap = nicePayModule.payProcess(request); //결제 처리 ㄱㄱ
        
        if(MapUtils.isNotEmpty(resultMap)) {

            //공통 페이먼트 테이블 필요한 부분 미리 넣기.
            resultMap.put("cust_no", "27319"); // 로그인 한 유저 번호 가져와야함.
            resultMap.put("pay_method", wrapper.getParameter("PayMethod"));
            resultMap.put("pg_trnas_id", wrapper.getParameter("TxTid"));
            resultMap.put("name", wrapper.getParameter("BuyerName"));
            resultMap.put("pay_price", wrapper.getParameter("Amt"));
            resultMap.put("no_vat_price", 0);
            resultMap.put("vat_price", 0);
            resultMap.put("vat", 0);
        }

        //결제 처리가 완료 시 디비 요청.
        String method = resultMap.getString("pay_method");
        insertPay(resultMap); //공통적으로 넣기. insert 후 pay_no 가 map 안에 들어감.

        switch (paymentType){

            case CUST_REGULAR:
                paymentMapper.insertCustPay(resultMap);
                break;
            case ACADEMY:
                //TODO 아카데미 DB INSERT 처리ㄱㄱ.






                break;

            case WORK:

                //TODO 작품 DB INSERT 처리ㄱㄱ.
                
                
                paymentMapper.insertLotPay(resultMap);






                //TODO 아직해야함.
                if(!"VBANK".equals(method)) { //가상 계좌 아닌경우에만 FEE 업데이트 ㅇㅇ. 기존레가시 참조.
                    paymentMapper.updateLotFeeForPayment(resultMap);
                }
                break;
        }

        return resultMap;
    }

}
