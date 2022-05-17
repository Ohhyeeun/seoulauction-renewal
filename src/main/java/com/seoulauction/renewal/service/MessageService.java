package com.seoulauction.renewal.service;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import lombok.RequiredArgsConstructor;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;

@Service
@RequiredArgsConstructor
public class MessageService {

	
	private static JavaMailSender mailSender;
	
	private static VelocityEngine velocityEngine;
	
	@Value("${email.from}")
	static
	String emailFrom;

	public static void sendMail(String to, String subject, String template, Map<String, Object> model) throws MessagingException{

		MimeMessage message = mailSender.createMimeMessage();
    	try{
        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
        	//logger.info("====>from {} : to {}: subject {}", mailFrom, to, subject);
        	messageHelper.setSubject(subject);
    		messageHelper.setTo(to);
    		messageHelper.setFrom(emailFrom);
            String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, template, "UTF-8", model);
        	messageHelper.setText(text, true);
            //messageHelper.setText("간다고 한다.");
            /*FileSystemResource file = new FileSystemResource(new File("c:/Sample.jpg"));
            helper.addAttachment("CoolImage.jpg", file);*/

    		/*JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    		mailSender.setHost("smtp.gmail.com");
    		mailSender.setPort(587);
    		mailSender.setUsername("debugger0101@gmail.com");
    		mailSender.setPassword("ybjung12");
    		Properties props = new Properties();
    		props.put("mail.transport.protocol", "smtp");
    		props.put("mail.smtp.auth", "true");
    		props.put("mail.smtp.starttls.enable", "true");
    		props.put("mail.debug", "true");
    		mailSender.setJavaMailProperties(props);*/
    		
            /*message.setSubject("간다고 해라.");
            message.setFrom(new InternetAddress(mailFrom));
            message.addRecipient(RecipientType.TO, new InternetAddress(to));
            message.setText("간다고 한다.");*/
                        
    		mailSender.send(message);
    		
    		/*MimeMessagePreparator preparator = new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper message = new  MimeMessageHelper(mimeMessage, false, "UTF-8");
                    message.setSubject("welcome");
                    message.setTo(to);
                    message.setFrom(mailFrom); // could be parameterized...
                    String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, template, "UTF-8", model);
                    message.setText(text);
                }
            };
            mailSender.send(preparator);*/

    	}
    	catch(MessagingException ex){
    		throw ex;
    	}
	}

	
}
