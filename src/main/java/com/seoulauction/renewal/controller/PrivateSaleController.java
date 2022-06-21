package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
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

    @GetMapping("/psView/{saleAsNo}")
    public String psView(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                              @PathVariable("saleAsNo") int saleAsNo) {

        model.addAttribute("saleAsNo", saleAsNo);
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "psView" , locale);
    }

    @GetMapping("/exhibitView/print/{sale_no}/{lot_no}")
    public String exhibitViewPrint(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                            @PathVariable("sale_no") int saleNo,
                            @PathVariable("lot_no") int lotNo) {

        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "exhibitViewPrint" , locale);
    }

    @GetMapping("/psView/print/{saleAsNo}")
    public String psViewPrint(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                              @PathVariable("saleAsNo") int saleAsNo) {

        model.addAttribute("saleAsNo", saleAsNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        return SAConst.getUrl(SEVICE_PRIVATE_SALE , "psViewPrint" , locale);
    }
}
