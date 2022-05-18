package com.seoulauction.renewal.service;

import java.io.IOException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seoulauction.renewal.component.FileManager;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.MypageMapper;

import lombok.RequiredArgsConstructor;

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
    
    public CommonMap selectInquiryList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectInquiryList(commonMap));
    	map.put("cnt", mypageMapper.selectInquiryListCnt(commonMap));
        return map;
    }

    
    public CommonMap selectInquiry(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("inquiryInfo", mypageMapper.selectInquiryInfo(commonMap));
    	map.put("inquiryReply", mypageMapper.selectInquiryReply(commonMap));
    	map.put("inquiryFileList", mypageMapper.selectFileList(commonMap));

    public List<CommonMap> selectInquiryCategory(CommonMap commonMap){
        return mypageMapper.selectInquiryCategory(commonMap);
    }
    
    public CommonMap selectInquiryCustomerInfo(CommonMap commonMap){
        return mypageMapper.selectInquiryCustomerInfo(commonMap);
    }
    
    public int insertInquiry(MultipartHttpServletRequest request, Principal principal) throws IOException {
    	
		//문의 등록
    	CommonMap map = new CommonMap(formatMapRequest(request));
    	map.put("action_user_no", principal.getName());
    	map.put("action_user_ip", request.getRemoteAddr());
    	int result = 0;
    	//mypageMapper.insertInquiryWrite(map);

    	try {	
    		List<MultipartFile> fileList = request.getFiles("file");
    			for(MultipartFile file : fileList) {
    				if(file.getSize() > 0 && !file.getOriginalFilename().equals("")) {
    					//서버 저장 -> s3 api호출로 변경 예정.
    					CommonMap commonMap = FileManager.uploadFile(file);
    					commonMap.put("write_no", map.get("write_no"));
    					
    					/*
    					commonMap.put("file_path", "");
    		    		commonMap.put("file_name", "");
    		    		commonMap.put("file_name_org", "");
    		    		commonMap.put("size", "");
    					*/
    					
    					//result = mypageMapper.insertInquiryWriteFile(commonMap);
    				}
    			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
        return result;
    }
    
    // 공통
    public Map<String,Object> formatMapRequest(HttpServletRequest request) {
    	Map<String, Object> map = new HashMap<String, Object>();
        Enumeration<String> enumber = request.getParameterNames();
        while (enumber.hasMoreElements()) {
            String key = enumber.nextElement().toString();
            String value = request.getParameter(key);

            map.put(key, value);  
        }
        return map;
    }

}