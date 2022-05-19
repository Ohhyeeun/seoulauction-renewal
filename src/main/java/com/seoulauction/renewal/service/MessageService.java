package com.seoulauction.renewal.service;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;


@Service
public class MessageService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private VelocityEngine velocityEngine;
	
	@Value("${email.from}")
	String emailFrom;

	
	public void sendMail(String to, String subject, String template, Map<String, Object> model) throws MessagingException{

		MimeMessage message = mailSender.createMimeMessage();
		
    	try{
        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
        	messageHelper.setSubject(subject);
    		messageHelper.setTo(to);
    		messageHelper.setFrom(emailFrom);
            String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, template, "UTF-8", model);
        	messageHelper.setText(text, true);          
    		mailSender.send(message);
    	}
    	
    	catch(MessagingException ex){
    		throw ex;
    	}
	}

	
}
