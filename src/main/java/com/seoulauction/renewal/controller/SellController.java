package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_SELL;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SERVICE_SELL)
public class SellController {
    @GetMapping("/consignment")
    public String consignment(Locale locale) {
        return SAConst.getUrl(SERVICE_SELL , "consignment" , locale);
    }
}
