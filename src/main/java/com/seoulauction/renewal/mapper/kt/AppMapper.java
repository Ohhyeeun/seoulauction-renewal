package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AppMapper {

    List<CommonMap> selectDeviceId(CommonMap map);

    void insertAppInfo(CommonMap map);

    void updateAppInfo(CommonMap map);

    List<CommonMap> selectToken(CommonMap paramMap);

    void insertLoginToken(CommonMap map);

    void updateLoginToken(CommonMap paramMap);

    int deleteLoginToken(CommonMap paramMap);

    List<CommonMap> selectLoginByToken(CommonMap paramMap);
}
