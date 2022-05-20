package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleService {


    private final SaleMapper saleMapper;

    public CommonMap search_list_paging(CommonMap paramMap){

        CommonMap map = new CommonMap();
        map.put("list", saleMapper.search_list_paging(paramMap));
        map.put("cnt", saleMapper.search_list_count(paramMap));
        map.put("cust_info", saleMapper.get_customer_by_cust_no(paramMap));

        //검색 히스토리 적재
        saleMapper.search_log(paramMap);

        return map;
    }

    public int add_cust_inte_lot(CommonMap paramMap){
        return saleMapper.add_cust_inte_lot(paramMap);
    }

    public int del_cust_inte_lot(CommonMap paramMap){
        return saleMapper.del_cust_inte_lot(paramMap);
    }
}
