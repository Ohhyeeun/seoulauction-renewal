package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.AuctionOnlineMapper;
import com.seoulauction.renewal.mapper.kt.CertificationMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class AuctionOnlineService {
    private final AuctionOnlineMapper auctionOnlineMapper;

    private final MainMapper mainMapper;

    private final CertificationMapper certificationMapper;

    public CommonMap selectSaleInfoList(CommonMap commonMap) {
        CommonMap resultMap = auctionOnlineMapper.selectSaleInfoList(commonMap);
        resultMap.put("buttonList", mainMapper.selectBrochures(commonMap));
        resultMap.put("categoryList", auctionOnlineMapper.selectCategoryList(commonMap));
        resultMap.put("lotTagList", auctionOnlineMapper.selectLotTagList(commonMap));
        return resultMap;
    }

    public CommonMap selectLotList(CommonMap commonMap) {
        CommonMap map = new CommonMap();
        map.put("list", auctionOnlineMapper.selectLotListPaging(commonMap));
        map.put("cnt", auctionOnlineMapper.selectLotListCount(commonMap));

        return map;
    }

    public List<CommonMap> selectLotRefreshList(CommonMap commonMap) {
        return auctionOnlineMapper.selectLotRefreshList(commonMap);
    }

    public CommonMap selectCurrentLotInfo(CommonMap commonMap) {
        return auctionOnlineMapper.selectCurrentLotInfo(commonMap);
    }

    public CommonMap selectLotInfo(CommonMap commonMap) {
        return auctionOnlineMapper.selectLotInfo(commonMap);
    }

    public CommonMap selectManager(){
        int custNo = 0;
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            custNo = saUserDetails.getUserNo();
        }

        CommonMap map = auctionOnlineMapper.selectManager(custNo);
        if(map == null || StringUtils.isEmpty(map.getString("TEL"))){
            map = new CommonMap();
            map.put("EMP_NAME" , "고객센터");
            map.put("EMP_NAME_EN" , "Customer Center");
            map.put("TEL" , "02-395-0330");
        } else if(StringUtils.isEmpty(map.getString("EMP_NAME_EN"))){
            map.put("EMP_NAME_EN" , map.getString("EMP_NAME"));
        }

        return map;
    }

    public List<CommonMap> selectCustInteLotList(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }
        return auctionOnlineMapper.selectCustInteLotList(commonMap);
    }

    public int insertCustInteLotList(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }
        return auctionOnlineMapper.insertCustInteLot(commonMap);
    }


    public int deleteCustInteLotList(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }
        return auctionOnlineMapper.deleteCustInteLot(commonMap);
    }

    public CommonMap selectSaleCertInfo(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }
        return auctionOnlineMapper.selectSaleCertInfo(commonMap);
    }

    public CommonMap insertSaleCert(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }

        auctionOnlineMapper.insertSaleCert(commonMap);
        return commonMap;
    }

    public int updateSaleCert(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
            commonMap.put("action_user_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
            commonMap.put("action_user_no", 0);
        }
        int result = certificationMapper.updateCustHp(commonMap);
        if(result > 0) {
            auctionOnlineMapper.updateSaleCert(commonMap);
        }
        return result;
    }
}
