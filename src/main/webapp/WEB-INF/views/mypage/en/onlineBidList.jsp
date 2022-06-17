<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<body class="">
    <div class="wrapper" ng-app="myApp">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/en/header.jsp" flush="false" />
            <script type="text/javascript" src="/js/mypage/onlineBid.js"></script>
            <!-- //header -->

            <!-- container -->
                <div id="container" class="onlineBid" ng-controller="onlineBidListCtl" data-ng-init="loadonlineBidList(1);">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_auction">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">Online Auction Bids History</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <!-- [0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
                                                <article class="bid-list-wrap">
                                                    <div class="bid-list">
                                                        <dl class="bid-item" ng-repeat="onlineBid in onlineBidList">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                        <span>{{onlineBid[1][0].SALE_TITLE_EN}}</span>
                                                                    </div>
                                                                    <div class="desc tb1">
                                                                        <span class="tit">Auction Date</span>
                                                                        <span>{{onlineBid[1][0].FROM_DT_EN}} </span>
                                                                    </div>
                                                                </div>
                                                                 <div class="btn-area">
                                                                   <button ng-if="onlineBid[1][0].CLOSE_YN != 'Y'"  class="btn btn_point btn-view-ing" type="button"><a href="/currentAuction?sale_kind=online_only&page=1&lang=ko#page1"><span >View Auction</span></a></button>
                                                                   <button ng-if="onlineBid[1][0].CLOSE_YN == 'Y'"  class="btn btn_gray_line btn-view-result" type="button"><a href="/currentAuction?sale_kind=online_only&page=1&lang=ko#page1"><span>End Auction</span></a></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in onlineBid[1]">
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                     <img src="/nas_img{{data.LOT_IMG}}" alt="">
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'N' && data.BID_PRICE == data.success_bid_price"><span class="bid_result-icon">Hammer</span></div>
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'Y'"><span class="bid_result-icon">Cancel</span></div>
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">{{data.LOT_NO}}</div>
                                                                            <div class="title">
                                                                                <div class="titlename">{{data.ARTIST_NAME_EN}}</div>
                                                                            </div>
                                                                            <div class="desc">{{data.LOT_TITLE_EN}}</div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="pay-infobox">
                                                                    <div class="pay-area">
                                                                        <dl class="price">
                                                                            <dt class="tit">Bid</dt>
                                                                            <dd class="txt">{{data.CURR_CD}} {{comma(bidGroup(data.BID_JSON)[0].BID_PRICE)}}</dd>
                                                                        </dl>
                                                                        <dl class="price succ">
                                                                            <dt class="tit">Hammer</dt>
                                                                            <dd class="txt">{{data.CURR_CD}} {{comma(data.success_bid_price)}}</dd>
                                                                        </dl>
                                                                        <dl class="date">
                                                                            <dt class="tit">Bid Date</dt>
                                                                            <dd class="txt">{{bidGroup(data.BID_JSON)[0].BID_DT_EN}}</dd>
                                                                        </dl>
<!--                                                                         <dl class="way">
                                                                            <dt class="tit"></dt>
                                                                            <dd class="txt">({{bidGroup(data.BID_JSON)[0].BID_KIND_NM}})</dd>
                                                                        </dl> -->
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button" ng-click="onlineBidHis({'bid':data})"><span>Bid History</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="onlineBidCnt == 0">
                                                           <p class="txt_empty">No bid History.</p>
                                                        </div>
                                                    </div>
                                                     <div class="wrap_paging" ng-if="onlineBidCnt != 0">
														<paging page="currentPage"
															page-size=5
															total="onlineBidCnt"
															paging-action="loadonlineBidList(page)"
															scroll-top="true"
															hide-if-empty="true"
															show-prev-next="true"
															show-first-last="true"
															ul-class="page_ul"
															active-class="page_active"
														    disabled-class="page_disable"
														    text-next-class="icon-page_next next page_btn sp_btn btn_next02"
														    text-prev-class="icon-page_prev prev page_btn sp_btn btn_prev02"
														    text-first-class="icon-page_prevprev prev_end page_btn sp_btn btn_prev "
														    text-last-class="icon-page_nextnext next_end page_btn sp_btn btn_next">
														</paging>				
													</div>
                                                </article>
                                                <!-- //[0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-footer"></div>
                            </div>
							<!-- 팝업 : 라이브경매관리 온라인패들 응찰 이력 -->
							    <div id="popup_auction_live_record-wrap" class="trp popupfixed-wrap auction_live_record-popup" >
							        <div class="popup-dim"></div>
							        <div class="popup-align mode-lg mode-mb_full">
							            <div class="popup-vertical">
							                <div class="popup-layer">
							                    <div class="pop-panel">
							                        <div class="pop-header">
							                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
							                            <div class="title-box">
							                                <span class="txt_title type-big"> Bid History</span>
							                            </div>
							                            <!-- [0610] 추가 -->
							                            <div class="right_txt" ng-if="onlineBidHisList[0].ABORT_YN =='N'">
							                                <span>Automatic bid set price <em>{{onlineBidHisList[0].CURR_CD}} {{comma(onlineBidHisList[0].BID_PRICE)}}</em></span>
							                            </div>
							                            <!-- //[0610] 추가 -->
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
							                                            
							                                                <tr ng-repeat="onlineBidhis in onlineBidHisList">
							                                                    <td>{{onlineBidhis.CURR_CD}} {{comma(onlineBidhis.BID_PRICE)}}</td>
							                                                    <td>{{onlineBidhis.BID_DT_EN}}</td>
							                                                    <td>{{onlineBidhis.BID_KIND_NM_EN}} <span ng-if="onlineBidhis.ABORT_YN && onlineBidhis.ABORT_YN =='Y'">Cancel</span></td>
							                                                    <td ><span class="succ" ng-if="onlineBidhis.HAMMER_STAT == 'hammer'">Hammer</span></td>
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
                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/en/footer.jsp" flush="false" />
            <!-- //footer -->

            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>
    </div>


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>

    <script>
        $(".js-history_back").click(function() {
            window.history.back();
        })
    </script>
	
    
    <script>
        (function() {
            var popup_marketing1 = $(".js-popup_auction_live_record").trpLayerFixedPopup("#popup_auction_live_record-wrap");
            $(popup_marketing1.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_marketing1.open(this); // or false   
                popup_fixation("#popup_auction_live_record-wrap"); // pc 스크롤
                popup_motion_open("#popup_auction_live_record-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_auction_live_record-wrap .js-closepop, #popup_auction_live_record-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_marketing1.close();
                popup_motion_close("#popup_auction_live_record-wrap");
            });

            $(".js-history_back").click(function() {
                window.history.back();
            })
        })();
    </script>

</body>

</html>