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

import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seoulauction.renewal.component.AddressFinder;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.kt.KTMainMapper;
import com.seoulauction.renewal.mapper.kt.MypageMapper;
import com.seoulauction.renewal.util.SecurityUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class MypageService {

	private final S3Service s3Service;
	
	private final MypageMapper mypageMapper;
	
	private final KTMainMapper ktMainMapper;
	
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
    	
    	//map.put("customerInfo", mypageMapper.selectCustomerByCustNo(commonMap));
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
			throw new SAException("message : " + e.getMessage() + ", fileList" + request.getFiles("file"));
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
    	map.put("list", mypageMapper.selectLiveBidHistoryList(commonMap));
//    	map.put("cnt", mypageMapper.selectLiveBidReqCnt(commonMap));                                                                          
        return map;
    }
    
    public CommonMap selectLiveBidHammerList(CommonMap commonMap){
    	CommonMap map = new CommonMap();
    	map.put("list", mypageMapper.selectLiveBidHammerList(commonMap));
    	map.put("cnt", mypageMapper.selectLiveBidHammerCnt(commonMap));                                                                          
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
    
    public List<CommonMap> selectCustInteArtist(CommonMap paramMap){
    	return mypageMapper.selectCustInteArtist(paramMap);
    }

    public List<CommonMap> selectArtistByArtistName(CommonMap paramMap){
    	return mypageMapper.selectArtistByArtistName(paramMap);
    }
    
    public int updateCust(CommonMap paramMap){
        return mypageMapper.updateCust(paramMap);
    }
    public int updateCustPushWay(String custNo, String pushWayStr){
		CommonMap paramMap = new CommonMap();
		paramMap.put("cust_no", custNo);
		
    	int result = deleteCustPushWay(paramMap);
    	
    	String[] pushWays = pushWayStr.split("\\|");
    	if(pushWayStr != "" && pushWays.length > 0) {
    		for (int i = 0; i < pushWays.length; i++) {
        		paramMap.put("push_way_cd", pushWays[i]);
        		result += mypageMapper.insertCustPushWay(paramMap);
			}
    	}
    	
        return result >= pushWays.length + 1 ? 1 : 0;
    }

    public int updateCustInteArtist(String custNo, String inteArtistStr){
    	CommonMap paramMap = new CommonMap();
		paramMap.put("cust_no", custNo);
		
    	int result = deleteCustInteArtist(paramMap);
    	
    	String[] inteArtists = inteArtistStr.split("\\|");
    	if(inteArtistStr != "" && inteArtists.length > 0) {
    		for (int i = 0; i < inteArtists.length; i++) {
        		paramMap.put("artist_no", inteArtists[i]);
        		result += mypageMapper.insertCustInteArtist(paramMap);
			}
    	}
    	
        return result >= inteArtists.length + 1 ? 1 : 0;
    }

    public int updateCustInteArea(String custNo, String inteAreaStr){
    	CommonMap paramMap = new CommonMap();
		paramMap.put("cust_no", custNo);
		
    	int result = deleteCustInteArea(paramMap);
    	
    	String[] inteAreas = inteAreaStr.split("\\|");
    	if(inteAreaStr != "" && inteAreas.length > 0) {
    		for (int i = 0; i < inteAreas.length; i++) {
        		paramMap.put("inte_area_cd", inteAreas[i]);
        		result += mypageMapper.insertCustInteArea(paramMap);
			}
    	}
    	
        return result >= inteAreas.length + 1 ? 1 : 0;
    }
    
    public int custLeaveValidCheck(CommonMap paramMap){
    	int leaveValid = 0; // 1이상: 탈퇴불가능, 0; 탈퇴가능
		
    	// 1. 응찰중인지 확인 (lot 종료일시 > 현재 = 응찰중)
    	List<CommonMap> bidMap = mypageMapper.selectBidForCustLeave(paramMap);
    	if(bidMap.size() > 0) {
    		leaveValid++;
    	}
    	log.info(bidMap.size() > 0 ? "응찰중" : "응찰중아님 탈퇴가능");
    	
    	// 2. 자동응찰중인지 확인 (lot 종료일시 > 현재 = 응찰중)
    	List<CommonMap> autoBidMap = mypageMapper.selectAutoBidReqForcustLeave(paramMap);
    	if(autoBidMap.size() > 0) {
    		leaveValid++;
    	}
    	log.info(autoBidMap.size() > 0 ? "자동응찰중" : "자동응찰중아님 탈퇴가능");
    	
		// 3. 낙찰 후 결제대기 경매가 있는지 확인
    	paramMap.put("action_user_no", paramMap.get("cust_no"));
    	List<CommonMap> haveToPayMap = ktMainMapper.selectHaveToPayWork(paramMap);
    	if(haveToPayMap.size() > 0) {
    		leaveValid++;
    	}
    	log.info(autoBidMap.size() > 0 ? "낙찰 후 결제대기중" : "낙찰 후 결제대기중아님 탈퇴가능");
    	
    	return leaveValid;
    }
    
    public int deleteCust(CommonMap paramMap){
    	//회원탈퇴 (개인회원은 같은 아이디로 재가입불가능)
        int result = mypageMapper.deleteCust(paramMap);
        
        //고객발송정보 delyn Y
        result += mypageMapper.updateCustSendInfoNew(paramMap);
        
        //고객수신방법 데이터삭제
        result += mypageMapper.deleteCustPushWay(paramMap);
        
        String socialYn = SecurityUtils.getAuthenticationPrincipal().getSocialYn();
        if(socialYn.equals("Y")) {
        	String socialType = SecurityUtils.getAuthenticationPrincipal().getSocialType();
        	log.info(" ======== socialYn : {}, socialType : {} ======== " + socialYn, socialType);
        	paramMap.put("social_type", socialType);
        	//소셜회원일 경우 소셜데이터삭제(소셜회원은 같은 소셜이메일로 재가입가능)
        	result += mypageMapper.deleteCustSocial(paramMap);
        }
        return result;
    }
    
    public int deleteCustPushWay(CommonMap paramMap){
        return mypageMapper.deleteCustPushWay(paramMap);
    }

    public int deleteCustInteArtist(CommonMap paramMap){
        return mypageMapper.deleteCustInteArtist(paramMap);
    }

    public int deleteCustInteArea(CommonMap paramMap){
        return mypageMapper.deleteCustInteArea(paramMap);
    }

	public CommonMap selectManager(){
		CommonMap paramMap = new CommonMap();
		SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
		if (saUserDetails != null) {
			paramMap.put("cust_no", saUserDetails.getUserNo());
		} else {
			paramMap.put("cust_no", 0);
		}

		return mypageMapper.selectManager(paramMap);
	}
}
