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
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
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
        return settingLotData(saleLiveMapper.selectLiveSale(map));
    }
    public List<CommonMap> selectLiveSaleLots(CommonMap map){

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        return saleLiveMapper.selectLiveSaleLots(map).stream().peek(this::settingLotData).collect(Collectors.toList());
    }
    public CommonMap selectLiveSaleLotByOne(CommonMap map){

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null) {
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        CommonMap result = saleLiveMapper.selectLiveSaleLotByOne(map);

        //만약 라이브경매값이 없는경우 첫번째 랏을 리턴.
        if(result == null) {
            map.put("lot_no" , 1);
            result = saleLiveMapper.selectLiveSaleLotByOne(map);
            result.settingJsonStrToObject();
            result.settingYNValueToBoolean();
        }

        return settingLotData(result);
    }
    public List<CommonMap> selectLiveTypes(CommonMap map){

        List<CommonMap> result = saleLiveMapper.selectLiveTypes(map);

        //간혈적으로 정렬이 안되어 정렬 재적용.
        result.sort((s1 , s2) -> {

                 //타입이 같다면 compareTo 역순.
                 if(s1.getString("TYPE").equals(s2.getString("TYPE"))) {
                    return s2.getString("CD_NM").compareTo(s1.getString("CD_NM"));
                 //기본적으로 compareTo.
                }else {
                    return s1.getString("CD_NM").compareTo(s2.getString("CD_NM"));
                }
        });
        return result;
    }
    public List<CommonMap> selectLiveMyBidding(CommonMap map){


        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        return saleLiveMapper.selectLiveMyBidding(map);
    }
    //현재 응찰 내역 + 랏 현재가 , 호가
    public CommonMap selectLiveSiteBidding(CommonMap map){

        CommonMap resultMap = new CommonMap();
        CommonMap lotOne = selectLiveSaleLotByOne(map);
        resultMap.put("BID_DATA" , saleLiveMapper.selectLiveSiteBidding(map));
        resultMap.put("GROW_PRICE" , lotOne.get("GROW_PRICE"));
        resultMap.put("CURRENT_PRICE" , lotOne.get("LAST_PRICE") !=null ? lotOne.get("LAST_PRICE") : lotOne.get("START_PRICE") );
        resultMap.put("LIVE_ING_YN" , lotOne.get("LIVE_ING_YN"));
        resultMap.put("LIVE_CLOSE_YN" , lotOne.get("LIVE_CLOSE_YN"));
        resultMap.put("IS_WIN" , lotOne.get("IS_WIN"));
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
        //sale_no , lot_no 값 세팅.
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);
        map.put("cust_no" , 0);
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            map.put("cust_no", saUserDetails.getUserNo());
        }

        //!!!!!랏이 마감 되어있는지 체크!! ( 현재가 조정 기능은 가능 )
        if("Y".equals(saleLiveMapper.selectLotClose(map)) && !"price_change".equals(offlineBiddingForm.getBidKindCd()) ){
            throw new SAException("이미 랏이 마감 되었습니다.");
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

        return awsSaleMapper.selectBidNotice(commonMap).stream().peek(this::settingLotData).collect(Collectors.toList());
    }

    @Transactional("ktTransactionManager")
    public void lotSync(CommonMap map){
        //lot no 가 있을경우에는 lot 전용 sync 실행.
        if(map.get("lot_no") !=null){
            saleLiveMapper.updateLotSync2(map);
        } else {
            saleLiveMapper.updateLotSync1(map);
        }
    }

    public void lotLotCloseToggle(CommonMap map){
        saleLiveMapper.updateLotCloseToggle(map);
    }
    public void deleteBidOfflineByBidId(CommonMap map){
        saleLiveMapper.deleteBidOfflineByBidId(map);
    }

    public List<CommonMap> selectSaleLotImages(CommonMap commonMap) {
        return saleLiveMapper.selectSaleLotImages(commonMap);
    }

    public CommonMap selectSaleList(CommonMap map){

        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }
        CommonMap resultMap = new CommonMap();
        resultMap.put("list" , saleLiveMapper.selectSaleList(map).stream().peek(this::settingLotData).collect(Collectors.toList()));
        resultMap.put("count" , saleLiveMapper.selectSaleListCount(map));

        return resultMap;

    }

    //랏 데이터를 세팅 ( 이미지 PATH , MATE )
    private CommonMap settingLotData(CommonMap map){

        if(map !=null) {
            //json stringify -> object
            map.settingJsonStrToObject();
            map.settingYNValueToBoolean();

            //이미지
            map.put("IMAGE_FULL_PATH", "");
            if (map.get("LOT_IMG_PATH") != null && map.get("LOT_IMG_NAME") != null) {
                map.put("IMAGE_FULL_PATH", IMAGE_URL + map.get("LOT_IMG_PATH") + "/" + map.get("LOT_IMG_NAME"));
            } else {
                map.remove("IMAGE_FULL_PATH");
            }
//            map.remove("LOT_IMG_PATH");
//            map.remove("LOT_IMG_NAME");

            //재질
            if (map.get("MATE_CD_KO") != null && map.get("MATE_CD_EN") != null) {

                CommonMap mateMap = new CommonMap();
                mateMap.put("ko", map.get("MATE_CD_KO"));
                mateMap.put("en", map.get("MATE_CD_EN"));

                map.put("MATE_CD", mateMap);
            }

            map.remove("MATE_CD_KO");
            map.remove("MATE_CD_EN");

            //작가 필터
            if(map.get("ARTIST_NAME_JSON") !=null) {
                HashMap<String, Object> artistMap = (HashMap<String, Object>) map.get("ARTIST_NAME_JSON");
                List<String> artistFilters = new ArrayList<>();
                artistFilters.add("김환기");
                artistFilters.add("박수근");
                //작가 정보가 안비어있고, 결과값이 있을경우.
                map.put("IMAGE_MAGNIFY", MapUtils.isNotEmpty(artistMap) && artistFilters.stream().anyMatch(f -> f.equals(artistMap.get("ko"))));
            }

        }
        return map;
    }

}

