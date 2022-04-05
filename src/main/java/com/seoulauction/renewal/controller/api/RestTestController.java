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
public class RestTestController {

    @RequestMapping(value="/good", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> test() {

        CommonMap map = new CommonMap();
        map.put("asdfasdf","asdfasdf");
        map.put("asdfasdf2","asdfasdf2");
        map.put("asdfasdf3","asdfasdf3");
        map.put("asdfasdf4","asdfasdf4");

        String ddfasd ="asdfasdf";

        log.info("map : {}" , map);

        return ResponseEntity.ok(RestResponse.ok(map));
    }
}
