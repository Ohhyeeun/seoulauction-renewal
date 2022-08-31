package com.seoulauction.renewal.exception;

import com.seoulauction.renewal.domain.CommonMap;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 결제 실패 시 오류 처리 Excetpion.
 */
@Getter
@Setter
@NoArgsConstructor
@Builder
public class PaymentErrorException extends RuntimeException{

    private String payKind;
    private String errorMsg;
    private CommonMap keyMap;

    public PaymentErrorException(String payKind , String errorMsg){
        super(errorMsg);
        this.payKind = payKind;
        this.errorMsg = errorMsg;
    }
    public PaymentErrorException(String payKind , String errorMsg  , CommonMap map){
        super(errorMsg);
        this.payKind = payKind;
        this.errorMsg = errorMsg;
        this.keyMap = map;
    }

}
