<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
<div class="wrapper" ng-controller="ctl" data-ng-init="init();" ng-cloak>
    <div class="sub-wrap pageclass type-width_list">
        <!-- header -->
        <jsp:include page="../../include/en/nav.jsp" flush="false"/>
        <!-- //header -->
        <link rel="stylesheet" href="/css/plugin/csslibrary.css">
        <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
        <script type="text/javascript" src="/js/angular/checklist-model.js"></script>
        <script type="text/javascript" src="/js/angular/hrzslider.min.js"></script>
        <link href="/css/jquery.nouislider.css" rel="stylesheet">
        <script>
            app.value('locale', 'en');
            app.value('is_login', 'false');
        </script>
        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">
                <section class="basis-section search-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-search">
                            <div class="panel-header">
                                <div class="search_results">"<strong>${param.searchContent}</strong>" Results <q id="totalCount"></q> total</div>
                            </div>
                            <div class="panel-body">
                                <div class="search-area">
                                    <div class="search-box">
                                        <div class="input_del">
                                            <input class="searchContent" type="text" placeholder="" value="${param.searchContent}" onkeyup="enterSearch('searchContent', true);">
                                            <button class="btn_del"><i class="form-search-del_lg"></i></button>
                                        </div>
                                        <button class="btn_search"><i class="form-search_lg" onclick="goSearch('searchContent', true);"></i></button>
                                    </div>
                                    <div class="suggestion-box">
                                        <div class="word">
                                            <span>Featured Search</span>
                                        </div>
                                        <div class="word-items">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="basis-section tab-auction-section">
                    <div class="section-inner">
                        <!-- 텝메뉴 -->
                        <div class="content-panel type_panel-search_tab2">
                            <div class="panel-header">
                                <div class="tab-wrap">
                                    <div class="tab-area type-left">
                                        <ul class="tab-list js-list_tab">
                                            <li class="active"><a href="" ng-click="loadSubPage('all');" ><span>All</span> <em id="allCount"></em></a></li>
                                            <li><a href="#tab-cont-2" ng-click="loadSubPage('live');" ><span>Live</span> <em id="liveCount"></em></a></li>
                                            <li><a href="#tab-cont-3" ng-click="loadSubPage('online');" ><span>Online</span> <em id="onlineCount"></em></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <article class="search_tab-article">
                                    <div class="article-body">

                                        <div class="col_item positon-col1">
                                            <div class="filter-box">
                                                <div class="btn_set">
                                                    <button class="filter_btn js-filter_btn"><i class="icon-filter"></i></button>
                                                </div>
                                                <ul class="filter-list js-filter_del-list">
                                                    <li id="endLot"><span>Last</span><button><i class="icon-filter_del"></i></button></li>
                                                    <li id="ingLot"><span>In Progress</span><button><i class="icon-filter_del"></i></button></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col_item positon-col2">
                                            <div class="select-box">
                                                <select id="selectSort" class="select2Basic42"
                                                        ng-init="selectSortType = selectSortType || options[0].value"
                                                        onchange="angular.element(this).scope().search();">
                                                    <option ng-repeat="item in modelSortType" value="{{item.value}}">{{item.name}}</option>
                                                </select>
                                            </div>
                                            <div class="select-box">
                                                <select id="selectMore" class="select2Basic42 js-select_page" onchange="angular.element(this).scope().search();">
                                                    <option ng-repeat="item in modelViewType" value="{{item.value}}">{{item.name}}</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="basis-section last-section auction_list-section" id="search_content">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_list">
                            <div class="panel-body" id="panel_content">
                                <ul class="product-list">
                                    <!-- [0617]a태그 -->
                                    <li class="" ng-if="lotList !== null" ng-repeat="item in lotList">
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area" ng-if="item.STAT_CD != 'reentry' && (item.IMG_DISP_YN == 'Y' || custInfo.EMP_GB == 'Y')" ng-click="goDetail(item.SALE_NO, item.LOT_NO, item.SALE_KIND_CD, item.END_YN);">
                                                    <figure class="img-ratio">
                                                        <!-- [0617]a태그로 변경 -->
                                                        <a href="#" class="img-align">
                                                            <img src="{{item.IMAGE_URL}}{{item.LOT_IMG_PATH}}/{{item.LOT_IMG_NAME}}"
                                                                 alt="{{item.TITLE_JSON.en | trimSameCheck : item.TITLE_JSON[locale]}}">
                                                        </a>
                                                        <a href="#" class="img-align" ng-if="item.STAT_CD != 'reentry' && item.IMG_DISP_YN != 'Y'">
                                                            <img src="/images/bg/no_image.jpg">
                                                        </a>
                                                        <!-- //[0617]a태그로 변경 -->
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <a href="#"><span class="num" ng-bind="item.LOT_NO">1</span></a>
                                                            <button class="heart js-work_heart"><i class="item.FAVORITE_YN === 'Y' ? 'icon-heart_on' : 'icon-heart_off'" ng-click="favorite(item);"></i></button>
                                                        </div>
                                                        <div class="info-box">
                                                            <div class="title"><a href="#"><span>{{item.ARTIST_NAME_JSON.en | trimSameCheck : item.TITLE_JSON[locale]}}</span></a></div>
                                                            <div class="desc"><a href="#"><span ng-bind="item.TITLE_JSON.en | do_sub_string : item.TITLE_JSON.en" title="{{item.TITLE_JSON.en}}">Air (From The Series The Elements)</span></a></div>
                                                            <div class="standard">
                                                                <a href="#"><span ng-bind="item.MATE_NM | do_sub_string : item.MATE_NM" title="{{item.MATE_NM}}">spray paint on canvas</span></a>
                                                                <div class="size_year">
                                                                    <a href="#">
                                                                        <span ng-bind="item.LOT_SIZE_JSON[0] | size_text_cm | do_sub_string_low : item.LOT_SIZE_JSON[0]" title="{{item.LOT_SIZE_JSON[0] | size_text_cm}}"></span>
                                                                        <span ng-bind="item.MAKE_YEAR_JSON.en | do_sub_string_low : item.MAKE_YEAR_JSON.en" title="{{item.MAKE_YEAR_JSON.en}}"></span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="price-box">
                                                            <a href="#">
                                                                <dl class="price-list" ng-if="lot.EXPE_PRICE_INQ_YN == 'Y'">
                                                                    <dt>Estimate</dt>
                                                                    <dd>KRW 9,900,000,000</dd>
                                                                    <dd>~ 9,900,000,000</dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="lot.EXPE_PRICE_INQ_YN != 'Y'">
                                                                    <dt>Estimate</dt>
                                                                    <dd ng-if="item.CURR_CD == 'HKD'">{{item.CURR_CD}} {{item.EXPE_PRICE_FROM_JSON.HKD | currency:item.EXPE_PRICE_FROM_JSON.HKD }} </dd>
                                                                    <dd ng-if="item.CURR_CD == 'HKD'">~ {{item.EXPE_PRICE_TO_JSON.HKD | currency:item.EXPE_PRICE_TO_JSON.HKD }}</dd>
                                                                    <dd ng-if="item.CURR_CD == 'USD'">{{item.CURR_CD}} {{item.EXPE_PRICE_FROM_JSON.USD | currency:item.EXPE_PRICE_FROM_JSON.USD }} </dd>
                                                                    <dd ng-if="item.CURR_CD == 'USD'">~ {{item.EXPE_PRICE_TO_JSON.USD | currency:item.EXPE_PRICE_TO_JSON.USD }}</dd>
                                                                    <dd ng-if="item.CURR_CD == 'KRW'">{{item.CURR_CD}} {{item.EXPE_PRICE_FROM_JSON.KRW | currency:item.EXPE_PRICE_FROM_JSON.KRW }} </dd>
                                                                    <dd ng-if="item.CURR_CD == 'KRW'">~ {{item.EXPE_PRICE_TO_JSON.KRW | currency:item.EXPE_PRICE_TO_JSON.KRW }}</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>Start Price</dt>
                                                                    <dd>{{item.CURR_CD}} {{item.START_PRICE | currency : item.START_PRICE }} </dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="custInfo.CUST_NO && is_login && item.STATUS == '진행' && item.LAST_PRICE > 0">
                                                                    <dt>Current</dt>
                                                                    <dd><strong>{{item.CURR_CD}} {{item.LAST_PRICE | currency:item.LAST_PRICE : 0 }} </strong><em>(Bid {{item.BID_CNT }})</em></dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="!custInfo.CUST_NO && item.STATUS == '진행'">
                                                                    <dt>Current</dt>
                                                                    <dd>Log in and check Please.</dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="!custInfo.CUST_NO && item.STATUS == '완료'">
                                                                    <dt>Winning Bid</dt>
                                                                    <dd>Log in and check Please.</dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="custInfo.CUST_NO && is_login && item.STATUS == '완료' && item.LAST_PRICE > 0">
                                                                    <dt>Winning Bid</dt>
                                                                    <dd><strong>{{item.CURR_CD}} {{item.LAST_PRICE | currency:item.LAST_PRICE }}</strong></dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="custInfo.CUST_NO && (item.LAST_PRICE == undefined || item.LAST_PRICE == 0)">
                                                                    <dt></dt>
                                                                    <dd></dd>
                                                                </dl>
                                                            </a>
                                                        </div>
                                                        <div class="state-box">
                                                            <div ng-if="item.STATUS == '완료'" class="state op-end">
                                                                <div>End</div>
                                                            </div>
                                                            <div ng-if="item.STATUS == '진행'" class="state op-ing">
                                                                <div>Proceeding</div>
                                                            </div>
                                                            <div class="other">
                                                                <a href="#">
                                                                    <div class="d_name" ng-bind="item.SALE_TITLE_JSON.en | do_sub_string_low : item.SALE_TITLE_JSON.en" title="{{item.SALE_TITLE_JSON.en}}"></div>
                                                                    <div class="d_day">{{item.SALE_TO_DT | date:'yyyy.MM.dd'+'('+getWeek(item.SALE_TO_DT)+')'}} {{item.SALE_TO_DT | date : 'HH:mm'}} {{item.SALE_KIND_CD == 'hongkong' ? "HKT" : "KST"}}</div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="panel-footer" id="panel_footer">
                                <div class="set-pc_mb">
                                    <div class="only-pc">
                                        <div id="paging_search" class="paging-area">
                                            <button class="btn btn_gray_line" id="more_search" type="button" ng-click="moreSearch();"><span>더보기</span></button>
                                        </div>
                                    </div>
                                    <div class="only-mb">
                                        <button class="btn btn_gray_line" id="more_search_m" type="button" ng-click="moreSearch();"><span>더보기</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="basis-section last-section auction_list-section" id="search_empty">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_list">
                            <div class="panel-body">
                                <div class="data-empty type-big">
                                    <div class="img_empty">
                                        <img src="/images/mobile/auction/symbol-none_data.png" alt="검색결과가 없습니다." />
                                    </div>
                                    <div class="txt_empty">
                                        <div class="title">No results found</div>
                                        <div class="desc">Please check that the spelling and spacing of the words are correct.</div>
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
        <jsp:include page="../../include/en/footer.jsp" flush="false"/>
        <!-- //footer -->

        <!-- stykey -->
        <div class="scroll_top-box">
            <div class="box-inner">
                <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
            </div>
        </div>
        <!-- // stykey -->

        <aside class="filter_fixed-wrap">
            <div class="popup-dim"></div>

            <div class="fixed-panel">
                <div class="panel-header">
                    <button class="filter_close js-filter_close">
                        <i class="icon-pop_view_close"></i>
                    </button>
                    <div class="title-box">
                        <div class="box-inner">
                            <span>Filter</span>
                            <button class="btn-filter_refresh" ng-click="initFilter();">
                                <i class="icon-filter_refresh"></i><span>Delete all</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="panel-body scroll-type">

                    <article class="filter_potion-article">
                        <ul class="js-toggle_accordion">
                            <li class="">
                                <div class="accordion-header">
                                    <a href="#" class="header-box" data-active="">
                                        <span>Auction date</span>
                                        <i class="icon-accordion_arrow_thin"></i>
                                    </a>
                                </div>
                                <div class="accordion-body">
                                    <ul class="check-list">
                                        <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox1" type="checkbox" name="lotCheckBox">
                                            <i></i>
                                            <label for="checkbox1">Last</label>
                                        </span>
                                        </li>
                                        <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox2" type="checkbox" name="lotCheckBox">
                                            <i></i>
                                            <label for="checkbox2">In progress</label>
                                        </span>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <div class="accordion-header">
                                    <div class="header-box">
                                        <span>Material</span>
                                    </div>
                                </div>
                                <div class="accordion-body">
                                    <ul class="check-list">
                                        <li>
                                            <input type="text" placeholder="Search material" ng-model="search.mate_nm" id="mateNm" ng-keypress="$event.keyCode === 13 && filterCheck();">
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>

                    </article>

                </div>
                <div class="panel-footer">
                    <div class="btn_set">
                        <div class="btn_item"><a class="btn btn_point btn_lg" href="#" role="button" ng-click="filterCheck();"><span>Apply filter</span></a> </div>
                    </div>
                </div>
            </div>
        </aside>

    </div>
