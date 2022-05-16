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
import java.util.Locale;

@Service
@RequiredArgsConstructor
@Log4j2
public class PaymentService {

    private final PaymentMapper paymentMapper;

    private final NicePayModule nicePayModule;

    //가상계좌전용.
    public void insertPayWait(HttpServletRequest request, CommonMap resultMap){
        resultMap.put("cust_no", "117997");
        resultMap.put("payer", resultMap.get("BuyerName"));
        resultMap.put("pay_price", resultMap.get("Amt"));
        resultMap.put("pg_trans_id", resultMap.get("TID"));
        resultMap.put("reg_emp_no",  "117997");

        resultMap.put("academy_no", request.getParameter("academy_no"));

        //가상결제 PAY_ WAIT 테이블 입력을 위해서
        resultMap.put("kind_cd", PaymentType.ACADEMY);
        resultMap.put("ref_no", request.getParameter("academy_no"));
        resultMap.put("pay_method_cd", resultMap.get("PayMethod"));

        resultMap.put("no_vat_price", request.getParameter("no_vat_price"));
        resultMap.put("vat_price", request.getParameter("vat_price"));
        resultMap.put("vat", request.getParameter("vat"));
        resultMap.put("uuid", request.getParameter("MallReserved"));

        resultMap.put("vbank_cd", resultMap.get("VbankBankCode"));
        resultMap.put("vbank_nm", resultMap.get("vbankBankName"));
        resultMap.put("vbank_num", resultMap.get("vbankNum"));
        resultMap.put("vbank_exp_dt", resultMap.get("vbankExpDate"));

        paymentMapper.insertPayWait(resultMap);
    }

    //실제 결제 요청이 성공적으로 된경우.
    public void insertPay(PaymentType paymentType ,  HttpServletRequest request){

        String method = request.getParameter("PayMethod");

        CommonMap resultMap = new CommonMap();
        if(request.getParameter("PayMethod").equals("VBANK")) {
            CommonMap paramMap = new CommonMap();
            paramMap.put("uuid", request.getParameter("MallReserved"));
            resultMap = paymentMapper.selectPayWait(paramMap);
        }

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

        //TODO: 로그인한 정보 가져오기
        if("VBANK".equals(payMethod)){
            insertPayWait(request, resultMap);
        } else {
            insertPay(paymentType , request);
        }
        //결제 처리가 완료 시 디비 요청.
        return resultMap;
    }

    @Transactional("ktTransactionManager")
    public void niceVBankPaid(HttpServletRequest request) {
        String PayMethod    = request.getParameter("PayMethod");        //지불수단
        String ResultCode   = request.getParameter("ResultCode");       //결과코드 ('4110' 경우 입금통보)
        String mall_reserved = request.getParameter("MallReserved");

        boolean paySuccess = false;		// 결제 성공 여부
        if(PayMethod.equals("VBANK")){		//가상계좌
            if(ResultCode.equals("4110")) paySuccess = true;
        }

        if(paySuccess){
            CommonMap paramMap = new CommonMap();
            paramMap.put("uuid", mall_reserved);

            CommonMap resultMap = paymentMapper.selectPayWait(paramMap);

            insertPay(PaymentType.valueOf(resultMap.get("kind_cd").toString().toUpperCase()), request);
        }
    }
}
