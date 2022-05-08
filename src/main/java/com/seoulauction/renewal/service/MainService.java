package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainService {

    private final MainMapper mainMapper;

    public List<CommonMap> selectBeltBanners() {
        return mainMapper.selectBeltBanners();
    }

    public List<CommonMap> selectNewsletters(CommonMap map) {
        return mainMapper.selectNewsletters(map);
    }

    public CommonMap selectNewsletterById(CommonMap map) {
        return mainMapper.selectNewsletterById(map);
    }

    public void insertNewsletter(CommonMap map){

        CommonMap checkMap = mainMapper.selectNewsletterForOverlapCheck(map);

        if(checkMap != null){
            throw new SAException("해당 정보로 이미 구독한 정보가 있습니다.");
        }

        mainMapper.insertNewsletter(map);
    }
}

