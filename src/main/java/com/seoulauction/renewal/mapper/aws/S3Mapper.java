package com.seoulauction.renewal.mapper.aws;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface S3Mapper {

    void insertS3File(CommonMap map);
    void insertS3FileData(CommonMap map);
    List<CommonMap> selectS3FileData(CommonMap map);
    CommonMap selectS3FileDataForOne(CommonMap map);
}
