package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FooterMapper {

    //FAQ
    List<CommonMap> selectFaqs(CommonMap map);

    //채용공고
    List<CommonMap> selectRecruits(CommonMap map);
    List<CommonMap> selectCountRecruits(CommonMap map);
    CommonMap selectRecruitById(CommonMap map);

    //공지사항
    List<CommonMap> selectNotices(CommonMap map);
    int selectCountNotices(CommonMap map);
    CommonMap selectNoticeById(CommonMap map);

    //언론보도
    List<CommonMap> selectContentPress(CommonMap map);
    int selectCountContentPress(CommonMap map);

}
