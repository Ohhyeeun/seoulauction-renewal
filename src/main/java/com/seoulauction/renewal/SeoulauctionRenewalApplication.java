package com.seoulauction.renewal;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@Log4j2
public class SeoulauctionRenewalApplication {

    public static void main(String[] args) {
        SpringApplication.run(SeoulauctionRenewalApplication.class, args);
    }

    @Value("${server.config}")
    String config;

    @Bean
    public CommandLineRunner commandLineRunner(){
        return args -> log.info("server config : {}" , config);
    }
}
