package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SEVICE_PRIVATE_SALE;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SEVICE_PRIVATE_SALE)
public class PrivateSaleController {

    @GetMapping("/exhibit")
    public String exhibit(Locale locale) {
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "exhibit" , locale);
    }

    @GetMapping("/exhibit/first")
    public String firstExhibit(Locale locale) {
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "firstExhibit" , locale);
    }


    @GetMapping("/exhibitView/{sale_no}/{lot_no}")
    public String exhibitView(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                              @PathVariable("sale_no") int saleNo,
                              @PathVariable("lot_no") int lotNo) {

        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "exhibitView" , locale);
    }

    @GetMapping("/psGuide")
    public String psGuide(Locale locale) {
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "psGuide" , locale);
    }

    @GetMapping("/psList")
    public String psList(Locale locale) {
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "psList" , locale);
    }

}
