package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {
    List<CommonMap> selectNewsletters(CommonMap map);

    List<CommonMap> selectNewsletterById(CommonMap map);
}
