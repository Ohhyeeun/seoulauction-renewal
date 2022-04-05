package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("customer")
public class CustomerController {

    private final TestService testService;

    @GetMapping("/test")
    public String test(Model model) {

        model.addAttribute("test", testService.selectArtistTest());
        return "customer/login";
    }
}
