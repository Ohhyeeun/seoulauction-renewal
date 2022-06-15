package com.seoulauction.renewal.util;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.http.HttpServletRequest;

public class TagLibrary {
    public static String getJSONString(String text, String locale) throws ParseException {
        JSONParser parser = new JSONParser();
        JSONObject jsonObj = (JSONObject) parser.parse(text);

        return (String) jsonObj.get(locale);
    }

    public static boolean isMobile(HttpServletRequest req) {
        String userAgent = req.getHeader("User-Agent").toUpperCase();

        if(userAgent.indexOf("MOBI") > -1) {
            return true;
        } else {
            return false;
        }
    }
}
