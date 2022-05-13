package com.seoulauction.renewal.common;

import java.text.DecimalFormat;
import java.util.Locale;

public class SAConst {

    public static final String PAGINATION_DEFAULT_SIZE = "20";
    public static final String PAGINATION_DEFAULT_PAGE = "1";

    public static final String SERVICE_CUSTOMER ="customer";
    public static final String SERVICE_SALE ="sale";
    public static final String SERVICE_PAYMENT ="payment";
    public static final String SERVICE_MAIN ="main";
    public static final String SERVICE_AUCTION ="auction";
    public static final String SERVICE_SELL ="sell";
    public static final String SERVICE_LOGIN ="login";
    public static final String API_LOGIN ="api/login";
    public static final String SERVICE_MYPAGE ="mypage";


    public static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("###,###"); //천단위마다 콤마 ㄱ


    public static String getUrl(String viewName){
        return getUrl("",viewName,null);
    }

    public static String getUrl(String ServiceName , String viewName){
        return getUrl(ServiceName,viewName,null);
    }

    public static String getUrl(String viewName , Locale locale){
        return getUrl("", viewName, locale);
    }

    public static String getUrl(String serviceName , String viewName , Locale locale){

        if("/".equals(viewName)){
            viewName = "";
        }

        String serviceStr = "".equals(serviceName) ? serviceName : serviceName + "/";

        String localeStr = Locale.KOREA.getLanguage();
        if(locale !=null){

            if(Locale.ENGLISH.getLanguage().equals(locale.getLanguage()) ) {
                localeStr = Locale.ENGLISH.getLanguage();
            }
        }

        localeStr += "/";

        return serviceStr + localeStr + viewName;
    }
}


