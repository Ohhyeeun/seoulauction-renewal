package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.S3Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/s3")
public class ApiS3Controller {

    private final S3Service s3Service;

    @Value("${admin.token}")
    private String ADMIN_TOKEN;

    @PostMapping(value="/fileUploads")
    public ResponseEntity<RestResponse> fileUploads(
            @RequestHeader (value = "Authorization") String auth,
            @RequestPart( value = "files" ) List<MultipartFile> files,
            @RequestParam(value = "isPrivate" , defaultValue = "false") Boolean isPrivate,
            @RequestParam(value = "groupName") String groupName,
            @RequestParam(value = "rowId") String rowId
    ) {

        if(!ADMIN_TOKEN.equals(auth)){
            throw new SAException("인증 토큰이 올바르지 않습니다.");
        }

        s3Service.insertS3FileData(isPrivate , files , groupName, rowId);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @PostMapping(value="/fileUpload")
    public ResponseEntity<RestResponse> fileUpload(
            @RequestHeader (value = "Authorization") String auth,
            @RequestPart( value = "files" ) MultipartFile files,
            @RequestParam(value = "isPrivate" , defaultValue = "false") Boolean isPrivate,
            @RequestParam(value = "groupName") String groupName,
            @RequestParam(value = "rowId") String rowId
    ) {
        if(!ADMIN_TOKEN.equals(auth)){
            throw new SAException("인증 토큰이 올바르지 않습니다.");
        }

        s3Service.insertS3FileData(isPrivate , files , groupName, rowId);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @GetMapping(value="/fileSelect")
    public ResponseEntity<RestResponse> fileSelect(
            @RequestHeader (value = "Authorization") String auth,
            @RequestParam(value = "groupName") String groupName,
            @RequestParam(value = "rowId") String rowId
    ) {
        if(!ADMIN_TOKEN.equals(auth)){
            throw new SAException("인증 토큰이 올바르지 않습니다.");
        }

        return ResponseEntity.ok(RestResponse.ok(s3Service.getS3FileData(groupName,rowId)));
    }
}

