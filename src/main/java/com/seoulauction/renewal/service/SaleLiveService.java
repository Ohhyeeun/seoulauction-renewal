package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.form.OfflineBiddingForm;
import com.seoulauction.renewal.mapper.aws.AWSSaleMapper;
import com.seoulauction.renewal.mapper.kt.SaleLiveMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class SaleLiveService {

    private final SaleLiveMapper saleLiveMapper;
    private final AWSSaleMapper awsSaleMapper;
    private final AuctionService auctionService;

    @Value("${image.root.path}")
    private String IMAGE_URL;

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

        return saleLiveMapper.selectLiveSaleLots(map).stream().peek(k->{

            //json stringify -> object
            k.settingJsonStrToObject();
            k.settingYNValueToBoolean();

            //이미지
            k.put("IMAGE_FULL_PATH","");
            if(k.get("LOT_IMG_PATH") !=null && k.get("LOT_IMG_NAME") !=null) {
                k.put("IMAGE_FULL_PATH", IMAGE_URL + k.get("LOT_IMG_PATH") + "/" + k.get("LOT_IMG_NAME"));
            }
            k.remove("LOT_IMG_PATH");
            k.remove("LOT_IMG_NAME");

            //재질
            if( k.get("MATE_CD_KO") !=null && k.get("MATE_CD_EN") !=null ){

                CommonMap mateMap = new CommonMap();
                mateMap.put("ko" , k.get("MATE_CD_KO"));
                mateMap.put("en" , k.get("MATE_CD_EN"));

                k.put("MATE_CD" , mateMap);
            }

            k.remove("MATE_CD_KO");
            k.remove("MATE_CD_EN");

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

        //만약 라이브경매값이 없는경우 첫번째 랏을 리턴.
        if(result == null){
            map.put("lot_no" , 1);
            result = saleLiveMapper.selectLiveSaleLotByOne(map);
            result.settingJsonStrToObject();
            result.settingYNValueToBoolean();
        }

        result.settingJsonStrToObject();
        result.settingYNValueToBoolean();

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
    //현재 응찰 내역 + 랏 현재가 , 호가
    public CommonMap selectLiveSiteBidding(CommonMap map){

        CommonMap resultMap = new CommonMap();
        CommonMap lotOne = selectLiveSaleLotByOne(map);
        resultMap.put("BID_DATA" , saleLiveMapper.selectLiveSiteBidding(map));
        resultMap.put("GROW_PRICE" , lotOne.get("GROW_PRICE"));
        resultMap.put("LAST_PRICE" , lotOne.get("LAST_PRICE"));
        resultMap.put("LIVE_ING_YN" , lotOne.get("LIVE_ING_YN"));
        resultMap.settingYNValueToBoolean();
        return resultMap;
    }

    //동기화 처리.
    public synchronized void insertOfflineBidding(int saleNo , int lotNo , OfflineBiddingForm offlineBiddingForm){

        //비드 카인드가 이상한 값이 들어온경우.
        if( !"online".equals(offlineBiddingForm.getBidKindCd()) &&
            !"price_change".equals(offlineBiddingForm.getBidKindCd()) &&
            !"floor".equals(offlineBiddingForm.getBidKindCd())
        ) {
            throw new SAException("bidKindCd 값이 올바르지 않습니다.");
        }

        CommonMap map = new CommonMap();
        map.put("cust_no" , 0);


        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            map.put("cust_no" , saUserDetails.getUserNo());
        }

        CommonMap lastMap = new CommonMap();
        lastMap.put("sale_no" , saleNo);
        lastMap.put("lot_no" , lotNo);

        //비드 카인드가 online 일경우 paddle 정보를 넣음. )
        switch (offlineBiddingForm.getBidKindCd()) {
            case "online":

                int paddle = auctionService.selectSalePaddNo(map);

                if (paddle == 0) {
                    //비드 카인드가 online 일경우 paddle 변호가 없으면 오류.
                    throw new SAException("패들 번호가 존재 해야 합니다.");
                } else {
                    map.put("padd_no", paddle);
                }

                //floor 값이 아닌데도 notice 값이 있을경우 null 처리
                offlineBiddingForm.setBidNotice(null);
                offlineBiddingForm.setBidNoticeEn(null);
                break;
            //현장 응찰일 때
            case "floor":

                //notice 값이 둘다 있을경우 공지로 간주.
                if (offlineBiddingForm.getBidNotice() != null && offlineBiddingForm.getBidNoticeEn() != null) {
                    //혹시 bidPrice 값이 들어있다면 null 처리.
                    offlineBiddingForm.setBidPrice(null);
                }
                break;
            //현재가 조정일경우
            case "price_change":
                //직원 권한이 있는지 여부 처리.

                if(saUserDetails == null){
                    throw new SAException("로그인을 하지 않았습니다.");
                }

                if(!SecurityUtils.checkRole("ROLE_EMPLOYEE_USER")){
                    throw new SAException("직원이 아닙니다.");
                }
                //floor 값이 아닌데도 notice 값이 있을경우 null 처리
                offlineBiddingForm.setBidNotice(null);
                offlineBiddingForm.setBidNoticeEn(null);
                break;
        }

        CommonMap lastPriceMap = saleLiveMapper.selectBidOfflineForLastPrice(lastMap);
        if(lastPriceMap !=null){
            Long data = (Long) lastPriceMap.get("BID_PRICE");

            if(offlineBiddingForm.getBidPrice()!=null && !offlineBiddingForm.getBidKindCd().equals("price_change")){
                if( data > offlineBiddingForm.getBidPrice()){
                    throw new SAException("현재가 보다 낮은 응찰을 할 수 없습니다.");
                }
            }
        }
        //값 세팅.
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);
        map.put("bid_kind_cd", offlineBiddingForm.getBidKindCd());
        map.put("bid_price", offlineBiddingForm.getBidPrice());
        map.put("bid_notice", offlineBiddingForm.getBidNotice());
        map.put("bid_notice_en", offlineBiddingForm.getBidNoticeEn());

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

