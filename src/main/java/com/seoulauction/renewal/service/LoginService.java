package com.seoulauction.renewal.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.PrivateKey;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.bouncycastle.asn1.pkcs.PrivateKeyInfo;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.LoginMapper;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
public class LoginService {

	private final LoginMapper loginMapper;

	public CommonMap selectCustByLoginId(CommonMap paramMap) {
		return loginMapper.selectCustByLoginId(paramMap);
	}

	public int insertConnHist(CommonMap paramMap) {
		return loginMapper.insertConnHist(paramMap);
	}

	public CommonMap selectCustByCustNo(CommonMap paramMap) {
		return loginMapper.selectCustByCustNo(paramMap);
	}

	public int updateCustPwdResetByCustNo(CommonMap paramMap) {
		return loginMapper.updateCustPwdResetByCustNo(paramMap);
	}

	public int updateCustPwdModDtByCustNo(CommonMap paramMap) {
		return loginMapper.updateCustPwdModDtByCustNo(paramMap);
	}

	/*아이디 찾기*/
	public List<CommonMap> selectCustLoginIdByCustName(CommonMap paramMap) {
		List<CommonMap> resultList = loginMapper.selectCustLoginIdByCustName(paramMap);
		if (resultList.size() < 1) {
			throw new SAException("일치하는 회원 정보가 없습니다.");
		}
		return resultList;
	}

	/*비밀번호 업데이트*/
	public int updatePasswordByLoginId(CommonMap commonMap) {
		return loginMapper.updatePasswordByLoginId(commonMap);
	}

	/*비밀번호 찾기 > 사용자 조회*/
	public CommonMap selectCustomerByStatCdAndLoginId(CommonMap paramMap) {
		return loginMapper.selectCustomerByStatCdAndLoginId(paramMap);
	}

	public CommonMap selectCustSocialBySocialLoginId(CommonMap paramMap) {
		return loginMapper.selectCustSocialBySocialLoginId(paramMap);
	}

	public List<CommonMap> selectCustForIdExist(CommonMap paramMap) {
		return loginMapper.selectCustForIdExist(paramMap);
	}

	public List<CommonMap> selectCustForExist(CommonMap paramMap) {
		return loginMapper.selectCustForExist(paramMap);
	}

	public CommonMap selectEmpByEmpName(CommonMap paramMap) {
		CommonMap map = new CommonMap();
		map.put("list", loginMapper.selectEmpByEmpName(paramMap));
		map.put("cnt", loginMapper.selectEmpByEmpNameCnt(paramMap));
		return map;
	}

	public List<CommonMap> selectCode(CommonMap paramMap) {
		return loginMapper.selectCode(paramMap);
	}

	public int insertCust(CommonMap paramMap) {
		return loginMapper.insertCust(paramMap);
	}

	public int insertCustSocial(CommonMap paramMap) {
		return loginMapper.insertCustSocial(paramMap);
	}

	public CommonMap selectCustForCustSocial(CommonMap paramMap) {
		return loginMapper.selectCustForCustSocial(paramMap);
	}

	public int insertCustPushWay(CommonMap paramMap) {
		return loginMapper.insertCustPushWay(paramMap);
	}

	/**
	 * 클라이언트의 IP 주소는 HttpServletRequest.getRemoteAddr() 메서드를 이용하여 알아낼 수 있다. 그러나
	 * Proxy, Caching server, Load Balancer 등을 거쳐올 경우 getRemoteAddr()를 이용하여 IP 주소를
	 * 가지고 오지 못하게 된다. 이걸 위한 별도의 처리가 필요
	 */
	public String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
		}

		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}

		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}

		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}

	public JsonElement postRestful(StringBuilder sb, String reqUrl) {
		JsonElement element = null;
		
		try {
			URL url = new URL(reqUrl);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
            BufferedReader br = null;
            if (100 <= responseCode && responseCode < 400) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
			log.info("responseCode : {}", responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : {}", result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			element = parser.parse(result);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return element;
	}

	public JsonElement getRestful(String token, String reqUrl) {
		JsonElement element = null; 
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = conn.getResponseCode();
            BufferedReader br = null;
            if (100 <= responseCode && responseCode < 400) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
			log.info("responseCode : {}", responseCode);

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : {}", result);

			JsonParser parser = new JsonParser();
			element = parser.parse(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return element;
	}

	public String checkDuplSocialLoginId(String socialType) {
		String socialLoginId = "";

		boolean duplIdCheck = true;
		while (duplIdCheck) {
			socialLoginId = socialType + "_" + Double.toString(Math.random() * 10).replace(".", "").substring(0, 8);
			log.info(socialLoginId);
			CommonMap paramMap = new CommonMap();
			paramMap.put("socialLoginId", socialLoginId);
			CommonMap resultMap = selectCustSocialBySocialLoginId(paramMap);
			if (resultMap == null) {
				duplIdCheck = false;
			}
		}

		return socialLoginId;
	}
	public CommonMap getCustByEmpNo(int custNo){

		CommonMap empCustMap = loginMapper.selectCustForEmpNo(new CommonMap("cust_no" , custNo));

		if(empCustMap == null){
			empCustMap = new CommonMap();
			empCustMap.put("CUST_NAME" , "고객센터");
			empCustMap.put("TEL" , "02-395-0330");
			//담당자 전번도 없을때는 고객센터로 ㄱ
		} else {
			String tel = empCustMap.getString("TEL");
			if(StringUtils.isEmpty(tel)){
				empCustMap.put("CUST_NAME" , "고객센터");
				empCustMap.put("TEL" , "02-395-0330");
			}
		}

		return empCustMap;


	}
	
	public String createClientSecret(String teamId, String clientId, String keyId, String keyPath, String authUrl) throws IOException {
//		teamId 2LXTMAYUA5
//		clientId com.seoulauction.renewal-web
//		keyId 72UURP4N8Z
//		keyPath AuthKey_72UURP4N8Z.p8
//		authUrl https://appleid.apple.com
	    Date expirationDate = Date.from(LocalDateTime.now().plusDays(30).atZone(ZoneId.systemDefault()).toInstant());
	    return Jwts.builder()
	               .setHeaderParam("kid", keyId)
	               .setHeaderParam("alg", "ES256")
	               .setIssuer(teamId)
	               .setIssuedAt(new Date(System.currentTimeMillis()))
	               .setExpiration(expirationDate)
	               .setAudience(authUrl)
	               .setSubject(clientId)
	               .signWith(SignatureAlgorithm.ES256, getPrivateKey(keyPath))
	               .compact();
	}
	
	private PrivateKey getPrivateKey(String keyPath) throws IOException {
	    ClassPathResource resource = new ClassPathResource(keyPath);
	    InputStream is = resource.getInputStream();
	    File file = File.createTempFile("TEMPFILE_P8", new Date().getTime() + ".p8");
	    try(OutputStream outputStream = new FileOutputStream(file)){
	        IOUtils.copy(is, outputStream);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    final PEMParser pemParser = new PEMParser(new FileReader(file));
	    final JcaPEMKeyConverter converter = new JcaPEMKeyConverter();
	    final PrivateKeyInfo object = (PrivateKeyInfo) pemParser.readObject();
	    final PrivateKey pKey = converter.getPrivateKey(object);
	    pemParser.close();
	    return pKey;
	}
}	