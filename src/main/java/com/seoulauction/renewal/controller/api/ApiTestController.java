package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.S3Service;
import com.seoulauction.renewal.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/test")
public class ApiTestController {

    private final TestService testService;

    private final S3Service s3Service;

    @RequestMapping(value="/good", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> test() {
        CommonMap map = new CommonMap();
        map.put("asdfasdf","asdfasdf");
        map.put("asdfasdf2","asdfasdf2");
        String ddfasd ="asdfasdf";
        return ResponseEntity.ok(RestResponse.ok(map));
    }

    @RequestMapping(value="/pageing", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> test(
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size
    ) {
        return ResponseEntity.ok(RestResponse.ok(testService.test(CommonMap.create(page,size))));
    }

    @PostMapping(value="/fileUpload")
    public ResponseEntity<RestResponse> fileUpload(
            @RequestPart( value = "file" ) final MultipartFile multipartFile,
            @RequestParam(value = "groupName") String groupName,
            @RequestParam(value = "rowId") String rowId
    ) {

        s3Service.insertS3FileData(multipartFile , groupName, rowId);
        return ResponseEntity.ok(RestResponse.ok());
    }

    @GetMapping(value="/fileSelect")
    public ResponseEntity<RestResponse> fileSelect(
            @RequestParam(value = "groupName") String groupName,
            @RequestParam(value = "rowId") String rowId
    ) {

        return ResponseEntity.ok(RestResponse.ok(s3Service.getS3FileData(groupName,rowId)));
    }
}

