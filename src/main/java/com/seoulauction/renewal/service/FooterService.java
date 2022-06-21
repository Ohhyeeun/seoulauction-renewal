package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.FooterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class FooterService {

    private final FooterMapper footerMapper;

    private final S3Service s3Service;

    public List<CommonMap> getFaqList(CommonMap map){
        return footerMapper.selectFaqs(map);
    }

    public CommonMap getBoardMediaList(CommonMap map){

        CommonMap resultMap = new CommonMap();
        resultMap.put("list" , footerMapper.selectContentPress(map));
        resultMap.put("count" , footerMapper.selectCountContentPress(map));
        return resultMap;
    }

    public CommonMap getRecruitList(CommonMap map){

        CommonMap resultMap = new CommonMap();
        resultMap.put("list" , footerMapper.selectRecruits(map));
        resultMap.put("count" , footerMapper.selectCountRecruits(map));
        return resultMap;
    }

    public CommonMap getRecruitById(CommonMap map){

        CommonMap resultMap = footerMapper.selectRecruitById(map);
        if(resultMap != null) {
            resultMap.put("images", s3Service.getS3FileDataAll("recruit", resultMap.get("id")));
        }
        return resultMap;
    }

    public CommonMap getBoardNoticeList(CommonMap map){
        CommonMap resultMap = new CommonMap();
        resultMap.put("list" , footerMapper.selectNotices(map).stream().peek(c-> c.put("images", s3Service.getS3FileData("notice", c.get("id")))).collect(Collectors.toList()));
        resultMap.put("count" , footerMapper.selectCountNotices(map));
        return resultMap;
    }

    public CommonMap getBoardById(CommonMap map){

        CommonMap resultMap = footerMapper.selectNoticeById(map);
        if(resultMap != null) {
            resultMap.put("images", s3Service.getS3FileDataAll("notice", resultMap.get("id")));
        }
        return resultMap;
    }
}
