package com.seoulauction.renewal.auth;

import lombok.extern.log4j.Log4j2;
import org.apache.commons.net.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

@Log4j2
public class Cryptography {
	
	public static String encryptAes(String strDataToEncrypt, String key) {
		String strCipherText = "";
		try{
			SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
			Cipher aesCipher = Cipher.getInstance("AES");
			aesCipher.init(Cipher.ENCRYPT_MODE, keySpec);
			byte[] byteDataToEncrypt = strDataToEncrypt.getBytes();
			byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt); 
			strCipherText = Base64.encodeBase64String(byteCipherText);
		}
		catch (Exception e){
			log.error(e);
		}
		return strCipherText.trim();
	}
	
	public static String decryptAes(String strCipherText, String key){
		String strDecryptedText = "";
		try{
			SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
			Cipher aesCipher = Cipher.getInstance("AES");
			aesCipher.init(Cipher.DECRYPT_MODE, keySpec);//, aesCipher.getParameters());
			byte[] byteDecryptedText = aesCipher.doFinal(Base64.decodeBase64(strCipherText));
			strDecryptedText = new String(byteDecryptedText);
		}
		catch (Exception e){
			log.error(e);
		}

		return strDecryptedText.trim();
	}
}
