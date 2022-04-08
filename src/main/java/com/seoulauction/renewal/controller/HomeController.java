package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.component.SlackSender;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@Log4j2
@RequiredArgsConstructor
public class HomeController {

    private final SlackSender slackSender;

    @GetMapping({"/" , "/en"})
    public String index(HttpServletRequest request) {

        String path = request.getServletPath();
        return StringUtils.isNotEmpty(path) && path.equals("/en") ? "/index_en" : "/index";
    }
}
