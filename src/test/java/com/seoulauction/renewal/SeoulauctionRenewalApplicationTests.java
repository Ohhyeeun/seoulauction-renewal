package com.seoulauction.renewal;

import com.seoulauction.renewal.service.MainService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SeoulauctionRenewalApplicationTests {

    @Autowired
    MainService mainService;

    @Test
    public void test(){
        mainService.selectAuctions(null);
    }

}
