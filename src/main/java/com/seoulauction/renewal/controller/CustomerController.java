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
@RequestMapping(SAConst.SERVICE_CUSTOMER)
public class CustomerController {

    @GetMapping("/login")
    public String login(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_CUSTOMER , "login" , locale);
    }
}
