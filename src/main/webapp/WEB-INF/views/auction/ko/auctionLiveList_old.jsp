<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<%--<style>--%>
<%--    .select2-container {--%>
<%--        z-index: 999;--%>
<%--    }--%>
<%--</style>--%> 

<c:set var="isRegular" value="false" />
<sec:authorize access="hasAuthority('ROLE_REGULAR_USER')">
    <c:set var="isRegular" value="true" />
</sec:authorize>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass type-width_list">

            <!-- header -->
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
<%--            <link rel="stylesheet" href="/css/plugin/csslibrary.css">--%>
            <!-- //header -->

            <!-- container -->
            <div id="container" ng-controller="ctl" data-ng-init="load();" ng-cloak>
                <div id="contents" class="contents">

                    <!-- page title (ing, view)   -->
                    <section class="page_title-section list_page-section">
                        <div class="section-inner full_size">
                            <div class="padding-inner">
                                <article class="auction_head_info-article">
                                    <div class="center-box view">
                                        <h2 class="page_title"><span class="th1">{{sale.SALE_TH | localeOrdinal}} {{sale.TITLE_JSON['ko']}}</span></h2>

                                        <ul class="event_day-list">
                                            <li><span class="colorB2">프리뷰</span><span class=""> : {{sale.PREV_FROM_DT | date:'MM.dd'+'('+getWeek(sale.PREV_FROM_DT)+')'}} - {{sale.PREV_TO_DT| date:'MM.dd'+'('+getWeek(sale.PREV_TO_DT)+')'}}</span>
                                            </li>
                                            <li><span class="colorB2">경매일</span><span
                                                    class=""> : {{sale.TO_DT | date:'MM.dd'+'('+getWeek(sale.TO_DT)+')'}}</span></li>
                                        </ul>
                                        <div class="btn_set">
                                            <a class="btn btn_white " href="#" target="_blank" ng-href="/footer/notice/{{sale.WRITE_NO}}" role="button" ng-if="sale.WRITE_NO > 0"><span>안내사항</span></a>
                                            <a class="btn btn_white " ng-click="goBrochure(item.id, item.content.url)" role="button" ng-repeat="item in sale.buttonList">
                                                <span ng-bind="{'pdf':'E-BOOK', 'ebook':'E-BOOK', 'vr':'VR보기'}[item.content_type]"></span>
                                            </a>
                                        </div>
                                    </div>
                                </article>

                                <%--라이브 응찰 신청기간--%>
                                <article class="proceeding-article" ng-if="sale.LIVE_BID_YN == 'Y'">
                                    <a ng-click="goLiveBid();" class="js-terms_required">
                                        <div class="article-inner">
                                            <div class="column view">
                                                <strong class="note_msg" id="note_msg">{{paddNoteMsg}}</strong>
                                            </div>
                                            <div class="column">
                                                <div class="note_etc">
                                                    <span id="note_etc">{{paddNoteEtc}}</span><strong ng-if="paddNo > 0">{{paddNo}}</strong>
                                                </div>
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

                            <!-- 텝메뉴 -->
                            <div class="content-panel type_panel-search_tab ">
                                <div class="panel-header">

                                    <div class="tab-wrap">
                                        <div class="tab-area type-left">
                                            <ul class="tab-list js-list_tab">
                                                <li ng-class="{active:'전체' === selectLotTag}"><a href="" ng-click="searchLotTags('전체');"><span>전체</span></a>
                                                </li>
                                                <li ng-class="{active: item.CD_ID === selectLotTag}"  ng-repeat="item in categories"><a href="" ng-click="searchCategory(item.CD_ID);"><span ng-bind="item.CD_NM"></span></a></li>
                                                </li>
