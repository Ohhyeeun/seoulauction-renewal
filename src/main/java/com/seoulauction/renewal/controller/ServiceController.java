package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_SERVICE;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_SERVICE)
public class ServiceController {
    @GetMapping("/marketing")
    public String marketing(HttpServletRequest request , Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing" , locale);
    }

    @GetMapping("/marketing/vip")
    public String marketing_vip(HttpServletRequest request , Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing_vip" , locale);
    }

    @GetMapping("/marketing/art")
    public String marketing_art(HttpServletRequest request , Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing_art" , locale);
    }

    @GetMapping("/marketing/plan")
    public String marketing_plan(HttpServletRequest request , Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing_plan" , locale);
    }

    @GetMapping("/marketing/consulting")
    public String marketing_consulting(HttpServletRequest request , Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing_consulting" , locale);
    }
}
