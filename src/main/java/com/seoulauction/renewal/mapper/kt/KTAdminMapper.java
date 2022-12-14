package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KTAdminMapper {

    List<CommonMap> selectActiveSales(CommonMap map);
    CommonMap selectArtistByNo(CommonMap map);
    CommonMap selectArtistByName(CommonMap map);
    List<CommonMap> selectCode(CommonMap map);
}
