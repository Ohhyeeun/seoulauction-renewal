package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.FooterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class FooterService {

    private final FooterMapper footerMapper;


    public List<CommonMap> getFaqList(CommonMap map){
        return null;
    }

    public List<CommonMap> getBoardMediaList(CommonMap map){
        return null;
    }

    public List<CommonMap> getBoardIncruitList(CommonMap map){
        return null;
    }

    public List<CommonMap> getBoardNoticeList(CommonMap map){
        return null;
    }


}
