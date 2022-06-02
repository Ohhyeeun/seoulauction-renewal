package com.seoulauction.renewal.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper loginMapper;

    public CommonMap selectCustByLoginId(CommonMap paramMap){
        return loginMapper.selectCustByLoginId(paramMap);
    }

    public int insertConnHist(CommonMap paramMap){
        return loginMapper.insertConnHist(paramMap);
    }

    public int updateCustPasswdByCustNo(CommonMap paramMap){
        return loginMapper.updateCustPasswdByCustNo(paramMap);
    }
    
    public int updateCustPwdResetByCustNo(CommonMap paramMap){
        return loginMapper.updateCustPwdResetByCustNo(paramMap);
    }

    public int updateCustPwdModDtByCustNo(CommonMap paramMap){
        return loginMapper.updateCustPwdModDtByCustNo(paramMap);
    }


    public CommonMap selectCustLoginIdByCustName(CommonMap paramMap){
    	CommonMap resultMap = loginMapper.selectCustLoginIdByCustName(paramMap);
    	if(MapUtils.isEmpty(resultMap)) {
			 throw new SAException("일치하는 회원 정보가 없습니다.");
		 }
        return resultMap;
    }

    public int updatePasswordByLoginId(CommonMap commonMap){
    	return loginMapper.updatePasswordByLoginId(commonMap);
    }

    public CommonMap selectCustomerByStatCdAndLoginId(CommonMap paramMap){
        return loginMapper.selectCustomerByStatCdAndLoginId(paramMap);
    }

    public CommonMap selectCustSocialBySocialLoginId(CommonMap paramMap){
        return loginMapper.selectCustSocialBySocialLoginId(paramMap);
    }
    
    public List<CommonMap> selectCustForExist(CommonMap paramMap){
        return loginMapper.selectCustForExist(paramMap);
    }
    
    public CommonMap selectEmpByEmpName(CommonMap paramMap){
    	CommonMap map = new CommonMap();
    	map.put("list", loginMapper.selectEmpByEmpName(paramMap));
    	map.put("cnt", loginMapper.selectEmpByEmpNameCnt(paramMap));
        return map;
    }
    
    public List<CommonMap> selectCode(CommonMap paramMap){
        return loginMapper.selectCode(paramMap);
    }
    
    public int insertCust(CommonMap paramMap){
        return loginMapper.insertCust(paramMap);
    }
    
    public int insertCustSocial(CommonMap paramMap){
        return loginMapper.insertCustSocial(paramMap);
    }

    public CommonMap selectCustForCustSocial(CommonMap paramMap){
        return loginMapper.selectCustForCustSocial(paramMap);
    }
    
    public int insertCustPushWay(CommonMap paramMap){
        return loginMapper.insertCustPushWay(paramMap);
    }
    
    /**
	 * 클라이언트의 IP 주소는 HttpServletRequest.getRemoteAddr() 메서드를 이용하여 알아낼 수 있다.
	 * 그러나 Proxy, Caching server, Load Balancer 등을 거쳐올 경우 getRemoteAddr()를 이용하여 IP 주소를 가지고 오지 못하게 된다.
	 * 이걸 위한 별도의 처리가 필요
	 */
    public String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
		}

		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}

		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}

		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}

    public CommonMap selectCustForChkPassword(CommonMap paramMap){
    	return loginMapper.selectCustForChkPassword(paramMap);
    }
}