</div>


<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/common/paging.js"></script>
<script type="text/javascript" src="/js/sale/search.js"></script>
<script>
    <!-- ===텝메뉴=== -->
    $('.js-list_tab a').on('click', function($e) {
        $e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-list_tab").parents(".tab-area").width() / 2) + $(this).width() / 2;

        if ($(this).parents('li').hasClass('active')) {
            return false;
        } else {
            $(".js-list_tab li").removeClass('active');
            $(this).parents('li').addClass('active');

            $(".js-list_tab").parents(".tab-area").scrollLeft(scrollX);
        }
    });

    /* 필터 삭제 */
    $(".js-filter_del-list button").on("click", function($e) {
        $(this).closest("li").remove();
    })

    $(function() {
        $(window).on("resize", function($e) {
            select_resize_change();
        });


        function select_resize_change() {
            if ($("body").hasClass("is_mb")) {
                $(".js-select_page").val("2");
            } else {
                $(".js-select_page").val("1");
            }
            $(".js-select_page").trigger('change');
        }
        select_resize_change();
    });
</script>

<%--<aside class="filter_fixed-wrap">--%>
<%--    <div class="popup-dim"></div>--%>

<%--    <div class="fixed-panel" >--%>
<%--        <div class="panel-header">--%>
<%--            <button class="filter_close js-filter_close">--%>
<%--                <i class="icon-pop_view_close"></i>--%>
<%--            </button>--%>
<%--            <div class="title-box">--%>
<%--                <div class="box-inner">--%>
<%--                    <span>Filter</span>--%>
<%--                    <button class="btn-filter_refresh" ng-click="initFilter();">--%>
<%--                        <i class="icon-filter_refresh"></i><span>초기화</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="panel-body scroll-type">--%>

