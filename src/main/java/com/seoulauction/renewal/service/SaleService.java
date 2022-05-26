package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.ArtistMapper;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleService {


    private final SaleMapper saleMapper;
    private final ArtistMapper artistMapper;

    public CommonMap search_list_paging(CommonMap paramMap) {

        CommonMap map = new CommonMap();
        map.put("list", saleMapper.search_list_paging(paramMap));
        map.put("cntList", saleMapper.search_list_count(paramMap));
        map.put("cust_info", saleMapper.get_customer_by_cust_no(paramMap));

        //검색 히스토리 적재
        if (map.get("chk") != null) {
            saleMapper.search_log(paramMap);
        }

        return map;
    }

    public int add_cust_inte_lot(CommonMap paramMap) {

        int result = 0;
        result = saleMapper.add_cust_inte_lot(paramMap);

        if (result > 0) {
            log.info("add_cust_inte_lot success : " + result);
        } else {
            log.info("add_cust_inte_lot fail : " + result);
        }
        return result;
    }

    public int del_cust_inte_lot(CommonMap paramMap) {

        int result = 0;
        result = saleMapper.del_cust_inte_lot(paramMap);

        if (result > 0) {
            log.info("add_cust_inte_lot success : " + result);
        } else {
            log.info("add_cust_inte_lot fail : " + result);
        }

        return result;
    }

    public List<CommonMap> selectRecommandArtist() {

        return artistMapper.selectRecommandArtist();

    }
}
