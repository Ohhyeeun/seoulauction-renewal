package com.seoulauction.renewal.auth;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Value;


@WebListener
public class SessionListener implements HttpSessionListener{

    @Value("${sa.session.timeout}")
    private int sessionTime;        
    
    public void sessionCreated(HttpSessionEvent se) {        
    	se.getSession().setMaxInactiveInterval(sessionTime);    
    }     
    
    public void sessionDestroyed(HttpSessionEvent se) {
    }
}