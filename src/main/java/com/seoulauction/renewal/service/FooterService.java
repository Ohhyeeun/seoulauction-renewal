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
        return footerMapper.selectFaqs(map).stream().map(c->{
            c.put("image", s3Service.getS3FileData("main_popup", c.get("id")));
            return c;
        }).collect(Collectors.toList());
    }

    public List<CommonMap> getBoardMediaList(CommonMap map){
        return footerMapper.selectContentPress(map);
    }

    public List<CommonMap> getBoardIncruitList(CommonMap map){
        return footerMapper.selectRecruits(map);
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
            resultMap.put("images", s3Service.getS3FileData("notice", resultMap.get("id")));
        }
        return resultMap;
    }


}
