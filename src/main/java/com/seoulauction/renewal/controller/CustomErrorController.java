package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
@Log4j2
public class CustomErrorController implements ErrorController {
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Locale locale) {
        log.info("/error {}", locale);

        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value()) {
                return SAConst.getUrl(SAConst.SERVICE_ERROR , "error_404" , locale);
            } else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return SAConst.getUrl(SAConst.SERVICE_ERROR , "error_500" , locale);
            }
        }

        return SAConst.getUrl(SAConst.SERVICE_ERROR , "error_404" , locale);
    }
}
