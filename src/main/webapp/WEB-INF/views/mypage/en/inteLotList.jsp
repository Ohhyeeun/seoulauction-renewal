<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<body class="">
	<div class="wrapper" ng-app="myApp">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/inteLot.js"></script>
            <!-- //header -->
		
            <!-- container -->
            <div id="container" class="intelot" ng-controller="InteListCtl" data-ng-init="loadInteLotList(1);" style="opacity: 0" opacity=1>
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
                                                        <span class="tt2">Favorites</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap part">
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <!-- [0728]텍스트수정 -->
                                                            <li><span>Auction works can only be viewed in detail while the auction is in progress.</span></li>
                                                            <!-- //[0728]텍스트수정 -->
                                                        </ul>
                                                    </div>
                                                </article>
                                            </div>
                                            <div class="tabmenu-wrap">
                                                <div class="tab-area type-left_mm_2">
                                                    <ul class="tab-list js-left_mm_2">
                                                        <li id="taball"  class="active" ><a href="#tab-cont-1"><span  ng-click="tabClick('all')">All</span></a></li>
                                                        <li id="tablive"  class=""><a href="#tab-cont-2"><span   ng-click="tabClick('live')">Live</span></a></li>
                                                        <li id="tabonline"  class="" ><a href="#tab-cont-3"><span  ng-click="tabClick('online')">Online</span></a></li>
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
                                                                        <span>{{il[1][0].SALE_TH}}{{il[1][0].SALE_TH_DSP}} {{il[1][0].SALE_TITLE_EN}}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-area">
                                                                    <button ng-if="il[1][0].CLOSE_YN != 'Y' && (il[1][0].SALE_KIND_CD =='online'||il[1][0].SALE_KIND_CD =='online_zb')" class="btn btn_point btn-view-bid" type="button"><a ng-click="goSale(il[1][0].SALE_KIND_CD, il[1][0].SALE_NO)"><span >View Auction</span></a></button>
                                                                    <button ng-if="il[1][0].CLOSE_YN != 'Y' && (il[1][0].SALE_KIND_CD !='online' && il[1][0].SALE_KIND_CD !='online_zb')" class="btn btn_point btn-view-bid" type="button"><a ng-click="goSale(il[1][0].SALE_KIND_CD, il[1][0].SALE_NO)"><span >View Auction</span></a></button>
                                                                    <button ng-if="il[1][0].CLOSE_YN == 'Y' && (il[1][0].SALE_KIND_CD =='online'||il[1][0].SALE_KIND_CD =='online_zb')"  class="btn btn_gray btn-view-bid" type="button" ><span>End Auction</span></button>
                                                                    <button ng-if="il[1][0].CLOSE_YN == 'Y' && (il[1][0].SALE_KIND_CD !='online' && il[1][0].SALE_KIND_CD !='online_zb')"  class="btn btn_gray_line btn-view-result" type="button" ><a ng-click="goSale(il[1][0].SALE_KIND_CD, il[1][0].SALE_NO)"><span>View Result</span></a></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in il[1]">
                                                             <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <button class="btn-heart js-work_heart on" id="heart_{{data.SALE_NO}}_{{data.LOT_NO}}" ng-click="inteFavorite(data.SALE_NO, data.LOT_NO)"><i class="icon-heart_off"></i></button>
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <a href="#" class="img-align" ng-if="data.CLOSE_YN != 'Y'" ng-click="goLotDetail(data.SALE_KIND_CD, data.SALE_NO, data.LOT_NO)"> <%-- 경매 진행 중 일 떄만 해당 작품 상세페이지로 경매 마감 시 링크 닫음 --%>
                                                                                    <img src="${imageRootPath}{{data.FILE_PATH}}/{{data.FILE_NAME}}" alt="">
                                                                                </a>
                                                                                <a class="img-align" ng-if="data.CLOSE_YN == 'Y'"> <%-- 경매 진행 중 일 떄만 해당 작품 상세페이지로 경매 마감 시 링크 닫음 --%>
                                                                                    <img src="${imageRootPath}{{data.FILE_PATH}}/{{data.FILE_NAME}}" alt="">
                                                                                </a>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">{{data.LOT_NO}}</div>
                                                                            <div class="title">
                                                                                <div class="titlename">{{data.ARTIST_NAME_EN}}</div>
                                                                            </div>
                                                                            <div class="desc">{{data.TITLE_EN}}</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="pay-infobox">
                                                                    <div class="pay-infobox-inner">
                                                                        <div class="pay-area">
                                                                            <dl class="price">
                                                                                <dt class="tit">Estimate</dt>
                                                                                <dd class="txt" ng-if="data.EXPE_PRICE_INQ_YN != 'Y'"><span>KRW {{comma(data.EXPE_PRICE_FROM_KO || 0)}}</span> <span>~ {{comma(data.EXPE_PRICE_TO_KO || 0)}}</span></dd>
                                                                            	<dd class="txt" ng-if="data.EXPE_PRICE_INQ_YN == 'Y'"><span>Separate Inquiry</span></dd>
                                                                            </dl>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                               <%--  <div class="product-infobox">
                                                                    <button class="btn-heart js-work_heart on" ng-click="inteDel(data.SALE_NO, data.LOT_NO)"><i class="icon-heart_off"></i></button>
                                                                    <div class="thumb-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                  <img src="${imageRootPath}{{data.FILE_PATH}}/{{data.FILE_NAME}}" alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="text-area">
                                                                        <div class="num">{{data.LOT_NO}}</div>
                                                                        <div class="title">
                                                                            <div class="titlename">{{data.ARTIST_NAME_EN}}</div>
                                                                        </div>
                                                                        <div class="desc">{{data.TITLE_EN}}</div>
                                                                        <div class="sub-box">
                                                                            <div class="sub-li">
                                                                                <div class="tit">Estimate</div>
                                                                                <div class="txt"><span>{{data.CURR_CD}} {{comma(data.EXPE_PRICE_FROM_KO)}}</span> <span>~ {{comma(data.EXPE_PRICE_TO_KO)}}</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div> --%>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="inteLotCnt == 0">
                                                           <p class="txt_empty">Favorites does not exist.</p>
                                                        </div>
                                                    </div>
                                                    <div class="wrap_paging" ng-if="inteLotCnt != 0">
														<paging page="currentPage"
															page-size=5
															total="inteLotCnt"
															paging-action="loadInteLotList(page)"
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

    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>

</body>

</html>