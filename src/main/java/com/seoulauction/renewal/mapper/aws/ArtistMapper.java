package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArtistMapper {

    List<CommonMap> selectRecommandArtist();

    CommonMap selectArtistInfo(CommonMap commonMap);

}
