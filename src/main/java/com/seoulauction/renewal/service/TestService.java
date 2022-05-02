package com.seoulauction.renewal.service;

import com.seoulauction.renewal.exception.SAErrorCode;
import com.seoulauction.renewal.exception.SAException;
import org.springframework.stereotype.Service;

@Service
public class TestService {


    public void test(){

        String asdf = null;


        if(asdf == null){
            throw new SAException("커스텀 메세지 ㄱㄱ");
        }

    }

}
