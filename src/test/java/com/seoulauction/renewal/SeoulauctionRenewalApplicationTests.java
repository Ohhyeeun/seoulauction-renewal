package com.seoulauction.renewal;

import com.seoulauction.renewal.component.SlackSender;
import com.seoulauction.renewal.mapper.TestMapper;
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
        slackSender.sendMessage("ddddddddd");
        slackSender.sendMessage("ddddddddd2");
        slackSender.sendMessage("ddddddddd3");
        slackSender.sendMessage("ddddddddd4");
    }

}
