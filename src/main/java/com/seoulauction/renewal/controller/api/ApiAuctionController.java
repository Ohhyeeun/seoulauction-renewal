package com.seoulauction.renewal.controller.api;

import com.seoulauction.renewal.common.RestResponse;
import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.service.AuctionService;
import com.seoulauction.renewal.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("api/auction")
public class ApiAuctionController {

    private final AuctionService auctionService;

    private WebClient webClient = WebClient.builder()
            .baseUrl("http://localhost:8002")
            .build();

    @RequestMapping(value="/bid", method = RequestMethod.POST)
    public ResponseEntity<RestResponse> bid(@RequestBody CommonMap map, HttpServletRequest req, HttpServletResponse res) {
        webClient.post().uri("/bid")
                .bodyValue(map)
                .retrieve()
                .bodyToMono(CommonMap.class)
                .block();

        return ResponseEntity.ok(RestResponse.ok());
    }

    @RequestMapping(value="/saleInfo", method = RequestMethod.POST)
    public ResponseEntity<RestResponse> saleInfo(@RequestBody CommonMap map, HttpServletRequest req, HttpServletResponse res) {
        return ResponseEntity.ok(RestResponse.ok());
    }
}
