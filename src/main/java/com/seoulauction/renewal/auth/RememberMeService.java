package com.seoulauction.renewal.auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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
		String socialType = "";
		String socialEmail = "";
		if(custNo.contains("|")) {
			// social Remember Me Auto Login
			log.info("social Remember Me Auto Login");
			
			String[] custNoArr = custNo.split("\\|");
			custNo = custNoArr[0];
			socialType = custNoArr[1]; 
			socialEmail = custNoArr[2];
			log.info("custNo : {}, socialType : {}, socialEmail : {}", custNo, socialType, socialEmail);
		}
		CommonMap paramMap = new CommonMap();
        paramMap.put("cust_no", custNo);
        paramMap.put("remember_me", 'Y');
		CommonMap resultMap = loginMapper.selectCustByCustNo(paramMap);
		
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		
		if(resultMap == null || resultMap.isEmpty()){
			attr.getRequest().getSession().setAttribute("USER_NOT_FOUND", true);
			throw new RememberMeAuthenticationException("User not found");
	    }
		
		if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("stop")){
			attr.getRequest().getSession().setAttribute("STOP_USER", true);
			throw new RememberMeAuthenticationException("Stop User"); // 이용제한 아이디 STAT_CD = 'stop'
        }
		
		if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("not_certify")){
			attr.getRequest().getSession().setAttribute("NOT_CERTIFY_USER", true);
			throw new RememberMeAuthenticationException("Not Certify User"); // 해외고객 이메일 미인증 STAT_CD = 'not_certify'
        }
		
		// 비밀번호 변경 180일 경과 여부
		if(resultMap.get("PASSWD_MOD_NECESSARY_YN").equals("Y")){
		    attr.getRequest().getSession().setAttribute("PASSWD_MOD_NECESSARY_YN", true);
		}
		        
		// 관리자에 의한 비밀번호 초기화 여부
		if(resultMap.get("PASSWD_RESET_YN").equals("Y")){
		    attr.getRequest().getSession().setAttribute("PASSWD_RESET_YN", true);
		}
		
		List<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
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

		String addr = "";
        if(resultMap.get("ADDR") != null) {
        	addr = resultMap.get("ADDR").toString();
        	if(resultMap.get("ADDR_DTL") != null) {
        		addr += resultMap.get("ADDR_DTL").toString();
        	}
        }
		return SAUserDetails.builder()
				.loginId(resultMap.get("CUST_NO").toString())
				.password(resultMap.get("PASSWD").toString())
				.userNo(Integer.parseInt(resultMap.get("CUST_NO").toString()))
				.authorities(roles)
				.userKind(resultMap.get("CUST_KIND_CD") != null ? resultMap.get("CUST_KIND_CD").toString() : "")
    			.userNm(resultMap.get("CUST_NAME") != null ? resultMap.get("CUST_NAME").toString() : "")
    			.ip(null)
    			.zipNo(resultMap.get("ZIPNO") != null ? resultMap.get("ZIPNO").toString() : "")
    			.addr(addr)
    			.hp(resultMap.get("HP") != null ? resultMap.get("HP").toString() : "")
				.email(resultMap.get("EMAIL") != null ? resultMap.get("EMAIL").toString() : "")
				.validDate(resultMap.get("VALID_DATE") != null ? resultMap.get("VALID_DATE").toString() : "")
				.socialYn(resultMap.get("SOCIAL_YN") != null ? resultMap.get("SOCIAL_YN").toString() : "" + resultMap.get("SOCIAL_YN") != null ? " " + resultMap.get("SOCIAL_YN").toString() : "")
				.socialType(socialType)
				.socialEmail(socialEmail)
    			.build();
	}
}
