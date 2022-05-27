package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.SaleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_SALE)
public class SaleController {

    private final SaleService saleService;

    @GetMapping("/test")
    public String login(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_SALE , "test" , locale);
    }

    @GetMapping("/search")
    public String search(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_SALE , "search" , locale);
    }

}

