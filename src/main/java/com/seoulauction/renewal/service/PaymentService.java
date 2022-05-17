package com.seoulauction.renewal.service;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.NicePayModule;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.PaymentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
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
    public CommonMap insertPayWait(HttpServletRequest request, CommonMap resultMap){
        resultMap.put("cust_no", "117997");
        resultMap.put("payer", resultMap.get("BuyerName"));
        resultMap.put("pay_price", resultMap.get("Amt"));
        resultMap.put("pg_trans_id", resultMap.get("TID"));
        resultMap.put("reg_emp_no",  "117997");

        resultMap.put("academy_no", request.getParameter("academy_no"));

        //가상결제 PAY_ WAIT 테이블 입력을 위해서
       // resultMap.put("kind_cd", PaymentType.ACADEMY);
        resultMap.put("ref_no", request.getParameter("academy_no"));
        resultMap.put("pay_method_cd", resultMap.get("PayMethod"));

        resultMap.put("no_vat_price", request.getParameter("no_vat_price"));
        resultMap.put("vat_price", request.getParameter("vat_price"));
        resultMap.put("vat", request.getParameter("vat"));

        resultMap.put("uuid", request.getParameter("MallReserved"));
        resultMap.put("vbank_cd", resultMap.get("VbankBankCode"));
        resultMap.put("vbank_nm", resultMap.get("VbankBankName"));
        resultMap.put("vbank_num", resultMap.get("VbankNum"));
        resultMap.put("vbank_exp_dt", resultMap.get("VbankExpDate"));

        paymentMapper.insertPayWait(resultMap);

        return resultMap;
    }

    //실제 결제 요청이 성공적으로 된경우.
    public CommonMap insertPay(String paymentType ,  HttpServletRequest request){

        String method = request.getParameter("PayMethod");

        CommonMap resultMap = new CommonMap();
        if(request.getParameter("PayMethod").equals("VBANK")) {
            CommonMap paramMap = new CommonMap();
            paramMap.put("uuid", request.getParameter("MallReserved"));
            resultMap = paymentMapper.selectPayWaitByUuid(paramMap);
        }

        //공통 페이먼트 테이블 필요한 부분 미리 넣기.
        resultMap.put("cust_no", "27319"); // 로그인 한 유저 번호 가져와야함.
        resultMap.put("pay_method", request.getParameter("PayMethod"));
        resultMap.put("pg_trnas_id", request.getParameter("TxTid"));
        resultMap.put("name", request.getParameter("BuyerName"));
        resultMap.put("pay_price", request.getParameter("Amt"));
        resultMap.put("pg_cd", SAConst.PG_NICEPAY);
        resultMap.put("no_vat_price", request.getParameter("no_vat_price"));
        resultMap.put("vat_price", request.getParameter("vat_price"));
        resultMap.put("vat", request.getParameter("vat"));
        paymentMapper.insertPay(resultMap);//공통적으로 넣기. insert 후 pay_no 가 map 안에 들어감.

        switch (paymentType){

            case SAConst.PAYMENT_KIND_MEMBERSHIP:
                paymentMapper.insertCustPay(resultMap);
                break;
            case SAConst.PAYMENT_KIND_ACADEMY:
                //TODO 아카데미 DB INSERT 처리ㄱㄱ.
                break;

            case SAConst.PAYMENT_KIND_WORK:
                //TODO 작품 DB INSERT 처리ㄱㄱ.
                paymentMapper.insertLotPay(resultMap);
                if(!"VBANK".equals(method)) { //가상 계좌 아닌경우에만 FEE 업데이트 ㅇㅇ. 기존레가시 참조.
                    paymentMapper.updateLotFeeForPayment(resultMap);
                }
                break;
        }
        return resultMap;
    }

    @Transactional("ktTransactionManager")
    public CommonMap paymentProcess(String paymentType , HttpServletRequest request){

        //결제 처리 요청.
        CommonMap resultMap = nicePayModule.payProcess(request); //결제 처리
        String payMethod = request.getParameter("PayMethod");

        //TODO: 로그인한 정보 가져오기
        if("VBANK".equals(payMethod)){
            resultMap = insertPayWait(request, resultMap);
        } else {
            resultMap = insertPay(paymentType , request);
        }
        //결제 처리가 완료 시 디비 요청.
        return resultMap;
    }
    public CommonMap goPaymentResultAcademy(String payMethod, String payId) {
        CommonMap resultMap = getPaymentForPayResult(payMethod, payId);
        if(SAConst.PAYMENT_METHOD_VBANK.equals(payMethod)){
            resultMap.put("academy_no", resultMap.get("ref_no"));
            resultMap.putAll(paymentMapper.selectAcademyByAcademyNo(resultMap));
        } else if(SAConst.PAYMENT_METHOD_CARD.equals(payMethod)){
            resultMap.put("academy_no", resultMap.get("ref_no"));
            resultMap.putAll(paymentMapper.selectAcademyByAcademyNo(resultMap));
        }




        return resultMap;
    }
    public CommonMap getPaymentForPayResult(String payMethod, String payId){

        CommonMap resultMap = null;
        String custNo = "117997"; //로그인한 유저정보를 가져와야함.


        CommonMap paramMap = new CommonMap();
        paramMap.put("cust_no",custNo);
        paramMap.put("pay_no", payId);

        if(SAConst.PAYMENT_METHOD_VBANK.equals(payMethod)){
            resultMap = paymentMapper.selectPayWaitByPayNoAndCustNo(paramMap);
        } else if(SAConst.PAYMENT_METHOD_CARD.equals(payMethod)){
            resultMap = paymentMapper.selectPayByPayNoAndCustNo(paramMap);
        }

        //찾은결과가 없다면
        if(resultMap == null) {
            throw new SAException("잘못된 접근 입니다.");
        }
        return resultMap.toLowerCaseMap();
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

            CommonMap resultMap = paymentMapper.selectPayWaitByUuid(paramMap);

            insertPay(resultMap.get("kind_cd").toString().toUpperCase(), request);
        }
    }


}
