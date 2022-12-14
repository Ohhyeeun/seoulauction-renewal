package com.seoulauction.renewal.util;

import com.seoulauction.renewal.domain.SAUserDetails;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Log4j2
public class SecurityUtils {

    public static SAUserDetails getAuthenticationPrincipal(){

        SAUserDetails userDetails = null;
        Authentication  authentication = SecurityContextHolder.getContext().getAuthentication();
        Object detail = authentication.getDetails();
        if(detail instanceof SAUserDetails){
            userDetails = (SAUserDetails) detail;
        }

        return userDetails;
    }
    public static Boolean checkRole(String Role){

        SAUserDetails userDetails = getAuthenticationPrincipal();
        boolean result = false;
        if(userDetails !=null){
            result = userDetails.getAuthorities().stream().anyMatch(c -> c.getAuthority().equals(Role));
        }
        return result;
    }

}
