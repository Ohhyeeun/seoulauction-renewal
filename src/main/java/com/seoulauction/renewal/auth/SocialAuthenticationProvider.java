package com.seoulauction.renewal.auth;

import java.util.ArrayList;
import java.util.List;

//import com.seoulauction.common.auth.SAUserDetails;
//import com.seoulauction.front.util.AuctionUtil;
//import com.seoulauction.ws.dao.CommonDao;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
@Log4j2
public class SocialAuthenticationProvider  implements AuthenticationProvider {


	private final LoginMapper loginMapper;

	@Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        log.info("social authenticate");

        SAUserDetails parameterUserDetail = (SAUserDetails) authentication.getDetails();
        String socialType = parameterUserDetail.getSocialType();
        String socialEmail = parameterUserDetail.getSocialEmail();
        String ip = parameterUserDetail.getIp();

        log.info("socialType : {}, socialEmail: {}, ip: {}", socialType, socialEmail, ip);

        // check CUST
        CommonMap paramMap = new CommonMap();
        paramMap.put("social_type", socialType);
        paramMap.put("social_email", socialEmail);
        CommonMap resultMap = loginMapper.selectCustForCustSocial(paramMap);;

        if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("stop")){
			throw new BadCredentialsException("Stop User"); // 이용제한 아이디 STAT_CD = 'stop'
        }

        if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("not_certify")){
			throw new BadCredentialsException("Not Certify User"); // 해외고객 이메일 미인증 STAT_CD = 'not_certify'
        }

        paramMap.put("ip", ip);
        paramMap.put("user_no", resultMap.get("CUST_NO"));
        paramMap.put("user_kind_cd", "customer");
        loginMapper.insertConnHist(paramMap);

        //결제여부, 직원여부에 따른 권한 분류
        paramMap.put("cust_no", resultMap.get("CUST_NO"));
        paramMap.put("remember_me", 'N');
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
                = new UsernamePasswordAuthenticationToken(custNo, null, roles);
        result.setDetails(SAUserDetails.builder()
    			.loginId(resultMap.get("LOGIN_ID") != null ? resultMap.get("LOGIN_ID").toString() : "")
    			.password(null)
    			.userNo(custNo)
    			.authorities(roles)
    			.userKind(resultMap.get("CUST_KIND_CD") != null ? resultMap.get("CUST_KIND_CD").toString() : "")
    			.userNm(resultMap.get("CUST_NAME") != null ? resultMap.get("CUST_NAME").toString() : "")
    			.ip(ip)
    			.zipNo(resultMap.get("ZIPNO") != null ? resultMap.get("ZIPNO").toString() : "")
				.addr(resultMap.get("ADDR") != null ? resultMap.get("ADDR").toString() : "" + resultMap.get("ADDR_DTL") != null ? " " + resultMap.get("ADDR_DTL").toString() : "")
				.socialYn(resultMap.get("SOCIAL_YN") != null ? resultMap.get("SOCIAL_YN").toString() : "" + resultMap.get("SOCIAL_YN") != null ? " " + resultMap.get("SOCIAL_YN").toString() : "")
    			.build());

        return result;
    }

    @Override
    public boolean supports(Class<? extends Object> authentication) {
        return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
    }
}

