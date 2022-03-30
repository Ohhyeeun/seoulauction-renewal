package com.seoulauction.renewal.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Log4j2
@ControllerAdvice
public class ExceptionHandller {

    //404 페이지 낫 파운드
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String error404(){
        log.info("404");
        return "/errors/404";
    }

    //그외 심각한 오류들
    @ExceptionHandler(Exception.class)
    public String exception(){
        log.info("500");
        return "/errors/500";
    }

}
