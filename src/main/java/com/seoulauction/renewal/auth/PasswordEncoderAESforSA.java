package com.seoulauction.renewal.auth;

import com.seoulauction.renewal.component.Cryptography;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class PasswordEncoderAESforSA implements PasswordEncoder {

	//@Override
	public String encode(CharSequence rawPassword) {
		String encodePassword = Cryptography.encryptAes((String)rawPassword, "SA:1101111627011");
		//logger.info("=======> encodePassword  raw: {}, encode : {}, decode:{}", rawPassword, encodePassword, this.decode(encodePassword));
		return encodePassword;
	}
	
	public String decode(CharSequence rawPassword) {
		String decodePassword = Cryptography.decryptAes((String)rawPassword, "SA:1101111627011");
		return decodePassword;
	}
	
	//@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		//logger.info("=======> isPasswordValid : {}, {}", rawPassword, encodedPassword);
		return encode((String)rawPassword).equals(encodedPassword);
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
