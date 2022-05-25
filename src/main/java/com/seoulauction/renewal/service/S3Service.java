package com.seoulauction.renewal.service;

import com.seoulauction.renewal.component.S3Uploader;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.mapper.aws.S3Mapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class S3Service {

    private final S3Mapper s3Mapper;

    private final S3Uploader s3Uploader;

    @Value("${aws.s3.url}")
    String S3_BASE_URL;

    @Value("${aws.cdn.url}")
    String S3_CDN_BASE_URL;

    @Value("${aws.s3.image.base.url}")
    String S3_IMAGE_BASE_URL;

    @Value("${aws.s3.private.image.base.url}")
    String S3_PRIVATE_IMAGE_BASE_URL;

    //S3 업로드 이후 디비에 저장.
    private CommonMap insertS3File(Boolean isPrivate , MultipartFile uploadFile , String tableName , String rowId) throws IOException {

        //파일 이름.
        String origName = uploadFile.getOriginalFilename();
        String[] fileSplit = origName.split("\\.");

        //파일 확장자.
        final String name = fileSplit[0];
        final String ext = fileSplit[1];

        final long fileSize = uploadFile.getSize();
        String contentType = uploadFile.getContentType();

        String path = s3Uploader.upload(uploadFile,(isPrivate ? S3_PRIVATE_IMAGE_BASE_URL : S3_IMAGE_BASE_URL )  + "/" + tableName + "/" + rowId);

        CommonMap paramMap = null;

        if(path != null) {

            paramMap = new CommonMap();
            paramMap.put("name", name);
            paramMap.put("ext", ext);
            paramMap.put("path", path);
            paramMap.put("mimetype", contentType);
            paramMap.put("filesize", fileSize);
            paramMap.put("url", S3_BASE_URL + path);
            paramMap.put("cdn_url", S3_CDN_BASE_URL + path);

            log.info("origName : {}", origName);
            log.info("ext : {}", ext);
            log.info("fileSize : {}", fileSize);
            log.info("contentType : {}", contentType);
            log.info("url : {}", path);

            s3Mapper.insertS3File(paramMap);
        }
        return paramMap;
    }

    /**
     * @param isPrivate - s3 파일 외부 공개 여부.
     * @param uploadFile - s3 업로드 될 파일.
     * @param tableName - s3파일이 필요한 테이블.
     * @param rowId - s3파일이 필요한 테이블의 row Id.
     */
    @Transactional("ktTransactionManager")
    public void insertS3FileData(boolean isPrivate , MultipartFile uploadFile , String tableName , String rowId) {

            //성공적으로 업로드 된경우!! s3file_id 값이 map 에 담김.
        CommonMap map = null; // s3업로드.

        try {
            map = insertS3File(isPrivate , uploadFile , tableName , rowId);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(map != null) {
            map.put("table_name", tableName);
            map.put("row_id", rowId);
            s3Mapper.insertS3FileData(map);
        }
    }

    //img 모든 데이터를 리턴.
    public List<CommonMap> getS3FileDataAll(String tableName , Object rowId) {
        CommonMap map = new CommonMap();
        map.put("table_name",tableName);
        map.put("row_id",rowId);
        return s3Mapper.selectS3FileData(map);
    }

    //img STR LIST를 리턴.
    public List<String> getS3FileData(String tableName , Object rowId) {

        CommonMap map = new CommonMap();
        map.put("table_name",tableName);
        map.put("row_id",rowId);
        List<CommonMap> resultMap = s3Mapper.selectS3FileData(map);
        log.info("resultMap : {}" , resultMap);
        return resultMap.stream().map(c->c.getString("cdn_url")).collect(Collectors.toList());
    }

    //IMG STR 한개를 리턴.
    public String getS3FileDataForOne(String tableName , Object rowId) {
        CommonMap map = new CommonMap();
        map.put("table_name",tableName);
        map.put("row_id",rowId);
        map.put("is_one" , true);
        List<CommonMap> resultMapList = s3Mapper.selectS3FileData(map);
        CommonMap returnMap = new CommonMap();
        //is_one 이면 무조건 데이터는 1개.
        if(CollectionUtils.isNotEmpty(resultMapList) && resultMapList.size() == 1){
            returnMap = resultMapList.get(0);
        }

        return Optional.ofNullable(returnMap).map(c->c.getString("cdn_url"))
                .orElse("");
    }

}
