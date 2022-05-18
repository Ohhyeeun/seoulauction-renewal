package com.seoulauction.renewal.mapper.kt;

import com.seoulauction.renewal.domain.CommonMap;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SaleMapper {

    CommonMap search_list_count(CommonMap paramMap);

    List<CommonMap> search_list_paging(CommonMap paramMap);

    CommonMap get_customer_by_cust_no(CommonMap paramMap);

    int search_log(CommonMap paramMap);

    int add_cust_inte_lot(CommonMap paramMap);

    int del_cust_inte_lot(CommonMap paramMap);

}
