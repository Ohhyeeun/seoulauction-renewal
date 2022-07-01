package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.common.SAConst;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/admin")
public class ApiAdminController {

    @Value("${admin.token}")
    private String ADMIN_TOKEN;

    private final AdminService adminService;

    @GetMapping("/active-sales")
    public ResponseEntity<RestResponse> activeSales(
            @RequestHeader(value = "Authorization") String auth,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_PAGE) int page,
            @RequestParam(required = false , defaultValue = SAConst.PAGINATION_DEFAULT_SIZE) int size,
            @RequestParam(required = false , defaultValue = "6") int month) {

        if(!ADMIN_TOKEN.equals(auth)){
            throw new SAException("인증 토큰이 올바르지 않습니다.");
        }

        CommonMap map = CommonMap.create(page,size);
        map.put("month" , month);

        return ResponseEntity.ok(RestResponse.ok(adminService.activeSales(map)));
    }

    @GetMapping("/artists/{no}")
    public ResponseEntity<RestResponse> getArtistByNo(
            @RequestHeader(value = "Authorization") String auth,
            @PathVariable("no") int no) {

        if(!ADMIN_TOKEN.equals(auth)){
            throw new SAException("인증 토큰이 올바르지 않습니다.");
        }


        return ResponseEntity.ok(RestResponse.ok(adminService.getArtistByNo(new CommonMap("no" , no))));
    }

    @GetMapping("/codes")
    public ResponseEntity<RestResponse> getCodes(
            @RequestHeader(value = "Authorization") String auth,
            @RequestParam(value = "grp_id", defaultValue = "nation") String grp_id) {

        if(!ADMIN_TOKEN.equals(auth)){
            throw new SAException("인증 토큰이 올바르지 않습니다.");
        }

        return ResponseEntity.ok(RestResponse.ok(adminService.getCode(new CommonMap("grp_id" , grp_id))));
    }


}

