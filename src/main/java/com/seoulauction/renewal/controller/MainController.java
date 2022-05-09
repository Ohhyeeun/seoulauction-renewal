package com.seoulauction.renewal.controller;

import static com.seoulauction.renewal.common.SAConst.SERVICE_MAIN;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.SlackSender;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainController {

    private final SlackSender slackSender;

    @GetMapping({"/"})
    public String index(Locale locale) {
        return SAConst.getUrl(SERVICE_MAIN , "index" , locale);
    }
    @GetMapping("/guide" )
    public String guide(HttpServletRequest request) {
        return "guide_list";
    }

    @GetMapping("/newsletter" )
    public String newsletter(Locale locale) {
        return SAConst.getUrl(SERVICE_MAIN , "newsletter" , locale);
    }

    @GetMapping("/newsletter/{id}" )
    public String newsletterView(@PathVariable int id, HttpServletRequest request, Locale locale) {
        request.setAttribute("id", id);
        return SAConst.getUrl(SERVICE_MAIN , "newsletterView" , locale);
    }
    
    @GetMapping("/maxSession" )
    public String maxSession(Locale locale) {
        return SAConst.getUrl(SERVICE_MAIN , "popup/maxSession" , locale);
    }

    @GetMapping("/beltBanner" )
    public String beltBanner(Locale locale) {
        return SAConst.getUrl(SERVICE_MAIN , "beltBanner" , locale);
    }

}
