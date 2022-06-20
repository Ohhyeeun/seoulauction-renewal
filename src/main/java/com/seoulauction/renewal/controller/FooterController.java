package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.SAConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_FOOTER;
import static com.seoulauction.renewal.common.SAConst.SERVICE_SERVICE;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SERVICE_FOOTER)
public class FooterController {

    @GetMapping("/recruitForm")
    public String boardIncruitApply(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "incruitForm" , locale);}
    @GetMapping("/incruitEmpty")
    public String boardIncruitEmpty(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "boardIncruitEmpty" , locale);}
    @GetMapping("/recruit")
    public String boardIncruitList(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "recruit" , locale);}
    @GetMapping("/recruit/{id}")
    public String boardIncruitView(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "recruitView" , locale);}
    @GetMapping("/media")
    public String boardMediaList(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "media" , locale);}
    @GetMapping("/notice")
    public String boardNoticeList(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "notice" , locale);}
    @GetMapping("/notice/{id}")
    public String boardNoticeView(
            @PathVariable("id") int id,
            HttpServletRequest request,
            Locale locale) {
            request.setAttribute("id", id);
            return SAConst.getUrl(SERVICE_FOOTER , "noticeView" , locale);
    }
    @GetMapping("/companyHistory")
    public String companyHistory(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "companyHistory" , locale);
    }
    @GetMapping("/companyIntro")
    public String companyIntro(Locale locale) {return SAConst.getUrl(SERVICE_FOOTER , "companyIntro" , locale);}
    @GetMapping("/faq")
    public String faq(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "faq" , locale);
    }
    @GetMapping("/infoAution")
    public String infoAution(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "infoAution" , locale);
    }
    @GetMapping("/infoAutionPopup")
    public String infoAutionPopup(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "infoAutionPopup" , locale);
    }
    @GetMapping("/location")
    public String location(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "location" , locale);
    }
    @GetMapping("/privacy")
    public String privacy(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "privacy" , locale);
    }
    @GetMapping("/rules")
    public String rules(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "rules" , locale);
    }
    @GetMapping("/sub")
    public String sub(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "sub" , locale);
    }
    @GetMapping("/terms")
    public String terms(Locale locale) {
        return SAConst.getUrl(SERVICE_FOOTER , "terms" , locale);
    }


}
