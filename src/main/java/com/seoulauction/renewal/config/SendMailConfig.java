package com.seoulauction.renewal.config;

import java.util.Properties;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;

import lombok.RequiredArgsConstructor;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SendMailConfig  {
	
		@Value("${email.smtp.host}")
		private String host;

	  	@Value("${email.smtp.port}")
	    private int port;
	  	
	  	@Value("${email.smtp.user}")
	  	private String username;
	  	
	  	@Value("${email.smtp.passwd}")
	  	private String password;
	  	
	  	
	    @Value("${email.transport.protocol}")
	    private String protocol;
	    
	    @Value("${email.smtp.auth}")
	    private boolean auth;
	    
	    @Value("${email.smtp.starttls}")
	    private boolean starttls;


		 @Bean
		 public JavaMailSender javaMailService() {
		       JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		       javaMailSender.setHost(host);
		       javaMailSender.setPort(port);
		       javaMailSender.setUsername(username);
		       javaMailSender.setPassword(password);
		       
		       Properties pt = new Properties();
		       
		       pt.put("mail.transport.protocol", protocol); 
		       pt.put("mail.smtp.auth", auth);
		       pt.put("mail.smtp.starttls.enable", starttls);
		       pt.put("mail.debug", true);
		       pt.put("mail.smtp.localhost", "");
		       javaMailSender.setJavaMailProperties(pt);       
		       javaMailSender.setDefaultEncoding("UTF-8");
		       
		       return javaMailSender;
		 }
		 
		 @Bean
		 public VelocityEngineFactoryBean velocityEngine() {
			 VelocityEngineFactoryBean velocityEngineFactoryBean = new VelocityEngineFactoryBean();
			 velocityEngineFactoryBean.setResourceLoaderPath("classpath:mail-template/");
		       return velocityEngineFactoryBean;
		 }
		 
}