   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div id="popup_auction_live_record-wrap" class="trp popupfixed-wrap auction_live_record-popup" >
        <div class="popup-dim"></div>
        <div class="popup-align mode-lg mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">
                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">응찰 내역</span>
                            </div>
                            <!-- [0617] 수정 -->
                            <div class="right_txt">
                                <span>자동응찰설정가 <em>KRW 999,999,999</em></span>
                            </div>
                        </div>
                        <div class="pop-body">
                            <section class="section">
                                <article class="article-area thead_item-wrap">
                                    <div class="table-wrap thead_item">
                                        <table class="table_base data-table auction-bid-history">
                                            <thead>
                                                <tr>
                                                    <th>응찰가</th>
                                                    <th>응찰일자</th>
                                                    <th>응찰방법</th>
                                                    <th>비고</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </article>
                                <article class="article-area scroll-type mCustomScrollbar tbody_item-wrap">
                                    <div class="table-wrap">
                                        <table class="table_base data-table auction-bid-history">
                                            <tbody>
                                            
<%--                                                <tr ng-repeat="liveBidReqhis in liveBidReqHisList">--%>
<%--                                                    <td>{{liveBidReqhis.CURR_CD}} {{comma(liveBidReqhis.BID_PRICE)}}</td>--%>
<%--                                                    <td>{{liveBidReqhis.REQ_DT}}</td>--%>
<%--                                                    <td>{{liveBidReqhis.BID_KIND_NM}}</td>--%>
<%--                                                    <td><span class="succ" ng-if="liveBidReqhis.HAMMER_STAT == 'hammer'">낙찰</span></td>--%>
<%--                                                </tr>--%>
<tr>
    <td>KRW 1,500,000</td>
    <td>2022.04.20 15:02:14</td>
    <td>1회 응찰</td>
    <td><span class="succ">낙찰</span></td>
</tr>
<tr>
    <td>KRW 900,000</td>
    <td>2022.04.20 15:01:22</td>
    <td>자동 응찰 중지</td>
    <td></td>
</tr>
<tr>
    <td>KRW 800,000</td>
    <td>2022.04.20 15:00:45</td>
    <td>자동 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 700,000</td>
    <td>2022.04.20 14:59:50</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 600,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 500,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 500,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 1,500,000</td>
    <td>2022.04.20 15:02:14</td>
    <td>1회 응찰</td>
    <td><span class="succ">낙찰</span></td>
</tr>
<tr>
    <td>KRW 900,000</td>
    <td>2022.04.20 15:01:22</td>
    <td>자동 응찰 중지</td>
    <td></td>
</tr>
<tr>
    <td>KRW 800,000</td>
    <td>2022.04.20 15:00:45</td>
    <td>자동 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 700,000</td>
    <td>2022.04.20 14:59:50</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 600,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 500,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 500,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 1,500,000</td>
    <td>2022.04.20 15:02:14</td>
    <td>1회 응찰</td>
    <td><span class="succ">낙찰</span></td>
</tr>
<tr>
    <td>KRW 900,000</td>
    <td>2022.04.20 15:01:22</td>
    <td>자동 응찰 중지</td>
    <td></td>
</tr>
<tr>
    <td>KRW 800,000</td>
    <td>2022.04.20 15:00:45</td>
    <td>자동 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 700,000</td>
    <td>2022.04.20 14:59:50</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 600,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 500,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
<tr>
    <td>KRW 500,000</td>
    <td>2022.04.20 14:59:10</td>
    <td>1회 응찰</td>
    <td></td>
</tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </article>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>