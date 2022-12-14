<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:eval expression="@environment.getProperty('bid.domain')" var="bid_domain" />

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<c:set var="isEmployee" value="false" />
<sec:authorize access="hasAuthority('ROLE_EMPLOYEE_USER')">
    <c:set var="isEmployee" value="true" />
</sec:authorize>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass type-width_list">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <%--        <link rel="stylesheet" href="/css/plugin/csslibrary.css">--%>
        <!-- //header -->
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();" ng-cloak>
            <div id="contents" class="contents">
                <!-- page title (ing, view) 경매정보   -->
                <section class="page_title-section list_page-section">
                    <div class="section-inner full_size">
                        <div class="padding-inner">
                            <article class="auction_head_info-article">
                                <div class="center-box ing">
                                    <h2 class="page_title">
                                        <span class="th1">{{sale.SALE_TH | localeOrdinal}} {{sale.TITLE_JSON.ko}}</span>
                                    </h2>
                                    <ul class="event_day-list">
                                        <li>
                                            <span class="colorB2">프리뷰</span><span> : {{sale.PREV_FROM_DT | date:'MM.dd' + '(' + getWeek(sale.PREV_FROM_DT) + ')'}} - {{sale.PREV_TO_DT | date:'MM.dd' + '(' + getWeek(sale.PREV_TO_DT) + ')'}}</span>
                                        </li>
                                        <li>
                                            <span class="colorB2">경매일</span><span> : {{sale.TO_DT | date:'MM.dd' + '(' + getWeek(sale.TO_DT) + ')'}}</span>
                                        </li>
                                    </ul>
                                    <div class="btn_set">
                                        <a class="btn btn_white" href="#" target="_blank" ng-href="/footer/notice/{{sale.WRITE_NO}}" role="button" ng-if="sale.WRITE_NO > 0"><span>안내사항</span></a>
                                        <a class="btn btn_white" ng-click="goBrochure(item.id, item.content.url)" role="button" ng-repeat="item in sale.buttonList">
                                            <span ng-bind="{'pdf':'E-BOOK', 'ebook':'E-BOOK', 'vr':'VR보기'}[item.content_type]"></span>
                                        </a>
                                    </div>
                                </div>
                            </article>
                            <article class="proceeding-article" ng-show="$scope.showCurrentLot === true">
                                <a href="#" title="진행중 Lot 10|김선우" ng-click="goLot(sale_no, CUR_LOT_NO);">
                                    <div class="article-inner">
                                        <div class="column ing">
                                            <strong class="note_msg">진행중 Lot</strong>
                                            <ul class="ac-list">
                                                <li><span id="cur_lot_no" class="count" ng-bind="CUR_LOT_NO"></span>
                                                </li>
                                                <li><span id="cur_artist_name" class="name"
                                                          ng-bind="CUR_LOT_ARTIST_NAME"></span></li>
                                            </ul>
                                        </div>
                                        <i class="icon-link_arrow"></i>
                                    </div>
                                </a>
                            </article>
                        </div>
                    </div>
                </section>
                <section class="basis-section tab-auction-section">
                    <div class="section-inner">
                        <!-- 텝메뉴 (경매카테고리 정보) -->
                        <div class="content-panel type_panel-search_tab ">
                            <div class="panel-header">
                                <div class="tab-wrap">
                                    <div class="tab-area type-left">
                                        <ul class="tab-list js-list_tab">
                                            <li ng-class="{active:'전체' === selectLotTag}"><a href="#tab-cont-1"
                                                                                             ng-click="searchLotTags('전체');"><span>전체</span></a>
                                            <li ng-class="{active: item.CD_ID === selectLotTag}"
                                                ng-repeat="item in categories"><a href="#tab-cont"
                                                                                  ng-click="searchCategory(item.CD_ID);"><span
                                                    ng-bind="item.CD_NM"></span></a></li>
                                            </li>
                                            <li ng-class="{active: item.LOT_TAG === selectLotTag}"
                                                ng-repeat="item in lotTags"><a href="#tab-cont"
                                                                               ng-click="searchLotTags(item.LOT_TAG);"><span
                                                    ng-bind="item.LOT_TAG"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- 텝메뉴 (경매카테고리 정보) -->
                            <div class="panel-body">
                                <article class="search_tab-article">
                                    <div class="article-body">
                                        <div class="col_item mb-col1">
                                            <!-- [0617]카운트/LOT셀렉트박스 분리 -->
                                            <div class="count tb1">
                                                <span>ALL <em ng-bind="lotLength"></em></span>
                                            </div>
                                            <!-- [0714]LOT셀렉트박스 모바일 분리/변경 -->
                                            <div class="select-box only-pc">
                                                <div class="trp-dropdown-area h42-line">
                                                    <%-- 0712 lot 팝업 수정 --%>
