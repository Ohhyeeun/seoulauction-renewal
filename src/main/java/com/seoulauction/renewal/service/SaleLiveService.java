package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.form.OfflineBiddingForm;
import com.seoulauction.renewal.mapper.aws.MainMapper;
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

    private final MainMapper mainMapper;

    @Value("${image.root.path}")
    private String IMAGE_URL;

    public CommonMap selectLiveSale(CommonMap map){
        return saleLiveMapper.selectLiveSale(map);
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

            if( saUserDetails !=null) {
                map.put("cust_no" , saUserDetails.getUserNo());
                isEmployee.set(saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER")));
            }
            //노이미지 처리.
            if (k.get("IMG_DISP_YN").equals("N") && !isEmployee.get()) {
                k.put("IMAGE_URL", "");
                k.put("LOT_IMG_PATH", "");
                k.put("LOT_IMG_NAME", "/images/bg/no_image.jpg");
            } else {
                k.put("IMAGE_URL", IMAGE_URL);
            }

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

        return saleLiveMapper.selectLiveSaleLotByOne(map);
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

    public CommonMap selectSaleInfo(CommonMap commonMap) {
        CommonMap resultMap = saleLiveMapper.selectSaleInfo(commonMap);
        resultMap.put("buttonList", mainMapper.selectBrochures(commonMap));
        return resultMap;
    }

    public void addBrochureReadCount(CommonMap paramMap) {
        mainMapper.addBrochureReadCount(paramMap);
    }
}

