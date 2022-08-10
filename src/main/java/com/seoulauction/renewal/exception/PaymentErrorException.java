package com.seoulauction.renewal.exception;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 결제 실패 시 오류 처리 Excetpion.
 */
@Getter
@Setter
@NoArgsConstructor
public class PaymentErrorException extends RuntimeException{

    public PaymentErrorException(String msg){
        super(msg);
    }

}
