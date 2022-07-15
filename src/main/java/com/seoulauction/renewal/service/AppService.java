package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.AppMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
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
            System.out.println("앱 정보 조회 결과 없음 => 기기ID 및 버전정보 insert");
            appMapper.insertAppInfo(map); //기기ID 및 버전정보 저장
        }
        else {
            System.out.println("앱 정보 조회 결과 있음 => 기존 앱 정보에 앱 재진입 시점 update");
            appMapper.updateAppInfo(map); //기존 저장된 App Info에 last_access_time을 현재시간으로 update
        }

        return map;
    }

    public CommonMap selectLoginToken(CommonMap paramMap) {
        List<CommonMap> resultList = appMapper.selectLoginToken(paramMap); //로그인 정보로 토큰 조회
        CommonMap map = new CommonMap();
        if(resultList.size() < 1) {
            System.out.println("Token 조회 결과 없음 => Token 생성 및 insert");
            //JWT Token을 생성하는 로직 구현 요망
            String tokenVal = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.dyt0CoTl4WoVjAHI9Q_CwSKhl6d_9rhM3NrXuJttkao";
            paramMap.put("token", tokenVal); //토큰 값
            //토큰 만료기간은 토큰 생성 시간으로부터 1년
            appMapper.insertLoginToken(paramMap);

            resultList = appMapper.selectLoginToken(paramMap);
//            System.out.println("resultList = "+resultList);

            map.put("id", resultList.get(0).get("CUST_NO")); //고객번호
            map.put("token", tokenVal); //토큰 값
            map.put("expiredAt", resultList.get(0).get("EXPIRED_DT")); //토큰 만료기간
        }
        else {
            System.out.println("Token 조회 결과 있음 => 기존 토큰에 로그인시간, 토큰 만료기간 update");
            appMapper.updateLoginToken(paramMap); //로그인시간, 토큰 만료기간 update

            map.put("id", resultList.get(0).get("CUST_NO")); //고객번호
            map.put("token", resultList.get(0).get("TOKEN")); //토큰 값
            map.put("expiredAt", resultList.get(0).get("EXPIRED_DT")); //토큰 만료기간
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

    public List<CommonMap> selectLoginByToken(String token) {
//        if(paramMap.get("token") == null && paramMap.get("token") == "") throw new SAException("앱의 토큰 정보가 필요합니다.");
        if(token == null && token.equals("")) throw new SAException("앱의 토큰 정보가 필요합니다.");

        CommonMap map = new CommonMap();
        map.put("token", token); //토큰 값
        List<CommonMap> resultList = appMapper.selectLoginToken(map); //토큰 값으로 조회
        if(resultList.size() > 0) {
            map.put("cust_no", resultList.get(0).get("CUST_NO")); //고객번호
            appMapper.updateLoginToken(map); //로그인시간, 토큰 만료기간 update
            return resultList;
        } else {
            throw new SAException("요청하신 토큰 정보를 찾을 수 없습니다");
        }
    }
}
