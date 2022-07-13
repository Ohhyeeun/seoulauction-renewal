package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.AppService;
import io.swagger.annotations.*;
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

    @ApiOperation(value="insertAppInfo", notes="앱 기기 ID & 버전정보 저장")
    @PostMapping(value="/insert-app-info")
    public ResponseEntity<RestResponse> insertAppInfo(@ApiParam(example = "device_id : string\nos : string\napp_version : string") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : device_id(앱 기기 ID), os(사용 os 정보), app_version(앱 버전정보) 필수 그 외 필요시 추가
        return ResponseEntity.ok(RestResponse.ok(appService.insertAppInfo(paramMap)));
    }

    @ApiOperation(value="insertLoginToken", notes="로그인 완료 시, 토큰 생성 및 앱에 전달")
    @PostMapping(value="/insert-login-token")
    public ResponseEntity<RestResponse> insertLoginToken(@ApiParam(example = "cust_no : int") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : cust_no
        return ResponseEntity.ok(RestResponse.ok(appService.selectLoginToken(paramMap)));
    }

    @ApiOperation(value="deleteLoginToken", notes="로그아웃 시, 토큰 삭제 및 앱에 로그아웃 여부를 전달 ")
    @PostMapping(value="/delete-login-token")
    public ResponseEntity<RestResponse> deleteLoginToken(@ApiParam(example = "cust_no : int") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : cust_no
        return ResponseEntity.ok(RestResponse.ok(appService.deleteLoginToken(paramMap)));
    }

    @ApiOperation(value="selectLoginToken", notes="앱 재진입 시, 앱에서 보유한 토큰의 정합성 확인")
    @PostMapping(value="/select-login-token")
    public ResponseEntity<RestResponse> selectLoginToken(@ApiParam(example = "token : string") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : token(토큰 값)
        List<CommonMap> resultMap = appService.selectLoginByToken(paramMap);
        if(resultMap != null) {
            log.info(resultMap.toString());
        }
        return ResponseEntity.ok(RestResponse.ok(resultMap));
    }

    @ApiOperation(value="loginByToken", notes="토큰을 통한 재로그인 처리")
    @PostMapping(value="/login-by-token")
    public ResponseEntity<RestResponse> loginByToken(@ApiParam(example = "token : string") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : token(토큰 값)?
        return ResponseEntity.ok(RestResponse.ok());
    }


}
