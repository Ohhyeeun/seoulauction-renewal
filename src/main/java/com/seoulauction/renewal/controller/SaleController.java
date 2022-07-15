package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.service.SaleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Locale;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class SaleController {

    private final SaleService saleService;

    @GetMapping(SAConst.SERVICE_SALE+"/test")
    public String login(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_SALE , "test" , locale);
    }

    @GetMapping(SAConst.SERVICE_SALE+"/search")
    public String search(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_SALE , "search" , locale);
    }

    @GetMapping("/soldInvoiceReport")
    public String soldInvoiceReport(@RequestParam Map<String, String> params, ModelMap model, Locale locale){
        model.addAttribute("VIEW_ID", "SOLD_INVOICE");
        if(params.containsKey("sale_no")) model.addAttribute("SALE_NO", params.get("sale_no"));
        if(params.containsKey("cust_no")) model.addAttribute("CUST_NO", params.get("cust_no"));
        if(params.containsKey("invoice_dt")) model.addAttribute("INVOICE_DT", params.get("invoice_dt"));

        return SAConst.getUrl(SAConst.SERVICE_SALE , "soldInvoiceReport" , locale);
    }
}

