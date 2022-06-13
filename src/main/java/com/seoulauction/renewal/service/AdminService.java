package com.seoulauction.renewal.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.KTAdminMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class AdminService {

    private final KTAdminMapper ktAdminMapper;

    public List<CommonMap> activeSales(CommonMap map){
        ObjectMapper mapper = new ObjectMapper();

        return ktAdminMapper.selectActiveSales(map).stream().map(c->{
            Map maps = null;
            CommonMap resultMap =new CommonMap();
            try {
                maps = mapper.readValue(String.valueOf(c.get("SALE_TITLE_JSON")) , Map.class);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            resultMap.put("kr_title" , maps.get("ko"));
            resultMap.put("en_title" , maps.get("en"));
            resultMap.put("sale_no",c.get("sale_no"));
            return resultMap;
        }).collect(Collectors.toList());
    }

}
