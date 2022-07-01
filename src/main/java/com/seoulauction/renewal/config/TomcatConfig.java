package com.seoulauction.renewal.config;

import org.apache.catalina.webresources.ExtractingRoot;
import org.springframework.context.annotation.Configuration;

import org.apache.catalina.Context;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;

@Configuration
public class TomcatConfig {
    @Bean
    public WebServerFactoryCustomizer<TomcatServletWebServerFactory> servletContainerCustomizer() {
        return (TomcatServletWebServerFactory container) -> {
            container.addContextCustomizers((Context context) -> {
                context.setResources(new ExtractingRoot());
                context.setReloadable(Boolean.FALSE);
            });
        };
    }
}
