package com.seoulauction.renewal.mapper;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestMapper {
    List<CommonMap> selectArtist();
}
