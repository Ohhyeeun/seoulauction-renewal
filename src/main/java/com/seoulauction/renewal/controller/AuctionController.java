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

    @GetMapping("/info/online")
    public String info_online(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_AUCTION, "info_online", locale);
    }

    @GetMapping("/results")
    public String results(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionResult" , locale);
    }

    /* ????????? ?????? ?????????*/
    @GetMapping(value="/list/{saleNo}")
    public String list(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("saleNo") int saleNo) {

        model.addAttribute("saleNo", saleNo);

        //????????? ????????? ??????.
        Boolean isCustRequired = false;

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
            isCustRequired = saleService.checkCustRequired(new CommonMap("cust_no", saUserDetails.getUserNo()));
        } else {
            model.addAttribute("member", new SAUserDetails());
        }

        model.addAttribute("isCustRequired", isCustRequired);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionList" , locale);
    }

    /**
     * ????????? ?????? ??????(New)
     */
    @GetMapping(value = "/online/{saleNo}")
    public String onlineAuctionList(Locale locale,
                                    Model modal,
                                    HttpServletRequest request,
                                    HttpServletResponse response,
                                    @PathVariable("saleNo") Integer saleNo
    ) {
        return SAConst.getUrl(SAConst.SERVICE_AUCTION, "onlineAuctionList", locale);
    }

    /**
     * ????????? ?????? ?????? (New)
     */
    @GetMapping(value = "/online/{saleNo}/{lotNo}")
    public String onlineAuctionView(Locale locale,
                                    Model model,
                                    HttpServletRequest request,
                                    HttpServletResponse response,
                                    @PathVariable("saleNo") Integer saleNo,
                                    @PathVariable("lotNo") Integer lotNo
    ) {
        return SAConst.getUrl(SAConst.SERVICE_AUCTION, "onlineAuctionView", locale);
    }

    /* ????????? ?????? ??????*/
    @GetMapping("/online/view/{sale_no}/{lot_no}")
    public String view(Locale locale, Model model
    		, HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("sale_no") int saleNo,
                       @PathVariable("lot_no") int lotNo) {
    	
        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        //????????? ????????? ??????.
        Boolean isCustRequired = false;

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
            isCustRequired = saleService.checkCustRequired(new CommonMap("cust_no", saUserDetails.getUserNo()));
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        model.addAttribute("isCustRequired", isCustRequired);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionView" , locale);
    }

    /* ????????? ?????? ?????????*/
    @GetMapping("/live/list/{sale_no}")
    public String liveList(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                           @PathVariable("sale_no") int saleNo) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        model.addAttribute("saleNo", saleNo);

        //????????? ????????? ??????.
        Boolean isCustRequired = false;

        if( saUserDetails != null){
            isCustRequired = saleService.checkCustRequired(new CommonMap("cust_no", saUserDetails.getUserNo()));
        }

        model.addAttribute("isCustRequired", isCustRequired);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveList" , locale);
    }

    @GetMapping("/live/list/new/{sale_no}")
    public String NewLiveList(Locale locale, Model model , HttpServletRequest request, HttpServletResponse response,
                           @PathVariable("sale_no") int saleNo) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        model.addAttribute("saleNo", saleNo);

        //????????? ????????? ??????.
        Boolean isCustRequired = false;

        if( saUserDetails != null){
            isCustRequired = saleService.checkCustRequired(new CommonMap("cust_no", saUserDetails.getUserNo()));
        }

        model.addAttribute("isCustRequired", isCustRequired);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveListNew" , locale);
    }

    /* ????????? ?????? ??????*/
    @GetMapping("/live/view/{sale_no}/{lot_no}")
    public String liveView(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("sale_no") int saleNo,
                       @PathVariable("lot_no") int lotNo) {

        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        //????????? ????????? ??????.
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



    /* ????????? ?????? ??????/?????? ?????? ????????? */
    @GetMapping("/live/sale/{sale_no}/lot/{lot_no}/biding")
    public String liveBiding(Locale locale, Model model,
                             @PathVariable("sale_no") int saleNo,
                             @PathVariable("lot_no") int lotNo) {

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        //?????? ????????? ???????????? ??????.
        model.addAttribute("emp" , loginService.getCustByEmpNo(saUserDetails.getUserNo()));
        model.addAttribute("member" , SecurityUtils.getAuthenticationPrincipal());
        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveBiding" , locale);
    }

    /* ??? ?????? ???????????? */
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

    /** ????????? ?????? ????????? **/
    /* ?????? */
    @GetMapping(value="/live/bid/player/{saleNo}")
    public String bidingPlayOnly(Locale locale, Model model , HttpServletRequest request, HttpServletResponse response) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionBidingPlayOnly" , locale);
    }

    @GetMapping(value="/live/bid/player/mobile/{saleNo}")
    public String bidingPlayOnlyMobile(Locale locale, Model model , HttpServletRequest request, HttpServletResponse response, @PathVariable("saleNo") int saleNo) {
        model.addAttribute("saleNo", saleNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }

        String returnJsp = SecurityUtils.checkRole("ROLE_REGULAR_USER") ? "auctionBiddingView" :"auctionBidingPlayOnly_mobile";

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , returnJsp , locale);
    }

    @GetMapping(value="/live/bidder/{saleNo}")
    public String bidder(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,
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

    @GetMapping(value="/live/bidder/new/{saleNo}")
    public String bidderTest(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                         @PathVariable("saleNo") int saleNo) {
        model.addAttribute("saleNo", saleNo);

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            model.addAttribute("member", saUserDetails);
        } else {
            model.addAttribute("member", new SAUserDetails());
        }
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionBiddingView_New" , locale);
    }

    /* ????????? ?????? */
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

    /* ????????? ????????? */
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

    /* ???????????? ????????? */
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

    /* ??????????????? */
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
