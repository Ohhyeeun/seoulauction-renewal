package com.seoulauction.renewal.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.NicePayModule;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.InternalServerException;
import com.seoulauction.renewal.exception.PaymentErrorException;
import com.seoulauction.renewal.exception.PgNotFoundException;
import com.seoulauction.renewal.mapper.kt.PaymentMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.eclipse.jetty.util.StringUtil;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

@Service
@RequiredArgsConstructor
@Log4j2
public class PaymentService {

    private final PaymentMapper paymentMapper;

    private final NicePayModule nicePayModule;

    private final AuctionService auctionService;

    private void setRefNo(HttpServletRequest request, CommonMap resultMap) {
        switch (request.getAttribute("pay_kind").toString()){
            case SAConst.PAYMENT_KIND_MEMBERSHIP:
                resultMap.put("ref_no", resultMap.get("cust_no")); // TODO: cust_no
                break;
            case SAConst.PAYMENT_KIND_ACADEMY:
                resultMap.put("ref_no", request.getParameter("academy_no"));
                break;
            case SAConst.PAYMENT_KIND_WORK:
                resultMap.put("ref_no", request.getParameter("sale_no"));
                resultMap.put("ref_no2", request.getParameter("lot_no"));
                break;
        }
    }
    //??????????????????.
    public CommonMap insertPayWait(HttpServletRequest request, CommonMap resultMap){
        setRefNo(request, resultMap);

        resultMap.put("payer", resultMap.get("BuyerName"));
        resultMap.put("pay_price", resultMap.get("Amt"));
        resultMap.put("pg_trans_id", resultMap.get("TID"));
        resultMap.put("reg_emp_no",  resultMap.get("cust_no")); // ???????????? ?????? ????

        resultMap.put("academy_no", request.getParameter("academy_no"));
        resultMap.put("pg_cd", SAConst.PG_NICEPAY);

        resultMap.put("pay_method_cd", resultMap.get("PayMethod"));
        resultMap.put("pay_method", resultMap.get("PayMethod"));

        resultMap.put("uuid", request.getAttribute("uuid"));
        resultMap.put("kind_cd", request.getAttribute("pay_kind"));

        resultMap.put("no_vat_price", request.getAttribute("no_vat_price"));
        resultMap.put("vat_price", request.getAttribute("vat_price"));
        resultMap.put("vat", request.getAttribute("vat"));

        resultMap.put("vbank_cd", resultMap.get("VbankBankCode"));
        resultMap.put("vbank_nm", resultMap.get("VbankBankName"));
        resultMap.put("vbank_num", resultMap.get("VbankNum"));
        resultMap.put("vbank_exp_dt", resultMap.get("VbankExpDate"));

        resultMap.put("rcpt_type", request.getAttribute("rcpt_type"));
        resultMap.put("rcpt_type_no", request.getAttribute("rcpt_type_no"));

        paymentMapper.insertPayWait(resultMap);

        return resultMap;
    }

