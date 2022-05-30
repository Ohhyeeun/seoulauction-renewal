<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>search | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
</head>
<body class="">
<div class="wrapper" >
    <div class="sub-wrap pageclass type-width_list">

        <!-- header -->
        <%--<link rel="stylesheet" href="/css/main.css" type="text/css" />--%>
        <jsp:include page="../../include/en/header.jsp" flush="false"/>
        <!-- //header -->
        <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
        <script type="text/javascript" src="/js/angular/checklist-model.js"></script>
        <script type="text/javascript" src="/js/angular/rzslider.min.js"></script>
        <link href="/css/jquery.nouislider.css" rel="stylesheet">
        <script type="text/javascript" src="/js/customer/login.js"></script>
        <script>
            app.value('locale', 'en');
        </script>
        <script type="text/javascript" src="/js/sale/search.js"></script>

        <!-- container -->
        <div id="container" ng-controller="lotListCtl">
            <div id="contents" class="contents">
                <section class="basis-section search-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-search">
                            <div class="panel-header">
                                <div class="search_results">"<strong>${param.searchContent}</strong>" 검색결과 <q id="totalCount"></q> 개</div>
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
                                            <span>추천 검색어</span>
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
                                            <li class="active"><a href="" ng-click="loadSubPage('all');" ><span>전체</span> <em id="allCount"></em></a></li>
                                            <li><a href="#tab-cont-2" ng-click="loadSubPage('live');" ><span>라이브</span> <em id="liveCount"></em></a></li>
                                            <li><a href="#tab-cont-3" ng-click="loadSubPage('online');" ><span>온라인</span> <em id="onlineCount"></em></a></li>
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
                                                    <li id="endLot"><span>지난경매</span><button><i class="icon-filter_del"></i></button></li>
                                                    <li id="ingLot"><span>진행경매</span><button><i class="icon-filter_del"></i></button></li>
                                                    <li id="readyLot"><span>예정경매</span><button><i class="icon-filter_del"></i></button></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col_item positon-col2">
                                            <div class="select-box" id="selectSort">
                                                <select class="select2Basic42" >
                                                    <option value="1">경매 최신순</option>
                                                    <option value="2">추정가 낮은순</option>
                                                    <option value="3">추정가 높은순</option>s
                                                </select>
                                            </div>
                                            <div class="select-box" id="selectMore">
                                                <select class="select2Basic42 js-select_page" >
                                                    <option value="1">더보기 방식</option>
                                                    <option value="2">페이지 방식</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </article>
                            </div>
                        </div>

                    </div>
                </section>

                <section class="basis-section last-section auction_list-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list">
                            <div class="panel-body" id="panel_content">

                                <ul class="product-list">
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
                                        <button class="btn btn_gray_line" type="button"><span>더보기</span></button>
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
        <!--footer도 아래와 같이 inculde 하는게 맞지만 일단 깨져서 적용 안함-->
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
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/common/paging.js"></script>
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

<aside class="filter_fixed-wrap">
    <div class="popup-dim"></div>

    <div class="fixed-panel" ng-controller="lotListCtl" data-ng-init="init();">
        <div class="panel-header">
            <button class="filter_close js-filter_close">
                <i class="icon-pop_view_close"></i>
            </button>
            <div class="title-box">
                <div class="box-inner">
                    <span>Filter</span>
                    <button class="btn-filter_refresh">
                        <i class="icon-filter_refresh" ng-click="initFilter();"></i><span>초기화</span>
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
                                <span>경매일</span>
                                <i class="icon-accordion_arrow_thin"></i>
                            </a>
                        </div>
                        <div class="accordion-body">
                            <ul class="check-list">
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox1" type="checkbox" name="lotCheckBox" value="end">
                                            <i></i>
                                            <label for="checkbox1">지난 경매</label>
                                        </span>
                                </li>
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox2" type="checkbox" name="lotCheckBox" value="ing">
                                            <i></i>
                                            <label for="checkbox2">진행 경매</label>
                                        </span>
                                </li>
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox3" type="checkbox" name="lotCheckBox" value="ready">
                                            <i></i>
                                            <label for="checkbox3">예정 경매</label>
                                        </span>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="accordion-header">
                            <div class="header-box">
                                <span>재질</span>
                            </div>
                        </div>
                        <div class="accordion-body">
                            <ul class="check-list">
                                <li>
                                    <input type="text" placeholder="작품재질 입력" ng-model="search.mate_nm" id="mateNm">
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </article>

        </div>
        <div class="panel-footer" >
            <div class="btn_set">
                <div class="btn_item"><a class="btn btn_point btn_lg" href="#" role="button" ng-click="filterCheck();"><span>필터적용</span></a> </div>
            </div>
        </div>
    </div>
</aside>
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
</body>
</html>