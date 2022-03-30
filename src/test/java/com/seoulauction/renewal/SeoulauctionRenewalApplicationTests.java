package com.seoulauction.renewal;

import com.seoulauction.renewal.mapper.TestMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SeoulauctionRenewalApplicationTests {

    @Autowired
    TestMapper testMapper;

    @Test
    void contextLoads() {

        System.out.println(testMapper.selectArtist());
    }

}
