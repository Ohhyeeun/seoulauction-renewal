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

    //가상계좌전용.
    public void insertPayWait(CommonMap map){
        //TODO 가상계좌 PAY_WAIT ㄱㄱ

    }

    //실제 결제 요청이 성공적으로 된경우.
    public void insertPay(PaymentType paymentType ,  HttpServletRequest request){

        String method = request.getParameter("PayMethod");

        CommonMap resultMap = new CommonMap();
            //공통 페이먼트 테이블 필요한 부분 미리 넣기.
        resultMap.put("cust_no", "27319"); // 로그인 한 유저 번호 가져와야함.
        resultMap.put("pay_method", request.getParameter("PayMethod"));
        resultMap.put("pg_trnas_id", request.getParameter("TxTid"));
        resultMap.put("name", request.getParameter("BuyerName"));
        resultMap.put("pay_price", request.getParameter("Amt"));
        resultMap.put("no_vat_price", 0);
        resultMap.put("vat_price", 0);
        resultMap.put("vat", 0);

        paymentMapper.insertPay(resultMap);//공통적으로 넣기. insert 후 pay_no 가 map 안에 들어감.

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
                if(!"VBANK".equals(method)) { //가상 계좌 아닌경우에만 FEE 업데이트 ㅇㅇ. 기존레가시 참조.
                    paymentMapper.updateLotFeeForPayment(resultMap);
                }
                break;
        }
    }

    @Transactional("ktTransactionManager")
    public CommonMap paymentProcess(PaymentType paymentType , HttpServletRequest request){

        //결제 처리 요청.
        CommonMap resultMap = nicePayModule.payProcess(request); //결제 처리
        
        String payMethod = request.getParameter("PayMethod");

        if("VBANK".equals(payMethod)){
            insertPayWait(resultMap);
        } else {
            insertPay(paymentType , request);
        }
        //결제 처리가 완료 시 디비 요청.
        return resultMap;
    }

    @Transactional("ktTransactionManager")
    public void niceVBankPaid(HttpServletRequest request) {
        String PayMethod    = request.getParameter("PayMethod");        //지불수단
        String Amt          = request.getParameter("Amt");              //금액
        String TID          = request.getParameter("TID");              //거래번호
        String AuthDate     = request.getParameter("AuthDate");         //입금일시 (yyMMddHHmmss)
        String ResultCode   = request.getParameter("ResultCode");       //결과코드 ('4110' 경우 입금통보)
        String VbankInputName = request.getParameter("VbankInputName"); //입금자 명

        String RcptType     = request.getParameter("RcptType");         //현금 영수증 구분(0:미발행, 1:소득공제용, 2:지출증빙용)

        String mall_reserved = request.getParameter("MallReserved");

        boolean paySuccess = false;		// 결제 성공 여부
        if(PayMethod.equals("VBANK")){		//가상계좌
            if(ResultCode.equals("4110")) paySuccess = true;
        }

        if(paySuccess){
            CommonMap paramMap = new CommonMap();
            paramMap.put("uuid", mall_reserved);

            CommonMap resultMap = paymentMapper.selectPayWait(paramMap);
            resultMap.put("trans_id", TID);
            resultMap.put("pay_dt", AuthDate);
            resultMap.put("pay_price", Amt);
            resultMap.put("real_payer", VbankInputName);
            resultMap.put("uuid", mall_reserved);
            resultMap.put("rcpt_type", RcptType);

            //insertPayment(resultMap);
        }
    }
}
