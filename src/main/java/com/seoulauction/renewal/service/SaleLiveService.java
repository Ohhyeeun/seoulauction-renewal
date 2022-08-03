package com.seoulauction.renewal.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.ArtistMapper;
import com.seoulauction.renewal.mapper.kt.SaleLiveMapper;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleLiveService {

    private final SaleLiveMapper saleLiveMapper;

    @Value("${image.root.path}")
    private String IMAGE_URL;

    public CommonMap selectLiveSale(CommonMap map){
        return saleLiveMapper.selectLiveSale(map);
    }
    public List<CommonMap> selectLiveSaleLots(CommonMap map){
        return saleLiveMapper.selectLiveSaleLots(map);
    }
    public CommonMap selectLiveSaleLotByOne(CommonMap map){
        return saleLiveMapper.selectLiveSaleLotByOne(map);
    }
    public List<CommonMap> selectLiveCategories(CommonMap map){
        return saleLiveMapper.selectLiveCategories(map);
    }
    public List<CommonMap> selectLiveMyBidding(CommonMap map){
        return saleLiveMapper.selectLiveMyBidding(map);
    }
    public List<CommonMap> selectLiveSiteBidding(CommonMap map){
        return saleLiveMapper.selectLiveSiteBidding(map);
    }
}

