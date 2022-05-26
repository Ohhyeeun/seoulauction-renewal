package com.seoulauction.renewal.utill;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class TagLibrary {
    public static String getJSONString(String text, String locale) throws ParseException {
        JSONParser parser = new JSONParser();
        JSONObject jsonObj = (JSONObject) parser.parse(text);

        return (String) jsonObj.get(locale);
    }
}
