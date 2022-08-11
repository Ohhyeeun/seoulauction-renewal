package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {

    /*Popup*/
    CommonMap selectPopup();

    //테이블 별로 readCount 설정.
    void addReadCount(CommonMap map);

    List<CommonMap> selectTopNotice();

    List<CommonMap> selectBeltBanners();

    List<CommonMap> selectVideos(CommonMap map);

    /*Newsletter*/
    List<CommonMap> selectNewsletters(CommonMap map);
    CommonMap selectNewsletterById(CommonMap map);
    void insertNewsletter(CommonMap map);
    void insertNewsletterHistory(CommonMap map);
    CommonMap selectNewsletterForOverlapCheck(CommonMap map);
    void updateNewsletter(CommonMap map);
    List<CommonMap> selectBigBanners();

    List<CommonMap> selectBrochures(CommonMap map);

    void addBrochureReadCount(CommonMap map);
}
