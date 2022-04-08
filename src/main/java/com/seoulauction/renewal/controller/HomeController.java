package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
public class HomeController {

    private final TestService testService;

    @GetMapping("/")
    public String home(Model model) {

        return "/index";
    }
}
