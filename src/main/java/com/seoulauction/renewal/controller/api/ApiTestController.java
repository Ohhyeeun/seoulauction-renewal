package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/test")
public class ApiTestController {

    @RequestMapping(value="/good", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> test() {
        CommonMap map = new CommonMap();
        map.put("asdfasdf","asdfasdf");
        map.put("asdfasdf2","asdfasdf2");
        String ddfasd ="asdfasdf";
        return ResponseEntity.ok(RestResponse.ok(map));
    }
}
