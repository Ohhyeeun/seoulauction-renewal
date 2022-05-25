<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<body class="">
	<div class="wrapper" ng-app="myApp">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/inteLot.js"></script>
            <!-- //header -->
		
            <!-- container -->
            <div id="container" class="intelot" ng-controller="InteListCtl" data-ng-init="loadInteLotList(1);">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_favorite">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">관심작품</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap part">
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>온라인 경매 작품은 경매 진행 중에만 상세 확인이<br class="m-ver"> 가능합니다.</span></li>
                                                        </ul>
                                                    </div>
                                                </article>
                                            </div>
                                            <div class="tabmenu-wrap">
                                                <div class="tab-area type-left_mm_2">
                                                    <ul class="tab-list js-left_mm_2">
                                                        <li class="active" ><a href="#tab-cont-1"><span  ng-click="tabClick('all')">전체</span></a></li>
                                                        <li class=""><a href="#tab-cont-2"><span   ng-click="tabClick('live')">라이브</span></a></li>
                                                        <li class="" ><a href="#tab-cont-3"><span  ng-click="tabClick('online')">온라인</span></a></li>
                                                    	<input type="hidden" id="saleKind" value="all"/>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="bid-list-wrap favorite-list-wrap">
                                                    <div class="bid-list favorite-list">
                                                        <dl class="bid-item"  ng-repeat="il in inteLotList">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                        <span>{{il[1][0].SALE_TITLE_KO}}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-area">
                                                                    <button ng-if="il[1][0].CLOSE_YN != 'Y'" class="btn btn_point btn-view-bid" type="button"><a href="/currentAuction?sale_kind=online_only&page=1&lang=ko#page1"><span >진행경매보기</span></a></button>
                                                                    <button ng-if="il[1][0].CLOSE_YN == 'Y'"  class="btn btn_gray btn-view-bid" type="button" disabled><span>경매 종료</span></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in il[1]">
                                                                <div class="product-infobox">
                                                                    <button class="btn-heart js-work_heart on" ng-click="inteDel(data.SALE_NO, data.LOT_NO)"><i class="icon-heart_off"></i></button>
                                                                    <div class="thumb-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                 <img ng-src="/nas_img{{data.FILE_NAME | imagePath1 : data.FILE_PATH : 'detail'}}" />
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="text-area">
                                                                        <div class="num">{{data.LOT_NO}}</div>
                                                                        <div class="title">
                                                                            <div class="titlename">{{data.ARTIST_NAME_KO}}</div>
                                                                        </div>
                                                                        <div class="desc">{{data.TITLE_KO}}</div>
                                                                        <div class="sub-box">
                                                                            <div class="sub-li">
                                                                                <div class="tit">추정가</div>
                                                                                <div class="txt"><span>KRW {{comma(data.EXPE_PRICE_FROM_KO)}}</span> <span>~ {{comma(data.EXPE_PRICE_TO_KO)}}</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                    <div class="paging-area">
                                                    <div class="paging">
														<paging page="currentPage"
															page-size=3
															total="inteLotCnt"
															paging-action="loadInteLotList(page)"
															scroll-top="true"
															hide-if-empty="true"
															show-prev-next="true"
															show-first-last="true"
															ul-class="paging"
															active-class="on"
														    disabled-class="page_disable"
														    text-next-class="next icon-page_next"
														    text-prev-class="prev icon-page_prev"
														    text-first-class="prev_end icon-page_prevprev"
														    text-last-class="next_end icon-page_nextnext">
														</paging>
													</div>
													</div>
                                                </article>
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
        $('.js-left_mm_2 a').on('click', function(e) {
            e.preventDefault();
            var tar = $(this).position().left;
            var scrollX = tar - ($(".js-left_mm_2").parents(".tab-area").width() / 2) + $(this).width() / 2;

            if ($(this).parents('li').hasClass('active')) {
                return false;
            } else {
                $(".js-left_mm_2 li").removeClass('active');
                $(this).parents('li').addClass('active');

                $(".js-left_mm_2").parents(".tab-area").scrollLeft(scrollX);
            }
        });

        /* $(".js-work_heart").click(function(){
			if($(this).hasClass("on")){//on->off로 변경하는 시점
				$(this).find("i").attr("class","icon-heart_off")
			} else {//off->on으로 변경하는 시점
				$(this).find("i").attr("class","icon-heart_on")
			}
		}) */

        /* $(".js-history_back").click(function(){
        	window.history.back();
        }) */
    </script>



</body>

</html>