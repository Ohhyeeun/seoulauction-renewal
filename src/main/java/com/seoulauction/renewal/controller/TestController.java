package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.mapper.TestMapper;
import com.seoulauction.renewal.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
public class TestController {

    private final TestService testService;

    @GetMapping("/test")
    public String test(Model model) {

        log.info("test");

        log.info("adsfas  :  {}" , testService.selectArtistTest());

        model.addAttribute("test", testService.selectArtistTest());
        return "test/good";
    }
}
