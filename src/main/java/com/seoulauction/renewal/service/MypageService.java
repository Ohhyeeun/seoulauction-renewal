package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.MypageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MypageService {

	private final MypageMapper mypageMapper;
	    
    public CommonMap selectAcademyList(CommonMap commonMap){  
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectAcademyList(commonMap));
    	map.put("cnt", mypageMapper.selectAcademyCnt(commonMap));
        return map;
    }
    
    public CommonMap selectAcademyPayInfo(CommonMap commonMap){  
    	return mypageMapper.selectAcademyPayInfo(commonMap);
    }
    
    public CommonMap selectSaleListByCustNo(CommonMap commonMap){  
    	CommonMap map = new CommonMap();
    	map.put("saleList", mypageMapper.selectSaleListByCustNo(commonMap));
        return map;
    }
    
    public CommonMap selectPayListByCustNo(CommonMap commonMap){  
    	CommonMap map = new CommonMap();
    	List<CommonMap> list = mypageMapper.selectPayListByCustNo(commonMap);
    	map.put("payCount", mypageMapper.selectPayCountByCustNo(commonMap));
    	map.put("payList", mypageMapper.selectPayListByCustNo(commonMap));

    	
//    	Map<Object, List<CommonMap>> result = list.stream().collect(
//    	Collectors.groupingBy(m->m.get("SALE_TITLE_KR"), Map <String,List<CommonMap>>, Collectors.toList()));
    	
		/*
		 * List<Test> list2 = null;
		 * Map<String, List<Test>> result = list2.stream().collect(
		 * Collectors.groupingBy(Test::getSaleTitle));
		 */
    	
    	map.put("customerInfo", mypageMapper.selectCustomerByCustNo(commonMap));
        return map;
    }
}