<%--                                                <li ng-class="{active: item.LOT_TAG === selectLotTag}"--%>
<%--                                                    ng-repeat="item in lotTags"><a href="#tab-cont" ng-click="searchLotTags(item.LOT_TAG);"><span ng-bind="item.LOT_TAG"></span></a></li>--%>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
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
<%--                                                        <button class="js-lotbox-btn">--%>
                                                        <button class="js-dropdown-btn">
                                                            <span>LOT</span>
                                                            <i class="form-select_arrow_md"></i>
                                                        </button>
                                                        <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                            <div class="search-box">
                                                                <input type="search" placeholder="LOT 번호 입력" id="search_lot" class="">
                                                                <i class="form-search_md"></i>
                                                            </div>


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
                                                <!-- [0617]검색창위치 변경 -->
                                                <div class="search-box">
                                                    <input type="search" placeholder="작가/작품명" id="search_value"
                                                           ng-model="searchValue"
                                                           ng-keyup="searchArtist(event=$event)" class="h42">
                                                    <i class="form-search_md" ng-click="searchArtist2()"></i>
                                                </div>
                                                <div class="select-box">
                                                    <select id="sortType" class="select2Basic42 select2-hidden-accessible"
                                                            ng-init="selectSortType = selectSortType || options[0].value"
                                                            onchange="angular.element(this).scope().rerange();">
                                                        <option ng-repeat="item in modelSortType" value="{{item.value}}">{{item.name}}</option>
                                                    </select>
                                                </div>
                                                <div class="select-box">
                                                    <select id="viewType" class="select2Basic42 js-select_page select2-hidden-accessible"
                                                            onchange="angular.element(this).scope().chgViewType();">
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


                    <section ng-show="saleInfo.length <= 0" class="basis-section auction_result_list-section last-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-product_result_list">
                                <div class="panel-body">

                                    <div class="data-empty type-big">
                                        <div class="img_empty">
                                            <img src="/images/mobile/auction/symbol-none_data.png" alt="검색결과가 없습니다." />
                                        </div>
                                        <div class="txt_empty">
                                            <div class="title">검색결과가 없습니다.</div>
                                            <div class="desc">단어의 철자나 띄어쓰기가 <br class="only-mb" />
                                                정확한지 확인해주세요</div>
                                        </div>

                                        <div class="empty_btn">
                                            <button class="btn btn_gray_line" ng-click="searchInit()" type="button"><span>전체결과보기</span></button>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </section>

                    <section ng-show="saleInfo.length > 0" class="basis-section last-section auction_list-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-product_list">
                                <div class="panel-body">

                                    <ul class="product-list">
