package com.seoulauction.renewal.service;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.AppMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class AppService {

    private final AppMapper appMapper;
    public CommonMap insertAppInfo(CommonMap map) {
        List<CommonMap> resultList = appMapper.selectDeviceId(map);
        if(resultList.size() < 1) {
            appMapper.insertAppInfo(map); //기기ID 및 버전정보 저장
        }
        else {
            appMapper.updateAppInfo(map); //기존 저장된 App Info에 last_access_time을 현재시간으로 update
        }

        return map;
    }

    public CommonMap selectLoginToken(CommonMap paramMap) {
        List<CommonMap> resultList = appMapper.selectToken(paramMap); //로그인 정보로 토큰 조회
        CommonMap map = new CommonMap();
        if(resultList.size() < 1) {
            String tokenVal = "tokenValue"; //JWT Token을 생성하는 로직 구현
            paramMap.put("token", tokenVal); //토큰 값
            paramMap.put("expiredAt", "2022-07-05"); //토큰 만료기간
            appMapper.insertLoginToken(paramMap);

            map.put("id", paramMap.get("cust_no")); //고객번호
            map.put("token", tokenVal); //토큰 값
            map.put("expiredAt", "2022-07-05"); //토큰 만료기간
        }
        else {
            paramMap.put("expiredAt", "2022-12-31"); //갱신된 토큰 만료기간
            appMapper.updateLoginToken(paramMap); //로그인시간, 토큰 만료기간 update

            map.put("id", paramMap.get("cust_no")); //고객번호
            map.put("token", paramMap.get("token")); //토큰 값
            map.put("expiredAt", paramMap.get("expiredAt")); //토큰 만료기간
        }

        return map;
    }

    public int deleteLoginToken(CommonMap paramMap) {
        int result = appMapper.deleteLoginToken(paramMap); //로그인정보에 해당하는 토큰 삭제
        if(result < 1) {
            throw new SAException("로그인 토큰 정보 삭제에 실패하였습니다");
        }
        return result;
    }

    public List<CommonMap> selectLoginByToken(CommonMap paramMap) {
        return appMapper.selectLoginByToken(paramMap); //토큰 값으로 조회
    }
}
