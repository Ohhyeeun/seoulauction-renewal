package com.seoulauction.renewal.service;

import org.springframework.stereotype.Service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper loginMapper;

    public CommonMap selectCustByLoginId(CommonMap paramMap){
        return loginMapper.selectCustByLoginId(paramMap);
    }

    public int insertConnHist(CommonMap paramMap){
        return loginMapper.insertConnHist(paramMap);
    }

}
