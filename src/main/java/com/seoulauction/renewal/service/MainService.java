package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.KTMainMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class MainService {

    private final MainMapper mainMapper;
    private final KTMainMapper ktMainMapper;
    private final S3Service s3Service;

    @Value("${image.root.path}")
    private String IMAGE_URL;

    public List<CommonMap> selectTopNotice() {
        return mainMapper.selectTopNotice();
    }

    public List<CommonMap> selectBeltBanners() {
        List<CommonMap> resultMap = mainMapper.selectBeltBanners();
        resultMap.forEach(item -> {
            List<CommonMap> imageListMap = s3Service.getS3FileDataAll("main_banner",  item.get("id"));
            CommonMap map = new CommonMap();
            imageListMap.forEach(c-> map.put(c.getString("tag")+"_url",c.getString("cdn_url")));
            item.put("image", map);
        });

        return resultMap;
    }

    public List<CommonMap> selectNewsletters(CommonMap map) {
        return mainMapper.selectNewsletters(map);
    }

    public CommonMap selectMainPopup() {
        CommonMap map = mainMapper.selectPopup();
        if(map !=null) {
            map.put("image", s3Service.getS3FileDataAll("main_popup", map.get("id")));
        }
        return map;
    }

    public CommonMap selectNewsletterById(CommonMap map) {
        return mainMapper.selectNewsletterById(map);
    }

    public void insertNewsletter(CommonMap map){

        CommonMap checkMap = mainMapper.selectNewsletterForOverlapCheck(map);

        if(checkMap != null){
            throw new SAException("해당 정보로 이미 구독한 정보가 있습니다.");
        } else {
            mainMapper.insertNewsletter(map);
            mainMapper.insertNewsletterHistory(map);
        }
    }

    public CommonMap selectAuctions(CommonMap map){

        CommonMap resultMap = new CommonMap();

        boolean isEmployee = false;

        CommonMap counts = ktMainMapper.selectIngMenuCount();
        List<CommonMap> saleList = selectIngAuctions();
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        boolean finalIsEmployee = isEmployee;
        saleList.forEach(c-> {
                CommonMap lotMap = new CommonMap("sale_no" , c.get("SALE_NO"));
                if (saUserDetails != null ) {
                    lotMap.put("cust_no", saUserDetails.getUserNo());
                }

                List<CommonMap> lots = ktMainMapper.selectLotsBySaleNo(lotMap);

                List<CommonMap> customLots = lots.stream().peek(k->{

                    if (k.get("IMG_DISP_YN").equals("N") && !finalIsEmployee) {
                        k.put("IMAGE_URL", "");
                        k.put("FILE_PATH", "");
                        k.put("FILE_NAME", "images/bg/no_image.jpg");
                    } else {
                        k.put("IMAGE_URL", IMAGE_URL);
                    }
                }).collect(Collectors.toList());

                c.put("lots" , customLots );
        });

        resultMap.put("list" , saleList);
        resultMap.put("count" , counts);

        return resultMap;
    }

    public List<CommonMap> selectVideos(CommonMap map) {

        List<CommonMap> mapList = mainMapper.selectVideos(map);
        mapList.stream().forEach(c -> c.put("image", s3Service.getS3FileDataForOne("content_media", c.get("id"))));
        return mapList;
    }

    public List<CommonMap> selectUpcomings() {

        List<CommonMap> resultMapList = ktMainMapper.selectUpcomings();

        resultMapList = resultMapList.stream().map(item -> {
            CommonMap returnMap = new CommonMap();
            returnMap.put("SALE_NO", item.get("SALE_NO"));
            returnMap.put("D_DAY", item.get("D_DAY"));
            returnMap.put("SALE_KIND", item.get("SALE_KIND_CD").equals("online") || item.get("SALE_KIND_CD").equals("online_zb") ? "ONLINE" : "LIVE" );
            returnMap.put("TITLE_BLOB", item.get("TITLE_BLOB"));
            returnMap.put("SALE_TH", item.get("SALE_TH") != null ? item.get("SALE_TH") : "");

            returnMap.put("FROM_DT", item.get("FROM_DT"));
            returnMap.put("TO_DT", item.get("TO_DT"));
            returnMap.put("PREV_FROM_DT", item.get("PREV_FROM_DT"));
            returnMap.put("PREV_TO_DT", item.get("PREV_TO_DT"));

            CommonMap paramMap = new CommonMap();
            paramMap.put("sale_no", item.get("SALE_NO"));
            CommonMap saleImg = new CommonMap();
            if(ktMainMapper.selectSaleSqaureImage(paramMap) != null) {
                saleImg = ktMainMapper.selectSaleSqaureImage(paramMap);
            }

            returnMap.put("FILE_PATH", saleImg.get("FILE_PATH"));
            returnMap.put("FILE_NAME", saleImg.get("FILE_NAME"));

            return returnMap;
        }).collect(Collectors.toList());

        return resultMapList;
    }


    public List<CommonMap> selectIngAuctions(){

        List<CommonMap> resultMapList = ktMainMapper.selectIngAuctions();

        resultMapList = resultMapList.stream().map(item -> {
            CommonMap returnMap = new CommonMap();
            returnMap.put("SALE_NO", item.get("SALE_NO"));
            returnMap.put("SALE_KIND", item.get("SALE_KIND"));
            returnMap.put("SHORT_TITLE", item.get("TINY_TITLE_BLOB"));
            returnMap.put("SALE_TH", item.get("SALE_TH") != null ? item.get("SALE_TH") : "");
            returnMap.put("TITLE_BLOB", item.get("TITLE_BLOB"));
            returnMap.put("FROM_DT", item.get("FROM_DT"));
            returnMap.put("IMG_DISP_YN", item.get("IMG_DISP_YN"));
            returnMap.put("TO_DT", item.get("TO_DT"));
            returnMap.put("DEFAULT_IMAGE_PATH", "");

            CommonMap paramMap = new CommonMap();
            paramMap.put("sale_no", item.get("SALE_NO"));
            CommonMap saleImg = new CommonMap();
            if(ktMainMapper.selectSaleSqaureImage(paramMap) != null) {
                saleImg = ktMainMapper.selectSaleSqaureImage(paramMap);
            }else{
                returnMap.put("DEFAULT_IMAGE_PATH", "/images/pc/thumbnail/gnb_thubnatil_ready.jpg");
            }

            returnMap.put("FILE_PATH", saleImg.get("FILE_PATH"));
            returnMap.put("FILE_NAME", saleImg.get("FILE_NAME"));

            return returnMap;
        }).collect(Collectors.toList());

        return resultMapList;
    }

    public CommonMap selectIngMenuCount(){
        return ktMainMapper.selectIngMenuCount();
    }

    public CommonMap selectHaveToPayWorkCount(Principal principal){
        CommonMap paramMap = new CommonMap();
        paramMap.put("action_user_no", principal.getName());

        int haveToPayCount = ktMainMapper.selectHaveToPayWork(paramMap) == null? 0 : ktMainMapper.selectHaveToPayWork(paramMap).size();

        CommonMap resultMap = new CommonMap();
        resultMap.put("isExist", haveToPayCount > 0 ? true : false);

        return resultMap;
    }

    public List<CommonMap> selectBigBanners() {
        List<CommonMap> resultMap = mainMapper.selectBigBanners();
        resultMap.stream().forEach(item -> {
            List<CommonMap> imageListMap = s3Service.getS3FileDataAll("main_banner",  item.get("id"));
            CommonMap map = new CommonMap();
            imageListMap.forEach(c-> map.put(c.getString("tag")+"_url",c.getString("cdn_url")));
            item.put("image", map);
        });
        return resultMap;
    }

    public List<CommonMap> selectBrochures(CommonMap map) {
        return mainMapper.selectBrochures(map);
    }
    public void addReadCount(CommonMap map){
        mainMapper.addReadCount(map);
    }
}
