package com.seoulauction.renewal.auth;

import java.util.ArrayList;
import java.util.List;

import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import lombok.RequiredArgsConstructor;

@Log4j2
@RequiredArgsConstructor
@Component
public class FrontAuthenticationProvider implements AuthenticationProvider {

	private final PasswordEncoderAESforSA encoder;

	private final LoginMapper loginMapper;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String loginId = (String)authentication.getPrincipal();
		String passwd = (String)authentication.getCredentials();
		
		CommonMap paramMap = new CommonMap();
        paramMap.put("login_id", loginId);
        paramMap.put("passwd", passwd);
        paramMap.put("stat_cd", "normal");
        
        CommonMap resultMap = loginMapper.getCustomerByLoginId(paramMap);
        
        if(resultMap == null || resultMap.isEmpty()){
			throw new BadCredentialsException("User not found.");
        }

		if(!encoder.matches(passwd, resultMap.getString("PASSWD"))){
			throw new BadCredentialsException("Wrong password");
		}
		
		WebAuthenticationDetails wad = null;
        String userIPAddress         = null;

        // Get the IP address of the user tyring to use the site
        wad = (WebAuthenticationDetails) authentication.getDetails();
        userIPAddress = wad.getRemoteAddress();
        paramMap.put("ip", userIPAddress);
        paramMap.put("user_no", resultMap.get("CUST_NO"));
        paramMap.put("user_kind_cd", "customer");
        int insertResult = loginMapper.insertConnHist(paramMap);
        if(insertResult > 0){
        	log.info("userIPAddress == " + userIPAddress);
        }

		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        roles.add(new SimpleGrantedAuthority("ROLE_FRONT_USER"));
        
        int custNo = Integer.parseInt(resultMap.get("CUST_NO").toString());
        
        UsernamePasswordAuthenticationToken result 
        	= new UsernamePasswordAuthenticationToken(custNo, resultMap.get("PASSWD").toString(), roles);
        
        result.setDetails(SAUserDetails.builder()
        					.loginId(loginId)
        					.password(resultMap.get("PASSWD").toString())
        					.userNo(custNo)
        					.authorities(roles)
        					.userKind(resultMap.get("CUST_KIND_CD").toString())
        					.userNm(resultMap.get("CUST_NAME").toString())
        					.ip(userIPAddress)
        					.build());
		return result;
	}

	@Override
	public boolean supports(Class<? extends Object> authentication) {
		return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}

}
