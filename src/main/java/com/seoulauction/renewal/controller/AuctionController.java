package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.service.AuctionService;
import com.seoulauction.renewal.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_AUCTION)
public class AuctionController {

    private final AuctionService loginService;
    
    @GetMapping("/online/view")
    public String view(Locale locale, Model model
    		, HttpServletRequest request, HttpServletResponse response,
                       @RequestParam(value = "sale_no", required = false) String saleNo,
                       @RequestParam(value = "lot_no", required = false) String lotNo) {
    	
    	// 로그인 이전페이지 기억
    	/*String referrer = request.getHeader("Referer");
    	if(referrer != null && !referrer.endsWith("/login")) {
    		log.info("referrer : {}",referrer);
    		request.getSession().setAttribute("prevPage", referrer);
    	}*/

        model.addAttribute("saleNo", saleNo);
        model.addAttribute("lotNo", lotNo);

        return SAConst.getUrl(SAConst.SERVICE_AUCTION , "auctionView_ko" , locale);
    }



}
