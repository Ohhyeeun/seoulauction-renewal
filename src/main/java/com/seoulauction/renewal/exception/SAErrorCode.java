package com.seoulauction.renewal.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum SAErrorCode {


    CONTENTS_IS_NULL("#00001","컨텐츠가 존재하지 않습니다."),
    CUSTOM("#99999","커스텀 메세지");

    public final String code;
    public final String msg;
}
