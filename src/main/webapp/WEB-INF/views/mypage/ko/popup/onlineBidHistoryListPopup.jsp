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
                <!-- [0613] 추가 -->
                   <div class="right_txt" ng-if="onlineBidHisList[0].ABORT_YN =='N'">
                       <span>자동응찰설정가 <em>{{onlineBidHisList[0].CURR_CD}} {{comma(onlineBidHisList[0].BID_PRICE)}}</em></span>
                   </div>
                   <!-- //[0613] 추가 -->
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
                                        
                                            <tr ng-repeat="onlineBidhis in onlineBidHisList">
                                                <td>{{onlineBidhis.CURR_CD}} {{comma(onlineBidhis.BID_PRICE)}}</td>
                                                <td>{{onlineBidhis.BID_DT}}</td>
                                                <td>{{onlineBidhis.BID_KIND_NM}} <span ng-if="onlineBidhis.ABORT_YN && onlineBidhis.ABORT_YN =='Y'">중지</span></td>
                                                <td ><span class="succ" ng-if="onlineBidhis.HAMMER_STAT == 'hammer'">낙찰</span></td>
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