<%--                                        <li ng-show="{cancel: item.STAT_CD === 'reentry'}"  ng-repeat="item in saleInfo">--%>
                                        <li ng-class="{cancel: item.STAT_CD === 'reentry'}"  ng-repeat="item in saleInfo">

                                            <div class="li-inner">
                                                <!-- 경매 마감 일 때 "result" 클래스 추가 하면 됨. <article class="item-article result"> -->
                                                <article class="item-article">
                                                <!-- 경매 마감 일 때 "result" 클래스 추가 하면 됨. <article class="item-article result"> -->
                                                    <div class="image-area">
                                                        <figure class="img-ratio">
                                                            <a href="/auction/live/view/{{item.SALE_NO}}/{{item.LOT_NO}}">
                                                                <div class="img-align">
                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"  alt="">
                                                                </div>
                                                            </a>
                                                        </figure>
                                                    </div>
                                                    <div class="typo-area">
                                                        <div class="product_info">
                                                            <div class="num_heart-box">
                                                                <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                    <span class="num">{{item.LOT_NO}}</span>
                                                                </a>
                                                                <button class="heart js-work_heart"><i ng-class="item.FAVORITE_YN==='Y' ? 'icon-heart_off' : 'icon-heart_on'"
                                                                ng-click="favorite(item);"
                                                                ></i></button>
                                                            </div>
                                                            <div class="info-box">
                                                                <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                    <div class="title"><span title="{{item.ARTIST_NAME_JSON != null ? item.ARTIST_NAME_JSON.ko : 'ㅤ'}}">{{item.ARTIST_NAME_JSON != null ? item.ARTIST_NAME_JSON.ko : 'ㅤ'}}</span>

    <%--                                                                    <span ng-if="item.BORN_YEAR !=null && item.BORN_YEAR !==''" class="sub">({{item.BORN_YEAR}})</span>--%>
    <%--                                                                    <span ng-if="item.BORN_YEAR ==null || item.BORN_YEAR ===''" class="sub">ㅤ</span>--%>

                                                                    </div>
                                                                    <div class="desc">
                                                                        <span class="text-over span_block" title="{{item.LOT_TITLE_JSON.ko != null ? item.LOT_TITLE_JSON.ko : 'ㅤ'}}">{{item.LOT_TITLE_JSON.ko != null ? item.LOT_TITLE_JSON.ko : 'ㅤ'}}</span>
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
                                                                    <dl class="price-list">
                                                                        <dt>추정가</dt>
                                                                        <div ng-switch on="item.EXPE_PRICE_INQ_YN">
                                                                            <div ng-switch-when="Y">
                                                                                <dd><strong>별도 문의</strong></dd>
                                                                                <dd>&nbsp;</dd>
                                                                                <dd>&nbsp;</dd>
                                                                            </div>
                                                                            <div ng-switch-when="N">
                                                                                <dd>KRW {{item.EXPE_PRICE_FROM_JSON.KRW}} </dd>
                                                                                <dd> ~ {{item.EXPE_PRICE_TO_JSON.KRW}}</dd>
                                                                                <dd>USD {{item.EXPE_PRICE_FROM_JSON.USD}} ~ {{item.EXPE_PRICE_TO_JSON.USD}}</dd>
                                                                            </div>
                                                                        </div>

                                                                    </dl>
                                                                    <dl class="price-list"  ng-show="item.showBtn === 2">
                                                                        <dt>낙찰가</dt>
                                                                        <div ng-show="item.OFFLINE_MAX_BID_PRICE !== 'NaN' ">
                                                                            <div>
                                                                                <dd><strong>KRW {{item.OFFLINE_MAX_BID_PRICE}}</strong></dd>
    <%--                                                                            <dd ng-bind="'KRW ' + (item.MAX_BID_PRICE | currency)"></dd>--%>
                                                                            </div>
                                                                        </div>

                                                                    </dl>
                                                                </a>
                                                            </div>

                                                            <%--TODO 서면 응찰 신청 조건 작업 해야함.--%>
                                                            <div id="biding_req" class="bidding-box col_2">
                                                                <div class="deadline_set"><span>신청마감 {{ item.LOT_EXPIRE_DATE_SUB | date_format }}</span></div>
                                                                <div class="btn_set"><a class="btn btn_point" href="" ng-click="moveToBidding(item)"
                                                                                        role="button"><span>서면/전화 응찰 신청</span></a></div>
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
                                    </ul>
                                </div>

                                <div class="panel-footer">
                                    <div class="set-pc_mb">
                                        <div id="page_layer" ng-show="selectViewType == 1">
                                            <div class="paging-area">
                                                <!-- paging -->
                                                <div class="paging">
                                                    <a href="javascript:void(0);" ng-click="pageing(1);" class="prev_end icon-page_prevprev">FIRST</a>
                                                    <a href="javascript:void(0);" ng-click="pageingPrev();" class="prev icon-page_prev">PREV</a>
                                                    <a href="javascript:void(0);" ng-click="pageing(item);" ng-class="{'on':item === curpage}"
                                                       ng-repeat="item in pageingdata">
                                                        <strong ng-if="item === curpage" ng-bind="item"></strong>
                                                        <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                    <a href="javascript:void(0);" ng-click="pageingNext();" class="next icon-page_next">NEXT</a>
                                                    <a href="javascript:void(0);" ng-click="pageing(pagelast);" class="next_end icon-page_nextnext">LAST</a>
                                                </div>
                                                <!-- paging -->
                                            </div>
                                        </div>
                                        <!-- 더보기 -->
                                        <div id="add_layer" class="only-mb2" ng-show="selectViewType == 2">
                                            <button class="btn btn_gray_line" type="button" ng-click="addpage(curpage + 1);"><span>더보기</span></button>
                                        </div>
                                        <!-- 더보기 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

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

                <%-- 패들번호 부여 및 약관동의 팝업(위치 변경 금지) --%>
                <jsp:include page="popup/paddle.jsp" />
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



