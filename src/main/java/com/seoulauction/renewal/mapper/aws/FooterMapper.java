package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FooterMapper {
    List<CommonMap> selectFaqs(CommonMap map);
    List<CommonMap> selectRecruits(CommonMap map);
    List<CommonMap> selectNotices(CommonMap map);
    List<CommonMap> selectContentPress(CommonMap map);

}
