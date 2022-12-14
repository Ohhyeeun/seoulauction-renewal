package com.seoulauction.renewal.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RestResponse {

    Boolean success;
    Object data;
    String info;

    public static RestResponse ok() {
        return ok(null);
    }
    public static RestResponse ok(Object data){
        return RestResponse.builder()
                .success(Boolean.TRUE)
                .data(data)
                .build();
    }
}
