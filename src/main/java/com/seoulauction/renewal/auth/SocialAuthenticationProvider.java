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
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

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

        // 소셜타입, 소셜이메일로 회원조회
        CommonMap paramMap = new CommonMap();
        paramMap.put("social_type", socialType);
        paramMap.put("social_email", socialEmail);
        CommonMap resultMap = loginMapper.selectCustForCustSocial(paramMap);
		
        // 조회결과 없을시
        if(resultMap == null || resultMap.isEmpty()){
			throw new BadCredentialsException("User not found.");
        }
        
        // 이용제한 사용자 체크
        if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("stop")){
			throw new BadCredentialsException("Stop User"); // 이용제한 아이디 STAT_CD = 'stop'
        }

        // 미인증 사용자 체크
        if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("not_certify")){
			throw new BadCredentialsException("Not Certify User"); // 해외고객 이메일 미인증 STAT_CD = 'not_certify'
        }
        String loginId = resultMap.getString("LOGIN_ID");

        // 접속이력추가
        paramMap.put("ip", ip);
        paramMap.put("user_no", resultMap.get("CUST_NO"));
        paramMap.put("user_kind_cd", "customer");
        loginMapper.insertConnHist(paramMap);

        // 결제여부, 직원여부에 따른 권한 분류
        paramMap.put("cust_no", resultMap.get("CUST_NO"));
        paramMap.put("remember_me", 'N');
        resultMap = loginMapper.selectCustByCustNo(paramMap);

        List<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
        // 정,준회원 구분하여 권한에 저장
        if(resultMap.get("MEMBERSHIP_YN").equals("Y")) {
        	roles.add(new SimpleGrantedAuthority("ROLE_REGULAR_USER"));
        }else if(resultMap.get("MEMBERSHIP_YN").equals("N")) {
        	roles.add(new SimpleGrantedAuthority("ROLE_ASSOCIATE_USER"));
        }
        // 직원인 경우 권한에 저장
        if(resultMap.get("EMP_GB").equals("Y")) {
        	roles.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE_USER"));
        }

        int custNo = Integer.parseInt(resultMap.get("CUST_NO").toString());

        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(custNo, null, roles);
        
        String addr = "";
        if(resultMap.get("ADDR") != null) {
        	addr = resultMap.get("ADDR").toString();
        	if(resultMap.get("ADDR_DTL") != null) {
        		addr += resultMap.get("ADDR_DTL").toString();
        	}
        }
        result.setDetails(SAUserDetails.builder()
    			.loginId(loginId)
    			.password(null)
    			.userNo(custNo)
    			.authorities(roles)
    			.userKind(resultMap.get("CUST_KIND_CD") != null ? resultMap.getString("CUST_KIND_CD") : "")
    			.userNm(resultMap.get("CUST_NAME") != null ? resultMap.getString("CUST_NAME") : "")
    			.ip(ip)
    			.zipNo(resultMap.get("ZIPNO") != null ? resultMap.getString("ZIPNO") : "")
    			.addr(addr)
    			.hp(resultMap.get("HP") != null ? resultMap.getString("HP") : "")
				.email(resultMap.get("EMAIL") != null ? resultMap.getString("EMAIL") : "")
				.validDate(resultMap.get("VALID_DATE") != null ? resultMap.getString("VALID_DATE") : "")
				.socialYn(resultMap.get("SOCIAL_YN") != null ? resultMap.getString("SOCIAL_YN") : "" + resultMap.get("SOCIAL_YN") != null ? " " + resultMap.getString("SOCIAL_YN") : "")
				.socialType(socialType)
				.socialEmail(socialEmail)
				.localKindCd(resultMap.get("LOCAL_KIND_CD") != null ? resultMap.getString("LOCAL_KIND_CD") : "" + resultMap.get("LOCAL_KIND_CD") != null ? " " + resultMap.getString("LOCAL_KIND_CD") : "")
    			.build());

        return result;
    }

    @Override
    public boolean supports(Class<? extends Object> authentication) {
        return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
    }
}

