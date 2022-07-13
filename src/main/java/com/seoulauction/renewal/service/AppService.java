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
        List<CommonMap> resultList = appMapper.selectLoginToken(paramMap); //로그인 정보로 토큰 조회
        CommonMap map = new CommonMap();
        if(resultList.size() < 1) {
            //JWT Token을 생성하는 로직 구현
            String tokenVal = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.dyt0CoTl4WoVjAHI9Q_CwSKhl6d_9rhM3NrXuJttkao";
            paramMap.put("token", tokenVal); //토큰 값
            //토큰 만료기간은 토큰 생성 시간으로부터 1년
            appMapper.insertLoginToken(paramMap);

            resultList = appMapper.selectLoginToken(paramMap);

            map.put("id", resultList.get(0).get("cust_no")); //고객번호
            map.put("token", tokenVal); //토큰 값
            map.put("expiredAt", resultList.get(0).get("expired_dt")); //토큰 만료기간
        }
        else {
            appMapper.updateLoginToken(paramMap); //로그인시간, 토큰 만료기간 update

            map.put("id", resultList.get(0).get("cust_no")); //고객번호
            map.put("token", resultList.get(0).get("token")); //토큰 값
            map.put("expiredAt", resultList.get(0).get("expired_dt")); //토큰 만료기간
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
        List<CommonMap> resultList = appMapper.selectLoginToken(paramMap); //토큰 값으로 조회
        if(resultList.size() > 0) {
            paramMap.put("cust_no", resultList.get(0).get("cust_no")); //토큰 값
            appMapper.updateLoginToken(paramMap); //로그인시간, 토큰 만료기간 update
            return resultList;
        } else {
            throw new SAException("토큰 정보를 찾을 수 없습니다");
        }
    }
}
