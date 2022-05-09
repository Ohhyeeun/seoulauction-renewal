package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AWSMainMapper {
    List<CommonMap> selectArtist();
}
