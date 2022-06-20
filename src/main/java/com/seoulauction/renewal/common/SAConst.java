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
    public static final String SERVICE_SERVICE ="service";
    public static final String SERVICE_FOOTER ="footer";

    public static final String SEVICE_PRIVATE_SALE = "privatesale";

    public static final String PG_NICEPAY ="nice";

    //기존 pay_wait 테이블 기반 kind 종류
    public static final String PAYMENT_KIND_MEMBERSHIP ="membership"; /*정회원 결제를 뜻함*/
    public static final String PAYMENT_KIND_ACADEMY ="academy"; /*아카데미 수강료 결제를 뜻함*/
    public static final String PAYMENT_KIND_WORK ="payment"; /*작품결제를 뜻함*/

    public static final String PAYMENT_METHOD_CARD = "CARD";
    public static final String PAYMENT_METHOD_VBANK = "VBANK";

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