    //?????? ?????? ????????? ??????????????? ?????????.
    public CommonMap insertPay(HttpServletRequest request){

        SAUserDetails details = SecurityUtils.getAuthenticationPrincipal();

        String method = request.getParameter("PayMethod");

        CommonMap resultMap = new CommonMap();
        if(SAConst.PAYMENT_METHOD_VBANK.equals(method)) {
            CommonMap paramMap = new CommonMap();
            paramMap.put("uuid", request.getAttribute("uuid"));

            resultMap = paymentMapper.selectPayWaitByUuid(paramMap);
            //resultMap.put("rcpt_type", request.getParameter("RcptType"));
            resultMap.put("real_payer", request.getParameter("VbankInputName"));
        } else {
            resultMap.put("pg_trans_id", request.getParameter("TxTid"));
            resultMap.put("no_vat_price", request.getAttribute("no_vat_price"));
            resultMap.put("vat_price", request.getAttribute("vat_price"));
            resultMap.put("vat", request.getAttribute("vat"));
            resultMap.put("cust_no", details.getUserNo());
            resultMap.put("payer", details.getUserNm());
        }

        //?????? ???????????? ????????? ????????? ?????? ?????? ??????.
        resultMap.put("pay_method", method);
        resultMap.put("pay_price", request.getParameter("Amt"));
        resultMap.put("pg_cd", SAConst.PG_NICEPAY);

        paymentMapper.insertPay(resultMap);//??????????????? ??????. insert ??? pay_no ??? map ?????? ?????????.

        switch (request.getAttribute("pay_kind").toString()){
            case SAConst.PAYMENT_KIND_MEMBERSHIP:
                paymentMapper.insertCustPay(resultMap);
                //??????????????? ????????? ROLE ??????.
                updateAuthorities();
                break;
            case SAConst.PAYMENT_KIND_ACADEMY:
                if(SAConst.PAYMENT_METHOD_VBANK.equals(method)) {
                    resultMap.put("academy_no", resultMap.get("ref_no"));
                } else {
                    resultMap.put("academy_no", request.getParameter("academy_no"));
                }
                paymentMapper.insertAcademyPay(resultMap);

                resultMap.put("reg_emp_no", resultMap.get("cust_no"));
                paymentMapper.insertAcademyReq(resultMap);

                break;
            case SAConst.PAYMENT_KIND_WORK:
                resultMap.put("sale_no", request.getParameter("sale_no"));
                resultMap.put("lot_no", request.getParameter("lot_no"));
                paymentMapper.insertLotPay(resultMap);
                if(!SAConst.PAYMENT_METHOD_VBANK.equals(method)) { //?????? ?????? ?????????????????? FEE ????????????
                    paymentMapper.updateLotFeeForPayment(resultMap);
                }
                break;
        }
        return resultMap;
    }

    @Transactional("ktTransactionManager")
    public CommonMap paymentProcess(HttpServletRequest request){

        CommonMap resultMap = null;

        //?????? ??? ?????? ????????? ?????? ????????? ?????? ?????? ?????? ???????????? ??????.
        try{

            SAUserDetails details = SecurityUtils.getAuthenticationPrincipal();
            //?????? ?????? ??????.
            resultMap = nicePayModule.payProcess(request); //?????? ??????

            resultMap.put("cust_no" , details.getUserNo()); // ???????????? ?????? ??????.

            String payMethod = request.getParameter("PayMethod");
            int Amt = Integer.parseInt(request.getParameter("Amt"));

            //TODO: ??????, ?????? ??????
            int vat_price = (int) (Amt / 1.1);
            int vat = Amt - vat_price;
            int no_vat_price = 0;
            request.setAttribute("vat_price", vat_price);
            request.setAttribute("vat", vat);
            request.setAttribute("no_vat_price", no_vat_price);

            if(SAConst.PAYMENT_METHOD_VBANK.equals(payMethod)){
                reservedStringSet(request.getParameter("ReqReserved"), request);

                resultMap = insertPayWait(request, resultMap);
            } else {
                resultMap = insertPay(request);
            }
        }catch (Exception e){
            CommonMap map = new CommonMap();
            map.put("academy_no" , request.getAttribute("academy_no"));
            map.put("sale_no" , request.getAttribute("sale_no"));
            map.put("lot_no" , request.getAttribute("lot_no"));
            throw new PaymentErrorException((String) request.getAttribute("pay_kind"), e.getMessage() , map);
        }

        //?????? ????????? ?????? ??? ?????? ??????.
        return resultMap;
    }

    public CommonMap goPaymentResultAcademy(String payMethod, String payId) {
        CommonMap resultMap = getPaymentForPayResult(payMethod, payId);
        if(SAConst.PAYMENT_METHOD_VBANK.equals(payMethod)){
            resultMap.put("academy_no", resultMap.get("ref_no"));
            resultMap.putAll(paymentMapper.selectAcademyByAcademyNo(resultMap));
        } else if(SAConst.PAYMENT_METHOD_CARD.equals(payMethod)){
            CommonMap map = paymentMapper.selectAcademyPayByPayNo(resultMap);
            resultMap.put("academy_no", map.get("ACADEMY_NO"));
            resultMap.putAll(paymentMapper.selectAcademyByAcademyNo(resultMap));
        }

        return resultMap;
    }

