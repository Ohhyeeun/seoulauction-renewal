<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
<div class="wrapper" ng-cloak>
    <div class="sub-wrap pageclass">

        <!-- header -->
        <jsp:include page="../../include/en/nav.jsp" flush="false"/>
        <link rel="stylesheet" href="/css/plugin/csslibrary.css">
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();">
            <div id="contents" class="contents">
                <!-- page title -->
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Private Sale</span></h2>
                            <div class="page_desc"><span class="tb1"></span></div>
                        </div>
                    </div>
                </section>



                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">
                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class=""><a href="#" onclick="goPsGuide();"><span>Private Sale Guide</span></a></li>
                                    <li class="active"><a href="#" onclick="goPrivateSale();"><span>Private Sale</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <section class="basis-section last-section private_sale_list-section ">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list type_panel-private_sale">

                            <div class="panel-header">
                                <article class="search_tab-article">
                                    <div class="article-body">
                                        <div class="col_item mb-col1">

                                            <div class="search-box">
                                                <input type="search" placeholder="Author or work name" id="search_value"
                                                       ng-model="searchValue"
                                                       ng-keyup="searchArtist(event=$event)" class="h42">
                                                <i class="form-search_md" ng-click="searchArtist2()"></i>
                                            </div>
                                        </div>
                                        <div class="col_item mb-col2">
                                            <div class="select-box">
                                                <select class="select2Basic42 js-select_page select2-hidden-accessible" id="viewType"
                                                        onchange="angular.element(this).scope().chgViewType();">
                                                    <option ng-repeat="item in modelViewType" value="{{item.value}}">{{item.name}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>

                            <div class="panel-body">
                                <ul class="product-list">
                                    <li class="" ng-repeat="item in saleInfo">
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <!-- [0617]a태그로 변경 -->
                                                        <a href="#" class="img-align" ng-click="goLot(item.SALE_AS_NO)">
                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                        </a>
                                                        <!-- //[0617]a태그로 변경 -->
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <a href="#"><span class="num">{{item.AS_NO}}</span></a>
                                                        </div>
                                                        <div class="info-box">
                                                            <div class="title"><a href="#"><span>{{item.ARTIST_NAME_BLOB_EN}}</span></a>
                                                                <!-- [0516]삭제	<span class="sub">(1965)</span> -->
                                                            </div>
                                                            <div class="desc"><a href="#"><span>{{item.TITLE_BLOB_EN}}</span></a></div>
                                                            <div class="standard">
                                                                <a href="#"><span>{{item.CD_NM_EN}}</span></a>
                                                                <div class="size_year">
                                                                    <a href="#">
                                                                        <span>{{item.SIZE1}} X {{item.SIZE2}} X {{item.SIZE3}}</span>
                                                                        <span>{{item.MAKE_YEAR_BLOB}}</span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="panel-footer">
                                <div class="set-pc_mb">
                                    <div id="page_layer" class="only-pc">
                                        <div class="paging-area">
                                            <div class="paging">
                                                <a href="javascript:void(0);" ng-click="pageing(1);" class="prev_end icon-page_prevprev"><em>FIRST</em></a>
                                                <a href="javascript:void(0);" ng-click="pageing(pageprev);" ng-show="pageprev > -1" class="next icon-page_prev "><em>PREV</em></a>
                                                <a href="javascript:void(0);" ng-click="pageing(item);"
                                                   ng-repeat="item in pageingdata">
                                                    <strong ng-if="item === curpage" ng-class="{'on':item === curpage}"
                                                            ng-bind="item"></strong>
                                                    <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                <a href="javascript:void(0);" ng-click="pageing(pagenext);" ng-show="pagenext > -1" class="next icon-page_next"><em>NEXT</em></a>
                                                <a href="javascript:void(0);" ng-click="pageing(pagelast);" ng-show="pagelast > -1" class="next icon-page_nextnext"><em>LAST</em></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="add_layer" class="only-mb">
                                        <button class="btn btn_gray_line" type="button" ng-click="addpage(curpage + 1);"><span>더보기</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--작품 없을때 -->
                        <div class="content-panel type_panel-product_list" id="emptyPrivateSale">
                            <div class="panel-body">
                                <article class="comingsoon-article">
                                    <div class="article-inner">
                                        <div class="data-empty">
                                            <div class="txt_empty">
                                                <div class="title">The work is being prepared.</div>
                                            </div>
                                        </div>

                                    </div>
                                </article>

                                <!-- 문의하기 -->
                                <article class="inquiry-article ">
                                    <div class="inquiry-box">
                                        <div class="typo-area">
                                            <div class="icon-box">
                                                <i class="icon-academy_inquiry"></i>
                                            </div>
                                            <div class="title-box">
                                                <strong>Contact</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>Seoul Auction Partner Group</span> <em>Kim seungyeob</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:02-2075-4422"><em>+82(0)2-2075-4426, +82-10-9045-0315</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:syk@seoulauction.com"><em>syk@seoulauction.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryList" role="button"><span>1:1 Inquiry</span></a>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>
                <input type="hidden" id="token" value="{{token}}"/>
                <input type="hidden" id="saleAsNo" value="{{saleAsNo}}"/>
                <input type="hidden" id="lot_no" value=""/>
                <input type="hidden" id="user_id" value="${member.loginId}"/>
                <input type="hidden" id="cust_no" value="${member.userNo}"/>
            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/en/footer.jsp" flush="false"/>
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
<script type="text/javascript" src="/js/private_sale/psList.js" type="text/javascript"></script>

</body>

<script>
    <!-- angular js -->
    app.value('locale', 'en');
    app.value('is_login', false);

</script>

</html>