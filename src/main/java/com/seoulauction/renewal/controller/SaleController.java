package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.SaleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.Locale;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping(SAConst.SERVICE_SALE)
public class SaleController {

    private final SaleService saleService;

    @GetMapping("/test")
    public String login(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_SALE , "test" , locale);
    }

    @GetMapping("/search")
    public String search(Locale locale) {
        return SAConst.getUrl(SAConst.SERVICE_SALE , "search" , locale);
    }

    @RequestMapping(value="/searchList" , method = RequestMethod.POST)
    public ResponseEntity<RestResponse> searchList(
            @RequestBody CommonMap map, Principal principal) throws Exception {

        if(principal == null){
            map.put("action_user_no", 126211);
        }else{
            map.put("action_user_no", principal.getName());
        }
        map.put("list_type", "SEARCH");
        map.put("for_count", true);

        return ResponseEntity.ok(RestResponse.ok(saleService.search_list_paging(map)));
    }

    @RequestMapping(value="/addCustInteLot")
    public ResponseEntity<RestResponse> addCustInteLot(
            @RequestParam(required = true) int saleNo, int lotNo, Locale locale, Principal principal) throws Exception {

        CommonMap map = new CommonMap();
        if(principal == null){
            map.put("action_user_no", 126211);
        }else{
            map.put("action_user_no", principal.getName());
        }
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(saleService.add_cust_inte_lot(map)));
    }

    @RequestMapping(value="/delCustInteLot")
    public ResponseEntity<RestResponse> delCustInteLot(
            @RequestParam(required = true) int saleNo, int lotNo, Locale locale, Principal principal) throws Exception {

        CommonMap map = new CommonMap();
        if(principal == null){
            map.put("action_user_no", 126211); //principal 안넘어와서 더미 데이터
        }else{
            map.put("action_user_no", principal.getName());
        }
        map.put("sale_no", saleNo);
        map.put("lot_no", lotNo);

        return ResponseEntity.ok(RestResponse.ok(saleService.del_cust_inte_lot(map)));
    }

    @RequestMapping(value = "/selectRecommandArtist", method = RequestMethod.GET)
    public ResponseEntity<RestResponse> selectRecommandArtist(){
        return ResponseEntity.ok(RestResponse.ok(saleService.selectRecommandArtist()));
    }
}

