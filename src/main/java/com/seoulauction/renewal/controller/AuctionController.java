package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.SAUserDetails;
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
    
    @GetMapping("/online/view/{sale_no}/{lot_no}")
    public String view(Locale locale, Model model
    		, HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("sale_no") int saleNo,
                       @PathVariable("lot_no") int lotNo) {
    	
    	// 로그인 이전페이지 기억
    	/*String referrer = request.getHeader("Referer");
    	if(referrer != null && !referrer.endsWith("/login")) {
    		log.info("referrer : {}",referrer);
    		request.getSession().setAttribute("prevPage", referrer);
    	}*/
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

    @GetMapping("/live/list/{sale_no}")
    public String liveList(Locale locale, Model model
            , HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("sale_no") int saleNo) {

        model.addAttribute("saleNo", saleNo);
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveList" , locale);
    }

    @GetMapping("/live/sale/{sale_no}/lot/{lot_no}/biding")
    public String liveBiding(Locale locale, Model model,
                             @PathVariable("sale_no") int saleNo,
                             @PathVariable("lot_no") int lotNo) {

        model.addAttribute("member" , SecurityUtils.getAuthenticationPrincipal());
        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionLiveBiding" , locale);
    }

    @GetMapping("/progress")
    public String progress(Locale locale) {

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "progress" , locale);
    }

    @GetMapping("/scheduled")
    public String scheduled(Locale locale) {

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "scheduled" , locale);
    }

    @GetMapping("/scheduled/{sale_no}")
    public String scheduledView(Locale locale, @PathVariable("sale_no") int saleNo, Model model) {
        model.addAttribute("saleNo", saleNo);
        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "scheduledView" , locale);
    }
}
