package com.seoulauction.renewal.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OfflineBiddingForm {
    private String bidKindCd;
    private Long bidPrice;
    private String bidNotice;
    private String bidNoticeEn;
}
