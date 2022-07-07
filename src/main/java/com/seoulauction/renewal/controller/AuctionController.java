package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.LoginService;
import com.seoulauction.renewal.service.SaleService;
import com.seoulauction.renewal.util.SecurityUtils;
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

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_AUCTION)
public class AuctionController {

    private final SaleService saleService;
    private final LoginService loginService;

    
    @GetMapping("/online/view/{sale_no}/{lot_no}")
    public String view(Locale locale, Model model
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
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionView" , locale);
    }

    @GetMapping("/live/view/{sale_no}/{lot_no}")
    public String liveView(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("sale_no") int saleNo,
                       @PathVariable("lot_no") int lotNo) {

        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        //필수값 있는지 여부.
        Boolean isCustRequired = false;

        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
            isCustRequired = saleService.checkCustRequired(new CommonMap("cust_no", saUserDetails.getUserNo()));
        } else {
            model.addAttribute("member", new SAUserDetails());
        }

        model.addAttribute("isCustRequired", isCustRequired);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveView" , locale);
    }

    @GetMapping("/view/print/{sale_no}/{lot_no}")
    public String printView(Locale locale, Model model
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
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionViewPrint" , locale);
    }


    @GetMapping(value="/list/{saleNo}")
    public String list(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
            @PathVariable("saleNo") int saleNo) {

        model.addAttribute("saleNo", saleNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionList" , locale);
    }

    @GetMapping(value="/live/bidder/{saleNo}")
    public String bidder(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("saleNo") int saleNo) {
        model.addAttribute("saleNo", saleNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionBiddingView" , locale);
    }

    @GetMapping("/live/list/{sale_no}")
    public String liveList(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("sale_no") int saleNo) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        model.addAttribute("saleNo", saleNo);

        //필수값 있는지 여부.
        Boolean isCustRequired = false;

        if( saUserDetails != null){
            isCustRequired = saleService.checkCustRequired(new CommonMap("cust_no", saUserDetails.getUserNo()));
        }

        model.addAttribute("isCustRequired", isCustRequired);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveList" , locale);
    }

    @GetMapping("/live/sale/{sale_no}/lot/{lot_no}/biding")
    public String liveBiding(Locale locale, Model model,
                             @PathVariable("sale_no") int saleNo,
                             @PathVariable("lot_no") int lotNo) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        //고객 담당자 저나번호 따기.
        model.addAttribute("emp" , loginService.getCustByEmpNo(saUserDetails.getUserNo()));
        model.addAttribute("member" , SecurityUtils.getAuthenticationPrincipal());
        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveBiding" , locale);
    }

    @GetMapping("/progress")
    public String progress(Locale locale) {

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "progress" , locale);
    }

    @GetMapping("/upcoming")
    public String upcoming(Locale locale) {

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "upcoming" , locale);
    }

    @GetMapping("/upcoming/{sale_no}")
    public String upcomingView(Locale locale, @PathVariable("sale_no") int saleNo, Model model) {
        model.addAttribute("saleNo", saleNo);
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "upcomingView" , locale);
    }

    @GetMapping("/info")
    public String info(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_AUCTION, "info", locale);
    }

    @GetMapping("/results")
    public String results(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionResult" , locale);
    }

    @GetMapping("/admin/bid/{sale_no}")
    public String adminBid(Locale locale, Model model, @PathVariable("sale_no") int saleNo) {

        SAUserDetails sa = SecurityUtils.getAuthenticationPrincipal();

        if (sa == null) {
            sa = new SAUserDetails();
        }

        model.addAttribute("member" , sa);
        model.addAttribute("saleNo", saleNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "bidLivePopEdit" , locale);
    }
    @GetMapping("/admin/notice/{sale_no}")
    public String adminNotice(Locale locale, Model model, @PathVariable("sale_no") int saleNo) {

        SAUserDetails sa = SecurityUtils.getAuthenticationPrincipal();

        if (sa == null) {
            sa = new SAUserDetails();
        }

        model.addAttribute("member" , sa);
        model.addAttribute("saleNo", saleNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "bidLivePopEdit_txt" , locale);
    }
    @GetMapping("/admin/paddle/{sale_no}")
    public String adminPaddle(Locale locale, Model model, @PathVariable("sale_no") int saleNo) {

        SAUserDetails sa = SecurityUtils.getAuthenticationPrincipal();

        if (sa == null) {
            sa = new SAUserDetails();
        }

        model.addAttribute("member" , sa);
        model.addAttribute("saleNo", saleNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "bidLivePopPaddle" , locale);
    }
    @GetMapping("/admin/currency/{sale_no}")
    public String adminCurrency(Locale locale, Model model, @PathVariable("sale_no") int saleNo) {

        SAUserDetails sa = SecurityUtils.getAuthenticationPrincipal();

        if (sa == null) {
            sa = new SAUserDetails();
        }

        model.addAttribute("member" , sa);
        model.addAttribute("saleNo", saleNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "bidLivePopCurrency" , locale);
    }

    @GetMapping("/admin/sale/reg/{sale_no}")
    public String adminSaleReg(Locale locale, Model model, @PathVariable("sale_no") int saleNo) {

        SAUserDetails sa = SecurityUtils.getAuthenticationPrincipal();

        if (sa == null) {
            sa = new SAUserDetails();
        }

        model.addAttribute("member" , sa);
        model.addAttribute("saleNo", saleNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "saleReg" , locale);
    }
}
