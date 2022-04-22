package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.AWSTestMapper;
import com.seoulauction.renewal.mapper.kt.KTTestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestService {

    private final KTTestMapper ktTestMapper;

    private final AWSTestMapper awsTestMapper;

    public CommonMap selectArtistTest(){
        CommonMap map = new CommonMap();
        map.put("aws", awsTestMapper.selectArtist());
        map.put("kt", ktTestMapper.selectArtist());
        return map;
    }
}
