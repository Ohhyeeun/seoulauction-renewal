package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.MainMapper;
import com.seoulauction.renewal.service.MainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/main")
public class ApiMainController {

    private final MainService mainService;

    @RequestMapping(value = "/upcomings", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> upcomings(Model model){

       return ResponseEntity.ok(RestResponse.ok(mainService.selectUpcomings()));
    }
}
