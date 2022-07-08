package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_SERVICE;
import static com.seoulauction.renewal.common.SAConst.SERVICE_ERROR;;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SERVICE_SERVICE)
public class ServiceController {
    @GetMapping("/loan")
    public String loan(Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "loan" , locale);
    }

    @GetMapping("/storage")
    public String storage(Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "storage" , locale);
    }

    @GetMapping("/showroom")
    public String showroom(Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "showroom" , locale);
    }

    @GetMapping("/showroom/vr")
    public String showroom_vr(Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "showroom_vr" , locale);
    }

    @GetMapping("/marketing")
    public String marketing(Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing" , locale);
    }
    
    @GetMapping("/academy")
    public String academy(Locale locale) {
    	if(locale.getLanguage().equals("ko")) {
    		return SAConst.getUrl(SERVICE_SERVICE , "academy" , locale);
    	}else {
    		return SAConst.getUrl(SERVICE_ERROR , "error_404" , locale);
    	}
    }
    
    @GetMapping("/academyDetail")
    public String inquiryView(@RequestParam(required = true ) int academyNo, @RequestParam(required = true ) String academyCd, Locale locale) {
    	if(locale.getLanguage().equals("ko")) {
    		return SAConst.getUrl(SERVICE_SERVICE, "academyDetail", locale);
    	}else {
    		return SAConst.getUrl(SERVICE_ERROR , "error_404" , locale);
    	}
    }
    
    @GetMapping("/academyList")
    public String inquiryList(@RequestParam(required = true ) String academyCd, Locale locale) {
    	if(locale.getLanguage().equals("ko")) {
    		return SAConst.getUrl(SERVICE_SERVICE, "academyList", locale);
    	}else {
    		return SAConst.getUrl(SERVICE_ERROR , "error_404" , locale);
    	}
    }
}
