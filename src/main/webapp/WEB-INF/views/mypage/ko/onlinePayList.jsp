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
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/onlinePay.js"></script>
            <!-- container -->
            <div id="container" class="onlinePay"  ng-controller="onlinePayListCtl" data-ng-init="loadOnlinePayList(1);">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_auction online-buy">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />
                                        
                                        
                                        <!-- container -->
                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">결제/구매내역</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>구매가(Purchase Price) : 낙찰가 + 낙찰 수수료 + 부가가치세가 합산된 금액입니다.</span></li>
                                                            <li><span>구매수수료 18%(부가가치세 별도) 일괄 적용합니다.</span></li>
                                                        </ul>
                                                    </div>
                                                </article>
                                                <article class="list_count-wrap">
                                                    <div class="count-area textlist-wrap">
                                                        <div class="tit">총 <span class="point">{{allCnt}}</span> 건의 내역이 있습니다.</div>
                                                        <div class="sub">(결제 할 내역 <span class="point">{{payCnt}}</span> 건, 구매 내역 <span class="point">{{paidCnt}}</span>건)</div>
                                                    </div>
                                                </article>
                                                <!-- [0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
                                                <article class="bid-list-wrap">
                                                    <div class="bid-list">
                                                        <dl class="bid-item" ng-repeat="pl in payList">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4 line-1">
                                                                        <span>{{pl[1][0].SALE_TITLE_KR}}</span>
                                                                    </div>
                                                                    <div class="desc tb1">
                                                                        <span class="tit">경매일</span>
                                                                        <span>{{pl[1][0].FROM_DT}} 순차마감</span>
                                                                    </div>
                                                                </div>
                                                            </dt>
                                                            <dd class="item-ea"  ng-repeat="data in pl[1]">
                                                                <div class="item-ea-tit">
                                                                    <!-- <div class="paystate pending" ng-if="data.PAID_CNT != 1">결제대기중 ({{data.PAY_METHOD_NM}})</div> -->
                                                                    <div class="paystate pending" ng-if="data.PAID_CNT != 1">결제대기중</div>
                                                                    <div class="paystate complete" ng-if="data.PAID_CNT == 1">결제완료</div>
                                                                    <div class="txt" ng-if="data.PAID_CNT == 1">{{data.payDate}} ({{data.payWeekDate}}) {{data.payTime}} ({{data.PAY_METHOD_NM}})</div>
                                                                </div>
                                                                <div class="item-ea-inner">
                                                                    <div class="product-infobox">
                                                                        <div class="product-infobox-inner">
                                                                            <div class="thumb-area">
                                                                                <figure class="img-ratio">
                                                                                    <div class="img-align">
                                                                                        <img src="/nas_img{{data.LOT_IMG}}" alt="">
                                                                                    </div>
                                                                                </figure>
                                                                            </div>
                                                                            <div class="text-area">
                                                                                <div class="num">{{data.LOT_NO}}</div>
                                                                                <div class="title">
                                                                                    <div class="titlename">{{data.ARTIST_NAME_KR}}</div>
                                                                                </div>
                                                                                <div class="desc">{{data.LOT_TITLE_KR}}</div>
                                                                                <div class="sub-box">
                                                                                    <!-- [0613]재질/사이즈로 수정 -->
                                                                                    <div class="sub-li">{{data.CD_NM}}</div>
                                                                                    <div class="sub-li">
                                                                                        <span>{{StringToJson(data.LOT_SIZE_JSON)[0].SIZE1}} X {{StringToJson(data.LOT_SIZE_JSON)[0].SIZE1}}cm</span>
                                                                                        <span>{{StringToJson(data.LOT_SIZE_JSON)[0].CANVAS}}</span>
                                                                                    </div>
                                                                                    <!-- //[0613]재질/사이즈로 수정 -->
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="pay-infobox">
                                                                        <div class="pay-area">
                                                                        	<dl class="price">
                                                                                <dt class="tit">응찰가</dt>
                                                                                <dd class="txt">
                                                                                    <span>{{data.CURR_CD}} {{comma(data.BID_PRICE)}}</span>
                                                                                    <div class="sub">
                                                                                        <span>{{data.BID_DT}} ({{data.BIDWEEKDT}})<br class="m-ver"> {{data.BIDTIME}}</span>
                                                                                        <span>({{data.bid_count}}회 응찰)</span>
                                                                                    </div>
                                                                                </dd>
                                                                            </dl>
                                                                            <dl class="price">
                                                                                <dt class="tit">낙찰가</dt>
                                                                                <dd class="txt">{{data.CURR_CD}} {{comma(data.BID_PRICE)}}</dd>
                                                                            </dl>
                                                                            <dl class="price">
                                                                                <dt class="tit">낙찰 수수료</dt>
                                                                                <dd class="txt">{{data.CURR_CD}} {{getPayTotal(data.BID_PRICE, data.LOT_FEE_JSON).fee}}</dd>
                                                                            </dl>
                                                                            <dl class="price succ">
                                                                                <dt class="tit">구매가</dt>
                                                                                <dd class="txt">KRW {{getPayTotal(data.BID_PRICE, data.LOT_FEE_JSON).price}}</dd>
                                                                            </dl>
                                                                        </div>
                                                                        <div class="btn-area" ng-if="data.PAID_CNT != 1">
                                                                            <button class="btn btn_point" type="button"><span>결제하기</span></button>
                                                                        </div>
                                                                        <div class="btn-area" ng-if="data.PAID_CNT == 1">
                                                                            <button class="btn btn_gray_line" type="button" ng-if="data.PAY_METHOD_ID == 'card' && data.receipt == 'Y'" ng-click="receiptPopup({'pay':data,'type':0})"><span>결제영수증</span></button>
                                                                            <button class="btn btn_gray_line" type="button" ng-if="data.PAY_METHOD_ID == 'vbank' && data.receipt == 'Y'" ng-click="receiptPopup({'pay':data,'type':1})"><span>현금영수증</span></button>
<!--                                                                             <button class="btn btn_gray btn-half btn-print" type="button" disabled>
                                                                                <span>보증서출력하기</span>
                                                                                <span>7일 이후 가능</span>
                                                                            </button> -->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="totalCnt == 0">
                                                            <p class="txt_empty">결재/구매 내역이 존재하지 않습니다.</p>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                   <div class="wrap_paging" ng-if ="totalCnt != 0">
														<paging page="currentPage"
															page-size=5
															total=totalCnt
															paging-action="loadOnlinePayList(page)"
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


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>



    <script>
        $(".js-history_back").click(function() {
            window.history.back();
        })
    </script>
</body>

</html>