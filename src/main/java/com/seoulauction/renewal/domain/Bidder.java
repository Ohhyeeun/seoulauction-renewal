package com.seoulauction.renewal.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Bidder {
    @JsonProperty("sale_no")
    private int saleNo;
    @JsonProperty("lot_no")
    private int lotNo;
    @JsonProperty("paddle")
    private int paddle;
    @JsonProperty("user_id")
    private String userId;
    @JsonProperty("token")
    private String token;
    @JsonProperty("sale_type")
    private int saleType;
    @JsonProperty("bid_type")
    private int bidType;
}
