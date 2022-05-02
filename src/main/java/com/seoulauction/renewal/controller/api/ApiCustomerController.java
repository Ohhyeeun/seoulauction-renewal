package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/customer")
public class ApiCustomerController {

    private final TestService testService;


    @RequestMapping(value="/test", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> test() {

        testService.test();

        return ResponseEntity.ok(RestResponse.ok());
    }
}