    public CommonMap getPaymentForPayResult(String payMethod, String payId){

        SAUserDetails details = SecurityUtils.getAuthenticationPrincipal();

        CommonMap resultMap = null;

        CommonMap paramMap = new CommonMap();
        paramMap.put("cust_no",details.getUserNo());
        paramMap.put("pay_no", payId);

        if(SAConst.PAYMENT_METHOD_VBANK.equals(payMethod)){
            resultMap = paymentMapper.selectPayWaitByPayNoAndCustNo(paramMap);
        } else if(SAConst.PAYMENT_METHOD_CARD.equals(payMethod)){
            resultMap = paymentMapper.selectPayByPayNoAndCustNo(paramMap);
        }

        //??????????????? ????????? 404 ?????? ????????? ???
        if(resultMap == null) {
            throw new PgNotFoundException();
        }

        resultMap.putAll(paymentMapper.selectCustByCustNo(paramMap));

        return resultMap.toLowerCaseMap();
    }

    @Transactional("ktTransactionManager")
    public void niceVBankPaid(HttpServletRequest request) {
        String PayMethod = request.getParameter("PayMethod");        //????????????
        String Amt = request.getParameter("Amt");              //??????
        String TID = request.getParameter("TID");              //????????????
        String AuthDate = request.getParameter("AuthDate");         //???????????? (yyMMddHHmmss)
        String ResultCode = request.getParameter("ResultCode");       //???????????? ('4110' ?????? ????????????)
        String VbankInputName = request.getParameter("VbankInputName"); //????????? ???
        String RcptType = request.getParameter("RcptType");         //?????? ????????? ??????(0:?????????, 1:???????????????, 2:???????????????)

        reservedStringSet(request.getParameter("MallReserved"), request);

        log.info("ResultCode: {}", ResultCode);
        boolean paySuccess = false;        // ?????? ?????? ??????
        if (PayMethod.equals(SAConst.PAYMENT_METHOD_VBANK)) {        //????????????
            if (ResultCode.equals("4110")) paySuccess = true;
        }

        log.info("paySuccess: {}", paySuccess);
        if (paySuccess) {
            insertPay(request);
            checkReceipt(request);
        }
    }

    private void reservedStringSet(String reservedString, HttpServletRequest request) {
        CommonMap reservedMap = new CommonMap();
        StringTokenizer stk = new StringTokenizer(reservedString, ",");
        while(stk.hasMoreTokens()) {
            String[] str = stk.nextToken().split("=");
            if (str.length == 2) {
                reservedMap.put(str[0], str[1]);
            }
        }
        request.setAttribute("uuid", reservedMap.get("uuid"));
        request.setAttribute("pay_kind", reservedMap.get("pay_kind"));
        request.setAttribute("rcpt_type", reservedMap.get("rcpt_type"));
        request.setAttribute("rcpt_type_no", reservedMap.get("rcpt_type_no"));
    }

    public void checkReceipt(HttpServletRequest request) {
        int rcpt_type = Integer.parseInt(StringUtils.defaultString((String)request.getAttribute("rcpt_type"), "0"));
        String rcpt_type_no = String.valueOf(request.getAttribute("rcpt_type_no"));
        if(rcpt_type > 0 && rcpt_type_no != null) {
            nicePayModule.receiptProcess(request);
        }
    }
    public CommonMap selectAcademyByAcademyNo(CommonMap paramMap) {
        CommonMap map = paymentMapper.selectAcademyByAcademyNo(paramMap);
        if(MapUtils.isEmpty(map)) {
            throw new PgNotFoundException();
        }

        return map;
    }