<%--    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/js/auction/auctionLiveList.js" type="text/javascript"></script>
    <script>
        Date.prototype.format = function (f) {
            if (!this.valueOf()) return " ";

            var weekName = ["일", "월", "화", "수", "목", "금", "토"];
            var d = this;

            return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function ($1) {
                switch ($1) {
                    case "yyyy":
                        return d.getFullYear();
                    case "yy":
                        return (d.getFullYear() % 1000).zf(2);
                    case "MM":
                        return (d.getMonth() + 1).zf(2);
                    case "dd":
                        return d.getDate().zf(2);
                    case "E":
                        return weekName[d.getDay()];
                    case "HH":
                        return d.getHours().zf(2);
                    case "hh":
                        return ((h = d.getHours() % 12) ? h : 12).zf(2);
                    case "mm":
                        return d.getMinutes().zf(2);
                    case "ss":
                        return d.getSeconds().zf(2);
                    case "a/p":
                        return d.getHours() < 12 ? "오전" : "오후";
                    default:
                        return $1;
                }
            });
        };
        String.prototype.string = function (len) {
            var s = '', i = 0;
            while (i++ < len) {
                s += this;
            }
            return s;
        };
        String.prototype.zf = function (len) {
            return "0".string(len - this.length) + this;
        };
        Number.prototype.zf = function (len) {
            return this.toString().zf(len);
        };


        var terms_required = $(".js-terms_required").trpLayerFixedPopup("#terms_required-wrap");
        var paddle_number = $(".js-paddle_number").trpLayerFixedPopup("#paddle_number-wrap");

        app.value('locale', 'ko');
        app.value('is_login', true);

        app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

        // 현재가 처리
        app.filter('date_format', function(){
            return function(val) {
                if (val === undefined) {
                    return '';
                }

                return (val === '')?'':new Date(val).format('MM/dd(E)');
            };
        })


        app.controller('ctl', function ($scope, consts, common, is_login, locale, $filter) {
            $scope.is_login = is_login;
            $scope.locale = locale;
            $scope.sale_no = "${saleNo}";

            $scope.pagesize = 10;
            $scope.itemsize = 20;
            $scope.curpage = 1;
            $scope.change_size = false;

            $scope.modelSortType = [{
                name: "LOT 번호순",
                value: 1
            }, {
                name: "추정가 높은순",
                value: 2
            }, {
                name: "추정가 낮은순",
                value: 3
            }];

            $scope.modelViewType = [{
                name: "페이지 방식",
                value: 1
            }, {
                name: "더보기 방식",
                value: 2
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

            $scope.searchArtist2 = function () {
                let pp = [];
                for (let i = 0; i < $scope.saleInfoAll.length; i++) {

                    if($scope.saleInfoAll[i].ARTIST_NAME_JSON !=null && $scope.saleInfoAll[i].LOT_TITLE_JSON) {

                        if ($scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 ||
                            $scope.saleInfoAll[i].LOT_TITLE_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                            pp.push($scope.saleInfoAll[i]);
                        }
                    }
                }

                $scope.lotLength = pp.length;
                $scope.searchSaleInfoAll = pp;
                $scope.pageing(1);

            }

            $scope.goLot = function (saleNo, lotNo) {
                window.location.href = '/auction/live/view/' + saleNo + '/' + lotNo;
            }

            $scope.favorite = function(item , $e) {
                if(!checkLogin()){
                    return;
                }


                let url = item.FAVORITE_YN ==='N' ? "/api/auction/live/delCustInteLot" : "/api/auction/live/addCustInteLot";

                try {
                    axios.post(url, {
                        sale_no: item.SALE_NO,
                        lot_no: item.LOT_NO
                    }).then(function(response) {
                        if(response.data.success){
                            item.FAVORITE_YN = item.FAVORITE_YN ==='N' ? 'Y' : 'N';
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

            $scope.moveToBidding = function(item) {

                //로그인 했는지 여부.
                if(!checkLogin()) {
                    return;
                }

                //정회원 여부.
                let isRegular = ${isRegular};
                if(!isRegular){
                    alert('정회원만 서면/전화 응찰 신청이 가능합니다.')
                    return;
                }

                //필수값 있는지 여부. ( 생년월일 , 성별 )
                let isCustRequired = ${isCustRequired};
                if(!isCustRequired){
                    if(confirm('서면/전화 응찰 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')){
                        location.href = '/mypage/custModify';
                    }
                    return;
                }

                //전부 다 조건을 만족햇을경우.
                location.href = '/auction/live/sale/' + item.SALE_NO + '/lot/' + item.LOT_NO + '/biding';
            }

            $scope.goLiveBid = function() {
                if($scope.sale_status == 'ING' && $scope.liveCheckDt >= $scope.liveStartDt) {
                    // 경매 당일 응찰하기
                    console.log("1");
                    window.open("/auction/live/bidder/"+$scope.sale_no, "bidder", "resizable=no, status=no, menubar=no, toolbar=no, location=no, directories=no");
                    return;
                } else if($scope.sale_status == 'ING' && $scope.nowTime == $scope.liveEnd && $scope.liveCheckDt < $scope.liveStartDt) {
                    // 경매 당일 패들번호 출력
                    console.log("2");
                    return;
                } else if($scope.sale_status == 'ING' && $scope.nowTime < $scope.liveEnd) {
                    // 경매 당일 전 신청하기 자동생성
                    if(!checkLogin()) return;

                    let isRegular = ${isRegular};
                    if(!isRegular){
                        alert('정회원만 패들 신청이 가능합니다.');
                        return;
                    }

                    let isCustRequired = ${isCustRequired};
                    if(!isCustRequired){
                        if(confirm('패들 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')){
                            location.href = '/mypage/custModify';
                        }
                        return;
                    }

                    if($scope.paddNo <= 0) {
                        terms_required.open(this); // or false
                        popup_fixation("#terms_required-wrap");

                        $("body").on("click", "#terms_required-wrap .js-closepop, #terms_required-wrap .popup-dim", function($e) {
                            $e.preventDefault();
                            terms_required.close();
                        });
                    }
                }
            }

            $scope.goLiveBidAgree = function() {
                if($(".js_all-terms #checkbox_all").is(":checked")) {
                    axios.post('/api/auction/live/paddle', {sale_no : '${saleNo}'})
                        .then(function (response) {
                            if (response.data.success) {
                                $scope.paddNo = response.data.data;
                                $scope.paddleStatus();
                            }
                        });

                    terms_required.close();
                    paddle_number.open(this); // or false
                    popup_fixation("#paddle_number-wrap");
                    $(".js_all-terms input[type='checkbox']").prop("checked", false);
                } else {
                    alert("약관에 동의해주세요.");
                }

                $("body").on("click", "#paddle_number-wrap .js-closepop, #paddle_number-wrap .popup-dim, #paddle_number-wrap #btn-paddle-number", function($e) {
                    $e.preventDefault();
                    paddle_number.close();
                });
            }

            $scope.setSale = async function (saleNo) {
                await axios.get('/api/auction/live/sales/' + saleNo + '/one')
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
                            $scope.nowTime = S_DB_NOW_D;
                            $scope.liveStartDt = LIVE_START_DT;
                            $scope.liveCheckDt = S_DB_NOW;

                            if (FROM_DT > S_DB_NOW && TO_DT > S_DB_NOW_D) {
                                $scope.sale_status = "READY";
                            } else if (FROM_DT <= S_DB_NOW && $scope.sale.CLOSE_YN != 'Y') {
                                $scope.sale_status = "ING";
                            } else {
                                $scope.sale_status = "END";

                                if (sessionStorage.getItem("is_login") === 'false') {
                                    alert("권한이 없거나 허용되지 않은 접근입니다.");
                                    //history_back();
                                }
                            }

                            $scope.$apply();
                        }
                    });
            }

            // 호출 부
            const getSaleInfo = (saleNo) => {
                try {
                    return axios.get('/api/auction/live/list/${saleNo}?is_live=Y');
                } catch (error) {
                    console.error(error);
                }
            };

            const getSaleImages = (saleNo, lotNo) => {
                try {
                    return axios.get('/api/auction/live/sale_images/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            }

            const getLotTags = (saleNo, lotNo) => {
                try {
                    return axios.get('/api/auction/live/lotTag/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            }

            const getCategories = (saleNo) => {
                try {
                    return axios.get('/api/auction/live/categories/'+saleNo);
                } catch (error) {
                    console.error(error);
                }
            }

            $scope.searchLotTags = function (lotTag) {
                $scope.selectLotTag = lotTag;

                console.log("검색", $scope.selectLotTag, $scope.searchValue );

                let pp = [];
                if (lotTag === '전체') {
                    if ($scope.searchValue.length > 0) {
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                            if ($scope.saleInfoAll[i].ARTIST_NAME_JSON == null) {
                                continue;
                            }
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
                            if ($scope.saleInfoAll[i].ARTIST_NAME_JSON == null) {
                                continue;
                            }
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
                        if ($scope.saleInfoAll[i].ARTIST_NAME_JSON == null) {
                            continue;
                        }
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

            // 호출 부
            $scope.load = function () {
                let run = async function () {
                    let [r1, r2, r3, r4] = await Promise.all([getSaleInfo($scope.sale_no), getSaleImages($scope.sale_no), getLotTags($scope.sale_no), getCategories($scope.sale_no)]);

                    $scope.saleInfoAll = r1.data.data;
                    $scope.lotLength = $scope.saleInfoAll.length;

                    $scope.searchSaleInfoAll = $scope.saleInfoAll;

                    //데이터가 없을 시 , 오프라인 경매인데 온라인으로 올 시 등등 접근 불가.
                    // if($scope.saleInfoAll.length === 0){
                    //     alert('잘못된 접근 입니다.');
                    //     history.back();
                    // }


                    $scope.saleImages = r2.data.data;
                    $scope.lotTags = r3.data.data;
                    $scope.categories = r4.data.data;

                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {

                        //영문 요일 -> 한국 요일로 치환처리.

                        if($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW !=null) {
                            $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW.toLocaleString('ko-KR');


                            $scope.saleInfoAll[i].EXPE_PRICE_INQ_YN = $scope.saleInfoAll[i].EXPE_PRICE_INQ_YN === undefined ? 'N' : $scope.saleInfoAll[i].EXPE_PRICE_INQ_YN;

                            $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = numberWithCommas($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW);
                            $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = numberWithCommas($scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW);
                            $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.USD = numberWithCommas($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.USD);
                            $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.USD = numberWithCommas($scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.USD);
                            $scope.saleInfoAll[i].MAX_BID_PRICE = numberWithCommas(parseInt($scope.saleInfoAll[i].MAX_BID_PRICE));
                            $scope.saleInfoAll[i].OFFLINE_MAX_BID_PRICE = numberWithCommas(parseInt($scope.saleInfoAll[i].OFFLINE_MAX_BID_PRICE));

                            //console.log($scope.saleInfoAll[i].LOT_EXPIRE_DATE_ALL);

                            //let expr_date = new Date($scope.saleInfoAll[i].LOT_EXPIRE_DATE).format('yyyy-MM-dd HH:mm:ss');

                            // if($scope.saleInfoAll[i].MAKE_YEAR_JSON.ko === undefined){
                            //     $scope.saleInfoAll[i].MAKE_YEAR_JSON.ko = ' ';
                            // }

                            //경매에 대한 마감 일.
                            let expr_date = $scope.saleInfoAll[i].LOT_EXPIRE_DATE_ALL;

                            //경매 마감 일이 지나고 또한 BID_KD 가 PLACE 이고 MAX_PRICE 가 있는 경우. 즉 낙찰가가 있는경우.
                            if (expr_date < new Date().format('yyyy-MM-dd HH:mm:ss')) {
                                if( $scope.saleInfoAll[i].OFFLINE_MAX_BID_PRICE !=='NaN') {
                                    $scope.saleInfoAll[i].showBtn = 2
                                }
                            } else {
                            // 아직 경매 마감일이 되지 않은 경우. ( 서면응찰 버튼이 보여야함. )
                                $scope.saleInfoAll[i].showBtn = 1
                            }
                        }
                    }

                    $scope.saleInfo = $scope.saleInfoAll.slice(0, $scope.itemsize);

                    let p = [];
                    let endVal = 0;
                    let page = 1;

                    let etc = ($scope.saleInfoAll.length % $scope.itemsize > 0) ? 1 : 0;
                    let end = parseInt($scope.saleInfoAll.length / $scope.itemsize) + etc;

                    if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
                        endVal = end;
                    } else {
                        endVal = $scope.pagesize + (parseInt(page / $scope.pagesize) + 1);
                    }

                    for (let i = 1; i <= endVal; i++) {
                        p.push(i);
                    }

                    await $scope.setSale($scope.sale_no);
                    //get paddle number
                    $scope.paddNo = 0;
                    if(sessionStorage.getItem("is_login") === 'true'){
                        await axios.get('/api/auction/live/paddles/${saleNo}')
                            .then(function(response) {
                                if (response.data.success) {
                                    const paddNo = response.data.data;
                                    if(paddNo > 0) {
                                        $scope.paddNo = paddNo;
                                    }
                                }
                            });
                    }

                    $scope.pageingdata = p;
                    $scope.$apply();
                    $scope.paddleStatus();

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
                    })

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

            $scope.chgViewType = function () {
                let sst = parseInt($("#viewType option:selected").val())
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
            $scope.rerange = function () {
                let sst = parseInt($("#sortType").val())
                let v;

                for (let i = 0 ; i < $scope.saleInfoAll.length;i++ ){
                    if ($scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW === undefined) {
                        console.log("$scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW ", $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW );
                        $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = 0;
                        console.log("$scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW ", $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW );
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
                            if (parseInt(a.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,"")) > parseInt(b.EXPE_PRICE_TO_JSON.KRW.toString().replace(/,/gi,""))) {
                                return -1;
                            }
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
                }

                $scope.curpage = 1;
                $scope.pageing($scope.curpage);
            }
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
                if(!$scope.$$phase) {
                    $scope.$apply();
                }
            }
            //paging
            //페이징 리스트 생성
            $scope.makePageing = function (v, page) {
                let p = [];
                let endVal = 0;
                let etc = (v.length % $scope.itemsize > 0) ? 1 : 0;
                let end = parseInt(v.length / $scope.itemsize) + etc;


                $scope.pagefirst = 1;
                $scope.pageprev = (page < $scope.pagesize)? - 1: ($scope.pagesize * parseInt((page - 1) / $scope.pagesize));

                if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
                    endVal = end;
                    $scope.pagelast = -1;
                    $scope.pagenext = -1;
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

            $scope.paddleStatus = function () {
                let paddNoteMsg = "라이브 응찰 신청";
                let paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";

                const is_login = sessionStorage.getItem("is_login");
                const membership_yn = '${isRegular}';
                const padd_no = $scope.paddNo;
                const sale_status = $scope.sale_status;

                const live_start_dt = $filter('date')($scope.sale.TO_DT, 'MM/dd');
                const live_start_dt_date = $scope.getWeek($scope.sale.TO_DT);
                const live_start_dt_hour = $filter('date')($scope.sale.TO_DT, 'HH');
                const live_start_dt_minute = $filter('date')($scope.sale.TO_DT, 'mm');

                if(sale_status == 'ING' && $scope.liveCheckDt >= $scope.liveStartDt) {
                    // 경매 당일 응찰하기
                    console.log("1");
                    if (is_login === 'true' && membership_yn === 'true' && padd_no > 0) {
                        paddNoteMsg = "라이브 경매 참가";
                        paddNoteEtc = "나의 패들번호 ";
                    } else {
                        paddNoteMsg = "라이브 경매 보기";
                        paddNoteEtc = "사전 신청한 회원만 응찰 가능합니다.";
                    }
                    $("article.proceeding-article a.js-terms_required").css("cursor", "pointer");
                } else if(sale_status == 'ING' && $scope.nowTime == $scope.liveEnd && $scope.liveCheckDt < $scope.liveStartDt) {
                    // 경매 당일 패들번호 출력
                    console.log("2");
                    if(is_login === 'true' && membership_yn === 'true' && padd_no > 0){
                        paddNoteMsg = "라이브 응찰 신청완료";
                        paddNoteEtc = "나의 패들번호 ";
                    } else {
                        paddNoteMsg = "라이브 경매 준비 중";
                        paddNoteEtc = live_start_dt+"("+live_start_dt_date+") "+live_start_dt_hour+"시";
                        if(live_start_dt_minute > 0) paddNoteEtc += " "+live_start_dt_minute+"분";
                        paddNoteEtc += "에 시작합니다.";
                    }
                    $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                    $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
                } else if(sale_status == 'ING' && $scope.nowTime < $scope.liveEnd) {
                    // 경매 당일 전 신청하기 자동생성
                    console.log("3");
                    if(is_login === 'true' && membership_yn === 'true' && padd_no > 0){
                        paddNoteMsg = "라이브 응찰 신청완료";
                        paddNoteEtc = "나의 패들번호 ";
                        $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
                    } else {
                        paddNoteMsg = "라이브 응찰 신청";
                        paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";
                        $("article.proceeding-article a.js-terms_required").css("cursor", "pointer");
                        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "");
                    }
                }

                $scope.paddNoteMsg = paddNoteMsg;
                $scope.paddNoteEtc = paddNoteEtc;
                $scope.$apply();
            }

            $scope.goBrochure = function (id, url) {
                axios.post('/api/auction/live/brochure/read', {id: id});
                window.open(url);
            }
        });

    (function() {
        //약관체크
        $(".js_all-terms").trpCheckBoxAllsImg(".js_all", ".js_item");
    })();


    </script>


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