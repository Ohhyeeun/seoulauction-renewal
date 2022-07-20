package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.AppService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/app")
public class ApiAppController {

    private final AppService appService;

    @ApiOperation(value="insertAppInfo", notes="앱 재진입 시, 앱 기기 ID & 버전정보 저장")
    @PostMapping(value="/insert-app-info")
    public ResponseEntity<RestResponse> insertAppInfo(@ApiParam(example = "device_id : string\nos : string\napp_version : string") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : device_id(앱 기기 ID), os(사용 os 정보), app_version(앱 버전정보) 필수 그 외 필요시 추가
        log.info("앱 기기 ID & 버전정보 저장 API 실행(insertAppInfo)");
        return ResponseEntity.ok(RestResponse.ok(appService.insertAppInfo(paramMap)));
    }

    @ApiOperation(value="insertLoginToken", notes="로그인 완료 시, 토큰 생성 및 앱에 전달")
    @PostMapping(value="/insert-login-token")
    public ResponseEntity<RestResponse> insertLoginToken(@ApiParam(example = "cust_no : int") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : cust_no
        log.info("로그인 토큰 생성 및 앱에 전달 API 실행(insertLoginToken)");
        return ResponseEntity.ok(RestResponse.ok(appService.selectLoginToken(paramMap)));
    }

    @ApiOperation(value="deleteLoginToken", notes="로그아웃 시, 토큰 삭제 및 앱에 로그아웃 여부를 전달 ")
    @PostMapping(value="/delete-login-token")
    public ResponseEntity<RestResponse> deleteLoginToken(@ApiParam(example = "cust_no : int") @RequestBody CommonMap paramMap) {
        //requestBody내 json 데이터 : cust_no
        log.info("토큰 삭제 & 앱에 로그아웃 여부 전달 API 실행(deleteLoginToken)");
        return ResponseEntity.ok(RestResponse.ok(appService.deleteLoginToken(paramMap)));
    }

    @ApiOperation(value="selectLoginToken", notes="앱 재진입 시, 앱에서 보유한 토큰의 정합성 확인")
    @PostMapping(value="/select-login-token")
    public ResponseEntity<RestResponse> selectLoginToken(@RequestHeader(name = "Authorization") String token) {
        log.info("앱 보유 토큰의 정합성 확인 API 실행(selectLoginToken)");

        //아래 메소드 리턴 타입 변경하고, 리턴 메시지 추가할 것
        List<CommonMap> resultList = appService.selectLoginByToken(token);
        if(resultList != null) {
            log.info(resultList.toString());
        }

        return ResponseEntity.ok(RestResponse.ok());
    }

    @ApiOperation(value="loginByToken", notes="앱 재진입 시, 토큰을 통한 재로그인 처리")
    @PostMapping(value="/login-by-token")
    public ResponseEntity<RestResponse> loginByToken(@RequestHeader(name = "Authorization") String token) {
        log.info("토큰을 통한 재로그인 처리 API 실행(loginByToken)");
        //앱 보유 토큰의 정합성 확인
        List<CommonMap> resultList = appService.selectLoginByToken(token);
        if(resultList != null) {
            log.info(resultList.toString());
        }

        return ResponseEntity.ok(RestResponse.ok());
    }


}
