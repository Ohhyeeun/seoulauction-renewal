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
import java.util.Optional;
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
            CommonMap resultMap = new CommonMap();

            try {
                maps = mapper.readValue(String.valueOf(c.get("SALE_TITLE_JSON")) , Map.class);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            resultMap.put("kr_title" , maps.get("ko"));
            resultMap.put("en_title" , maps.get("en"));
            resultMap.put("sale_no", c.get("SALE_NO"));
            resultMap.put("sale_th", c.get("SALE_TH"));
            resultMap.put("from_dt", c.get("FROM_DT"));
            return resultMap;
        }).collect(Collectors.toList());
    }
    public CommonMap getArtistByNo(CommonMap map){
        return Optional.ofNullable(ktAdminMapper.selectArtistByNo(map)).map(c->{

            ObjectMapper mapper = new ObjectMapper();
            Map maps = null;
            try {
                maps = mapper.readValue(String.valueOf(c.get("ARTIST_NAME_BLOB")) , Map.class);
                CommonMap nameMap = new CommonMap();
                nameMap.put("ko" , maps.get("ko"));
                nameMap.put("en" , maps.get("en"));
                c.put("NAME", nameMap);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            c.putIfAbsent("NATION_CD", null);
            c.putIfAbsent("DIE_YEAR", null);
            c.putIfAbsent("BORN_YEAR", null);
            c.remove("ARTIST_NAME_BLOB");

            return c;
        }).orElse(new CommonMap());
    }
    public List<CommonMap> getCode(CommonMap map){
        return ktAdminMapper.selectCode(map);
    }


}