<%--            <article class="filter_potion-article">--%>
<%--                <ul class="js-toggle_accordion">--%>
<%--                    <li class="">--%>
<%--                        <div class="accordion-header">--%>
<%--                            <a href="#" class="header-box" data-active="">--%>
<%--                                <span>경매일</span>--%>
<%--                                <i class="icon-accordion_arrow_thin"></i>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="accordion-body">--%>
<%--                            <ul class="check-list">--%>
<%--                                <li>--%>
<%--                                        <span class="trp checkbox-box">--%>
<%--                                            <input id="checkbox1" type="checkbox" name="lotCheckBox" value="end">--%>
<%--                                            <i></i>--%>
<%--                                            <label for="checkbox1">지난 경매</label>--%>
<%--                                        </span>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                        <span class="trp checkbox-box">--%>
<%--                                            <input id="checkbox2" type="checkbox" name="lotCheckBox" value="ing">--%>
<%--                                            <i></i>--%>
<%--                                            <label for="checkbox2">진행 경매</label>--%>
<%--                                        </span>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                        <span class="trp checkbox-box">--%>
<%--                                            <input id="checkbox3" type="checkbox" name="lotCheckBox" value="ready">--%>
<%--                                            <i></i>--%>
<%--                                            <label for="checkbox3">예정 경매</label>--%>
<%--                                        </span>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <div class="accordion-header">--%>
<%--                            <div class="header-box">--%>
<%--                                <span>재질</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="accordion-body">--%>
<%--                            <ul class="check-list">--%>
<%--                                <li>--%>
<%--                                    <input type="text" placeholder="작품재질 입력" ng-model="search.mate_nm" id="mateNm" ng-keypress="$event.keyCode === 13 && filterCheck();">--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>