<%--                                                    <button class="js-lotbox-btn">--%>
                                                    <button class="js-dropdown-btn">
                                                        <span>LOT</span><i
                                                            class="form-select_arrow_md"></i>
                                                    </button>
                                                    <div class="trp-dropdown_list-box"
                                                         data-trp-focusid="js-user_support">
                                                        <!-- 랏 서치 -->
                                                        <div class="search-box">
                                                            <input type="search" id="search_lot" placeholder="LOT 번호 입력"
                                                                   class="">
                                                            <i class="form-search_md"></i>
                                                        </div>
                                                        <!-- 랏 서치  -->
                                                        <!-- 랏 리스트 -->
                                                        <div class="list-box scroll-type">
                                                            <ul id="sale_lot_list">
                                                                <li ng-repeat="item in saleImages"
                                                                    data-index="{{item.LOT_NO}}">
                                                                    <a href="#"
                                                                       ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                        <div class="image-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"
                                                                                         alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="typo-area">
                                                                            <span>LOT {{::item.LOT_NO}}</span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <!-- 랏 리스트 -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="select-box js-lotbox-slct only-mb">
                                                <button class="js-lotbox-btn">
                                                    <span>LOT</span>
                                                    <i class="slct-arrow"></i>
                                                </button>
                                            </div>
                                            <!-- //[0714]LOT셀렉트박스 모바일 분리/변경 -->
                                        </div>
                                        <div class="col_item mb-col2">
                                            <!-- 작가/작품서치  -->
                                            <div class="search-box">
                                                <input type="search" placeholder="작가/작품명" id="search_value"
                                                       ng-model="searchValue"
                                                       ng-keyup="searchArtist(event=$event)" class="h42">
                                                <i class="form-search_md" ng-click="searchArtist2()"></i>
                                            </div>
                                            <!-- 작가/작품서치 -->
                                            <div class="select-box">
                                                <select id="sortType" class="select2Basic42 select2-hidden-accessible"
                                                        ng-init="selectSortType = selectSortType || options[0].value"
                                                        onchange="angular.element(this).scope().rerange();">
                                                    <option ng-repeat="item in modelSortType" value="{{item.value}}">
                                                        {{item.name}}
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="select-box">
                                                <select id="viewType"
                                                        class="select2Basic42 js-select_page select2-hidden-accessible"
                                                        onchange="angular.element(this).scope().chgViewType();">
                                                    <option ng-repeat="item in modelViewType" value="{{item.value}}">
                                                        {{item.name}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>
                <section ng-show="isEmpty" class="basis-section auction_result_list-section last-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_result_list">
                            <div class="panel-body">
                                <div class="data-empty type-big">
                                    <div class="img_empty">
                                        <img src="/images/mobile/auction/symbol-none_data.png" alt="검색결과가 없습니다."/>
                                    </div>
                                    <div class="txt_empty">
                                        <div class="title">검색결과가 없습니다.</div>
                                        <div class="desc">단어의 철자나 띄어쓰기가 <br class="only-mb">
                                            정확한지 확인해주세요</div>
                                    </div>
                                    <div class="empty_btn">
                                        <button class="btn btn_gray_line" type="button" ng-click="searchAll();">
                                            <span>전체결과보기</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="basis-section last-section auction_list-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_list">
                            <div class="panel-body">
                                <ul class="product-list">
                                    <!-- 작품 리스트 -->
                                    <li ng-class="{cancel: item.STAT_CD === 'reentry'}" ng-repeat="item in saleInfo">
                                        <div class="li-inner">
                                            <!-- 경매 마감 일 때 "result" 클래스 추가 하면 됨. <article class="item-article result"> -->
                                            <article class="item-article" ng-if="item.STAT_CD !== 'reentry'">
                                            <!-- //경매 마감 일 때 "result" 클래스 추가 하면 됨. <article class="item-article result"> -->
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <a href="/auction/online/view/{{item.SALE_NO}}/{{item.LOT_NO}}">
                                                            <div class="img-align">
                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                            </div>
                                                        </a>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <span class="num">{{item.LOT_NO}}</span>
                                                            <button class="heart js-work_heart"><i
                                                                    ng-class="item.FAVORITE_YN==='Y' ? 'icon-heart_off' : 'icon-heart_on'"
                                                                    ng-click="favorite(item);"
                                                            ></i></button>
                                                        </div>
                                                        <div class="info-box">
                                                            <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                <div class="title"><span>{{item.ARTIST_NAME_JSON != null ? item.ARTIST_NAME_JSON.ko : 'ㅤ'}}</span>

                                                                    <%--                                                                    <span ng-if="item.BORN_YEAR !=null && item.BORN_YEAR !==''" class="sub">({{item.BORN_YEAR}})</span>--%>
                                                                    <%--                                                                    <span ng-if="item.BORN_YEAR ==null || item.BORN_YEAR ===''" class="sub">ㅤ</span>--%>

                                                                </div>
                                                                <div class="desc">
                                                                    <span class="text-over span_block">{{item.LOT_TITLE_JSON.ko != null ? item.LOT_TITLE_JSON.ko : 'ㅤ'}}</span>
                                                                </div>
                                                                <div class="standard">
                                                                        <span class="text-over span_block">{{item.CD_NM != null ? item.CD_NM : 'ㅤ'}}
                                                                        </span>
                                                                    <div class="size_year">
                                                                        <span ng-bind="item | size_text_cm"></span>
                                                                        <span ng-bind="item.MAKE_YEAR_JSON.ko" ng-show="item.MAKE_YEAR_JSON.ko !== undefined"></span>
                                                                        <span ng-show="(item.MAKE_YEAR_JSON.ko === undefined && change_size)">ㅤ</span>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="price-box">
                                                            <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                <dl ng-if="item.EXPE_PRICE_INQ_YN !== 'Y'" class="price-list">
                                                                    <dt>추정가</dt>
                                                                    <dd>KRW {{item.EXPE_PRICE_FROM_JSON.KRW}}</dd>
                                                                    <dd>~ {{item.EXPE_PRICE_TO_JSON.KRW}}</dd>
                                                                </dl>
                                                                <dl ng-if="item.EXPE_PRICE_INQ_YN === 'Y'" class="price-list">
                                                                    <dt>추정가</dt>
                                                                    <dd><strong>별도문의</strong></dd>
                                                                    <dd></dd>
                                                                </dl>
                                                                <dl class="price-list" ng-if="item.START_PRICE !== ''">
                                                                    <dt>시작가</dt>
                                                                    <dd>{{item.START_PRICE}}</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt ng-bind="item.ON_STATE_COST_TXT"></dt>
                                                                    <dd ng-if="item.CUR_COST !== ''">
                                                                        <strong>{{item.CUR_COST}}</strong><em>{{item.BID_COUNT}}</em>
                                                                    </dd>
                                                                    <dd ng-if="item.CUR_COST === ''">
                                                                        <strong></strong><em></em>
                                                                    </dd>
                                                                </dl>
                                                            </a>
                                                        </div>
                                                        <%-- 0812(경매 마감 시 경매결과 보기) --%>
                                                        <div class="bidding-box">
                                                            <div class="deadline_set"><a href="#"><span>경매종료</span></a></div>
                                                            <div class="btn_set"><a class="btn btn_gray" href="#" role="button"><span>경매결과 보기</span></a></div>
                                                        </div>
                                                        <%-- //0812(경매 마감 시 경매결과 보기) --%>  

                                                        <div class="bidding-box">
                                                            <div class="deadline_set"><span
                                                                    ng-bind="item.BID_TICK"></span>
                                                            </div>
                                                            <div class="btn_set"><a name="open_popup"
                                                                                    class="btn btn_point"
                                                                                    href="javascript:void(0);"
                                                                                    ng-click="popSet(item.SALE_NO,item.LOT_NO, user_id, cust_no);"
                                                                                    role="button"><span
                                                                    ng-bind="item.BID_TICK_BTN">응찰</span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                            <article class="item-article" ng-if="item.STAT_CD === 'reentry'">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <a>
                                                            <div class="img-align">
                                                            </div>
                                                        </a>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                <span class="num"></span>
                                                            </a>
                                                            <button class="heart js-work_heart"><i></i></button>
                                                        </div>
                                                        <div class="info-box">
                                                            <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                <div class="title"><span></span>
                                                                </div>
                                                                <div class="desc">
                                                                    <span class="text-over span_block"></span>
                                                                </div>
                                                                <div class="standard">
                                                                    <span class="text-over span_block"></span>
                                                                    <div class="size_year">
                                                                        <span></span>
                                                                        <span></span>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="price-box">
                                                            <dl class="price-list">
                                                                <dt></dt>
                                                                <dd></dd>
                                                                <dd></dd>
                                                            </dl>
                                                            <dl class="price-list">
                                                                <dt></dt>
                                                                <dd></dd>
                                                            </dl>
                                                            <dl class="price-list">
                                                                <dt></dt>
                                                                <dd>
                                                                    <strong></strong><em></em>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                        <div class="bidding-box">
                                                            <div class="deadline_set"><span></span>
                                                            </div>
                                                            <div class="btn_set">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_cancle-area">
                                                    <div class="area-inner">
                                                        <i class="icon-cancle_box"></i>
                                                        <div class="typo">
                                                            <div class="name"><span>LOT {{item.LOT_NO}}</span></div>
                                                            <div class="msg"><span>출품이 취소되었습니다.</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                    <!-- 작품 리스트 -->
                                </ul>
                            </div>
                            <div class="panel-footer">
                                <div class="set-pc_mb">
                                    <div id="page_layer" ng-show="selectViewType == 1">
                                        <div class="paging-area">
                                            <!-- paging -->
                                            <div class="paging">
                                                <a href="javascript:void(0);" ng-click="pageing(1);"
                                                   class="prev_end icon-page_prevprev">FIRST</a>
                                                <a href="javascript:void(0);" ng-click="pageingPrev();"
                                                   class="prev icon-page_prev">PREV</a>
                                                <a href="javascript:void(0);" ng-click="pageing(item);"
                                                   ng-class="{'on':item === curpage}"
                                                   ng-repeat="item in pageingdata">
                                                    <strong ng-if="item === curpage" ng-bind="item"></strong>
                                                    <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                <a href="javascript:void(0);" ng-click="pageingNext();"
                                                   class="next icon-page_next">NEXT</a>
                                                <a href="javascript:void(0);" ng-click="pageing(pagelast);"
                                                   class="next_end icon-page_nextnext">LAST</a>
                                            </div>
                                            <!-- paging -->
                                        </div>
                                    </div>
                                    <!-- 더보기 -->
                                    <div id="add_layer" class="only-mb2" ng-show="selectViewType == 2">
                                        <button class="btn btn_gray_line" type="button"
                                                ng-click="addpage(curpage + 1);">
                                            <span>더보기</span></button>
                                    </div>
                                    <!-- 더보기 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <input type="hidden" id="token" value="{{token}}"/>
                <input type="hidden" id="sale_no" value="{{sale_no}}"/>
                <input type="hidden" id="lot_no" value=""/>
                <input type="hidden" id="user_id" value="${member.loginId}"/>
                <input type="hidden" id="cust_no" value="${member.userNo}"/>


                <!-- 랏상세 페이지 시작. -->
                <aside class="allview_fixed-wrap lot">
                    <div class="popup-dim"></div>
                    <!-- [0712]외부영역 클릭 시 닫힘:class(js-modal) 추가 -->
                    <div class="fixed-panel js-modal">
                        <div class="panel-header">
                            <button class="js-fixed_total"><span>전체 LOT</span><i class="icon-fixed_arrow-2x"></i></button>
                        </div>
                        <div class="panel-body">
                            <article class="bidding-offline-left">

                                <div class="lotlist-wrap">
                                    <div class="lotlist-header">
                                        <div class="header_top">
                                            <p class="totalcount"><span ng-bind="lotLength" class="num"></span> <span class="unit">LOT</span></p>
                                        </div>

                                        <div class="lotlist-tabmenu">

                                            <div class="btn_item">
                                                <a href="#" ng-class="'전체' === selectLotTag ? 'lot-btn_tabmenu on' : 'lot-btn_tabmenu'"
                                                   ng-click="searchLotTags('전체');" role="button">전체</a>
                                            </div>
                                            <div class="btn_item" ng-repeat="item in categories">
                                                <a href="#" ng-class="item.CD_ID === selectLotTag ? 'lot-btn_tabmenu on' : 'lot-btn_tabmenu'"
                                                   ng-click="searchCategory(item.CD_ID);" ng-bind="item.CD_NM" role="button"></a>
                                            </div>

                                            <div class="btn_item" ng-repeat="item in lotTags">
                                                <a href="#" ng-class="item.LOT_TAG === selectLotTag ? 'lot-btn_tabmenu on' : 'lot-btn_tabmenu'"
                                                   ng-click="searchLotTags(item.LOT_TAG);" ng-bind="item.LOT_TAG" role="button"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="lotlist-tabCont">

                                        <div class="mobile_scroll-type">
                                            <div class="lotlist-box">
                                                <ul class="lotlist-inner"  ng-repeat="item in searchSaleInfoAll">

                                                    <li ng-class="item.STAT_CD === 'reentry' ? 'lotitem cancel' : 'lotitem'">

                                                        <%--출품 취소상태가 아닐떄--%>
                                                        <div ng-show="item.STAT_CD !== 'reentry'" class="js-select_lotitem lotitem_wrap"
                                                             ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                            <div class="view-img">
                                                                <div class="img-box">
                                                                    <div class="box-inner">
                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="LOT {{item.LOT_NO}}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="item-cont">
                                                                <div class="num-box">
                                                                    <div class="num"><span class="snum">{{item.LOT_NO}}</span> </div>
                                                                </div>
                                                                <div class="typo-box">
                                                                    <div class="title"><span>{{item.LOT_TITLE_JSON.ko}}</span></div>
                                                                    <div class="desc"><span>{{item.CD_NM}}</span></div>
                                                                </div>
                                                                <div class="btn-box">
                                                                    <button ng-class="item.FAVORITE_YN==='Y' ? 'btn-lotChk js-work_heart' : 'btn-lotChk js-work_heart on'"
                                                                            ng-click="favorite(item , event=$event);">Favorite</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--출품 취소상태 일떄--%>
                                                        <p ng-show="item.STAT_CD === 'reentry'" class="txt">
                                                            {{item.LOT_NO}} <br>
                                                            출품이 취소 되었습니다.
                                                        </p>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </aside>
                <!-- 랏상세 페이지 끝. -->


            </div>
            <!-- //container -->
            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
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
</div>

    <script type="text/javascript" src="/js/auction/saleCert.js"></script>

    <jsp:include page="popup/auctionBidPopup.jsp" flush="false"/>
    <jsp:include page="popup/auctionConfirmPopup.jsp" flush="false"/>

    <!-- 하트 토글 -->
    <script>
        document.cookie = "crossCookie=bar; SameSite=None; Secure";
        $(".js-work_heart").trpToggleBtn(function ($this) {
            $($this).addClass("on");
        }, function ($this) {
            $($this).removeClass("on");
        });
    </script>

    <!-- 셀렉트 드롭다운 -->
    <script>
        let dropdown = $(".js-dropdown-btn").trpDropdown({
            list: ".trp-dropdown_list-box",
            area: ".trp-dropdown-area"
        });
        $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function ($e) {
            $e.preventDefault();
            var _this = $(this);
            _this.closest("ul").find("li").removeClass("on");
            _this.closest("li").addClass("on");
            _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
            dropdown.getClose();
        });
    </script>


    <!-- tab menu -->
    <script>
        $('.js-list_tab a').on('click', function (e) {
            e.preventDefault();
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
    </script>

    <!-- popup tab -->
    <script>
        $("body").on("click", ".selection", function () {
            $(window).trigger("resize");

        })
        $(".js-bidding_tab .topbtn-area .btn_item").on("click", function ($e) {
            var _index = $(this).index();


            $(".js-bidding_tab .topbtn-area .btn").removeClass("btn_default");
            $(".js-bidding_tab .topbtn-area .btn").addClass("btn_gray");
            $(".btn", this).removeClass("btn_gray").addClass("btn_default")

            //$("#reservation_bid").select2();

            $(".js-bidding_tab .bottombtn-area .btn_set").removeClass("active");
            $(".js-bidding_tab .bottombtn-area .btn_set").eq(_index).addClass("active");
        });
    </script>

    <!-- pc, mb select 값변경  -->
    <script>
        /*   $(function () {
               $(window).on("resize", function ($e) {
                   //select_resize_change();
               });
               function select_resize_change() {
                   if ($("body").hasClass("is_mb")) {
                       $(".js-select_page").val("2");
                   } else {
                       $(".js-select_page").val("1");
                   }
                   $(".js-select_page").trigger('change');
               }
               //select_resize_change();
           });
       */
    </script>
    <script>
        function size_text_cm(src) {
            if (src === null || src === undefined) {
                return;
            }

            var returnValue = "";
            var cmSize = ""

            for (let i = 0; i < src.length; i++) {
                if (src[i].UNIT_CD === "cm") {
                    cmSize = src[i].SIZE1 != 0 ? src[i].SIZE1.toFixed(1) : "";
                    cmSize += src[i].SIZE2 != 0 ? "☓" + src[i].SIZE2.toFixed(1) : "";
                    cmSize += src[i].SIZE3 != 0 ? "☓" + src[i].SIZE3.toFixed(1) +
                        "(" + (src[i].MIX_CD == "depth" ? "d" : "h") + ")" : "";
                    cmSize += cmSize != "" ? src[i].UNIT_CD : "";
                    cmSize += cmSize != "" && src[i].CANVAS != 0 ? " (" + (src[i].CANVAS_EXT_YN == "Y" ? "변형" : "") + src[i].CANVAS + ")" : "";

                    returnValue = src[i].PREFIX;
                    returnValue += (src[i].DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
                    returnValue += (src[i].SUFFIX ? " (" + src[i].SUFFIX + ") " : "");
                    return returnValue;
                }
            }
            return "";
        }

        //약관체크
        $(".js_all-1").trpCheckBoxAllsImg(".js_all", ".js_item");

        let popup_offline_payment = $(".js-popup_online_confirm").trpLayerFixedPopup("#popup_online_confirm-wrap");
        let popup_biddingPopup1 = $("a[name='open_popup']").trpLayerFixedPopup("#popup_biddingPopup1-wrap");

        <!-- angular js -->
        app.value('locale', 'ko');
        app.value('is_login', false);
        app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

        app.controller('ctl', function ($scope, consts, common, is_login, locale, $filter, $interval) {
            $scope.is_login = is_login;
            $scope.locale = locale;
            $scope.sale_no = "${saleNo}";
            $scope.cust_no = ${member.userNo};
            $scope.user_id = '${member.loginId}';

            $scope.pagesize = 10;
            $scope.itemsize = 20;
            $scope.curpage = 1;
            $scope.change_size = false;

            $scope.is_sale_cert = false;
            $scope.cust_hp = "";
            $scope.isEmployee = ${isEmployee};

            $scope.modelSortType = [{
                name: "LOT 번호순", value: 1
            }, {
                name: "추정가 높은순", value: 2
            }, {
                name: "추정가 낮은순", value: 3
            }, {
                name: "마감순", value: 4
            },{
                name: "응찰가 높은순", value: 5
            }, {
                name: "응찰가 낮은순", value: 6
            }, {
                name: "응찰수 높은순", value: 7
            }, {
                name: "응찰수 낮은순", value: 8
            }];

            $scope.modelViewType = [{
                name: "페이지 방식", value: 1
            }, {
                name: "더보기 방식", value: 2
            }];

            $scope.selectSortType = 1;
            $scope.selectViewType = 1;
            $scope.searchValue = "";
            $scope.searchSaleInfoAll = [];
            $scope.selectLotTag = "전체";

            $scope.searchInit = function (event) {
                $scope.searchValue = '';
                $scope.searchArtist2();
            }

            $scope.searchArtist = function (event) {
                if (event.keyCode === 13 || $scope.searchValue.length <= 0) {
                    $scope.searchArtist2();
                }
            }

            $scope.searchAll = function () {
                $scope.searchValue = "";
                $scope.searchArtist2();
            }

            $scope.searchArtist2 = function () {
                let pp = [];

                for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                    if ($scope.saleInfoAll[i].ARTIST_NAME_JSON != null && $scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 || $scope.saleInfoAll[i].LOT_TITLE_JSON != null && $scope.saleInfoAll[i].LOT_TITLE_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                        pp.push($scope.saleInfoAll[i]);
                    }
                }
                if (pp.length <= 0) {
                    $scope.isEmpty = true;
                } else {
                    $scope.isEmpty = false;
                }
                $scope.lotLength = pp.length;
                $scope.searchSaleInfoAll = pp;
                $scope.pageing(1);

            }

            $scope.goLot = function (saleNo, lotNo) {
                window.location.href = '/auction/online/view/' + saleNo + '/' + lotNo;
            }

            $scope.favorite = function (item, $e) {
                if(!checkLogin()) return;

                let url = item.FAVORITE_YN === 'N' ? "/api/auction/delCustInteLot" : "/api/auction/addCustInteLot";

                try {
                    axios.post(url, {
                        sale_no: item.SALE_NO, lot_no: item.LOT_NO
                    }).then(function (response) {
                        if (response.data.success) {
                            item.FAVORITE_YN = item.FAVORITE_YN === 'N' ? 'Y' : 'N';
                            $scope.$apply();
                        }
                    });
                } catch (error) {
                    console.error(error);
                }

                if($e !==undefined) {
                    $e.stopPropagation();
                }
            }

            // 호출 부
            const getSaleInfo = (saleNo) => {
                try {
                    return axios.get('/api/auction/list/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            };

            const getSaleImages = (saleNo, lotNo) => {
                try {
                    return axios.get('/api/auction/sale_images/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            }

            const getLotTags = (saleNo, lotNo) => {
                try {
                    return axios.get('/api/auction/lotTag/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            }

            const getCategories = (saleNo) => {
                try {
                    return axios.get('/api/auction/categories/' + saleNo);
                } catch (error) {
                    console.error(error);
                }
            }

            $scope.searchLotTags = function (lotTag) {
                $scope.selectLotTag = lotTag;


                let pp = [];
                if (lotTag === '전체') {
                    if ($scope.searchValue.length > 0) {
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                            if ($scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.indexOf($scope.searchValue) >= 0) {
                                pp.push($scope.saleInfoAll[i]);
                            }
                        }
                    } else {
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                                pp.push($scope.saleInfoAll[i]);
                        }
                    }
                } else {
                    if ($scope.searchValue.length > 0) {
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                            if ($scope.saleInfoAll[i].LOT_TAG === lotTag &&
                                $scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.indexOf($scope.searchValue) >= 0) {
                                pp.push($scope.saleInfoAll[i]);
                            }
                        }
                    } else {
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                            if ($scope.saleInfoAll[i].LOT_TAG === lotTag){
                                pp.push($scope.saleInfoAll[i]);
                            }
                        }
                    }
                }
                if (pp.length > 0) {
                    $scope.isEmpty = false;
                } else {
                    $scope.isEmpty = true;
                }
                $scope.lotLength = pp.length;
                $scope.searchSaleInfoAll = pp;
                $scope.pageing(1);

            }

            $scope.searchCategory = function (category) {
                $scope.selectLotTag = category;
                let pp = [];
                if ($scope.searchValue.length > 0) {
                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if ($scope.saleInfoAll[i].CATE_CD_ID === category &&
                            $scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.indexOf($scope.searchValue) >= 0) {
                            pp.push($scope.saleInfoAll[i]);
                        }
                    }
                } else {
                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if ($scope.saleInfoAll[i].CATE_CD_ID === category){
                            pp.push($scope.saleInfoAll[i]);
                        }
                    }
                }

                if (pp.length > 0) {
                    $scope.isEmpty = false;
                } else {
                    $scope.isEmpty = true;
                }
                $scope.lotLength = pp.length;
                $scope.searchSaleInfoAll = pp;
                $scope.pageing(1);

            }

            $scope.popSet = function (saleNo, lotNo, userId, custNo) {
                if(!checkLogin()) return;

                let isCustRequired = ${isCustRequired};
                if(!isCustRequired){
                    if(confirm('온라인 경매 응찰 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')){
                        location.href = '/mypage/custModify';
                    }
                    return;
                }

                let is_sale_cert = $scope.is_sale_cert;
                if (!is_sale_cert) {
                    popup_offline_payment.open(this); // or false
                    popup_fixation("#popup_online_confirm-wrap"); // pc 하단 붙이기

                    // 경매번호 삽입
                    $("#sale_no").val(saleNo);
                    // 랏번호 삽입
                    $("#lot_no").val(lotNo);

                    $("body").on("click", "#popup_online_confirm-wrap .js-closepop, #popup_online_confirm-wrap .popup-dim", function ($e) {
                        $e.preventDefault();
                        popup_offline_payment.close();
                    });
                } else {
                    let init_func_manual = async function (token, saleNo, lotNo, saleType, custNo) {
                        //console.log(token, saleNo, lotNo, saleType, userId);
                        // 경매번호 삽입
                        $("#sale_no").val(saleNo);
                        // 랏번호 삽입
                        $("#lot_no").val(lotNo);
                        let url = '';
                        if (window.location.protocol !== "https:") {
                            url = 'http${bid_domain}/init2';
                        } else {
                            url = 'https${bid_domain}/init2';
                        }
                        let resp = await fetch(url, {
                            method: "POST", body: JSON.stringify({
                                token: $scope.token,
                                sale_no: saleNo,
                                lot_no: lotNo,
                                sale_type: saleType,
                                user_id: '${member.loginId}',
                                cust_no: custNo,
                            }),
                        });
                        return resp;
                    }

                    // 메타데이타
                    let lotInfo = {};


                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if ($scope.saleInfoAll[i].SALE_NO === saleNo && $scope.saleInfoAll[i].LOT_NO === lotNo) {
                            lotInfo = {
                                imageUrl: $scope.saleInfoAll[i].IMAGE_URL + $scope.saleInfoAll[i].FILE_PATH + "//" + $scope.saleInfoAll[i].FILE_NAME,
                                artistName: $scope.saleInfoAll[i].ARTIST_NAME_JSON.ko,
                                bornYear: $scope.saleInfoAll[i].BORN_YEAR,
                                lotTitle: $scope.saleInfoAll[i].LOT_TITLE_JSON.ko,
                                material: $scope.saleInfoAll[i].CD_NM,
                                lotSize: $scope.saleInfoAll[i].LOT_SIZE_JSON,
                                makeYear: $scope.saleInfoAll[i].MAKE_YEAR_JSON.ko,
                            }
                            break
                        }
                    }

                    // 초기화
                    $("#pop_img_url").attr("src", "");
                    $("#bid_lst").html("");
                    $("#sale_no").val("");
                    $("#lot_no").val("");
                    $("#pop_lot_no").html("");
                    $("#pop_artist_nm").html("");
                    $("#pop_born_year").html("");
                    $("#pop_lot_title").html("");
                    $("#pop_material").html("");
                    $("#pop_size").html("");
                    $("#pop_make_year").html("");

                    // 초기화
                    $("#bid_lst").html('');
                    // 랏번호 삽입
                    $("#sale_no").val(saleNo);
                    // 랏번호 삽입
                    $("#lot_no").val(lotNo);
                    //
                    $("#pop_lot_no").html("LOT " + lotNo);
                    $("#pop_img_url").attr("src", lotInfo.imageUrl);
                    $("#pop_artist_nm").html(lotInfo.artistName);
                    $("#pop_born_year").html(lotInfo.bornYear);
                    $("#pop_lot_title").html(lotInfo.lotTitle);
                    $("#pop_material").html(lotInfo.material);
                    $("#pop_size").html(size_text_cm(lotInfo.lotSize));
                    if(lotInfo.makeYear) {
                        $("#pop_make_year").show();
                        $("#pop_make_year").html(lotInfo.makeYear);
                    } else {
                        $("#pop_make_year").hide();
                    }

                    popup_biddingPopup1.open(this); // or false
                    popup_fixation("#popup_biddingPopup1-wrap");

                    // 팝업시 1회응찰고정
                    $(".js-bidding_tab .topbtn-area .btn_item:eq(0)").click();

                    init_func_manual(token, parseInt(saleNo), parseInt(lotNo), 2, custNo);

                    $("body").on("click", "#popup_biddingPopup1-wrap .js-closepop, #popup_biddingPopup1-wrap .popup-dim", function ($e) {
                        $e.preventDefault();
                        popup_biddingPopup1.close();
                    });
                }
            }

            // 호출 부
            $scope.load = function () {


                let run = async function () {
                    let [r1, r2, r3, r4] = await Promise.all([getSaleInfo($scope.sale_no), getSaleImages($scope.sale_no), getLotTags($scope.sale_no), getCategories($scope.sale_no)]);

                    $scope.saleInfoAll = r1.data.data;
                    $scope.saleImages = r2.data.data;
                    $scope.lotTags = r3.data.data;
                    $scope.categories = r4.data.data;

                    $scope.searchSaleInfoAll = $scope.saleInfoAll;

                    if ($scope.saleInfoAll.length > 0) {
                        if ($scope.saleInfoAll[0].SALE_KIND_CD !== "online") {
                            alert('잘못된 접근 입니다.');
                            window.history.back();
                            return;
                        }
                    }

                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if ($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW != null) {
                            $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW.toLocaleString('ko-KR');
                        }
                    }
                    $scope.saleInfo = $scope.saleInfoAll.slice(0, $scope.itemsize);

                    let pp = $scope.makePageing($scope.saleInfoAll, 1);
                    $scope.pageingdata = pp;
                    $scope.curpage = 1;
                    $scope.lotLength = $scope.saleInfoAll.length;

                    await $scope.setSale($scope.sale_no);
                    //get sale cert
                    if (sessionStorage.getItem("is_login") === 'true') {
                        if ($scope.sale_status == "ING") {
                            await axios.get('/api/cert/sales/${saleNo}')
                                .then(function (response) {
                                    if (response.data.success) {
                                        if (response.data.data.CNT > 0) {
                                            $scope.is_sale_cert = true;
                                        } else {
                                            if(localStorage.getItem('saleCert${saleNo}') == null){
                                                localStorage.setItem('saleCert${saleNo}', 'Y');
                                                $scope.popSet();
                                            }
                                        }
                                        $("#cust_hp").val(response.data.data.HP);
                                        $scope.cust_hp = response.data.data.HP;
                                    }
                                });
                        }
                        await axios.get('/api/mypage/manager')
                            .then(function (response) {
                                if (response.data.success && response.data.data != undefined) {
                                    $("em#manager").html(response.data.data.EMP_NAME + " " + response.data.data.TEL);
                                }
                            });
                    }

                    $scope.$apply();

                    $scope.bidstart('${member.loginId}', ${member.userNo});
                    // lot
                    $("#search_lot").on("keyup", function () {
                        window.event.preventDefault();
                        let v = $("#search_lot").val();
                        if (v.length == 0) {
                            $("#sale_lot_list li").each(function (i, item) {
                                $(item).css("display", "");
                            })
                            return
                        } else {
                            $("#sale_lot_list li").each(function (i, item) {
                                if ($(item).attr('data-index').toString() != v) {
                                    $(item).css("display", "none");
                                } else {
                                    $(item).css("display", "");
                                }
                            })
                        }
                    });


                    //년도가 아래로 가야하는지 체크!!
                    $scope.change_size = matchMedia("(max-width: 1280px) and (min-width: 1023px)").matches;
                    $scope.$apply();

                    $(window).resize(function(){
                        $scope.change_size = matchMedia("(max-width: 1280px) and (min-width: 1023px)").matches;
                        $scope.$apply();
                    });


                }
                run();
            }
            /*################ 웹소켓 #################*/
            let promise;
            // connect 정보
            $scope.connectInfo = {};
            // 웹소켓
            $scope.w;
            // 웹소켓 타임아웃
            $scope.websocketTimeout;
            // 커넥션시도횟수
            $scope.conTryCnt = 0;
            // 비딩 종료 시간
            $scope.endBidTime = 0;
            // 비딩 종료 여부
            $scope.isEndBid = false;
            // 모든 비딩 정보
            $scope.bidsInfoAll = [];

            $scope.auctionEnd = false;

            let w;

            // bidstart
            $scope.bidstart = function (user_id, custNo) {
                $scope.retry(parseInt($scope.sale_no), 0, 2, user_id, custNo);
            }

            // websocket connection retry
            $scope.retry = function (saleNo, lotNo, saleType, userId, custNo) {
                window.clearTimeout($scope.websocketTimeout);
                if ($scope.auctionEnd) {
                    return;
                }
                if (w != null) {
                    w = null;
                }
                if (con_try_cnt > 5) {
                    con_try_cnt = 0
                    return
                }

                if (window.location.protocol !== "https:") {
                    w = new WebSocket("ws${bid_domain}/ws?sale_no=" +
                        $scope.sale_no + "&lot_no=0&cust_no=" + $scope.cust_no +
                        "&user_id=" + $scope.user_id + "&paddle=0&sale_type=2&bid_type=21");
                } else {
                    w = new WebSocket("wss${bid_domain}/ws?sale_no=" +
                        $scope.sale_no + "&lot_no=0&cust_no=" + $scope.cust_no +
                        "&user_id=" + $scope.user_id + "&paddle=0&sale_type=2&bid_type=21");
                }
                w.onopen = function() {
                    console.log("open");
                }
                w.onerror = function(evt) {
                    w.close();
                    console.log('error',evt);
                }
                w.onclose = function () {
                    if (w.readyState === w.CLOSED) {
                        if (!is_end_bid) {
                            con_try_cnt++;
                            $scope.websocketTimeout = window.setTimeout(function () {
                                $scope.retry(saleNo, lotNo, saleType, userId, custNo);
                            }, 1000);
                        }
                    }
                }
                w.onmessage = function (evt) {
                    $scope.proc(evt, saleNo, lotNo, saleType, userId, custNo);
                }
                con_try_cnt = 0;
            }

            // 패킷 정의
            $scope.proc = function (evt, saleNo, lotNo, saleType, userId, custNo) {
                // protocol 정의
                const PROCTOCOL = {
                    INIT: 1, BID_INFO: 2,
                    TIME_SYNC: 3, BID_INFO_INIT: 4,
                    END_TIME_SYNC: 5, WINNER: 6, AUTO_BID_SYNC: 14, LOT_REFRESH: 16,
                }

                // 돈 형식
                const bidCostFormat = function (cost, locale) {
                    let currency = "";
                    if (locale === "ko-KR") {
                        currency = "KRW";
                    }

                    return currency + " " + cost.toLocaleString(locale);
                };
                // 응찰 수 형식
                const bidCountFormat = function (cnt, locale) {
                    return "(" + transferWord("응찰", locale) + " " + cnt + ")";
                };

                // 한영변환
                const transferWord = function (word, locale) {
                    const wordMap = new Map();

                    wordMap.set("응찰", "BID")
                    wordMap.set("현재가", "")
                    wordMap.set("최고가 응찰 중", "")
                    wordMap.set("자동", "AUTO");
                    wordMap.set("경매시작 전 입니다.", "")
                    wordMap.set("낙찰가", "");
                    wordMap.set("경매가 종료되었습니다.", "");
                    wordMap.set("경매결과 보기", "");
                    wordMap.set("자동응찰 중지", "");
                    wordMap.set("일", "DAY");

                    if (locale === "ko-KR") {
                        return word
                    }
                    return wordMap.get(word);
                };

                // history add
                const historyAdd = function(bidLst) {
                    if (bidLst != null && bidLst.length > 0) {
                        let bidLstLayer = $("#bid_lst");
                        for (let i = 0; i < bidLst.length; i++) {
                            let bidTime = new Date(bidLst[i].bid_time);
                            let li = $("<li></li>");
                            let userIdLayer = $("<div></div>");
                            if (bidLst[i].customer.cust_no === custNo) {
                                userIdLayer.attr("class", "product-user on_green");
                            } else {
                                userIdLayer.attr("class", "product-user");
                            }
                            let userIdSpanLayer = $("<span></span>");

                            userIdSpanLayer.text(($scope.cust_no === bidLst[i].customer.cust_no) ? $scope.user_id :
                                bidLst[i].customer.user_id);
                            userIdLayer.append(userIdSpanLayer);

                            // 금액 layer
                            let costLayer = $("<div></div>");
                            costLayer.attr("class", "product-price");

                            // 금액 표시
                            let costLayerSpan = $("<span></span>");
                            costLayerSpan.text(bidLst[i].bid_cost.toLocaleString("ko-KR"));
                            costLayer.append(costLayerSpan);

                            let dateTimeLayer = $("<div></div>");
                            dateTimeLayer.attr("class", "product-day");

                            // 자동
                            let tagTypeLayer;
                            if (bidLst[i].is_auto_bid) {
                                // type
                                tagTypeLayer = $("<em></em>");
                                tagTypeLayer.attr("class", "type-auto");
                                tagTypeLayer.text(transferWord("자동", "ko-KR"));
                                dateTimeLayer.append(tagTypeLayer);
                            }

                            // date
                            let dateSpanLayer = $("<span></span>");
                            dateSpanLayer.text(bidTime.format("yyyy-MM-dd"));
                            // time
                            let timeSpanLayer = $("<span></span>");
                            timeSpanLayer.text(bidTime.format("HH:mm:ss"));

                            dateTimeLayer.append(dateSpanLayer);
                            dateTimeLayer.append(timeSpanLayer);

                            li.append(userIdLayer);
                            li.append(costLayer);
                            li.append(dateTimeLayer);

                            bidLstLayer.prepend(li, bidLstLayer.eq(0));
                        }
                    }
                }

                const quoteAdd = function(quoteLst, bidTopItem) {
                    let quoteArr = [];
                    if (quoteLst != null && quoteLst.length > 0) {
                        let cnt = 1;
                        let viewCnt = 0;

                        let tempCost = (bidTopItem.bid_count === 0) ?
                            bidTopItem.open_bid_cost :
                            bidTopItem.bid_cost;

                        if (bidTopItem.bid_cost === 0) {
                            quoteArr.push(tempCost);
                            viewCnt++;
                        }

                        while (viewCnt < 70) {
                            if (cnt > quoteLst.length - 1) {
                                tempCost = parseInt(tempCost) + parseInt(quoteLst[quoteLst.length - 1].quote_cost)
                                quoteArr.push(tempCost)
                                viewCnt++;
                                continue
                            }
                            if (quoteLst[cnt].cost === tempCost) {
                                tempCost = parseInt(tempCost) + parseInt(quoteLst[cnt].quote_cost)
                                quoteArr.push(tempCost)
                                viewCnt++;
                                continue
                            }
                            if (quoteLst[cnt].cost > tempCost) {
                                tempCost = parseInt(tempCost) + parseInt(quoteLst[cnt - 1].quote_cost)
                                quoteArr.push(tempCost)
                                viewCnt++;
                                continue
                            }
                            cnt++
                        }

                        $("#reservation_bid").find("option").remove();
                        for (let i = 0; i < quoteArr.length; i++) {
                            $("#reservation_bid").append(`<option value="` + quoteArr[i] + `">` + bidCostFormat(quoteArr[i], "ko-KR") + `</option>`);
                        }
                    }
                }

                let d = JSON.parse(evt.data);
                let endBidTime;

                if (d.msg_type === PROCTOCOL.INIT) {
                    // 현재 토큰정보
                    $scope.token = d.message.token;
                } else if (d.msg_type === PROCTOCOL.BID_INFO) {
                    if (d.message.bid != null && d.message.bid.length > 0) {
                        // 비딩 정보를 받으면 현재가로 변경
                        $("#bid_cost_text").text(transferWord("현재가", "ko-KR"));

                        let topBidItem = d.message.bid[d.message.bid.length - 1];
                        let costView = topBidItem.bid_cost;
                        let openCostView = topBidItem.open_bid_cost;
                        let bidCountView = topBidItem.bid_count;

                        // 현재값 세팅
                        let curCostValue = (bidCountView === 0) ? openCostView : costView;

                        let lst = [$scope.saleInfoAll, $scope.searchSaleInfoAll];

                       // 앵귤러 정보 삽입
                        for (let i = 0; i < lst.length; i++) {
                            for (let j = 0; j < lst[i].length; j++) {
                                if (parseInt(lst[i][j].SALE_NO) === topBidItem.customer.sale_no &&
                                    parseInt(lst[i][j].LOT_NO) === topBidItem.customer.lot_no) {
                                    lst[i][j].START_PRICE = bidCostFormat(openCostView, "ko-KR");
                                    lst[i][j].BID_COUNT = bidCountFormat(bidCountView, "ko-KR");
                                    lst[i][j].CUR_COST = bidCostFormat(curCostValue, "ko-KR");
                                    lst[i][j].ON_STATE_COST_TXT = (bidCountView === 0) ? transferWord("", "ko-KR") :
                                        transferWord("현재가", "ko-KR");
                                }
                            }
                        }

                        // 저장된 정보가 다를 경우
                        if (parseInt($("#sale_no").val()) !== topBidItem.customer.sale_no ||
                            parseInt($("#lot_no").val()) !== topBidItem.customer.lot_no) {
                            return
                        }

                        let bidCostLayerValue = $("#bid_cost_val");
                        let bidCostLayer = $("#bid_cost_cnt");
                        let qouteUnitLayer = $("#quote_unit");
                        let bidNewCostLayer = $("#bid_new_cost");
                        let bidNewCostValueLayer = $("#bid_new_cost_val");
                        let bidNewCostBtnLayer = $("#bid_new_cost_btn");

                        bidCostLayerValue.text(bidCostFormat(curCostValue, "ko-KR"));
                        bidCostLayer.text(bidCountFormat(bidCountView, "ko-KR"));
                        qouteUnitLayer.text(bidCostFormat(topBidItem.bid_quote, "ko-KR"));

                        let bidNewCostValue = curCostValue
                        if (bidCountView > 0) {
                            bidNewCostValue += topBidItem.bid_quote
                        }

                        bidNewCostLayer.text(bidCostFormat(bidNewCostValue, "ko-KR"));
                        bidNewCostValueLayer.attr("value", bidNewCostValue);
                        bidNewCostBtnLayer.text(transferWord("응찰", "ko-KR"));

                        // 현재 고객번호와 지금 로그인한 고객번호
                        if (topBidItem.customer.cust_no === $scope.cust_no) {
                            bidNewCostValueLayer.prop("disabled", true);
                            bidNewCostLayer.text(transferWord("최고가 응찰 중", "ko-KR"));
                            bidNewCostBtnLayer.text("");
                        }
                        // 히스토리 추가
                        historyAdd(d.message.bid);

                        // 호가 추가
                        if (!$("#reservation_bid").prop("disabled")) {
                            quoteAdd(d.message.quotes, bidTopItem);
                        }
                    }
                    if (d.message.times !== null && d.message.times.length > 0) {
                        let matching = new Map();
                        for (let j = 0; j < d.message.times.length; j++) {
                            matching.set(d.message.times[j].key, d.message.times[j].value);
                        }
                        let lst = [$scope.saleInfoAll, $scope.searchSaleInfoAll];
                        for (let i = 0; i < lst.length ; i++) {
                            for (let j = 0; j < lst[i].length; j++) {
                                lst[i][j].END_DT = matching.get(lst[i][j].SALE_NO +
                                    "-" + lst[i][j].LOT_NO);
                            }
                        }
                    }
                    $scope.$apply();

                } else if (d.msg_type === PROCTOCOL.TIME_SYNC) {
                    let tickValue = new Date(d.message.tick_value);
                    let bidTickLayer = $("#bid_tick");

                    let lst = [$scope.searchSaleInfoAll, $scope.saleInfoAll, $scope.saleInfo];
                    // 앵귤러 정보 삽입

                    for (let i = 0; i < lst.length; i++) {
                        for (let j = 0; j < lst[i].length; j++) {
                            if (new Date(lst[i][j].FROM_DT_ORG).getTime() > d.message.tick_value) {
                                lst[i][j].BID_TICK = transferWord("경매시작 전 입니다.", "ko-KR");
                            } else if (new Date(lst[i][j].FROM_DT_ORG).getTime() <= d.message.tick_value &&
                                lst[i][j].END_DT >= d.message.tick_value) {
                                let endDate = new Date(lst[i][j].END_DT);
                                let dateGap = endDate - tickValue;
                                let timeGap = new Date(0, 0, 0, 0, 0, 0, dateGap);

                                // 시간 계산
                                let diffDay = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10) ? 0 +
                                    (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString() :
                                    Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                                let diffHour = (timeGap.getHours() < 10) ? 0 +
                                    timeGap.getHours().toString() :
                                    timeGap.getHours();       // 시간
                                let diffMin = (timeGap.getMinutes() < 10) ? 0 +
                                    timeGap.getMinutes().toString() :
                                    timeGap.getMinutes();   // 분
                                let diffSec = (timeGap.getSeconds() < 10) ? 0 +
                                    timeGap.getSeconds().toString() :
                                    timeGap.getSeconds();   // 초

                                if (diffDay == "00") {
                                    if (j === 0) {
                                        $scope.showCurrentLot = true
                                    }
                                    diffDay = ""
                                } else {
                                    $scope.showCurrentLot = false
                                    diffDay += "일 "
                                }
                                lst[i][j].BID_TICK = diffDay + diffHour + ":" + diffMin + ":" + diffSec;
                                lst[i][j].BID_TICK_BTN = transferWord("응찰", "ko-KR");

                                bidTickLayer.text(diffDay + diffHour + ":" + diffMin + ":" + diffSec);
                            } else {
                                if (lst[i][j].bid_count > 0) {
                                    lst[i][j].ON_STATE_COST_TXT = transferWord("낙찰가", "ko-KR");
                                }
                                lst[i][j].BID_TICK = transferWord("경매가 종료되었습니다.", "ko-KR");
                                lst[i][j].BID_TICK_BTN = transferWord("경매결과 보기", "ko-KR");
                            }
                        }
                    }
                    $scope.$apply();

                } else if (d.msg_type === PROCTOCOL.BID_INFO_INIT) {
                    // popup용 이라면
                    if (d.message.is_list_popup) {
                        if (d.message.bids != null && d.message.bids.length > 0) {
                            // element
                            let bidCostLayerValue = $("#bid_cost_val");
                            let bidCostLayer = $("#bid_cost_cnt");
                            let qouteUnitLayer = $("#quote_unit");
                            let bidNewCostLayer = $("#bid_new_cost");
                            let bidNewCostValueLayer = $("#bid_new_cost_val");
                            let bidNewCostBtnLayer  = $("#bid_new_cost_btn");

                            let topBidItem = d.message.bids[d.message.bids.length - 1];
                            let costView = topBidItem.bid_cost;
                            let openCostView = topBidItem.open_bid_cost;


                            let bidCountView = topBidItem.bid_count;


                            //console.log("topBidItem.open_bid_cost-", topBidItem.open_bid_cost);

                            // 현재값 세팅
                            let curCostValue = (bidCountView === 0) ? openCostView: costView;

                            let bidNewCostValue = curCostValue
                            if (bidCountView > 0) {
                                bidNewCostValue += topBidItem.bid_quote
                            }

                            bidCostLayerValue.text(curCostValue);
                            bidCostLayer.text(bidCountFormat(bidCountView, "ko-KR"));

                            // 최종 시간
                            endBidTime = topBidItem.end_bid_time;

                            bidCostLayerValue.text(bidCostFormat(curCostValue, "ko-KR"));
                            bidCostLayer.text(bidCountFormat(bidCountView, "ko-KR"));
                            qouteUnitLayer.text(bidCostFormat(topBidItem.bid_quote, "ko-KR"));

                            bidNewCostLayer.text(bidCostFormat(bidNewCostValue, "ko-KR"));
                            bidNewCostValueLayer.attr("value", bidNewCostValue);
                            bidNewCostBtnLayer.text(transferWord("응찰", "ko-KR"));

                            // 현재 고객번호와 지금 로그인한 고객번호
                            if (topBidItem.customer.cust_no === $scope.cust_no) {
                                bidNewCostValueLayer.prop("disabled", true);
                                bidNewCostLayer.text(transferWord("최고가 응찰 중", "ko-KR"));
                                bidNewCostBtnLayer.text("");
                            }

                            if (d.message.bids_hist != null && d.message.bids_hist.length > 0) {
                                let bidHistInfo = d.message.bids_hist;
                                if (bidHistInfo != null && bidHistInfo.length > 0) {
                                    $("#no_history").css("display", "none");
                                    for (let i = 0; i < bidHistInfo.length; i++) {
                                        if (bidHistInfo[i].value != null) {
                                            historyAdd(bidHistInfo[i].value);
                                        } else {
                                            $("#no_history").css("display", "");
                                        }
                                    }
                                }
                            } else {
                                $("#bid_cost_text").text(transferWord("시작가", "ko-KR"));
                                $("#bid_cost_cnt").text("");
                            }

                            // 호가 추가
                            if (!$("#reservation_bid").prop("disabled")) {
                                quoteAdd(d.message.quotes, topBidItem);
                            }

                            // 낙찰이 완료 되었다면
                            if (topBidItem.winner_state === 2) {
                                $("#end_bid_true").css("display", "");
                                $("div[name='end_bid_false']").css("display", "none");
                                let bidTickLayer = $("#bid_tick");
                                if (endBidTime <= 0) {
                                    bidTickLayer.text(transferWord("경매 시작 전입니다.", "ko-KR"));
                                } else if (endBidTime < new Date().getTime()) {
                                    bidTickLayer.text(transferWord("경매가 종료 되었습니다.", "ko-KR"));
                                    $("#bid_new_cost").text("");
                                }
                            } else {
                                $("#end_bid_true").css("display", "none");
                                $("div[name='end_bid_false']").css("display", "");
                            }
                        }
                        if (d.message.reservation_bid != null) {
                            if (d.message.reservation_bid.customer.sale_no > 0 &&
                                d.message.reservation_bid.customer.lot_no > 0) {
                                $("#reservation_bid").prop("disabled", true);
                                $("#auto_bid_txt").text(transferWord("자동응찰 중지", "ko-KR"));
                                $("#reservation_bid").val(d.message.reservation_bid.bid_cost);
                            } else {
                                $("#reservation_bid").prop("disabled", false);
                                $("#auto_bid_txt").text(transferWord("응찰", "ko-KR"));
                                $("#reservation_bid option:eq(0)").prop("selected", true);
                            }
                        }
                        return
                    }
                    if (d.message.bids != null && d.message.bids.length > 0) {
                        $scope.bidsInfoAll = d.message.bids;
                        let matching = new Map();

                        // 정보를 처음 가져왔을 때, 인덱스 매핑
                        for (let i = 0; i < $scope.bidsInfoAll.length; i++) {
                            matching.set($scope.bidsInfoAll[i].customer.sale_no + "-" + $scope.bidsInfoAll[i].customer.lot_no, i);
                        }

                        // 현재 랏정보
                        $scope.CUR_LOT_NO = $scope.bidsInfoAll[0].cur_lot_no;
                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            if ($scope.saleInfoAll[j].LOT_NO === $scope.bidsInfoAll[0].cur_lot_no) {
                                $scope.CUR_LOT_ARTIST_NAME = $scope.saleInfoAll[j].ARTIST_NAME_JSON.ko;
                                break;
                            }
                        }

                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-" + $scope.saleInfoAll[j].LOT_NO);
                            if ($scope.bidsInfoAll[idx].winner_state === 2 &&
                                parseInt($scope.saleInfoAll[j].LOT_NO) === parseInt($("#lot_no").val())) {
                                $("#end_bid_true").css("display", "");
                                $("div[name='end_bid_false']").css("display", "none");
                                $("#bid_lst li:eq(0) .product-day .type-auto").remove();
                                $("#bid_lst li:eq(0) .product-day .type-success").remove();
                                $("#bid_lst li:eq(0) .product-day").prepend("<em class=\"type-success\">낙찰</em>")
                                break;
                            }
                        }

                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-" + $scope.saleInfoAll[j].LOT_NO);
                            if (idx !== undefined) {
                                let curCostValue = ($scope.bidsInfoAll[idx].bid_count === 0) ?
                                    "" :
                                    bidCostFormat($scope.bidsInfoAll[idx].bid_cost, "ko-KR");
                                // 시작일자
                                $scope.saleInfoAll[j].START_PRICE = bidCostFormat($scope.bidsInfoAll[idx].open_bid_cost, "ko-KR");
                                // 현재가
                                $scope.saleInfoAll[j].CUR_COST = curCostValue;
                                // 응찰 수
                                $scope.saleInfoAll[j].BID_COUNT = bidCountFormat($scope.bidsInfoAll[idx].bid_count, "ko-KR");
                                // 종료일
                                $scope.saleInfoAll[j].END_DT = $scope.bidsInfoAll[idx].end_bid_time;

                                if ($scope.bidsInfoAll[idx].bid_count > 0) {
                                    $scope.saleInfoAll[j].ON_STATE_COST_TXT = transferWord("현재가", "ko-KR");
                                } else {
                                    $scope.saleInfoAll[j].ON_STATE_COST_TXT = ""
                                }
                                // 낙찰이 완료 되었다면
                                if ($scope.bidsInfoAll[idx].winner_state === 2) {
                                    if ($scope.bidsInfoAll[idx].open_bid_time > new Date().getTime()) {
                                        $scope.saleInfoAll[j].BID_TICK = transferWord("경매 시작 전입니다.", "ko-KR");
                                    } else if ($scope.bidsInfoAll[idx].end_bid_time <= new Date().getTime()) {
                                        $scope.saleInfoAll[j].BID_TICK = transferWord("경매가 종료 되었습니다.", "ko-KR");
                                        $scope.saleInfoAll[j].BID_TICK_BTN = transferWord("경매결과 보기", "ko-KR");
                                    }
                                    if ($scope.bidsInfoAll[idx].bid_count > 0) {
                                        $scope.saleInfoAll[j].ON_STATE_COST_TXT = transferWord("낙찰가", "ko-KR");
                                    } else {
                                        $scope.saleInfoAll[j].ON_STATE_COST_TXT = ""
                                    }
                                    $scope.bidsInfoAll[idx].IS_END_BID = true;
                                }
                            }

                        }
                        $scope.$apply();

                    }
                } else if (d.msg_type === PROCTOCOL.WINNER) {
                    if (d.message != null) {
                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            if ($scope.saleInfoAll[j].SALE_NO === d.message.customer.sale_no &&
                                $scope.saleInfoAll[j].LOT_NO === d.message.customer.lot_no) {
                                $scope.saleInfoAll[j].BID_TICK = transferWord("경매가 종료 되었습니다.", "ko-KR");
                                $scope.saleInfoAll[j].BID_TICK_BTN = transferWord("경매결과 보기", "ko-KR");
                                if (parseInt(d.message.customer.lot_no) === parseInt($("#lot_no").val())) {
                                    $("#end_bid_true").css("display", "");
                                    $("div[name='end_bid_false']").css("display", "none");
                                    $("#bid_lst li:eq(0) .product-day .type-auto").remove();
                                    $("#bid_lst li:eq(0) .product-day .type-success").remove();
                                    $("#bid_lst li:eq(0) .product-day").prepend("<em class=\"type-success\">" + transferWord("낙찰", "ko-KR") + "</em>");
                                }
                                // 현재 랏정보
                                $scope.CUR_LOT_NO = d.message.cur_lot_no;
                                for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                                    if ($scope.saleInfoAll[j].LOT_NO === d.message.cur_lot_no) {
                                        $scope.CUR_LOT_ARTIST_NAME = $scope.saleInfoAll[j].ARTIST_NAME_JSON.ko;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                } else if (d.msg_type === PROCTOCOL.AUTO_BID_SYNC) {
                    if (d.message != null) {
                        if (d.message.reservation_bid != null) {
                            if (d.message.reservation_bid.customer.sale_no > 0 &&
                                d.message.reservation_bid.customer.lot_no > 0) {
                                $("#reservation_bid").prop("disabled", true);
                                $("#auto_bid_txt").text(transferWord("자동응찰 중지", "ko-KR"));
                                $("#reservation_bid").val(d.message.reservation_bid.bid_cost);
                            } else {
                                $("#reservation_bid").prop("disabled", false);
                                $("#auto_bid_txt").text(transferWord("응찰", "ko-KR"));
                                quoteAdd(q.message.quotes, d.message.bid);
                                $("#reservation_bid option:eq(0)").prop("selected", true);
                            }
                        }
                    }
                } else if (d.msg_type === PROCTOCOL.LOT_REFRESH) {
                    if (d.message !== undefined && d.message != null) {
                        if (d.message.data !== undefined && d.message.data != null) {
                            let matching = new Map();
                            for (let j = 0; j < d.message.data.length; j++) {
                                matching.set(d.message.data[j].SALE_NO + "-" + d.message.data[j].LOT_NO, j);
                            }
                            let i = 0;
                            for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                                i = matching.get($scope.saleInfoAll[j].SALE_NO +
                                    "-" + $scope.saleInfoAll[j].LOT_NO);
                                $scope.saleInfoAll[j].STAT_CD = d.message.data[i].STAT_CD;
                                $scope.saleInfoAll[j].START_PRICE = bidCostFormat(d.message.data[i].START_PRICE, "ko-KR");
                                $scope.saleInfoAll[j].END_DT = d.message.data[i].END_BID_TIME;
                            }
                        }
                    }
                    $scope.$apply();
                }
            }

            /*##################### 웹소켓 끝 #####################*/
            //페이지방식, 더보기방식 변경
            $scope.chgViewType = function () {
                //let sst = $scope.selectViewType;
                let sst = parseInt($("#viewType option:selected").val())
                $scope.curpage = 1;
                switch (sst) {
                    case 1:
                        $scope.pageing($scope.curpage)
                        break;
                    case 2:
                        $scope.addpage($scope.curpage);
                        break;
                }
                $scope.selectViewType = sst;
            }
            // 정렬방식 설정
            $scope.rerange = function () {
                let sst = parseInt($("#sortType").val())
                let parsing = function(val){
                    if (val.toString() === "") {
                        return 0;
                    }
                    return parseInt(val.toString().replace(/\)/gi, '').replace(/\(/gi, '').replace(/응찰/gi, '').replace(/KRW/gi, '').replace(/,/gi, '').replace(/USD/gi, ''));
                }
                let v;
                for (let i = 0 ; i < $scope.saleInfoAll.length;i++ ){
                    if ($scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW === undefined) {
                        $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = 0;
                    }
                    if ($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW === undefined) {
                        $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = 0;
                    }
                }
                v = $scope.saleInfoAll;

                for (let i = 0 ; i < $scope.searchSaleInfoAll.length; i++){
                    if ($scope.searchSaleInfoAll[i].EXPE_PRICE_TO_JSON.KRW === undefined) {
                        $scope.searchSaleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = 0;
                    }
                    if ($scope.searchSaleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW === undefined) {
                        $scope.searchSaleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = 0;
                    }
                }
                if ($scope.searchSaleInfoAll.length > 0) {
                    v = $scope.searchSaleInfoAll;
                }
                switch (sst) {
                    case 1:
                        // lot 번호 순
                        v.sort(function (a, b) {
                            if (a.LOT_NO > b.LOT_NO) return 1;
                            if (a.LOT_NO === b.LOT_NO) return 0;
                            if (a.LOT_NO < b.LOT_NO) return -1;
                        });
                        break;
                    case 2:
                        // lot 추정가 높은 순
                        v.sort(function (a, b) {
                            if (parseInt(a.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,"")) > parseInt(b.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,""))) return -1;
                            if (parseInt(a.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,"")) === parseInt(b.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,""))) return 0;
                            if (parseInt(a.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,"")) < parseInt(b.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,""))) return 1;
                        });
                        break;
                    case 3:

                        // lot 추정가 낮은 순
                        v.sort(function (a, b) {
                            if (parseInt(a.EXPE_PRICE_FROM_JSON.KRW.toString().replace(/,/gi,"")) > parseInt(b.EXPE_PRICE_FROM_JSON.KRW.toString().replace(/,/gi,""))) return 1;
                            if (parseInt(a.EXPE_PRICE_FROM_JSON.KRW.toString().replace(/,/gi,"")) === parseInt(b.EXPE_PRICE_FROM_JSON.KRW.toString().replace(/,/gi,""))) return 0;
                            if (parseInt(a.EXPE_PRICE_FROM_JSON.KRW.toString().replace(/,/gi,"")) < parseInt(b.EXPE_PRICE_FROM_JSON.KRW.toString().replace(/,/gi,""))) return -1;
                        });
                        break;
                    case 4:
         // 응찰가 높은 순
                        v.sort(function (a, b) {
                            if (parsing(a.CUR_COST) > parsing(b.CUR_COST)) return -1;
                            if (parsing(a.CUR_COST) === parsing(b.CUR_COST)) return 0;
                            if (parsing(a.CUR_COST) < parsing(b.CUR_COST)) return 1;
                        });
                        break;
                    case 5:
                        // 응찰가 낮은 순
                        v.sort(function (a, b) {
                            if (parsing(a.CUR_COST) > parsing(b.CUR_COST)) return 1;
                            if (parsing(a.CUR_COST) === parsing(b.CUR_COST)) return 0;
                            if (parsing(a.CUR_COST) < parsing(b.CUR_COST)) return -1;
                        });
                        break;
                    case 6:
                        // 응찰수 높은 순
                        v.sort(function (a, b) {
                            if (parsing(a.BID_COUNT) > parsing(b.BID_COUNT)) return -1;
                            if (parsing(a.BID_COUNT) === parsing(b.BID_COUNT)) return 0;
                            if (parsing(a.BID_COUNT) < parsing(b.BID_COUNT)) return 1;
                        });
                        break;
                    case 7:
                        // 응찰수 낮은 순
                        v.sort(function (a, b) {
                            if (parsing(a.BID_COUNT) > parsing(b.BID_COUNT)) return 1;
                            if (parsing(a.BID_COUNT) === parsing(b.BID_COUNT)) return 0;
                            if (parsing(a.BID_COUNT) < parsing(b.BID_COUNT)) return -1;
                        });
                        break;
                }
                $scope.curpage = 1;
                $scope.pageing($scope.curpage);
            }
            // 더보기 페이징
            $scope.addpage = function (page) {
                let v = $scope.saleInfoAll;

                if ($scope.searchValue.length > 0) {
                    v = $scope.searchSaleInfoAll;
                } else {
                    if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
                        v = $scope.searchSaleInfoAll;
                    }
                }
                $scope.saleInfo = v.slice(0, $scope.itemsize * (page));
                $scope.curpage = page;
                //let token = $scope.token;
                //$scope.popSet();
            }
            //페이징
            $scope.pageingPrev = function () {
                if ($scope.curpage == 1) {
                    return;
                }
                let v = $scope.saleInfoAll;
                if ($scope.searchValue.length > 0) {
                    v = $scope.searchSaleInfoAll;
                } else {
                    if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
                        v = $scope.searchSaleInfoAll;
                    }
                }
                $scope.saleInfo = v.slice(($scope.itemsize * (($scope.curpage - 1) - 1)), $scope.itemsize * ($scope.curpage - 1));

                let pp = $scope.makePageing(v, ($scope.curpage - 1));
                $scope.pageingdata = pp;
                $scope.curpage = $scope.curpage - 1;
                //let token = $scope.token;
                //$scope.popSet();
            }
            //페이징
            $scope.pageingNext = function () {
                let v = $scope.saleInfoAll;
                let etc = (v.length % $scope.itemsize > 0) ? 1 : 0;
                let end = parseInt(v.length / $scope.itemsize) + etc;
                if ($scope.curpage + 1 > end) {
                    return;
                }
                if ($scope.searchValue.length > 0) {
                    v = $scope.searchSaleInfoAll;
                } else {
                    if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
                        v = $scope.searchSaleInfoAll;
                    }
                }
                $scope.saleInfo = v.slice(($scope.itemsize * (($scope.curpage + 1) - 1)), $scope.itemsize * ($scope.curpage + 1));

                let pp = $scope.makePageing(v, ($scope.curpage + 1));
                $scope.pageingdata = pp;
                $scope.curpage = $scope.curpage + 1;
                //let token = $scope.token;
                //$scope.popSet();
            }

            //페이징
            $scope.pageing = function (page) {
                let v = $scope.saleInfoAll;
                if ($scope.searchValue.length > 0) {
                    v = $scope.searchSaleInfoAll;
                } else {
                    if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
                        v = $scope.searchSaleInfoAll;
                    }
                }
                $scope.saleInfo = v.slice(($scope.itemsize * (page - 1)), $scope.itemsize * page);

                let pp = $scope.makePageing(v, page);
                $scope.pageingdata = pp;
                $scope.curpage = page;
                //let token = $scope.token;
                //$scope.popSet();
            }
            //페이징 리스트 생성
            $scope.makePageing = function (v, page) {
                let p = [];
                let endVal = 0;
                let etc = (v.length % $scope.itemsize > 0) ? 1 : 0;
                let end = parseInt(v.length / $scope.itemsize) + etc;


                $scope.pagefirst = 1;
                $scope.pageprev = (page < $scope.pagesize) ? -1 : ($scope.pagesize * parseInt((page - 1) / $scope.pagesize));

                if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
                    endVal = end;
                    $scope.pagelast = endVal;
                    //$scope.pagenext = -1;
                } else {
                    endVal = $scope.pagesize + (parseInt(page / $scope.pagesize) + 1);
                    $scope.pagelast = end;
                    $scope.pagenext = endVal + 1;
                }
                for (let i = ($scope.pagesize * parseInt((page - 1) / $scope.pagesize)) + 1; i <= endVal; i++) {
                    p.push(i);
                }
                return p;
            }

            $scope.setSale = async function (saleNo) {
                await axios.get('/api/auction/sales/' + saleNo)
                    .then(function (response) {
                        if (response.data.success) {
                            $scope.sale = response.data.data;
                            $scope.sale.TITLE_JSON = JSON.parse($scope.sale.TITLE_JSON);
                            $scope.sale.buttonList.map(item => {
                                item.content = JSON.parse(item.content);
                            });

                            var S_DB_NOW = $filter('date')($scope.sale.DB_NOW, 'yyyyMMddHHmm');
                            var S_DB_NOW_D = $filter('date')($scope.sale.DB_NOW, 'yyyyMMdd');
                            var FROM_DT = $filter('date')($scope.sale.FROM_DT, 'yyyyMMdd');
                            var TO_DT = $filter('date')($scope.sale.TO_DT, 'yyyyMMdd');
                            var END_DT = $filter('date')($scope.sale.END_DT, 'yyyyMMddHHmm');
                            var LIVE_START_DT = $filter('date')($scope.sale.LIVE_BID_DT, 'yyyyMMddHHmm');
                            // 오프라인 경매인 경우에는 SALE.TO_DT는 YYYY.MM.DD로 체크. 비교 서버시간은 S_DB_NOW_D (YDH. 2016.10.05)

                            //라이브 응찰 시간 체크
                            $scope.liveEnd = TO_DT;
                            $scope.nowTime = S_DB_NOW;
                            $scope.liveStartDt = LIVE_START_DT;
                            $scope.liveCheckDt = S_DB_NOW;

                            if (FROM_DT > S_DB_NOW && END_DT > S_DB_NOW) {
                                $scope.sale_status = "READY";
                            } else if (FROM_DT <= S_DB_NOW && END_DT >= S_DB_NOW) {
                                $scope.sale_status = "ING";
                            } else {
                                $scope.sale_status = "END";

                                // TODO: 온라인 경매는 당일까지 확인 가능 (직원은 계속 가능)
                                if (sessionStorage.getItem("is_login") === 'false') {
                                    alert("권한이 없거나 허용되지 않은 접근입니다.");
                                    //history_back();
                                }
                            }
                            $scope.$apply();
                        }
                    });
            }

            $scope.goBrochure = function (id, url) {
                axios.post('/api/auction/brochure/read', {id: id});
                window.open(url);
            }
        });
    </script>
    <script type="text/javascript" src="/js/auction/auctionOnlineList.js"></script>

    <!-- [0712]모바일 LOT 버튼 클릭시 팝업 변경(전체 LOT 보기 팝업) -->
    <script>
        $(".js-lotbox-btn").on("click", function($e) {
            $(".allview_fixed-wrap.lot .js-fixed_total").addClass("on");
            $(".allview_fixed-wrap.lot").addClass("active");
        });
        $(".allview_fixed-wrap.lot .js-fixed_total").on("click", function() {
            $(this).removeClass("on");
            $(".allview_fixed-wrap.lot").removeClass("active");
        });
    </script>

    <!-- [0712]외부영역 클릭 시 닫힘 -->
    <script>
        $(document).mouseup(function(e) {
            if ($(".js-modal").has(e.target).length === 0) {
                $(".js-modal").parent(".allview_fixed-wrap").removeClass("active");
                $(".js-modal").closest(".js-fixed_total").removeClass("on");
            }
        });
    </script>
</body>
</html>