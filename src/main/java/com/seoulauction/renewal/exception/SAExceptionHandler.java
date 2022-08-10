package com.seoulauction.renewal.exception;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.component.SlackSender;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.util.ExceptionUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.Locale;

import static com.seoulauction.renewal.common.SAConst.SERVICE_ERROR;

@Log4j2
@ControllerAdvice
@RequiredArgsConstructor
public class SAExceptionHandler {

    private final SlackSender slackSender;

    //404 페이지 낫 파운드 , 혹은 잘못된 접근 ( POST 요청인데 Get 으로한경우 등등. )
    @ExceptionHandler({PgNotFoundException.class , NoHandlerFoundException.class , HttpRequestMethodNotSupportedException.class  , MissingServletRequestParameterException.class})
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String error404(Locale locale){
        log.info("404 {}", locale);
        return SAConst.getUrl(SERVICE_ERROR , "error_404" , locale);
    }

    //Rest API 에서 나오는 오류 캐치. ( RestResponse 리턴!! )
    @ExceptionHandler(SAException.class)
    public ResponseEntity<RestResponse> saException(SAException e){
        String errorMsg = ExceptionUtils.getStackTrace(e);
        log.error(errorMsg);
        slackSender.sendMessage(errorMsg);

        CommonMap map = new CommonMap();

        String msg = e.getMessage();

        SAErrorCode code = e.getErrorCode();

        if(code !=null) {
            map.put("code", code.getCode());
            msg = code.getMsg();
        }

        map.put("msg", msg);

        return ResponseEntity.ok(
                RestResponse.builder().success(false)
                .data(map)
                .build());
    }

    //서버에서 오류난경우 오류페이지로 리턴시킬때 사용.( 500 에러페이지 리턴! )
    @ExceptionHandler(InternalServerException.class)
    public String InternalSererException(Exception e , Locale locale){

        String errorMsg = ExceptionUtils.getStackTrace(e);
        log.error(errorMsg);
        slackSender.sendMessage(errorMsg);

        return SAConst.getUrl(SERVICE_ERROR , "error_500" , locale);
    }

    //서버에서 오류난경우 오류페이지로 리턴시킬때 사용.( 500 에러페이지 리턴! )
    @ExceptionHandler(PaymentErrorException.class)
    public String PaymentErrorException(Exception e , Locale locale){

        String errorMsg = ExceptionUtils.getStackTrace(e);
        log.error(errorMsg);
        slackSender.sendMessage(errorMsg);

        return SAConst.getUrl(SERVICE_ERROR , "error_pay" , locale);
    }



    //그외 심각한 오류들
    @ExceptionHandler(Exception.class)
    public String intervalException(Exception e , Locale locale){

        String errorMsg = ExceptionUtils.getStackTrace(e);
        log.error(errorMsg);
        slackSender.sendMessage(errorMsg);
        return SAConst.getUrl(SERVICE_ERROR , "error_500" , locale);
    }

}
