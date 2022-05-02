package com.seoulauction.renewal.exception;

import lombok.Getter;
import lombok.Setter;
import okhttp3.internal.http2.ErrorCode;

@Getter
@Setter
public class SAException extends RuntimeException{

    private SAErrorCode errorCode;


    public SAException (SAErrorCode code){
        this.errorCode = code;
    }

    public SAException (String msg){
        super(msg);
    }

}
