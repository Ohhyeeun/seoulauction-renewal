package com.seoulauction.renewal.service;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seoulauction.renewal.component.AddressFinder;
import com.seoulauction.renewal.component.FileManager;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.MypageMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class MypageService {

	private final S3Service s3Service;
	
	private final MypageMapper mypageMapper;
	
	public List<CommonMap> selectCustomerCustpayList(CommonMap commonMap){
        return mypageMapper.selectCustomerCustpayList(commonMap);
    }
	
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
    	map.put("payTotalCount", mypageMapper.selectPayTotalCountByCustNo(commonMap));
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

    
    public CommonMap selectInquiry(CommonMap commonMap) {
		CommonMap map = new CommonMap();
		map.put("inquiryInfo", mypageMapper.selectInquiryInfo(commonMap));
		map.put("inquiryReply", mypageMapper.selectInquiryReply(commonMap));
		map.put("inquiryFileList", s3Service.getS3FileDataAll("bbs_write", commonMap.get("write_no")));
    	return map;
    }

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
    	int result = mypageMapper.insertInquiryWrite(map);

    	try {	
    		List<MultipartFile> fileList = request.getFiles("file");
    			for(MultipartFile file : fileList) {
    				if(file.getSize() > 0 && !file.getOriginalFilename().equals("")) {
    					//서버 저장 -> s3 api호출로 변경 예정.
    					s3Service.insertS3FileData(false , file,"bbs_write", String.valueOf(map.get("write_no")));
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
    
    public HashMap<String, Object> findAddr(CommonMap action) {
    	HashMap<String, Object> r = null;
		
		try {
			r = new HashMap<String, Object>();
			r = (HashMap<String, Object>) AddressFinder.find(action);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return r;
	}

    public CommonMap selectInteLotList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectCustInteLotList(commonMap));
    	map.put("cnt", mypageMapper.selectCustInteLotCnt(commonMap));                                                                          
        return map;
    }
    
    public CommonMap insertCustInteLot(CommonMap commonMap){                                                                
        return mypageMapper.insertCustInteLot(commonMap);
    }

    public int deleteCustInteLot(CommonMap commonMap){                                                                
    	return mypageMapper.deleteCustInteLot(commonMap);
    }
    
    public CommonMap selectBidReqList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectLiveBidReqList(commonMap));
    	map.put("cnt", mypageMapper.selectLiveBidReqCnt(commonMap));                                                                          
        return map;
    }
    
    public CommonMap selectLiveBidReqHistoryList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectLiveBidReqHistoryList(commonMap));
//    	map.put("cnt", mypageMapper.selectLiveBidReqCnt(commonMap));                                                                          
        return map;
    }
    
    public CommonMap selectLiveBidList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectLiveBidList(commonMap));
    	map.put("cnt", mypageMapper.selectLiveBidCnt(commonMap));                                                                          
    	return map;
    }

    public CommonMap selectLiveBidHistoryList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectLiveBidReqHistoryList(commonMap));
//    	map.put("cnt", mypageMapper.selectLiveBidReqCnt(commonMap));                                                                          
        return map;
    }
    
    public CommonMap selectOnlineBidList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectOnlineBidList(commonMap));
    	map.put("cnt", mypageMapper.selectOnlineBidCnt(commonMap));                                                                          
    	return map;
    }

    public CommonMap selectOnlineBidHistoryList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectOnlineBidHistoryList(commonMap));
//    	map.put("cnt", mypageMapper.selectLiveBidReqCnt(commonMap));                                                                          
        return map;
    }
    
    public CommonMap selectCustForChkPassword(CommonMap paramMap){
    	return mypageMapper.selectCustForChkPassword(paramMap);
    }
    
    public int updateCustPasswdByCustNo(CommonMap paramMap){
        return mypageMapper.updateCustPasswdByCustNo(paramMap);
    }
    
    public List<CommonMap> selectCustSocialByCustNo(CommonMap commonMap){
        return mypageMapper.selectCustSocialByCustNo(commonMap);
    }
    
    public int deleteCustSocial(CommonMap paramMap){
        return mypageMapper.deleteCustSocial(paramMap);
    }
    
    public String requestToServer(String apiURL) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		
		log.info("responseCode===== {}", responseCode);
		if(responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
		  res.append(inputLine);
		}
		
		br.close();
		if(responseCode == 200) {
			log.info(res.toString());
			String new_res=res.toString().replaceAll("&#39;", "");
			return new_res; 
		} else {
			return null;
		}
    }
}
