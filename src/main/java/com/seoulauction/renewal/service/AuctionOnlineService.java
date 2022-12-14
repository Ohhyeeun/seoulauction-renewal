package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.domain.SAUserDetails;
import com.seoulauction.renewal.mapper.aws.ArtistMapper;
import com.seoulauction.renewal.mapper.aws.MainMapper;
import com.seoulauction.renewal.mapper.kt.AuctionOnlineMapper;
import com.seoulauction.renewal.mapper.kt.CertificationMapper;
import com.seoulauction.renewal.mapper.kt.SaleMapper;
import com.seoulauction.renewal.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class AuctionOnlineService {
    @Value("${image.root.path}")
    private String IMAGE_URL;

    private final AuctionOnlineMapper auctionOnlineMapper;

    private final MainMapper mainMapper;

    private final CertificationMapper certificationMapper;

    private final ArtistMapper artistMapper;

    private final S3Service s3Service;

    private final SaleMapper saleMapper;

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

    public CommonMap selectSimpleLotList(CommonMap commonMap) {
        CommonMap map = new CommonMap();
        map.put("list", auctionOnlineMapper.selectSimpleLotListPaging(commonMap));
        map.put("cnt", auctionOnlineMapper.selectSimpleLotListCount(commonMap));

        return map;
    }

    public List<CommonMap> selectLotRefreshList(CommonMap commonMap) {
        return auctionOnlineMapper.selectLotRefreshList(commonMap);
    }

    public CommonMap selectCurrentLotInfo(CommonMap commonMap) {
        return auctionOnlineMapper.selectCurrentLotInfo(commonMap);
    }

    public CommonMap selectLotInfo(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        boolean isEmployee = false;
        if(saUserDetails != null) {
            isEmployee = saUserDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals("ROLE_EMPLOYEE_USER"));
        }

        CommonMap resultMap = auctionOnlineMapper.selectLotInfo(commonMap);
        boolean finalIsEmployee = isEmployee;
        List<CommonMap> imageList = auctionOnlineMapper.selectLotImageList(commonMap);
        imageList.stream().map(c-> {
            if (c.get("IMG_DISP_YN").equals("N") && !finalIsEmployee) {
                c.put("IMAGE_URL", "");
                c.put("FILE_PATH", "");
                c.put("FILE_NAME", "images/bg/no_image.jpg");
            } else {
                c.put("IMAGE_URL", IMAGE_URL);
            }

            return c;
        }).collect(Collectors.toList());
        resultMap.put("imageList", imageList);

        return resultMap;
    }

    public CommonMap selectLotRefreshInfo(CommonMap commonMap) {
        return auctionOnlineMapper.selectLotRefreshInfo(commonMap);
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
            map.put("EMP_NAME" , "????????????");
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

    public CommonMap selectBidList(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }

        CommonMap map = new CommonMap();
        map.put("list", auctionOnlineMapper.selectBidListPaging(commonMap));
        map.put("cnt", auctionOnlineMapper.selectBidListCount(commonMap));

        return map;
    }

    public CommonMap selectCustInfo() {
        CommonMap commonMap = new CommonMap();
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails == null) {
            commonMap.put("CUST_NO", 0);
            commonMap.put("IS_LOGIN", "N");
            commonMap.put("IS_MEMBERSHIP", "N");
            commonMap.put("IS_EMPLOYEE", "N");
            commonMap.put("IS_CUST_REQUIRED", "N");
            return commonMap;
        }

        commonMap.put("cust_no", saUserDetails.getUserNo());
        String isCustRequired = saleMapper.selectCustCheckRequired(commonMap) ? "Y" : "N";
        commonMap = auctionOnlineMapper.selectCustInfo(commonMap);
        commonMap.put("IS_LOGIN", "Y");
        commonMap.put("IS_CUST_REQUIRED", isCustRequired);

        return commonMap;
    }

    public void insertBidOnce(CommonMap commonMap) {
//        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
//        if (saUserDetails != null) {
//            commonMap.put("cust_no", saUserDetails.getUserNo());
//        } else {
//            commonMap.put("cust_no", 0);
//        }
        System.out.println("commonMap: "+commonMap);
        CommonMap bidOnce = auctionOnlineMapper.selectBidOnce(commonMap);
        System.out.println("bidOnce: "+bidOnce);
        if(bidOnce != null){
            List<CommonMap> list = new ArrayList<>();
            list.add(bidOnce);

            CommonMap bidOnceAuto = auctionOnlineMapper.selectBidOnceAuto(bidOnce);
            System.out.println("bidOnceAuto: "+bidOnceAuto);
            if(bidOnceAuto != null){
                list.add(bidOnceAuto);
            }

            Map<String, Object> map = new HashMap<>();
            map.put("list", list);
            System.out.println("map: "+map);

            auctionOnlineMapper.insertBidOnce(map);

            auctionOnlineMapper.updateLotToDt(commonMap);
            long maxBidPrice = auctionOnlineMapper.selectBidMaxBidPrice(commonMap);
            commonMap.put("max_bid_price", maxBidPrice);
            auctionOnlineMapper.updateLotGrowPrice(commonMap);
        }

        auctionOnlineMapper.insertSuccessBid(commonMap);
    }

    public void insertBidAuto(CommonMap commonMap) {
//        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
//        if (saUserDetails != null) {
//            commonMap.put("cust_no", saUserDetails.getUserNo());
//        } else {
//            commonMap.put("cust_no", 0);
//        }
        auctionOnlineMapper.insertBidAuto(commonMap);
        auctionOnlineMapper.insertSuccessBid(commonMap);
    }

    public void updateAutoBidReqCancel(CommonMap commonMap) {
        auctionOnlineMapper.updateAutoBidReqCancel(commonMap);
    }

    public CommonMap selectLastAutoBidReq(CommonMap commonMap) {
        SAUserDetails saUserDetails = SecurityUtils.getAuthenticationPrincipal();
        if (saUserDetails != null) {
            commonMap.put("cust_no", saUserDetails.getUserNo());
        } else {
            commonMap.put("cust_no", 0);
        }
        return auctionOnlineMapper.selectLastAutoBidReq(commonMap);
    }

    public CommonMap selectArtistInfo(CommonMap commonMap) {
        CommonMap resultMap = artistMapper.selectArtistInfo(commonMap);
        if(resultMap != null) {
            resultMap.put("imageList", s3Service.getS3FileDataAll("artist",  resultMap.get("id")));
        }
        return resultMap;
    }
}
