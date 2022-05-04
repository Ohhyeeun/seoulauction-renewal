package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
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

    public List<CommonMap> selectNewsletterById(CommonMap map) {
        return mainMapper.selectNewsletterById(map);
    }
}
