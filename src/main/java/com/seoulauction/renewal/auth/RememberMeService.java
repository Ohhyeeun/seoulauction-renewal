package com.seoulauction.renewal.auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class RememberMeService implements UserDetailsService {

	private final LoginMapper loginMapper;

	@Override
	public SAUserDetails loadUserByUsername(String custNo) {
		log.info("RememberMeService custNo : {}" , custNo);
		CommonMap paramMap = new CommonMap();
        paramMap.put("cust_no", custNo);
		CommonMap resultMap = loginMapper.getCustomerByCustNo(paramMap);
		
		if(resultMap == null || resultMap.isEmpty()){
			throw new BadCredentialsException("User not found.");
	    }
		
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        roles.add(new SimpleGrantedAuthority("ROLE_FRONT_USER"));
        SAUserDetails userDetails = SAUserDetails.builder()
				.loginId(resultMap.get("CUST_NO").toString())
				.password(resultMap.get("PASSWD").toString())
				.userNo(Integer.parseInt(resultMap.get("CUST_NO").toString()))
				.authorities(roles)
				.userKind(resultMap.get("CUST_KIND_CD").toString())
				.userNm(resultMap.get("CUST_NAME").toString())
				.ip(null)
				.build();
        
        return userDetails; 
	}
}
