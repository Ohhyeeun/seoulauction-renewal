package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.SlackSender;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_MAIN;

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
    @GetMapping("/upcoming" )
    public String upcoming(Locale locale) {
        return SAConst.getUrl(SERVICE_MAIN , "upcoming" , locale);
    }


}
