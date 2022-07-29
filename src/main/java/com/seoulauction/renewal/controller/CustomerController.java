package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.exception.InternalServerException;
import com.seoulauction.renewal.service.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_CUSTOMER)
public class CustomerController {

    private final PaymentService paymentService;

    @GetMapping("/login")
    public String login(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "login" , locale);
    }

    @PostMapping(value = "/niceVbankPaid", produces="text/plain")
    @ResponseBody
    public void niceVBankPaid(HttpServletRequest request, HttpServletResponse response) {
        log.info("post niceVBankPaid");
        try {
            Enumeration params = request.getParameterNames();
            log.info("param start----------------------------");
            while (params.hasMoreElements()){
                String name = (String)params.nextElement();
                log.info(name + " : " +request.getParameter(name));
            }
            log.info("param end----------------------------");

            paymentService.niceVBankPaid(request);
        } catch(Exception e) {
            throw new InternalServerException(e);
        }
    }
}
