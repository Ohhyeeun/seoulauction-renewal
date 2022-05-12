package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_CUSTOMER)
public class CustomerController {

    @GetMapping("/login")
    public String login(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "login" , locale);
    }

    @GetMapping(value = "/niceVbankPaid")
    public void niceVBankPaidGet(HttpServletRequest request) {
        log.info("get niceVBankPaid");
    }

    @PostMapping(value = "/niceVbankPaid", produces="text/plain")
    @ResponseBody
    public void niceVBankPaid(HttpServletRequest request) {
        log.info("post niceVBankPaid");

        Enumeration params = request.getParameterNames();
        log.info("----------------------------");
        while (params.hasMoreElements()){
            String name = (String)params.nextElement();
            System.out.println(name + " : " +request.getParameter(name));
        }
        log.info("----------------------------");

        String PayMethod    = request.getParameter("PayMethod");        //지불수단
        String MID          = request.getParameter("MID");              //상점ID
        String MallUserID   = request.getParameter("MallUserID");       //회원사 ID
        String Amt          = request.getParameter("Amt");              //금액
        String name         = request.getParameter("name");             //구매자명
        String GoodsName    = request.getParameter("GoodsName");        //상품명
        String TID          = request.getParameter("TID");              //거래번호
        String MOID         = request.getParameter("MOID");             //주문번호
        String AuthDate     = request.getParameter("AuthDate");         //입금일시 (yyMMddHHmmss)
        String ResultCode   = request.getParameter("ResultCode");       //결과코드 ('4110' 경우 입금통보)
        String ResultMsg    = request.getParameter("ResultMsg");        //결과메시지
        String VbankNum     = request.getParameter("VbankNum");         //가상계좌번호
        String FnCd         = request.getParameter("FnCd");             //가상계좌 은행코드
        String VbankName    = request.getParameter("VbankName");        //가상계좌 은행명
        String VbankInputName = request.getParameter("VbankInputName"); //입금자 명

        String RcptTID      = request.getParameter("RcptTID");          //현금영수증 거래번호
        String RcptType     = request.getParameter("RcptType");         //현금 영수증 구분(0:미발행, 1:소득공제용, 2:지출증빙용)
        String RcptAuthCode = request.getParameter("RcptAuthCode");     //현금영수증 승인번호

        String mall_reserved = request.getParameter("MallReserved");


        boolean paySuccess = false;		// 결제 성공 여부
        if(PayMethod.equals("VBANK")){		//가상계좌
            if(ResultCode.equals("4110")) paySuccess = true;
        }

        if(paySuccess){
            Map<String, Object> paramMap = new HashMap<String, Object>();

            paramMap.put("trans_id", TID);
            paramMap.put("pay_dt", AuthDate);
            paramMap.put("PAY_PRICE", Amt);
            paramMap.put("REAL_PAYER", VbankInputName);
            paramMap.put("UUID", mall_reserved);
            paramMap.put("RCPT_TYPE", RcptType);

            System.out.println("REAL_PAYER: "+ VbankInputName);

            //int result = commonService.addData("add_wait2pay", paramMap);
        }
    }
}
