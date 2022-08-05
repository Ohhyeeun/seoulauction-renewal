package com.seoulauction.renewal.filter;

import org.springframework.web.filter.CharacterEncodingFilter;

public class EucKrEncodingFilter extends CharacterEncodingFilter {
    public EucKrEncodingFilter() {
        System.out.println("EucKrEncodingFilter");
        setEncoding("EUC-KR");
        setForceEncoding(true);
    }
}