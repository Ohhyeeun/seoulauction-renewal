package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.KTMainMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
@RequiredArgsConstructor
@Log4j2
public class MainService {

    private final MainMapper mainMapper;
    private final KTMainMapper ktMainMapper;



    public List<CommonMap> selectTopNotice() {
        return mainMapper.selectTopNotice();
    }

    public List<CommonMap> selectBeltBanners() {
        return mainMapper.selectBeltBanners();
    }

    public List<CommonMap> selectNewsletters(CommonMap map) {
        return mainMapper.selectNewsletters(map);
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
    public List<CommonMap> selectAuctions(CommonMap map){

        List<CommonMap> resultMapList = new ArrayList<>();

        IntStream.range(0 , 12).forEach(c-> {

            if(c > 8){
                c = c % 8 ;
            }
            String pcImgPath = "/images/pc/thumbnail/AuctionBanner_0"+(c+1)+"_280x280.png";
            String moImgPath = "/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png";
            String koName = "문형태";
            String enName = "Moon Hyungtae";
            String price = "200,000,000";
            CommonMap paramMap = new CommonMap();
            paramMap.put("pcImgPath", pcImgPath);
            paramMap.put("moImgPath", moImgPath);
            paramMap.put("koName", koName);
            paramMap.put("enName", enName);
            paramMap.put("price", price);
            resultMapList.add(paramMap);
        });

        Collections.shuffle(resultMapList);

        return resultMapList;
    }

    public List<CommonMap> selectUpcomings() {

        List<CommonMap> resultMapList = ktMainMapper.selectUpcomings();

        resultMapList = resultMapList.stream().map(item -> {
            CommonMap returnMap = new CommonMap();
            returnMap.put("SALE_NO", item.get("SALE_NO"));
            returnMap.put("SALE_KIND", item.get("SALE_KIND_CD").equals("online") || item.get("SALE_KIND_CD").equals("online_zb") ? "ONLINE" : "LIVE" );
            returnMap.put("TITLE_BLOB", item.get("TITLE_BLOB"));

//            int d_day = Integer.parseInt(item.get("DDAY").toString());
            returnMap.put("D_DAY", item.get("DDAY"));

            returnMap.put("FROM_DT", item.get("FROM_DT"));
            returnMap.put("TO_DT", item.get("TO_DT"));

            returnMap.put("FILE_PATH", "/front/online0688");
            returnMap.put("FILE_NAME", "2dc8da32-4760-471b-9bce-f087200a09e9.jpg");

            return returnMap;
        }).collect(Collectors.toList());

        return resultMapList;
    }


    public List<CommonMap> selectIngAuctions(){
        return ktMainMapper.selectIngAuctions();
    }
}

