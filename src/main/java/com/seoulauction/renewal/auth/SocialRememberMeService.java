package com.seoulauction.renewal.auth;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.codec.Hex;
import org.springframework.security.crypto.codec.Utf8;
import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
import org.springframework.security.web.authentication.rememberme.InvalidCookieException;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationException;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.seoulauction.renewal.domain.SAUserDetails;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SocialRememberMeService extends AbstractRememberMeServices {
	
	/* 생성자 */
	public SocialRememberMeService(@Value("${rememberme.key}") String key, UserDetailsService userDetailsService) {
		super(key, userDetailsService);
	}

	@Override
	protected void onLoginSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication successfulAuthentication) {
		
		log.info("SocialRememberMeService - onLoginSuccess()");

		SAUserDetails details = (SAUserDetails) successfulAuthentication.getDetails();
		
		String userNo = String.valueOf(details.getUserNo());
		if(details.getSocialYn().equals("Y")) {
			userNo += "|" + details.getSocialType() + "|" + details.getSocialEmail();
		}
		long time = System.currentTimeMillis() + (86400 * 365);
		String expiryTime = String.valueOf(time);
		String tokenSignature = "";

		String data = userNo + ":" + expiryTime + ":" + details.getPassword() + ":" + this.getKey();
		log.info("data : {}", data);
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			tokenSignature = new String(Hex.encode(digest.digest(data.getBytes())));
		}
		catch (NoSuchAlgorithmException ex) {
			throw new IllegalStateException("No MD5 algorithm available!");
		}

		log.info("userNo : {}", userNo);
		log.info("expiryTime : {}", expiryTime);
		log.info("tokenSignature : {}", tokenSignature);

		this.setParameter("remember-me");
		this.setTokenValiditySeconds(86400 * 365);

		try {
			// 쿠키 발행
			String[] rawCookieValues = new String[] { userNo, expiryTime, tokenSignature };
			log.info(Arrays.toString(rawCookieValues));
			this.setCookie(rawCookieValues, getTokenValiditySeconds(), request, response);

		} catch (DataAccessException e) {
			e.printStackTrace();
		}

	}

	@Override
	protected UserDetails processAutoLoginCookie(String[] cookieTokens, HttpServletRequest request,
			HttpServletResponse response) throws RememberMeAuthenticationException, UsernameNotFoundException {
		log.info("SocialRememberMeService - processAutoLoginCookie()");
		if (cookieTokens.length != 3) {
			throw new InvalidCookieException(
					"Cookie token did not contain 3" + " tokens, but contained '" + Arrays.asList(cookieTokens) + "'");
		}
		long tokenExpiryTime = getTokenExpiryTime(cookieTokens);
		if (isTokenExpired(tokenExpiryTime)) {
			throw new InvalidCookieException("Cookie token[1] has expired (expired on '" + new Date(tokenExpiryTime)
					+ "'; current time is '" + new Date() + "')");
		}
		// Check the user exists. Defer lookup until after expiry time checked, to
		// possibly avoid expensive database call.
		UserDetails userDetails = getUserDetailsService().loadUserByUsername(cookieTokens[0]);
		Assert.notNull(userDetails, () -> "UserDetailsService " + getUserDetailsService()
				+ " returned null for username " + cookieTokens[0] + ". " + "This is an interface contract violation");
		// Check signature of token matches remaining details. Must do this after user
		// lookup, as we need the DAO-derived password. If efficiency was a major issue,
		// just add in a UserCache implementation, but recall that this method is usually
		// only called once per HttpSession - if the token is valid, it will cause
		// SecurityContextHolder population, whilst if invalid, will cause the cookie to
		// be cancelled.
		String userName = userDetails.getUsername();
		SAUserDetails details = ((SAUserDetails) userDetails);
		
		if(details.getSocialYn().equals("Y")) {
			userName += "|" + details.getSocialType() + "|" + details.getSocialEmail();
		}
		String expectedTokenSignature = makeTokenSignature(tokenExpiryTime, userName,
				userDetails.getPassword());
		if (!equals(expectedTokenSignature, cookieTokens[2])) {
			throw new InvalidCookieException("Cookie token[2] contained signature '" + cookieTokens[2]
					+ "' but expected '" + expectedTokenSignature + "'");
		}
		return userDetails;
	}
	
	private long getTokenExpiryTime(String[] cookieTokens) {
		try {
			return new Long(cookieTokens[1]);
		}
		catch (NumberFormatException nfe) {
			throw new InvalidCookieException(
					"Cookie token[1] did not contain a valid number (contained '" + cookieTokens[1] + "')");
		}
	}
	
	protected boolean isTokenExpired(long tokenExpiryTime) {
		return tokenExpiryTime < System.currentTimeMillis();
	}
	
	protected String makeTokenSignature(long tokenExpiryTime, String username, String password) {
		String data = username + ":" + tokenExpiryTime + ":" + password + ":" + this.getKey();
		log.info("2data : {}", data);
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			return new String(Hex.encode(digest.digest(data.getBytes())));
		}
		catch (NoSuchAlgorithmException ex) {
			throw new IllegalStateException("No MD5 algorithm available!");
		}
	}
	
	/**
	 * Constant time comparison to prevent against timing attacks.
	 */
	private static boolean equals(String expected, String actual) {
		byte[] expectedBytes = bytesUtf8(expected);
		byte[] actualBytes = bytesUtf8(actual);
		return MessageDigest.isEqual(expectedBytes, actualBytes);
	}
	
	private static byte[] bytesUtf8(String s) {
		return (s != null) ? Utf8.encode(s) : null;
	}
}