    public  CommonMap getWorkPayInfo(CommonMap paramMap){
        CommonMap resultMap = new CommonMap();

        CommonMap lotMap = auctionService.lot(paramMap);

        //???????????? ?????? ??? Exception ??????
        if(MapUtils.isEmpty(lotMap)) {
            throw new PgNotFoundException();
        }

        //????????????
        resultMap.putAll(lotMap);

        //??????????????????
        CommonMap bidPriceMap = paymentMapper.selectLotBidPrice(paramMap);
        paramMap.put("bid_price", bidPriceMap.get("BID_PRICE"));
        CommonMap feeMap = paymentMapper.get_lot_fee(paramMap);
        CommonMap saleFeeMap = paymentMapper.get_sale_fee(paramMap);

        if(MapUtils.isEmpty(bidPriceMap) || MapUtils.isEmpty(feeMap) || MapUtils.isEmpty(saleFeeMap)) {
            throw new PgNotFoundException();
        }


        int lot_price = Integer.parseInt(bidPriceMap.get("BID_PRICE").toString());
        int fee_price = 0;

        if(feeMap.get("SUM_FEE") == null) fee_price = Integer.parseInt(saleFeeMap.get("SUM_FEE").toString());
        else  fee_price = Integer.parseInt(feeMap.get("SUM_FEE").toString());

//      ????????? ????????? ????????? ??????
//        int paid_price = (bidPriceMap.get("PAY_PRICE") == null ? 0 : Integer.parseInt(bidPriceMap.get("PAY_PRICE").toString()));
//        if(paid_price > 0){
//            if(paid_price <= no_vat_price){
//                no_vat_price = no_vat_price - paid_price;
//            }else{
//                vat_price = vat_price - (paid_price - no_vat_price);
//                no_vat_price = 0;
//            }
//        }

        int vat = fee_price / 11;
        fee_price = fee_price - vat;
        int pay_price = (lot_price + fee_price + vat);

        resultMap.put("no_vat_price" , lot_price);
        resultMap.put("vat_price" , fee_price + vat);
        resultMap.put("vat" , vat);
        resultMap.put("pay_price" , pay_price);




        return resultMap;
    }

    public CommonMap goPaymentResultWork(String payMethod, String payId) {

        SAUserDetails details = SecurityUtils.getAuthenticationPrincipal();

        CommonMap resultMap = getPaymentForPayResult(payMethod, payId);

        CommonMap paramMap = new CommonMap();
        paramMap.put("cust_no", details.getUserNo());
        paramMap.put("pay_no", payId);

        if(SAConst.PAYMENT_METHOD_VBANK.equals(payMethod)){
            resultMap.put("sale_no", resultMap.get("ref_no"));
            resultMap.put("lot_no", resultMap.get("ref_no2"));
            resultMap.putAll(getWorkPayInfo(resultMap));

        }else if(SAConst.PAYMENT_METHOD_CARD.equals(payMethod)){

            CommonMap lotPayMap = paymentMapper.selectLotPayByPayNo(resultMap);
            resultMap.put("sale_no", lotPayMap.get("SALE_NO"));
            resultMap.put("lot_no", lotPayMap.get("LOT_NO"));
            resultMap.putAll(getWorkPayInfo(resultMap));

        }

        return resultMap;
    }

    @SuppressWarnings("unchecked")
	public void updateAuthorities(){
		//?????? ??????,details
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	List<GrantedAuthority> oldRoles = new ArrayList<GrantedAuthority>();
    	oldRoles = (List<GrantedAuthority>) authentication.getAuthorities();
    	SAUserDetails oldDetails = (SAUserDetails) authentication.getDetails();
    	
    	List<SimpleGrantedAuthority> newRoles = new ArrayList<SimpleGrantedAuthority>();
    	newRoles.add(new SimpleGrantedAuthority("ROLE_REGULAR_USER"));
    	if(oldRoles.indexOf(new SimpleGrantedAuthority("ROLE_EMPLOYEE_USER")) > -1) {
    		//???????????? ????????? ??????
    		newRoles.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE_USER"));
    	}

    	//?????????validDate details??? ?????? (ex 2022-06-28 ????????? 2023-06-27?????? ?????????)
        Date today = new Date();
    	SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(today);
    	cal.add(Calendar.YEAR,  1);
    	cal.add(Calendar.DATE,  -1);
    	String validDate = dtFormat.format(cal.getTime());
    	log.info("=== validDate: {} ===", validDate);
    	
    	UsernamePasswordAuthenticationToken upat = new UsernamePasswordAuthenticationToken(
										    			SecurityContextHolder.getContext().getAuthentication().getPrincipal(),
										    			SecurityContextHolder.getContext().getAuthentication().getCredentials(),
										    			newRoles);
    	oldDetails.setAuthorities(newRoles);
    	oldDetails.setValidDate(validDate);
    	upat.setDetails(oldDetails);
    	SecurityContextHolder.getContext().setAuthentication(upat);
	}
}
