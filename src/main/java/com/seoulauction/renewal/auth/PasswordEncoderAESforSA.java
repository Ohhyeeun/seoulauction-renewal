package com.seoulauction.renewal.auth;

import org.springframework.stereotype.Component;

@Component
public class PasswordEncoderAESforSA {

	final String AES_KEY = "SA:1101111627011";

	public String encode(CharSequence rawPassword) {
		return Cryptography.encryptAes((String)rawPassword, AES_KEY);
	}
	
	public String decode(CharSequence rawPassword) {
		return Cryptography.decryptAes((String)rawPassword, AES_KEY);
	}
	
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return encode(rawPassword).equals(encodedPassword);
	}
	
	public static String saPasswdEncoding(String passwd){
		if(passwd == null || passwd.equals("")) return null;
		return new PasswordEncoderAESforSA().encode(passwd);
	}
	
	public static String saPasswdDecoding(String passwd){
		if(passwd == null || passwd.equals("")) return null;

		return new PasswordEncoderAESforSA().decode(passwd);
	}
}
