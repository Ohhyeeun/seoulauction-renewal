package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.form.OfflineBiddingForm;
import com.seoulauction.renewal.mapper.aws.AWSSaleMapper;
import com.seoulauction.renewal.mapper.aws.ArtistMapper;
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
    private final ArtistMapper artistMapper;

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
            map.put("reentry" , true);
            result = saleLiveMapper.selectLiveSaleLotByOne(map);
            result.settingJsonStrToObject();
            result.settingYNValueToBoolean();
        }

        return settingLotData(result);
    }
    public List<CommonMap> selectLiveTypes(CommonMap map){

        List<CommonMap> result = saleLiveMapper.selectLiveTypes(map);

        //간혈적으로 정렬이 안되어 정렬 재적용.
        result.sort(Comparator.comparing(s -> s.getString("TYPE")));
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
        saleLiveMapper.updateLotSync1(map);
        if(map.get("lot_no") !=null){
            saleLiveMapper.updateLotSync2(map);
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

        String[] lotNoArr = (String[]) map.get("lot_no");
        if(map.get("lot_no") != null) {
            String lotNoStr = "";
            for(int i = 0; i < lotNoArr.length; i++) {
                if(i > 0) lotNoStr += ", " + lotNoArr[i];
                else lotNoStr += lotNoArr[i];
            }
            map.put("lot_no" , lotNoStr);
        }

        CommonMap resultMap = new CommonMap();
        resultMap.put("list" , saleLiveMapper.selectSaleList(map).stream().peek(this::settingLotData).collect(Collectors.toList()));
        resultMap.put("count" , saleLiveMapper.selectSaleListCount(map));

        //LOT NO 배열 순서대로 List 정렬
        if(map.get("lot_no") != null) {
            List<CommonMap> saleList = (List<CommonMap>) resultMap.get("list"); //기존 List
            List<CommonMap> saleListNewLot = new ArrayList<>();
            for(int i = 0; i < lotNoArr.length; i++) {
                for (var item : saleList) {
                    if(item.get("LOT_NO").toString().equals(lotNoArr[i])) {
                        saleListNewLot.add(item);
                        break;
                    }
                }
            }
            resultMap.put("list", saleListNewLot);
        }

        //IMAGE_FULL_PATH 제외 & 직원 여부에 따른 이미지 노출 필터링
        List<CommonMap> saleListEx = (List<CommonMap>) resultMap.get("list");
        for (var item : saleListEx) {
            //직원 여부
            boolean isEmployee = false;
            //만약 로그인을 했고 직원 이면.
            if( saUserDetails !=null) {
                isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
            }
            if (item.get("IMG_DISP_YN").equals("N") && !isEmployee) {
//                item.put("IMAGE_URL", "");
                item.put("LOT_IMG_PATH", "");
                item.put("LOT_IMG_NAME", "/images/bg/no_image.jpg");
            } else {
//                item.put("IMAGE_URL", IMAGE_URL);
            }

            item.remove("IMAGE_FULL_PATH");
            item.remove("IMG_DISP_YN");

        }
        resultMap.put("list", saleListEx);

        //랏이동(pc/mobile) 경우
        if(map.get("device") != null) {
            List<CommonMap> saleList = (List<CommonMap>) resultMap.get("list");
            log.info("saleList : {}", saleList);
            List<CommonMap> saleListNew = new ArrayList<>();
            CommonMap saleListNewItem;
            if(map.get("device").equals("pc")) {
                for (var item : saleList) {
                    saleListNewItem = new CommonMap();
                    saleListNewItem.put("LOT_NO", item.get("LOT_NO"));
                    saleListNewItem.put("LOT_IMG_PATH", item.get("LOT_IMG_PATH"));
                    saleListNewItem.put("LOT_IMG_NAME", item.get("LOT_IMG_NAME"));
                    saleListNew.add(saleListNewItem);
                }
            } else if(map.get("device").equals("mo")) {
                for (var item : saleList) {
                    saleListNewItem = new CommonMap();
                    saleListNewItem.put("LOT_NO", item.get("LOT_NO"));
                    saleListNewItem.put("LOT_IMG_PATH", item.get("LOT_IMG_PATH"));
                    saleListNewItem.put("LOT_IMG_NAME", item.get("LOT_IMG_NAME"));
                    saleListNewItem.put("ARTIST_NAME_JSON", item.get("ARTIST_NAME_JSON"));
                    saleListNewItem.put("LOT_TITLE_JSON", item.get("LOT_TITLE_JSON"));
                    saleListNewItem.put("FAVORITE_YN", item.get("FAVORITE_YN"));
                    saleListNew.add(saleListNewItem);
                }
            }

            log.info("saleListNew : {}", saleListNew);
            resultMap.put("list", saleListNew);
        }

        return resultMap;
    }


    public CommonMap selectLotInfo(CommonMap map){
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if(saUserDetails !=null){
            map.put("cust_no" , saUserDetails.getUserNo());
        } else {
            map.put("cust_no" , 0);
        }

        CommonMap lotInfoMap = settingLotData(saleLiveMapper.selectLotInfo(map));
        //직원 여부
        boolean isEmployee = false;
        //만약 로그인을 했고 직원 이면.
        if( saUserDetails !=null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }
        if (lotInfoMap.get("IMG_DISP_YN").equals("N") && !isEmployee) {
            lotInfoMap.put("IMAGE_URL", "");
            lotInfoMap.put("LOT_IMG_PATH", "");
            lotInfoMap.put("LOT_IMG_NAME", "/images/bg/no_image.jpg");
        } else {
            lotInfoMap.put("IMAGE_URL", IMAGE_URL);
        }
        //IMAGE_FULL_PATH 제외
        lotInfoMap.remove("IMAGE_FULL_PATH");

        return lotInfoMap;
    }
    public List<CommonMap> selectAdminOffBid(CommonMap map){
        return saleLiveMapper.selectAdminOffBid(map);
    }

    public CommonMap selectAdminSaleInfo(CommonMap map){
        return settingLotData(saleLiveMapper.selectAdminSaleInfo(map));
    }

    /**
     * 랏 동기화 이후 해당 데이터를 가져옴.
     * @param map
     * @return
     */
    public CommonMap selectAdminLotInfo(CommonMap map){

        //랏 동기화.
        //lotSync(map);

        CommonMap resultMap = new CommonMap();
        resultMap.put("lot" , settingLotData(saleLiveMapper.selectAdminLotInfo(map)));
        resultMap.put("off_list" , saleLiveMapper.selectAdminOffBid(map));

        return resultMap;
    }

    public CommonMap selectArtistInfo(CommonMap commonMap) { return settingLotData(artistMapper.selectArtistInfo(commonMap)); }

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

