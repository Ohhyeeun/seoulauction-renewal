package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_SERVICE;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ContentsController {

    public String marketing(HttpServletRequest request , Locale locale) {
        return SAConst.getUrl(SERVICE_SERVICE , "marketing" , locale);
    }
}
