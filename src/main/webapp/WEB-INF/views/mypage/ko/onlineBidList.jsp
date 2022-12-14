<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<body class="" ng-controller="onlineBidListCtl" data-ng-init="loadonlineBidList(1);" ng-cloak>
    <div class="wrapper" ng-app="myApp">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
                <div id="container" class="onlineBid" >
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
                                                        <span class="tt2">응찰내역</span>
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
                                                                        <span>{{onlineBid[1][0].SALE_TH}}{{onlineBid[1][0].SALE_TH_DSP}} {{onlineBid[1][0].SALE_TITLE_KR}}</span>
                                                                    </div>
                                                                    <div class="desc tb1">
                                                                        <span class="tit">경매일</span>
                                                                        <span>{{onlineBid[1][0].TO_DT}} 순차마감</span>
                                                                    </div>
                                                                </div>
                                                                 <div class="btn-area">
                                                                   <button ng-if="onlineBid[2].SALE_CLOSE_YN != 'Y'"  class="btn btn_point btn-view-ing" type="button"><a ng-click="goSale(onlineBid[1][0].SALE_NO)"><span >진행경매보기</span></a></button>
                                                                   <button ng-if="onlineBid[2].SALE_CLOSE_YN == 'Y'"class="btn btn_gray btn-view-end" type="button" disabled><span>경매 종료</span></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in onlineBid[1]">
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <a href="#" ng-click="goLotDetail(data.SALE_NO, data.LOT_NO)" class="img-align" ng-if="data.CLOSE_YN != 'Y'"> <%-- 경매 진행 중 일 떄만 해당 작품 상세페이지로 경매 마감 시 링크 닫음 --%>
                                                                                     <img src="${imageRootPath}{{data.LOT_IMG}}" alt="${imageRootPath}{{data.LOT_IMG}}">
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'N' && bidGroup(data.BID_JSON)[0].BID_PRICE == data.success_bid_price && bidGroup(data.BID_JSON)[0].BID_NO == data.success_bid_no"><span class="bid_result-icon">낙찰</span></div>
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'Y'"><span class="bid_result-icon fail">낙찰취소</span></div>
                                                                                </a>
                                                                                <a class="img-align" ng-if="data.CLOSE_YN == 'Y'"> <%-- 경매 진행 중 일 떄만 해당 작품 상세페이지로 경매 마감 시 링크 닫음 --%>
                                                                                     <img src="${imageRootPath}{{data.LOT_IMG}}" alt="${imageRootPath}{{data.LOT_IMG}}">
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'N' && bidGroup(data.BID_JSON)[0].BID_PRICE == data.success_bid_price && bidGroup(data.BID_JSON)[0].BID_NO == data.success_bid_no"><span class="bid_result-icon">낙찰</span></div>
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'Y'"><span class="bid_result-icon fail">낙찰취소</span></div>
                                                                                </a>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">{{data.LOT_NO}}</div>
                                                                            <div class="title">
                                                                                <div class="titlename">{{data.ARTIST_NAME_KR}}</div>
                                                                            </div>
                                                                            <div class="desc">{{data.LOT_TITLE_KR}}</div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="pay-infobox">
                                                                    <div class="pay-area">
                                                                        <dl class="price">
                                                                            <dt class="tit">응찰가</dt>
                                                                            <dd class="txt">{{data.CURR_CD}} {{comma(data.MAX_BID_PRICE)}}</dd>
                                                                        </dl>
                                                                        <dl class="price succ">
                                                                            <dt class="tit">낙찰가</dt>
                                                                            <dd class="txt"  ng-if="data.success_bid_price">{{data.CURR_CD}} {{comma(data.success_bid_price)}}</dd>
                                                                        </dl>
                                                                        <dl class="date">
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">{{data.MAX_BID_DT}}</dd>
                                                                        </dl>
<!--                                                                         <dl class="way">
                                                                            <dt class="tit"></dt>
                                                                            <dd class="txt">({{bidGroup(data.BID_JSON)[0].BID_KIND_NM}})</dd>
                                                                        </dl> -->
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button" ng-click="onlineBidHis({'bid':data})"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="onlineBidCnt == 0">
                                                            <p class="txt_empty">응찰 내역이 존재하지 않습니다.</p>
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
                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false" />
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


<%--    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
--%>
<%--    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>--%>
<%--    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
<!-- [0516]삭제
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->


<%--    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/js/mypage/onlineBid.js"></script> 
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
	<jsp:include page="popup/onlineBidHistoryListPopup.jsp" flush="false"/>
	<!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>						
</body>

</html>