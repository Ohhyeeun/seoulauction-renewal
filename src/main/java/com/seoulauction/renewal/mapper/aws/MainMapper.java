package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {

    List<CommonMap> selectBeltBanners();
    List<CommonMap> selectNewsletters(CommonMap map);

    CommonMap selectNewsletterById(CommonMap map);

    void insertNewsletter(CommonMap map);

    CommonMap selectNewsletterForOverlapCheck(CommonMap map);
}
