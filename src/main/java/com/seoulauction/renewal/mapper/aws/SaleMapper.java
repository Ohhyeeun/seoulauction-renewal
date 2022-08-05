package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SaleMapper {

    //응찰 페이지 공지사항
    List<CommonMap> selectBidNotice(CommonMap commonMap);

}
