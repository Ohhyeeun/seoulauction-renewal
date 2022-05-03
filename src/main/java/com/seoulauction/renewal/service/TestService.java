package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.AWSTestMapper;
import com.seoulauction.renewal.mapper.kt.KTTestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestService {

    private final KTTestMapper ktTestMapper;

    public List<CommonMap> test(CommonMap map){
        return ktTestMapper.selectArtist(map);
    }

}
