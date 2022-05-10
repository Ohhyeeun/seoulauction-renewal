package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_PAYMENT)
public class PaymentController {

    @GetMapping("/paymentMember")
    public String paymentMember(Locale locale) {

        log.info("asdfasdfasdf");

        return SAConst.getUrl(SAConst.SERVICE_PAYMENT , "paymentMember" , locale);
    }

}