<%--            </article>--%>

<%--        </div>--%>
<%--        <div class="panel-footer" >--%>
<%--            <div class="btn_set">--%>
<%--                <div class="btn_item"><a class="btn btn_point btn_lg" href="#" role="button" ng-click="filterCheck();"><span>필터적용</span></a> </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</aside>--%>
<script>
    /* 팝업 열고,닫기 */
    $(".js-filter_btn").on("click", function() {
        $(".filter_fixed-wrap").addClass("active");
    });
    $(".filter_fixed-wrap .js-filter_close, .filter_fixed-wrap .popup-dim").on("click", function() {
        $(".filter_fixed-wrap").removeClass("active");
    });

    /* 토글 */
    var toggle_accordion = $(".js-toggle_accordion a").trpToggleBtn(
        function($this) {
            var _li = $($this).closest("li");
            _li.addClass("on");
            //_li.find(".accordion-body").addClass("on");
            _li.find(".accordion-body").slideDown("fast");
        },
        function($this) {
            var _li = $($this).closest("li");
            _li.removeClass("on");
            _li.find(".accordion-body").removeClass("on");
            _li.find(".accordion-body").slideUp("fast");

        });
    toggle_accordion.setBtn(0);
</script>
<script>
    /* angular js */
    app.requires.push.apply(app.requires, ["ngDialog", "checklist-model"]);
    app.filter('currency', function(){
        return function(val) {
            if (val === undefined) {
                return val;
            }
            return parseInt(val).toLocaleString('ko-KR');
        };
    })
    app.filter('do_sub_string', function(){
        return function(val) {
            let result ='';
            if (val === undefined) {
                return val;
            }
            if(val.length > 30){
                result = val.substring(0,30)+'...';
            }else{
                result = val;
            }
            return result;
        };
    })

    app.filter('do_sub_string_low', function(){
        return function(val) {
            let result ='';
            if (val === undefined) {
                return val;
            }
            if(val.length > 15){
                result = val.substring(0,15)+'...';
            }else{
                result = val;
            }
            return result;
        };
    })


    app.controller('ctl', function($scope, consts, common, is_login, locale, $filter) {
        // 현재가 처리
        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.pageRows = 20;
        $scope.reqRowCnt = "20";
        $scope.currentPage = 1;
        $scope.totalCount = 0
        $scope.is_error = false;
        $scope.search = {"sale_kind" : []};
        $scope.firstChk = 0;
        $scope.sortBy = "ENDDE";
        $scope.moreBy = "MOREP";

        let sortValue1 = '';
        let sortValue2 = '';
        let sortValue3 = '';
        let sortValue4 = '';

        let moreValue1 = '';
        let moreValue2 = '';
        let moreValue3 = '';
        let moreValue4 = '';


        if(locale == 'ko'){
            sortValue1 = '경매 최신순';
            sortValue2 = 'LOT 번호순';
            sortValue3 = '추정가 낮은순';
            sortValue4 = '추정가 높은순';
            moreValue1 = '더보기 방식';
            moreValue2 = '페이징 방식';
        }else{
            sortValue1 = 'Auction Latest';
            sortValue2 = 'LOT Number Order';
            sortValue3 = 'Lowest estimate';
            sortValue4 = 'Highest estimate';
            moreValue1 = '더보기 방식';
            moreValue2 = '페이징 방식';
        }

        $scope.modelSortType = [{
            name: sortValue1, value: 1
        }, {
            name: sortValue2, value: 2
        }, {
            name: sortValue3, value: 3
        }, {
            name: sortValue4, value: 4
        }];

        $scope.modelViewType = [{
            name: moreValue1, value: 1
        }, {
            name: moreValue2, value: 2
        }];

        $scope.selectSortType = 1;
        $scope.selectViewType = 1;

        let loadLotList = function($page, $subPage){

            console.log("run");
            //$(".product-list").empty();
            //최신순선택
            const sort = $("#selectSort option:selected").val();
            if(sort == 1){
                $scope.sortBy = "ENDDE";
            }else if(sort == 2){
                $scope.sortBy = "LOTAS";
            }else if(sort == 3){
                $scope.sortBy = "ESTAS";
            }else if(sort ==4){
                $scope.sortBy = "ESTDE";
            }
            const more = $("#selectMore option:selected").val();

            if(more == 1){
                $scope.moreBy = "MOREP";
            }else if(more == 2){
                $scope.moreBy = "PAGNG";
            }

            $scope.currentPage = $page;
            $scope.subPage = $subPage;

            let data = {};
            data['page'] = $page;
            data['sub_page'] = $subPage;
            data['keyword'] = $scope.search.keyword;
            data['mate_nm'] = $scope.search.mate_nm;
            data['from_dt'] = $scope.search.from_dt;
            data['to_dt'] = $scope.search.to_dt;
            data['chk'] = $scope.search.chk;
            data['from'] = (($scope.currentPage - 1) * parseInt($scope.reqRowCnt));
            data['rows'] = parseInt($scope.reqRowCnt);
            data['sort_by'] = $scope.sortBy;
            data['more_by'] = $scope.moreBy;
            data['sale_status_end_yn'] = $scope.sale_status_end_yn;
            data['sale_status_ing_yn'] = $scope.sale_status_ing_yn;
            data['sale_status_ready_yn'] = $scope.sale_status_ready_yn;

            let run = async function () {
                let [r1] = await Promise.all([get_search_list(data)]);
                let cntList;
                let custInfo;
                if (r1.data.data.length === 0) {
                    return;
                }
                if (r1.data.data.cntList.length > 0 ){
                    cntList = r1.data.data.cntList[0];
                }

                $scope.custInfo = r1.data.data.cust_info;
                $scope.lotList = r1.data.data.list;
                $scope.totalCount = cntList.CNT;
                $scope.allCount = cntList.ALL_CNT;
                $scope.liveCount = cntList.LIVE_CNT;
                $scope.onlineCount = cntList.ONLINE_CNT;
                $scope.pageRows = parseInt($scope.reqRowCnt);
                $scope.$apply();

                $("#panel-empty").empty().hide();
                $("#panel_footer").show();

                if($scope.lotList.length != 0){
                    // 최초 한번에 대해서만 subpage count 계산
                    if($scope.firstChk == 0){
                        $('#totalCount').empty();
                        $('#allCount').empty();
                        $('#liveCount').empty();
                        $('#onlineCount').empty();
                        $('#totalCount').append($scope.totalCount);
                        $('#allCount').append('(' + $scope.allCount + ')');
                        $('#liveCount').append('(' + $scope.liveCount + ')');
                        $('#onlineCount').append('(' + $scope.onlineCount + ')');
                        $scope.firstChk = 1;
                    }
                    $("#search_content").show();
                    $("#search_empty").hide();
                    $("#more_search").hide();
                    //$("#more_search_m").hide();
                    $(".paging").empty();

                    if($scope.moreBy == "MOREP") {
                        if($scope.totalCount > $scope.pageRows){
                            $("#more_search").show();
                            //$("#more_search_m").show();
                        }
                    }else if($scope.moreBy == "PAGNG"){
                        //paging이 선택된 경우 paging 계산
                        paging({
                            id: "paging_search",
                            className:"paging",
                            totalCount:$scope.totalCount,
                            itemSize:$scope.reqRowCnt,
                            pageSize:10,
                            page:$scope.currentPage,
                            callBackFunc:function(i) {
                                loadLotList(i, $scope.subPage);
                            }
                        });
                    }
                } else {
                    // 검색결과가 없는 경우 html 만드는 방법에서 숨기고 보여주는 방식으로 변경
                    $("#search_content").hide();
                    $("#panel_footer").hide();
                    $("#search_empty").show();

                    if($scope.firstChk == 0 && $scope.totalCount == 0) {
                        $('#totalCount').empty();
                        $('#totalCount').append(0);
                    }
                    if($scope.firstChk == 0 && $scope.allCount  == 0) {
                        $('#allCount').empty();
                        $('#allCount').append('(0)');
                    }
                    if($scope.firstChk == 0 && $scope.liveCount == 0) {
                        $('#liveCount').empty();
                        $('#liveCount').append('(0)');
                    }
                    if($scope.firstChk == 0 && $scope.onlineCount == 0) {
                        $('#onlineCount').empty();
                        $('#onlineCount').append('(0)');
                    }
                }
            }
            run();
        }

        $scope.loadSubPage = function(subPage){
            loadLotList(1, subPage);
        }

        $scope.initFilter = function(){

            let checked = true;
            $('input:checkbox[name="lotCheckBox"]').each(function(){
                $(this).attr("checked", false);
            });

            $scope.sale_status_end_yn = 'N';
            $scope.sale_status_ing_yn = 'N';
            $scope.sale_status_ready_yn = 'N';
            $('#mateNm').val('');
        }

        $scope.filterCheck = function(){
            //경매일 체크
            let checked = true;
            $scope.firstChk = 0;
            $('input:checkbox[name="lotCheckBox"]').each(function(){

                let checkBoxChecked = $(this).is(":checked");
                let checkBoxId = $(this).val();

                if(checkBoxChecked == true && checkBoxId == 'end'){
                    $scope.sale_status_end_yn = 'Y';
                    $('#endLot').show();
                }
                if(checkBoxChecked == true && checkBoxId == 'ing'){
                    $scope.sale_status_ing_yn = 'Y';
                    $('#ingLot').show();
                }
                // if(checkBoxChecked == true && checkBoxId == 'ready'){
                //     $scope.sale_status_ready_yn = 'Y';
                //     $('#readyLot').show();
                // }

                if(checkBoxChecked == false && checkBoxId == 'end'){
                    $scope.sale_status_end_yn = 'N';
                    $('#endLot').hide();
                }
                if(checkBoxChecked == false && checkBoxId == 'ing'){
                    $scope.sale_status_ing_yn = 'N';
                    $('#ingLot').hide();
                }
                // if(checkBoxChecked == false && checkBoxId == 'ready'){
                //     $scope.sale_status_ready_yn = 'N';
                //     $('#readyLot').hide();
                // }
            });

            $scope.search.mate_nm = $('#mateNm').val();
            loadLotList($scope.currentPage, $scope.subPage);
            $(".filter_fixed-wrap").removeClass("active");
        }

        // 호출 부
        const get_search_list = (data) => {
            try {
                return axios.post('/api/auction/searchList', data);
            } catch (error) {
                console.error(error);
            }
        };

        $scope.favorite = function (item) {
            if (sessionStorage.getItem("is_login") === 'false') {
                alert('로그인을 진행해주세요.');
                return;
            }
            let url = item.FAVORITE_YN === 'Y' ? "/api/auction/delCustInteLot" : "/api/auction/addCustInteLot";
            try {
                axios.post(url, {
                    sale_no: item.SALE_NO, lot_no: item.LOT_NO
                }).then(function (response) {

                    console.log("response :::: " +  response);

                    if (response.data.success) {
                        item.FAVORITE_YN = item.FAVORITE_YN === 'N' ? 'Y' : 'N';
                        $scope.$apply();
                    }
                });
            } catch (error) {
                console.error(error);
            }
        }

        $scope.search = function(){
            loadLotList($scope.currentPage, $scope.subPage);
        }

        $scope.moreSearch = function(){
            //더보기가 선택된 경우 더보기 계산
            if($scope.firstChk > 0){
                $scope.reqRowCnt = parseInt($scope.reqRowCnt) + 5;
            }
            loadLotList($scope.currentPage, $scope.subPage);
        }
        $scope.cnt = 0;

        $scope.init = function(){
            const request = new Request();
            $scope.search.keyword = request.getParameter("searchContent");
            $scope.search.chk = "all";//검색 조건 (all 통합검색, art 작가명, title 작품명)

            //검색결과 및 더보기 초기 로딩시 안보이게 숨김
            $("#more_search").hide();
            $("#search_empty").hide();

            addCookie($scope.search.keyword, "keywordHistory");
            $('input:checkbox[name="lotCheckBox"]').attr("checked", true);
            if($scope.search.keyword.length > 0){
                if(getCookie("prev_url").indexOf("lotDetail") > -1 ||
                    getCookie("prev_url").indexOf("lotSearchList") > -1){
                    if(getCookie('page') != undefined){
                        loadLotList(getCookie('page'), 'all');
                    }
                    else{
                        loadLotList(1, 'all');
                    }
                }
                else{
                    loadLotList(1, 'all');
                }
            }

            //추천 검색어

            axios.get('/api/auction/selectRecommandArtist').then(function(response) {
                console.log(response);
                const success = response.data.success;

                $('.word-items').empty();

                if (success) {
                    const data = response.data.data;
                    data.map(item =>{
                        let html = `<button onclick="recommandSearch(` + item.name + `)">` + + `</button>`;
                        html = '<button onclick="recommandSearch(\''+ JSON.parse(item.artist_name)[locale] +'\');">' + JSON.parse(item.artist_name)[locale]  + '</button>'
                        $('.word-items').append(html);
                    });
                }
            })
                .catch(function(error){
                    console.log(error);
                });
        }

        $scope.goDetail = function (saleNo, lotNo, saleKind, end_yn) {

            if(end_yn == 'Y'){
                window.location.href = '/auction/results';
            }else{
                if(saleKind == 'online' || saleKind == 'online_zb' ){
                    window.location.href = '/auction/online/view/' +  saleNo + '/' + lotNo;
                }else{
                    window.location.href = '/auction/live/view/' +  saleNo + '/' + lotNo;
                }
            }
        }
    });
</script>
</body>
</html>