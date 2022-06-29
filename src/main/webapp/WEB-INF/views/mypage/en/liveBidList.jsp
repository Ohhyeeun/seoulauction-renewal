<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>Online Paddle Bid History | Seoul Auction</title>
	</head>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<body class="" ng-controller="liveBidListCtl" data-ng-init="loadLiveBidList(1);" ng-cloak>
    <div class="wrapper" ng-app="myApp">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/en/header.jsp" flush="false" />
            <script type="text/javascript" src="/js/mypage/liveBid.js"></script>
            <!-- //header -->

              <!-- container -->
            <div id="container" class="liveBid" >
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
                                                        <span class="tt2">Online Paddle Bid History</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <!-- [0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
                                                <article class="bid-list-wrap">
                                                    <div class="bid-list">
                                                        <dl class="bid-item" ng-repeat="liveBid in liveBidList">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                          <span>{{liveBid[1][0].SALE_TH}}{{liveBid[1][0].SALE_TH_DSP}} {{liveBid[1][0].SALE_TITLE_EN}}</span>
                                                                    </div>
                                                                    <div class="sub">
                                                                        <div class="desc tb1">
                                                                            <span class="tit">Auction Date</span>
                                                                            <span>{{liveBid[1][0].FROM_DT_EN}} </span>
                                                                        </div>
                                                                        <div class="desc tb1">
                                                                            <span class="tit">My Paddle No.</span>
                                                                            <span class="paddle-num">{{liveBid[1][0].PADDLE}}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-area">
                                                                    <button class="btn btn_black btn-view-bid" type="button" ng-if="liveBid[1][0].success_bid_count != 0" ng-click="liveBidHammer({'bid':liveBid[1][0]})"><span>Notification Winning Bid</span></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in liveBid[1]">
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}" alt="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}">
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
                                                                            <div class="desc">{{data.LOT_TITLE_EN}} </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="pay-infobox">
                                                                    <div class="pay-area">
                                                                        <dl class="price">
                                                                            <dt class="tit">Bid</dt>
                                                                            <dd class="txt">{{data.CURR_CD}} {{comma(data.BID_PRICE)}}</dd>
                                                                        </dl>
                                                                        <dl class="price succ">
                                                                            <dt class="tit">Hammer</dt>
                                                                            <dd class="txt" ng-if="data.success_bid_price">{{data.CURR_CD}} {{comma(data.success_bid_price)}}</dd>
                                                                        </dl>
                                                                        <dl class="date">
                                                                            <dt class="tit">Bid Date</dt>
                                                                            <dd class="txt">{{data.BID_DT_EN}}</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button" ng-click="liveBidHis({'bid':data})"><span>Bid History</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="liveBidCnt == 0">
                                                            <p class="txt_empty">No bid History.</p>
                                                        </div>
                                                    </div>
                                                    <div class="wrap_paging" ng-if="liveBidCnt != 0">
														<paging page="currentPage"
															page-size=5
															total="liveBidCnt"
															paging-action="loadLiveBidList(page)"
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
    
	<!-- 팝업 : 라이브경매관리 온라인패들 응찰 이력 -->
	<jsp:include page="popup/liveBidHistoryListPopup.jsp" flush="false"/>
									    
	<!-- 오프라인결제 -->
	<jsp:include page="popup/liveBidSuccessListPopup.jsp" flush="false"/>
    
	<!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>

</body>

</html>