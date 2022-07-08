package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.AppService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/app")
public class ApiAppController {

    private final AppService appService;

    @PostMapping(value="/insertAppInfo")
    public ResponseEntity<RestResponse> insertAppInfo(@RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : device_id(앱 기기 ID), os(사용 os 정보), app_version(앱 버전정보) 필수 그 외 필요시 추가
        return ResponseEntity.ok(RestResponse.ok(appService.insertAppInfo(paramMap)));
    }

    @PostMapping(value="/loginToken")
    public ResponseEntity<RestResponse> loginToken(@RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : device_id(앱 기기 ID), cust no, 로그인타입(social/regular)
        return ResponseEntity.ok(RestResponse.ok(appService.selectLoginToken(paramMap)));
    }

    @PostMapping(value="/deleteLoginToken")
    public ResponseEntity<RestResponse> deleteLoginToken(@RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : device_id(앱 기기 ID), cust no, 로그인타입(social/regular)
        return ResponseEntity.ok(RestResponse.ok(appService.deleteLoginToken(paramMap)));
    }

    @PostMapping(value="/loginByToken")
    public ResponseEntity<RestResponse> loginByToken(@RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : token(토큰 값)
        List<CommonMap> resultMap = appService.selectLoginByToken(paramMap);
        if(resultMap != null) {
            log.info(resultMap.toString());
        }
        return ResponseEntity.ok(RestResponse.ok(resultMap));
    }


}
