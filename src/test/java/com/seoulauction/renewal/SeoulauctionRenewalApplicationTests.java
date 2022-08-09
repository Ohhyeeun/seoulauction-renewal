package com.seoulauction.renewal;

import com.seoulauction.renewal.auth.PasswordEncoderAESforSA;
import com.seoulauction.renewal.component.CurrencyDataManager;
import com.seoulauction.renewal.service.MainService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SeoulauctionRenewalApplicationTests {

    @Autowired
    MainService mainService;

    @Autowired
    PasswordEncoderAESforSA ddd;

    @Autowired
    CurrencyDataManager currencyDataManager;

    @Test
    public void test(){
        currencyDataManager.getCurrency("asdf");
    }

}
