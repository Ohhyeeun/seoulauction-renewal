package com.seoulauction.renewal;

import javax.servlet.http.HttpSessionListener;

import org.apache.catalina.Context;
import org.apache.tomcat.util.scan.StandardJarScanner;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

import com.seoulauction.renewal.auth.SessionListener;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootApplication
public class SeoulauctionRenewalApplication extends SpringBootServletInitializer {


    public static void main(String[] args) {
        SpringApplication.run(SeoulauctionRenewalApplication.class, args);
    }

    @Value("${server.config}")
    String config;

    @Bean
    public CommandLineRunner commandLineRunner() {
        return args -> log.info("server config : {}", config);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SeoulauctionRenewalApplication.class);
    }
    
    @Bean
    public HttpSessionListener httpSessionListener(){
        return new SessionListener();
    }
    @Bean
    public TomcatServletWebServerFactory tomcatFactory() {
        return new TomcatServletWebServerFactory() {
            @Override
            protected void postProcessContext(Context context) {
                ((StandardJarScanner) context.getJarScanner()).setScanManifest(false);
            }
        };
    }
}
