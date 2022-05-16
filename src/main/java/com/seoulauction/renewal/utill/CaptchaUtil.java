package com.seoulauction.renewal.utill;

import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.renderer.DefaultWordRenderer;

public class CaptchaUtil {
	private static int width = 150; /*보안문자 이미지 가로크기*/ 
	private static int height = 50; /*보안문자 이미지 세로크기*/

	/* CaptCha Image 생성 */
	public void getImgCaptCha(HttpServletRequest req, HttpServletResponse res) { /*폰트 및 컬러 설정*/
		List<Font> fontList = new ArrayList<Font>();
		fontList.add(new Font("", Font.HANGING_BASELINE, 40));
		fontList.add(new Font("Courier", Font.ITALIC, 40));
		fontList.add(new Font("", Font.PLAIN, 40));
		List<Color> colorList = new ArrayList<Color>();
		colorList.add(Color.BLACK);
		Captcha captcha = new Captcha.Builder(width, height) 
				// .addText() 또는 아래와 같이 정의 : 6자리 숫자와 폰트 및 컬러 설정
//				.addText(new NumbersAnswerProducer(6), new DefaultWordRenderer(colorList, fontList))
				.addText(new DefaultWordRenderer(colorList, fontList))
				.addNoise().addBorder() 
				.addBackground(new GradiatedBackgroundProducer()) 
				.build();
		
		/*JSP에서 Captcha 객체에 접근할 수 있도록 session에 저장*/ 
		req.getSession().setAttribute(Captcha.NAME, captcha); 
		CaptchaServletUtil.writeImage(res, captcha.getImage()); 
	}

//	/*CaptCha Audio 생성*/
//	public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse res, String answer)throws IOException {
//	    HttpSession session = req.getSession();
//	    Captcha captcha = (Captcha)session.getAttribute(Captcha.NAME);
//	    String getAnswer = answer;
//	    if (getAnswer == null || getAnswer.equals("")) 
//	        getAnswer = captcha.getAnswer();
//	    
//	    CaptchaKorVoiceUtil vProd = new CaptchaKorVoiceUtil(); //한국음성적용 
//
//	    AudioCaptcha audiocaptcha = new AudioCaptcha
//	        .Builder()
//	        .addAnswer(new SetTextProducer(getAnswer))
//	        .addVoice(vProd) //한국음성적용
//	        .addNoise() /*잡음 추가*/
//	        .build();
//	    CaptchaServletUtil.writeAudio(res, audiocaptcha.getChallenge());
//	}
//
//	public class SetTextProducer implements TextProducer {
//	    private final String str;
//	    public SetTextProducer(String getAnswer) {
//	        this.str = getAnswer;
//	    }
//	    @Override public String getText() {
//	        return this.str;
//	    }
//	}
//	
//	package com.seoulauction.renewal.utill;
//
//	import java.util.HashMap;
//	import java.util.Map;
//
//	import nl.captcha.audio.Sample;
//	import nl.captcha.audio.producer.VoiceProducer;
//	import nl.captcha.util.FileUtil;
//
//	public class CaptchaKorVoiceUtil  implements VoiceProducer  {
//
//	    private static final Map<Integer, String> DEFAULT_VOICES_MAP;
//
//	    static {
//	        DEFAULT_VOICES_MAP = new HashMap<Integer, String>();
//	        StringBuilder sb;
//
//	        for (int i = 0; i < 10; i++) {            
//	            sb = new StringBuilder("/sounds/ko/numbers/");
//	            sb.append(i);            
//	            sb.append(".wav");            
//	            DEFAULT_VOICES_MAP.put(i, sb.toString());
//	        }
//	    }
//
//	    private final Map<Integer, String> _voices;
//
//	    public CaptchaKorVoiceUtil() {
//	        this(DEFAULT_VOICES_MAP);
//	    }
//
//	    public CaptchaKorVoiceUtil(Map<Integer, String> voices) {
//	        _voices = voices;
//	    }
//
//	    @Override
//	    public Sample getVocalization(char num) {
//	       try {
//	            Integer.parseInt(num + "");
//	        } catch (NumberFormatException e) {
//	            throw new IllegalArgumentException("Expected <num> to be a number, got '" + num + "' instead.",e);
//	        }
//
//	        int idx = Integer.parseInt(num + "");
//	        String filename = _voices.get(idx); 
//	        return FileUtil.readSample(filename);
//	    }
//	}
	




}