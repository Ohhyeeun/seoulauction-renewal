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
                                        
                                            <tr ng-repeat="liveBidhis in liveBidHisList">
                                                <td>KRW {{comma(liveBidhis.BID_PRICE)}}</td>
                                                <td>{{liveBidhis.BID_DT}}</td>
                                                <td>온라인응찰</td>
                                                <td ><span class="succ" ng-if="liveBidhis.HAMMER_STAT == 'hammer'">낙찰</span></td>
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