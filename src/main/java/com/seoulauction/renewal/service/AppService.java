package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.AppMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Random;

import io.jsonwebtoken.*;

@Service
@RequiredArgsConstructor
@Log4j2
public class AppService {

    private final AppMapper appMapper;

    private static final String JWT_SECRET_KEY = "logtok"; //JWT Token의 서명(Signature)에 사용될 비밀키 (임의값)

    public CommonMap insertAppInfo(CommonMap map) {
        List<CommonMap> resultList = appMapper.selectDeviceId(map);
        if(resultList.size() < 1) {
            log.info("앱 정보 조회 결과 없음 => 기기ID 및 버전정보 insert");
            appMapper.insertAppInfo(map); //기기ID 및 버전정보 저장
        }
        else {
            log.info("앱 정보 조회 결과 있음 => 기존 앱 정보에 앱 재진입 시점 update");
            appMapper.updateAppInfo(map); //기존 저장된 App Info에 last_access_time을 현재시간으로 update
        }

        return map;
    }

    public CommonMap selectLoginToken(CommonMap paramMap) {
        List<CommonMap> resultList = appMapper.selectLoginToken(paramMap); //로그인 정보로 토큰 조회
        CommonMap map = new CommonMap();
        if(resultList.size() < 1) {
            log.info("Token 조회 결과 없음 => Token 생성 및 insert");
            //JWT Token을 생성
            String tokenVal;
            tokenVal = createToken(paramMap);
            System.out.println("생성된 JWT 토큰 값 = "+tokenVal);
            paramMap.put("token", tokenVal); //토큰 값
            //토큰 만료기간은 토큰 생성 시간으로부터 1년
            appMapper.insertLoginToken(paramMap);

            resultList = appMapper.selectLoginToken(paramMap);

            map.put("id", resultList.get(0).get("CUST_NO")); //고객번호
            map.put("token", tokenVal); //토큰 값
            map.put("expiredAt", resultList.get(0).get("EXPIRED_DT")); //토큰 만료기간
        }
        else {
            log.info("Token 조회 결과 있음 => 기존 토큰에 로그인시간, 토큰 만료기간 update");
            appMapper.updateLoginToken(paramMap); //로그인시간, 토큰 만료기간 update

            map.put("id", resultList.get(0).get("CUST_NO")); //고객번호
            map.put("token", resultList.get(0).get("TOKEN")); //토큰 값
            map.put("expiredAt", resultList.get(0).get("EXPIRED_DT")); //토큰 만료기간
        }

        return map;
    }

    private String createToken(CommonMap paramMap) { //JWT Token을 생성 메소드
        log.info("로그인 Token 생성 메소드 실행");
        //JWT Header 설정
        CommonMap headers = new CommonMap();
        headers.put("typ", "JWT");      //Token Type
        headers.put("alg", "HS256");    //Signature를 해싱하기위한 알고리즘 지정

        //JWT Payload 설정
        CommonMap payloads = new CommonMap();
        //고객번호를 Base64로 인코딩
        String custNo = String.valueOf(paramMap.get("cust_no"));
        String encodedCustNo = Base64.getEncoder().encodeToString(custNo.getBytes(StandardCharsets.UTF_8));
//        System.out.println("JWT Payload 설정 : CUST_NO = "+custNo+", encoded CUST_NO = "+encodedCustNo);
        payloads.put("payloadKey", encodedCustNo);

        //JWT 비밀키 설정 (임의 설정 String 값 + 중복되지 않는 4자리 난수)
        //4자리 난수 생성
        Random rand = new Random();
        String numStr = "";
        for(int i = 0; i < 4; i++) {
            String ran = Integer.toString(rand.nextInt(10)); //0~9 까지 난수 생성
            if(!numStr.contains(ran)) numStr += ran;
            else i -= 1;
        }
        String jwtSecretKey = JWT_SECRET_KEY+numStr;
//        System.out.println("JWT 비밀키 설정 : 비밀키 = "+jwtSecretKey);

        //JWT 토큰 생성
        String jwt = Jwts.builder()
                .setHeader(headers)
                .setClaims(payloads)
                .signWith(SignatureAlgorithm.HS256, jwtSecretKey.getBytes()) //Header에서 설정한 알고리즘과 비밀키로 서명(Signature) 추가
                .compact();

        return jwt;
    }

    public int deleteLoginToken(CommonMap paramMap) {
        int result = appMapper.deleteLoginToken(paramMap); //로그인정보에 해당하는 토큰 삭제
        if(result < 1) {
            throw new SAException("로그인 토큰 정보 삭제에 실패하였습니다");
        }
        return result;
    }

    public List<CommonMap> selectLoginByToken(String token) {
        //Header에 토큰 값이 없을 때
        if(token == null && token.equals("")) throw new SAException("재 로그인 시, 앱의 토큰 정보가 필요합니다.");

        CommonMap map = new CommonMap();
        map.put("token", token); //토큰 값
        List<CommonMap> resultList = appMapper.selectLoginToken(map); //토큰 값으로 조회
        if(resultList.size() > 0) {
            map.put("cust_no", resultList.get(0).get("CUST_NO")); //고객번호

            //앱이 보유한 토큰 만료 시
            Date today = new Date();
            Timestamp expiredDt = (Timestamp) resultList.get(0).get("EXPIRED_DT");
            Date tokenExpiredDt = new Date(expiredDt.getTime());
            System.out.println("today = "+today+", 토큰 만료기간 = "+tokenExpiredDt);

            if (tokenExpiredDt.before(today)) {
                log.info("앱의 로그인 토큰 만료 Case => 만료 토큰 삭제 진행");
                int result = appMapper.deleteLoginToken(map); //만료된 토큰 삭제
                if (result < 1) {
                    throw new SAException("앱 토큰 만료 : 로그인 토큰 정보 삭제에 실패하였습니다");
                }
                throw new SAException("앱의 토큰 정보가 만료되었습니다.");
            }
//
            appMapper.updateLoginToken(map); //로그인시점, 토큰 만료기간 update
            return resultList;
        } else {
            throw new SAException("요청하신 토큰 정보를 찾을 수 없습니다");
        }
    }
}
