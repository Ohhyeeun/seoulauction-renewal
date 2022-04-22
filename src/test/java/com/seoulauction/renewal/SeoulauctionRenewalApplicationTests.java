package com.seoulauction.renewal;

import com.seoulauction.renewal.service.TestService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SeoulauctionRenewalApplicationTests {


    @Autowired
    TestService testService;

    @Test
    void contextLoads() {
        System.out.println("asdfasd : " + testService.selectArtistTest());
    }

}
