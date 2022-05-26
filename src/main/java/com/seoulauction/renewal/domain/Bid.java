package com.seoulauction.renewal.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Bid {
        @JsonProperty("customer")
        private Bidder bidder;
        @JsonProperty("bid_cost")
        private int bidCost;
}
