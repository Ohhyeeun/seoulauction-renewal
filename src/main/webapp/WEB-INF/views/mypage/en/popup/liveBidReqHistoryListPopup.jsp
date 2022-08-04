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
                                <span class="txt_title type-big">Bid History</span>
                            </div>
                            <!-- [0617] 수정 -->
                           <!--  <div class="right_txt">
                                <span>Automatic bid set price<em>KRW 999,999,999</em></span> 
                            </div> -->
                            <!-- //[0617] 수정 -->
                        </div>
                         <div class="pop-body">
                             <section class="section">
                                 <article class="article-area thead_item-wrap">
                                     <div class="table-wrap thead_item">
                                         <table class="table_base data-table auction-bid-history">
                                            <thead>
                                                <tr>
                                                    <th>Bid Price</th>
                                                    <th>Bid Date</th>
                                                    <th>Bid Method</th>
                                                    <th>etc</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                 </article>
                                 <article class="article-area scroll-type mCustomScrollbar tbody_item-wrap">
                                     <div class="table-wrap">
                                         <table class="table_base data-table auction-bid-history">
                                            <tbody>
                                                <tr ng-repeat="liveBidReqhis in liveBidReqHisList">
                                                    <td>{{liveBidReqhis.CURR_CD}} {{comma(liveBidReqhis.BID_PRICE)}}</td>
                                                    <td>{{liveBidReqhis.REQ_DT_EN}}</td>
                                                    <td>{{liveBidReqhis.BID_KIND_NM_EN}}</td>
                                                    <td ><span class="succ" ng-if="liveBidReqhis.HAMMER_STAT == 'hammer'">Hammer</span></td>
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