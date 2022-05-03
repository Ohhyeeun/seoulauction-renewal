package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.AWSTestMapper;
import com.seoulauction.renewal.mapper.kt.CommonMapper;
import com.seoulauction.renewal.mapper.kt.KTTestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestService {

    private final KTTestMapper ktTestMapper;
    private final CommonMapper commonMapper;

    public CommonMap test(CommonMap map){

        CommonMap resultMap =new CommonMap();
        resultMap.put("data" , ktTestMapper.selectArtist(map));
        resultMap.put("count" , commonMapper.selectFoundRows());

        return resultMap;
    }

}
