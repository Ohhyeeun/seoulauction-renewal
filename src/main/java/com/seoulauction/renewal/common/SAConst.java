package com.seoulauction.renewal.common;

import java.util.Locale;

public class SAConst {

    public static final String SERVICE_CUSTOMER ="customer";
    public static final String SERVICE_SALE ="sale";
    public static final String SERVICE_MAIN ="main";
//    public static final String SERVICE_CUSTOMER ="customer";
//    public static final String SERVICE_CUSTOMER ="customer";



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
