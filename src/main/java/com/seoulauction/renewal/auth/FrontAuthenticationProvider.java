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
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.net.Inet4Address;
import java.net.UnknownHostException;
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

		// 아이디로 회원조회
		CommonMap resultMap = loginMapper.selectCustByLoginId(paramMap);

		// 조회결과 없을시
		if(resultMap == null || resultMap.isEmpty()){
			throw new BadCredentialsException("User not found.");
		}

		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();

		// 사용자입력 비밀번호를 암호화하여 DB값과 비교
		int loginFailCnt = (int) resultMap.get("LOGIN_FAIL_CNT");
		if(!encoder.matches(passwd, resultMap.getString("PASSWD"))){
			// 로그인 실패 횟수 + 1
			paramMap.put("cust_no", resultMap.get("CUST_NO"));
			paramMap.put("login_fail_cnt", ++loginFailCnt);

			// 로그인실패횟수 업데이트, 10번 이상일시 로그인페이지에 보안문자(captcha)표현됨
			int result = loginMapper.updateCustLoginFailCntByCustNo(paramMap);
			if(result > 0 && loginFailCnt >10) {
				attr.getRequest().getSession().setAttribute("LOGIN_FAIL_CNT_YN", true);
			}
			throw new BadCredentialsException("Wrong password");
		}else {
			// 로그인성공이므로 실패횟수 0으로 업데이트
			if(loginFailCnt > 0) {
				paramMap.put("cust_no", resultMap.get("CUST_NO"));
				paramMap.put("login_fail_cnt", 0);
				int result = loginMapper.updateCustLoginFailCntByCustNo(paramMap);
				if(result > 0) {
					attr.getRequest().getSession().removeAttribute("LOGIN_FAIL_CNT_YN");
				}
			}
		}

		// 이용제한 사용자 체크
		if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("stop")){
			throw new BadCredentialsException("Stop User"); // 이용제한 아이디 STAT_CD = 'stop'
		}

		// 미인증 사용자 체크
		if(resultMap.get("STAT_CD") != null && resultMap.get("STAT_CD").equals("not_certify")){
			throw new BadCredentialsException("Not Certify User"); // 해외고객 이메일 미인증 STAT_CD = 'not_certify'
		}

		// 비밀번호 변경 180일 경과 여부
		if(resultMap.get("PASSWD_MOD_NECESSARY_YN").equals("Y")){
			attr.getRequest().getSession().setAttribute("PASSWD_MOD_NECESSARY_YN", true);
		}

		// 관리자에 의한 비밀번호 초기화 여부
		if(resultMap.get("PASSWD_RESET_YN").equals("Y")){
			attr.getRequest().getSession().setAttribute("PASSWD_RESET_YN", true);
		}

		// 접속IP체크
		WebAuthenticationDetails wad;
		String userIPAddress;
		if(authentication.getDetails().getClass() == String.class) {
			userIPAddress = authentication.getDetails().toString();
		}else {
			// Get the IP address of the user tyring to use the site
			wad = (WebAuthenticationDetails) authentication.getDetails();
			userIPAddress = wad.getRemoteAddress();
		}

		// 접속이력추가
		try{
			userIPAddress = java.net.Inet4Address.getLocalHost().getHostAddress();
		}catch(UnknownHostException e) {}

		paramMap.put("ip", userIPAddress);
		paramMap.put("user_no", resultMap.get("CUST_NO"));
		paramMap.put("user_kind_cd", "customer");
		int insertResult = loginMapper.insertConnHist(paramMap);
		if(insertResult > 0){
			log.info("userIPAddress == " + userIPAddress);
		}

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

		UsernamePasswordAuthenticationToken result
				= new UsernamePasswordAuthenticationToken(custNo, resultMap.get("PASSWD").toString(), roles);

		String addr = "";
		if(resultMap.get("ADDR") != null) {
			addr = resultMap.get("ADDR").toString();
			if(resultMap.get("ADDR_DTL") != null) {
				addr += resultMap.get("ADDR_DTL").toString();
			}
		}
		result.setDetails(SAUserDetails.builder()
				.loginId(loginId)
				.password(resultMap.get("PASSWD") != null ? resultMap.getString("PASSWD") : "")
				.userNo(custNo)
				.authorities(roles)
				.userKind(resultMap.get("CUST_KIND_CD") != null ? resultMap.getString("CUST_KIND_CD") : "")
				.userNm(resultMap.get("CUST_NAME").toString())
				.ip(userIPAddress)
				.zipNo(resultMap.get("ZIPNO") != null ? resultMap.getString("ZIPNO") : "")
				.addr(addr)
				.hp(resultMap.get("HP") != null ? resultMap.getString("HP") : "")
				.email(resultMap.get("EMAIL") != null ? resultMap.getString("EMAIL") : "")
				.validDate(resultMap.get("VALID_DATE") != null ? resultMap.getString("VALID_DATE") : "")
				.socialYn(resultMap.get("SOCIAL_YN") != null ? resultMap.getString("SOCIAL_YN") : "" + resultMap.get("SOCIAL_YN") != null ? " " + resultMap.getString("SOCIAL_YN") : "")
				.localKindCd(resultMap.get("LOCAL_KIND_CD") != null ? resultMap.getString("LOCAL_KIND_CD") : "" + resultMap.get("LOCAL_KIND_CD") != null ? " " + resultMap.getString("LOCAL_KIND_CD") : "")
				.build());
		return result;
	}

	@Override
	public boolean supports(Class<? extends Object> authentication) {
		return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}

}
