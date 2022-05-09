package com.seoulauction.renewal.auth;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.kt.LoginMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.List;

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
        
        CommonMap resultMap = loginMapper.selectCustByLoginId(paramMap);
        
        if(resultMap == null || resultMap.isEmpty()){
			throw new BadCredentialsException("User not found.");
        }
        
        if(!encoder.matches(passwd, resultMap.getString("PASSWD"))){
        	throw new BadCredentialsException("Wrong password");
        }

        if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("stop")){
			throw new BadCredentialsException("Stop User"); // 이용제한 아이디 STAT_CD = 'stop'
        }

		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		// TODO 비밀번호 변경 180일 경과 여부
        
    	// TODO 관리자에 의한 비밀번호 초기화 여부
        
		WebAuthenticationDetails wad;
        String userIPAddress;

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

        //결제여부, 직원여부에 따른 권한 분류
        paramMap.put("cust_no", resultMap.get("CUST_NO"));
        resultMap = loginMapper.selectCustByCustNo(paramMap);
        
        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        //정,준회원 구분
        if(resultMap.get("MEMBERSHIP_YN").equals("Y")) {
        	roles.add(new SimpleGrantedAuthority("ROLE_REGULAR_USER"));
        }else if(resultMap.get("MEMBERSHIP_YN").equals("N")) {
        	roles.add(new SimpleGrantedAuthority("ROLE_ASSOCIATE_USER"));
        }
        //직원여부
        if(resultMap.get("EMP_GB").equals("Y")) {
        	roles.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE_USER"));
        }
        
        
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
