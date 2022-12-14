<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<body class="" ng-controller="liveBidReqListCtl" data-ng-init="loadLiveBidReqList(1);" ng-cloak>
    <div class="wrapper" ng-app="myApp">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/en/nav.jsp" flush="false" />
            <!-- //header -->

            <!-- container -->
                <div id="container" class="liveBidReq" >
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
                                                        <span class="tt2">Live Auction Bids History</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <!-- [0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
                                                <article class="bid-list-wrap">
                                                    <div class="bid-list">
                                                        <dl class="bid-item" ng-repeat="liveBidReq in liveBidReqList">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                        <span>{{liveBidReq[1][0].SALE_TH}}{{liveBidReq[1][0].SALE_TH_DSP}} {{liveBidReq[1][0].SALE_TITLE_EN}}</span>
                                                                    </div>
                                                                    <div class="desc tb1">
                                                                        <span class="tit">Auction Date</span>
                                                                        <span>{{liveBidReq[1][0].TO_DT_EN}} </span>
                                                                    </div>
                                                                </div>
                                                                 <div class="btn-area">
                                                                   <button ng-if="liveBidReq[1][0].CLOSE_YN != 'Y'"  class="btn btn_point btn-view-ing" type="button"><a ng-click="goSale(liveBidReq[1][0].SALE_NO)"><span >View Auction</span></a></button>
                                                                   <button ng-if="liveBidReq[1][0].CLOSE_YN == 'Y'"  class="btn btn_gray_line btn-view-result" type="button"><a ng-click="goSale(liveBidReq[1][0].SALE_NO)"><span>View Result</span></a></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in liveBidReq[1]">
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <a href="#" ng-click="goLotDetail(data.SALE_NO, data.LOT_NO)" class="img-align" ng-if="liveBidReq[1][0].CLOSE_YN != 'Y'" > <%-- 경매 진행 중 일 떄만 해당 작품 상세페이지로 경매 마감 시 링크 닫음 --%>
                                                                                     <img src="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}" alt="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}">
                                                                                </a >
                                                                                <a class="img-align" ng-if="liveBidReq[1][0].CLOSE_YN == 'Y'" > <%-- 경매 진행 중 일 떄만 해당 작품 상세페이지로 경매 마감 시 링크 닫음 --%>
                                                                                     <img src="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}" alt="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}">
                                                                                </a >
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
                                                                            <dd class="txt" ng-if="data.BID_KIND_CD != 'phone'">{{data.CURR_CD}} {{comma(data.BID_PRICE)}}</dd>
                                                                        </dl>
                                                                        <dl class="price succ">
                                                                            <dt class="tit">Hammer</dt>
                                                                            <dd class="txt" ng-if="data.success_bid_price && data.EXPE_PRICE_INQ_YN =='N'" >{{data.CURR_CD}} {{comma(data.success_bid_price)}}</dd>
                                                                        </dl>
                                                                        <dl class="date">
                                                                            <dt class="tit">Bid Date</dt>
                                                                            <dd class="txt">{{data.REQ_DT_EN}}</dd>
                                                                        </dl>
                                                                        <dl class="way">
                                                                            <dt class="tit"></dt>
                                                                            <dd class="txt">({{data.BID_KIND_NM_EN}})</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button" ng-click="liveBidReqHis({'bidReq':data})"><span>Bid History</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="liveBidReqCnt == 0">
                                                            <p class="txt_empty">No bid History.</p>
                                                        </div>
                                                    </div>
                                                     <div class="wrap_paging" ng-if="liveBidReqCnt != 0">
														<paging page="currentPage"
															page-size=5
															total="liveBidReqCnt"
															paging-action="loadLiveBidReqList(page)"
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


<%--    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>--%>
<%--    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->--%>
<%--    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>--%>
<%--    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
<%--    <!-- [0516]삭제--%>
<%--  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>--%>
<%---->--%>


<%--    <script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/js/mypage/liveBidReq.js"></script>

    <script>
        $(".js-history_back").click(function() {
        	window.location.href="/mypage/main";
        })
    </script>

    <!-- [0809]마이페이지 사이드 유저네임 글자수제한 -->
    <script>
        var asideUsername = $("aside .mem-name-wrap .tt2");
        asideUsername.each(function() {
            var asideUsernameTxt = $(this).text();
            var asideUsernameLimit = 8;
            if (asideUsernameTxt.length > asideUsernameLimit) {
                $(this).text(asideUsernameTxt.substr(0, asideUsernameLimit) + "...")
            }
        })
    </script>
    <!-- //[0809]마이페이지 사이드 유저네임 글자수제한 -->  

	<!-- 팝업 : 라이브경매관리 온라인패들 응찰 이력 -->
	<jsp:include page="popup/liveBidReqHistoryListPopup.jsp" flush="false"/>
	<!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
</body>

</html>