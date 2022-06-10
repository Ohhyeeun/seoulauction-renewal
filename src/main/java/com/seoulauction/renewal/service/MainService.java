package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.KTMainMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class MainService {

    private final MainMapper mainMapper;
    private final KTMainMapper ktMainMapper;
    private final S3Service s3Service;

    public List<CommonMap> selectTopNotice() {
        return mainMapper.selectTopNotice();
    }

    public List<CommonMap> selectBeltBanners() {
        List<CommonMap> resultMap = mainMapper.selectBeltBanners();
        resultMap.stream().forEach(item -> {
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

    public CommonMap selectPopup() {
        CommonMap map = mainMapper.selectPopup();
        map.put("image", s3Service.getS3FileDataForOne("main_popup", map.get("id")));
        return map;
    }

    public CommonMap selectNewsletterById(CommonMap map) {
        return mainMapper.selectNewsletterById(map);
    }

    public void insertNewsletter(CommonMap map){

        CommonMap checkMap = mainMapper.selectNewsletterForOverlapCheck(map);

        if(checkMap != null){
            throw new SAException("해당 정보로 이미 구독한 정보가 있습니다.");
        }
        mainMapper.insertNewsletter(map);
    }

    //어떤 테이블을 참조할지 모르기때문 우선 더미데이텨 리턴.
    public CommonMap selectAuctions(CommonMap map){

        CommonMap resultMap = new CommonMap();

        CommonMap counts = ktMainMapper.selectIngMenuCount();
        List<CommonMap> saleList = ktMainMapper.selectIngAuctions();
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        saleList.forEach(c-> {
                CommonMap lotMap = new CommonMap("sale_no" , c.get("SALE_NO"));
                if (saUserDetails != null ) {
                    lotMap.put("cust_no", saUserDetails.getUserNo());
                }
                c.put("lots" , ktMainMapper.selectLotsBySaleNo(lotMap));
        });

        List<CommonMap> test2 = new ArrayList<>();

        test2.add(saleList.get(0));
        test2.add(saleList.get(0));
        test2.add(saleList.get(0));

        resultMap.put("count" , counts);
        resultMap.put("list" , test2);

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
            returnMap.put("SALE_KIND", item.get("SALE_KIND_CD").equals("online") || item.get("SALE_KIND_CD").equals("online_zb") ? "ONLINE" : "LIVE" );
            returnMap.put("TITLE_BLOB", item.get("TITLE_BLOB"));

            returnMap.put("D_DAY", item.get("DDAY"));

            returnMap.put("FROM_DT", item.get("FROM_DT"));
            returnMap.put("TO_DT", item.get("TO_DT"));
            returnMap.put("OPEN_DT", item.get("OPEN_DT"));

            CommonMap paramMap = new CommonMap();
            paramMap.put("sale_no", item.get("SALE_NO"));
            CommonMap saleImg = new CommonMap();
            if(ktMainMapper.selectSaleImage(paramMap) != null) {
                saleImg = ktMainMapper.selectSaleImage(paramMap);
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
            returnMap.put("TITLE_BLOB", item.get("TITLE_BLOB"));
            returnMap.put("FROM_DT", item.get("FROM_DT"));
            returnMap.put("TO_DT", item.get("TO_DT"));

            CommonMap paramMap = new CommonMap();
            paramMap.put("sale_no", item.get("SALE_NO"));
            CommonMap saleImg = new CommonMap();
            if(ktMainMapper.selectSaleImage(paramMap) != null) {
                saleImg = ktMainMapper.selectSaleImage(paramMap);
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

}
