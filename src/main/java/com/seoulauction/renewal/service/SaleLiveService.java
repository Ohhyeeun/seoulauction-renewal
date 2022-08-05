package com.seoulauction.renewal.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.form.OfflineBiddingForm;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.aws.AWSSaleMapper;
import com.seoulauction.renewal.mapper.kt.AuctionMapper;
import com.seoulauction.renewal.mapper.kt.SaleLiveMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleLiveService {

    private final SaleLiveMapper saleLiveMapper;

    private final AuctionMapper auctionMapper;

    private final MainMapper mainMapper;

    private final AWSSaleMapper awsSaleMapper;

    @Value("${image.root.path}")
    private String IMAGE_URL;

    private final String JSON_KEY ="JSON";

    private final ObjectMapper mapper = new ObjectMapper();

    public CommonMap selectLiveSale(CommonMap map){

        CommonMap result = saleLiveMapper.selectLiveSale(map);
        if(result !=null){
            result.settingJsonStrToObject();
            result.settingYNValueToBoolean();
        }

        return result;
    }
    public List<CommonMap> selectLiveSaleLots(CommonMap map){

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        AtomicBoolean isEmployee = new AtomicBoolean(false);

        return saleLiveMapper.selectLiveSaleLots(map).stream().map(k->{

            //json stringify -> object
            k.settingJsonStrToObject();
            k.settingYNValueToBoolean();

            k.put("IMAGE_FULL_PATH","");

            if(k.get("LOT_IMG_PATH") !=null && k.get("LOT_IMG_NAME") !=null) {
                k.put("IMAGE_FULL_PATH", IMAGE_URL + k.get("LOT_IMG_PATH") + "/" + k.get("LOT_IMG_NAME"));
            }
            k.remove("LOT_IMG_PATH");
            k.remove("LOT_IMG_NAME");

           return k;
        }).collect(Collectors.toList());
    }
    public CommonMap selectLiveSaleLotByOne(CommonMap map){

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        CommonMap result = saleLiveMapper.selectLiveSaleLotByOne(map);

        if(result !=null) {
            result.settingJsonStrToObject();
            result.settingYNValueToBoolean();
            //값이 만약없을경우 특정조건을 빼고 랏1번으로 재호출.
        } else{
            map.put("lot_no" , 1);
            result = saleLiveMapper.selectLiveSaleLotByOne(map);
            result.settingJsonStrToObject();
            result.settingYNValueToBoolean();
        }

        result.put("IMAGE_FULL_PATH","");

        if(result.get("LOT_IMG_PATH") !=null && result.get("LOT_IMG_NAME") !=null) {
            result.put("IMAGE_FULL_PATH", IMAGE_URL + result.get("LOT_IMG_PATH") + "/" + result.get("LOT_IMG_NAME"));
        }

        result.remove("LOT_IMG_PATH");
        result.remove("LOT_IMG_NAME");

        return result;
    }
    public List<CommonMap> selectLiveCategories(CommonMap map){
        return saleLiveMapper.selectLiveCategories(map);
    }
    public List<CommonMap> selectLiveMyBidding(CommonMap map){
        return saleLiveMapper.selectLiveMyBidding(map);
    }
    public List<CommonMap> selectLiveSiteBidding(CommonMap map){return saleLiveMapper.selectLiveSiteBidding(map);}

    public void insertOfflineBidding(int saleNo , int lotNo , OfflineBiddingForm offlineBiddingForm){

        CommonMap map = new CommonMap();
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);
        map.put("bid_kind_cd", offlineBiddingForm.getBidKindCd());
        map.put("bid_price", offlineBiddingForm.getBidPrice());
        map.put("bid_notice", offlineBiddingForm.getBidNotice());
        map.put("bid_notice_en", offlineBiddingForm.getBidNoticeEn());

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();

        map.put("cust_no" , 0);
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            map.put("cust_no" , saUserDetails.getUserNo());
        }

        saleLiveMapper.insertLiveBidding(map);
    }
    public List<CommonMap> selectSaleExchRate(CommonMap map){
        return saleLiveMapper.selectSaleExchRate(map);
    }

    public List<CommonMap> selectBidNotice(CommonMap commonMap) {

        return awsSaleMapper.selectBidNotice(commonMap).stream().peek(c->{
            c.settingJsonStrToObject();
            c.settingYNValueToBoolean();
        }).collect(Collectors.toList());
    }
    public void lotSync(CommonMap map){
        saleLiveMapper.updateLotSync(map);
    }

    public void lotLotCloseToggle(CommonMap map){
        saleLiveMapper.updateLotCloseToggle(map);
    }

}

