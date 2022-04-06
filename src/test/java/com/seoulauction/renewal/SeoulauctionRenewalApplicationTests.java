package com.seoulauction.renewal;

import com.seoulauction.renewal.mapper.TestMapper;
import com.seoulauction.renewal.utill.SlackSender;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SeoulauctionRenewalApplicationTests {

    @Autowired
    TestMapper testMapper;

    @Autowired
    SlackSender slackSender;

    @Test
    void contextLoads() {
        slackSender.postSlackMessage("ddddddddd");
    }

}
