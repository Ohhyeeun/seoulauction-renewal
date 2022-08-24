<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<c:set var="isRegular" value="false"/>
<sec:authorize access="hasAuthority('ROLE_REGULAR_USER')">
  <c:set var="isRegular" value="true"/>
</sec:authorize>
<c:set var="isEmployee" value="false" />
<sec:authorize access="hasAuthority('ROLE_EMPLOYEE_USER')">
    <c:set var="isEmployee" value="true" />
</sec:authorize>
<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass type-details_view">
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();">
            <div id="contents" class="contents">
                <section class="basis-section last-section auction_view-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_view">
                            <div class="panel-header">
                                <div class="header-inner ">
                                    <article class="page_name-article js-page_name-article">
                                        <div class="row-box">
                                            <div class="col_item">
                                                <div class="page_title">
                                                    <a href="/auction/live/list/new/${saleNo}" title="목록보기">
                                                        <i class="icon-page_back"></i>
                                                    </a>
                                                    <span ng-bind="displaySaleTitle">{{displaySaleTitle}}</span>
                                                </div>
                                            </div>
                                            <div class="col_item">
                                                <!-- [0516]select 변경 -->
                                                <div class="select-box">
                                                    <div class="trp-dropdown-area h42-lines">
                                                        <button class="js-dropdown-btn">
                                                            <span ng-bind="'LOT ' + lotInfo.LOT_NO"></span><i
                                                                class="form-select_arrow_md"></i>
                                                        </button>
                                                        <div class="trp-dropdown_list-box"
                                                             data-trp-focusid="js-user_support">
                                                            <div class="search-box">
                                                                <input id="search_lot" type="search"
                                                                       placeholder="LOT 번호 입력">
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
                                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                                                    </div>
                                                                                </figure>
                                                                            </div>
                                                                            <div class="typo-area">
                                                                                <span ng-bind="'LOT ' + item.LOT_NO"></span>
                                                                            </div>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <!-- // [0516]select 변경 -->

                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row_view">
                                    <div class="col_item">
                                        <article class="product_view-article">
                                            <div class="view_row">
                                                <div class="viewer-area">
                                                    <div class="gallery_visual js-view_visual">
                                                        <div class="gallery_center">
                                                            <div class="swiper-wrapper js-popup_images">
                                                                <div ng-repeat="item in lotImages"
                                                                     ng-class="{'swiper-slide':$index>-1,'swiper-slide-active':$index == 0}"
                                                                     data-index="$index">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <!-- [0725]hover시 돋보기표시 -->
                                                                            <div class="dim">
                                                                                <i class="icon-zoom_in"></i>
                                                                            </div>
                                                                            <!-- //[0725]hover시 돋보기표시 -->
                                                                            <div class="img-align">
                                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"
                                                                                     alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="pagination"></div>
                                                    </div>
                                                </div>

                                                <div class="product_thumbnail-area">
                                                    <div class="gallery_thumbnail js-view_thumnail">
                                                        <div class="gallery_center">
                                                            <div class="swiper-wrapper">
                                                                <div ng-repeat="item in lotImages"
                                                                     ng-class="{'slide':$index>-1,'images':$index>-1,'active':$index==0}"
                                                                     data-index="$index"> <%-- 빈칸 class="slide" 까지 합해서 총 최대 7개 --%>
                                                                    <figure class="img-ratio">
                                                                        <div class="img-align">
                                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt=""/>
                                                                        </div>
                                                                    </figure>
                                                                    <div class="line"></div>
                                                                </div>
                                                            </div>

                                                            <div class="slide"
                                                                 data-index="4"> <%-- 이미지 없을 시 클래스 slide만 남겨놔야 함. --%>
                                                                <figure class="img-ratio">
                                                                    <div class="img-align">
                                                                        <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt=""/>
                                                                    </div>
                                                                </figure>
                                                                <div class="line"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="view_scale-area" ng-show="isUseViewScale">
                                                <a class="js-popup_image_viewer" href="#">
                                                    <i class="icon-view_scale"></i><span>VIEW SCALE</span></a>
                                            </div>
                                        </article>
                                    </div>

                                    <div class="col_item">
                                        <article class="product_detail-article js-product_detail-article">
                                            <div class="index-area">
                                                <div class="index-box"><span ng-bind="lotInfo.LOT_NO"></span></div>
                                                <div class="btn-box">
                                                    <a href="#" title="" class="sns_share js-sns_share"><i
                                                            class="icon-view_sns"></i></a>
                                                    <a id="heart" title=""

                                                       ng-class="lotInfo.FAVORITE_YN === 'Y' ? 'work_heart js-work_heart on' : 'work_heart js-work_heart'"
                                                       ng-click="favorite(lotInfo.SALE_NO, lotInfo.LOT_NO);"><i class="icon-view_heart_off"></i></a>

                                                    <div class="sns_layer-area">
                                                        <div class="sns-layer">
                                                            <div class="sns-item">
                                                                <button id="kakao-share" class="js-share_kakao">
                                                                    <i class="icon-share_sns_kakao"></i>
                                                                    <div class="txt"><span>카카오톡</span></div>
                                                                </button>
                                                            </div>
                                                            <div class="sns-item" ng-click="urlCopy();">
                                                                <button class="js-share_url">
                                                                    <i class="icon-share_url_copy"></i>
                                                                    <div class="txt"><span>URL 복사</span></div>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="artist-area">
                                                <div class="name">
                                                    <strong ng-bind="lotInfo.ARTIST_NAME_KO_TXT" title="{{lotInfo.ARTIST_NAME_KO_TXT}}"></strong>
                                                    <span ng-show="lotInfo.BORN_YEAR"
                                                          ng-bind="'b.' + lotInfo.BORN_YEAR" title="{{'b.' + lotInfo.BORN_YEAR}}"></span>
                                                </div>
                                                <div class="desc">
                                                    <span class="text-over span_block"
                                                          ng-bind="lotInfo.TITLE_KO_TXT" title="{{lotInfo.TITLE_KO_TXT}}"></span>
                                                </div>
                                            </div>
                                            <div class="price-area">
                                                <dl class="price-list">
                                                    <dt>추정가</dt>
                                                    <div ng-show="lotInfo.EXPE_PRICE_INQ_YN === 'N'">
                                                        <dd>KRW {{lotInfo.EXPE_PRICE_FROM_JSON.KRW}} ~ {{lotInfo.EXPE_PRICE_TO_JSON.KRW}}</dd>
                                                        <dd>USD {{lotInfo.EXPE_PRICE_FROM_JSON.USD}} ~ {{lotInfo.EXPE_PRICE_TO_JSON.USD}}</dd>
                                                    </div>
                                                    <div ng-show="lotInfo.EXPE_PRICE_INQ_YN === 'Y'">
                                                        <dd>별도 문의</dd>
                                                    </div>
                                                </dl>
                                                <dl class="price-list">
                                                    <dt>마감일</dt>
                                                    <dd><b id="end_date_time" ng-bind="lotInfo.LOT_EXPIRE_DATE_SUB | date_format"><!--WEB SOCKET--></b></dd>
                                                </dl>

                                                <dl class="price-list" ng-show="lotInfo.OFFLINE_MAX_BID_PRICE">
                                                    <dt>낙찰가</dt>
                                                    <div>
                                                        <dd><strong>KRW {{lotInfo.OFFLINE_MAX_BID_PRICE}}</strong></dd>
                                                    </div>
                                                </dl>
                                            </div>
                                            <div class="button-area">
                                                <div class="btn_set only-pc">
                                                    <div class="btn_item" id="show_btn" style="display:none;">
                                                        <a class="btn btn_point btn_lg" href="#" role="button"
                                                           ng-click="moveToBidding(lotInfo)"
                                                        ><span>서면/전화 응찰 신청</span></a>
                                                    </div>
                                                </div>
                                                <div class="btn_set cols_2">
                                                    <div class="btn_item hover_change only-pc">
                                                        <div class="op_default">
                                                            <a class="btn btn_default btn_lg js-popup_alert1" href="#"
                                                               role="button"><span>낙찰수수료</span></a>
                                                        </div>
                                                    </div>
                                                    <div class="btn_item only-mb">
                                                        <a class="btn btn_default btn_lg js-delivery_price js-popup_alert1"
                                                           href="#"
                                                           role="button"><span>낙찰수수료</span></a>
                                                    </div>
                                                    <div class="btn_item">
                                                        <a class="btn btn_default btn_lg js-popup_alert3" role="button"><span>경매 호가표</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="other-area">
                                                <div class="inquiry-box">
                                                    <i class="icon-view_inquiry"></i>
                                                    <span>작품문의 <a href="tel:02-395-0330">02-395-0330</a></span>
                                                </div>
                                                <div class="print-box">
                                                    <button class="print-btn">
                                                        <a href="/auction/view/print/{{lotInfo.SALE_NO}}/{{lotInfo.LOT_NO}}"
                                                           target="_blank">
                                                            <i class="icon-view_print"></i>
                                                        </a>
                                                    </button>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </div>

                                <article class="product_detail_view-article">
                                    <div class="view_editor-warp">
                                        <div class="info-box">
                                            <div class="title">작품정보</div>
                                            <div class="desc">
                                                <span ng-bind="lotInfo.MATE_NM_EN"></span>
                                                <br/>

                                                <%--재질 규격--%>
                                                <span ng-repeat="size in lotInfo.LOT_SIZE_JSON">
                                                        <span ng-bind="size | size_text_cm"></span>
                                                </span>
                                                <%--에디션--%>
                                                <div ng-show="lotInfo.EDITION">
                                                    <span> {{lotInfo.EDITION}} </span>
                                                </div>

                                                <%--년도--%>
                                                <div ng-show="isNotObjectEmpty(lotInfo.MAKE_YEAR_JSON)">
                                                    <span> {{lotInfo.MAKE_YEAR_JSON | locale_format }}</span>
                                                </div>

                                                <%--서명 값--%>
                                                <span> {{lotInfo.SIGN_INFO_JSON | locale_format }}</span>
                                            </div>


                                            <!-- [0714]작품정보 하위댑스 추가 -->
                                            <div class="info-sub-wrap">
                                                <div class="info-sub-box">
                                                    <%--CONDITION --%>
                                                    <div class="info-sub-box" ng-show="isNotObjectEmpty(lotInfo.COND_RPT_JSON)">
                                                        <div class="tit tt5">CONDITION</div>
                                                        <div class="desc">{{lotInfo.COND_RPT_JSON | locale_format }}</div>
                                                    </div>
                                                    <%--PROVENANCE--%>
                                                    <div ng-show="isNotObjectEmpty(lotInfo.PROV_INFO_JSON)" class="info-sub-box">
                                                        <div class="tit tt5">PROVENANCE</div>
                                                        <div class="desc">{{lotInfo.PROV_INFO_JSON | locale_format }}</div>
                                                    </div>

                                                    <%--LITERATURE--%>
                                                    <div ng-show="isNotObjectEmpty(lotInfo.LITE_INFO_JSON)" class="info-sub-box">
                                                        <div class="tit tt5">LITERATURE</div>
                                                        <div class="desc">{{lotInfo.LITE_INFO_JSON | locale_format }}</div>
                                                    </div>

                                                    <%--EXHIBITED--%>
                                                    <div ng-show="isNotObjectEmpty(lotInfo.EXHI_INFO_JSON)" class="info-sub-box">
                                                        <div class="tit tt5">EXHIBITED</div>
                                                        <div class="desc">{{lotInfo.EXHI_INFO_JSON | locale_format }}</div>
                                                    </div>

                                                    <%--Condition Report--%>
                                                    <%--                                        <div ng-show="isNotObjectEmpty(lotInfo.COND_RPT_JSON)" class="info-box">--%>
                                                    <%--                                            <div class="title">Condition Report</div>--%>
                                                    <%--                                            <div class="desc">{{lotInfo.COND_RPT_JSON | locale_format }}</div>--%>
                                                    <%--                                        </div>--%>
                                                </div>
                                            </div>
                                            <!-- //[0714]작품정보 하위댑스 추가 -->
                                        </div>

                                        <!-- [0714]작품설명 추가 -->
                                        <div ng-show="isNotObjectEmpty(lotInfo.CMMT_JSON)" class="info-box">
                                            <div class="title">작품 설명</div>
                                            <div class="desc txt-pre-line">{{lotInfo.CMMT_JSON | locale_format }}</div>
                                        </div>
                                        <!-- //[0714]작품설명 추가 -->

                                        <!-- [0613]notice 추가 -->
                                        <div ng-show="isNotObjectEmpty(lotInfo.NOTICE_DTL_JSON)" class="info-box">
                                            <!-- [0714]텍스트 대소문자 수정 -->
                                            <div class="title">NOTICE</div>
                                            <!-- //[0714]텍스트 대소문자 수정 -->
                                            <div class="desc">
                                                <ul class="mark_dot-list">
                                                    <li ng-bind-html="lotInfo.NOTICE_DTL_JSON_VALUE" class="txt-pre-line"></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- //[0613]notice 추가 -->

                                        <div id="artist_layer" class="info-box">
                                            <div class="title">작가정보</div>
                                            <div class="desc txt-pre-line" id="artistName">
                                            </div>
                                            <div class="desc txt-pre-line" id="artistProfile">
                                            </div>
                                            <div class="desc" id="artistMedia">
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="panel-footer">
                                <article ng-show="recentlyViews.length != 0" class="product_recent_work-article">
                                    <div class="article-header">
                                        <div class="title"><span>이 경매의 최근 본 작품</span></div>
                                    </div>
                                    <div class="article-body">
                                        <div class="scroll-type">
                                            <div class="product-area">
                                                <ul id="recently_views" class="product-list">
                                                    <li class="" ng-repeat="item in recentlyViews">
                                                        <div class="li-inner">
                                                            <a href="/auction/live/view/{{item.SALE_NO}}/{{item.LOT_NO}}">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"
                                                                                     alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <span class="num" ng-bind="item.LOT_NO"></span>

                                                                                <a ng-class="item.FAVORITE_YN === 'Y' ? 'heart js-work_heart on' : 'heart js-work_heart'"
                                                                                   ng-click="favorite2(item.SALE_NO, item.LOT_NO, $index);"><i
                                                                                        class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <a href="/auction/live/view/{{item.SALE_NO}}/{{item.LOT_NO}}">
                                                                                    <div class="title">
                                                                                        <span ng-bind="item.ARTIST_NAME_BLOB_JSON.ko"></span>
                                                                                    </div>
                                                                                    <div class="desc">
                                                                                        <span ng-bind="item.TITLE_BLOB_JSON.ko"></span>
                                                                                    </div>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span ng-bind="'LOT ' + item.LOT_NO"></span>
                                                                                </div>
                                                                                <div class="msg">
                                                                                    <span>출물이 취소되었습니다.</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </article>
                            </div>
                        </div>
                    </div>
                </section>
                <article class="sticky_bidding-article">
                    <div class="btn_set">
                        <div class="btn_lot-box">
                            <button class="js-lotbox-btn">
                                <div class="txt">전체 LOT</div>
                                <i class="form-select_arrow_view-2x"></i>
                            </button>
                        </div>
                        <div class="btn-box">
                            <button ng-click="moveToBidding(lotInfo)">서면/전화 응찰 신청</button>
                        </div>
                    </div>
                </article>
                <input type="hidden" id="sale_no" value="{{sale_no}}"/>
                <input type="hidden" id="lot_no" value="{{lot_no}}"/>
                <input type="hidden" id="lot_expr_date" value="{{lotInfo.LOT_EXPIRE_DATE}}"/>
            </div>
            <!-- [0712]전체 LOT 보기 팝업 -->
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
                                        <p class="totalcount"><span class="num" ng-bind="lotLength"></span> <span class="unit">LOT</span></p>
                                    </div>
                                    <div class="lotlist-tabmenu">
                                        <div class="btn_item">
                                            <a href="#"
                                               ng-class="{'lot-btn_tabmenu': '1' === '1', 'on':'전체' === selectLotTag}"
                                               ng-click="searchLotTags('전체');" role="button">
                                                <span>전체</span>
                                            </a>
                                        </div>
                                        <div class="btn_item" ng-repeat="ci in categories">
                                            <a href="#"
                                               ng-class="{'lot-btn_tabmenu': '1' === '1', 'on': ci.CD_NM === selectLotTag}"
                                               ng-click="searchLotTags(ci.CD_NM);">
                                                <span ng-bind="ci.CD_NM"></span>
                                            </a>
                                        </div>
                                        <div class="btn_item" ng-repeat="li in lotTags">
                                            <a href="#"
                                               ng-class="{'lot-btn_tabmenu': '1' === '1', 'on': li.LOT_TAG === selectLotTag}"
                                               ng-click="searchLotTags(li.LOT_TAG);">
                                                <span ng-bind="li.LOT_TAG"></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="lotlist-tabCont">
                                    <div class="mobile_scroll-type">
                                        <div class="lotlist-box">
                                            <ul class="lotlist-inner">
                                                <li class="lotitem" ng-repeat="item in searchSaleLotList"
                                                    data-index="{{item.LOT_NO}}" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                    <div class="js-select_lotitem lotitem_wrap">
                                                        <div class="view-img">
                                                            <div class="img-box">
                                                                <div class="box-inner">
                                                                    <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="'LOT' + {{item.LOT_NO}}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item-cont">
                                                            <div class="num-box">
                                                                <div class="num"><span class="snum" ng-bind="item.LOT_NO"></span> </div>
                                                            </div>
                                                            <div class="typo-box">
                                                                <div class="title"><span ng-bind="item.ARTIST_NAME_JSON === null? '작자미상' : item.ARTIST_NAME_JSON.ko"></span></div>
                                                                <div class="desc"><span  ng-bind="item.LOT_TITLE_JSON.ko"></span></div>
                                                            </div>
                                                            <div class="btn-box">
                                                                <button ng-class="item.FAVORITE_YN==='Y' ? 'icon-heart_off' : 'icon-heart_on'"
                                                                        ng-click="favorite3(item.SALE_NO,item.LOT_NO);"></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- <li class="lotitem cancel">
                            <p class="txt">
                              LOT 4 <br>
                              출품이 취소되었습니다.
                            </p>
                          </li> -->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </aside>
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
        <!-- stykey -->

    </div>
</div>

<!-- 뷰스케일 -->
<div id="popup_image_viewer-wrap" class="trp popupfixed-wrap image_viewer-popup">
    <div class="popup-dim"></div>
    <div class="popup-align">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_view_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body">
                        <article class="viewer-article">
                            <div class="gallery_view js-image_viewer" style="">
                                <div class="gallery_center">
                                    <div id="swiper-wrapper" class="swiper-wrapper">
                                    </div>
                                </div>
                            </div>
                            <div class="size-area">
                                <button class="size-btn js-size_btn">
                                    <i class="icon-viewer_size-off"></i>
                                    <i class="icon-viewer_size-on"></i>
                                </button>
                            </div>
                            <%--                            LOT이동 컨트롤 --%>
                            <div class="view_paging-area">
                                <%--                                <button class="page_prev"><i class="icon-view_paging_left"></i></button>--%>
                                <%--                                <span id="view_lot_no"></span>--%>
                                <%--                                <button class="page_next"><i class="icon-view_paging_right"></i></button>--%>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [0516] 이미지 뷰어 팝업 -->
<div id="popup_images-wrap" class="trp popupfixed-wrap images-popup">
    <div class="popup-dim"></div>
    <div class="popup-align">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body scroll_none">
                        <article class="viewer-article js-zoom_inout">
                            <div class="gallery_view js-imagesSwiper" style="">
                                <div class="gallery_center">
                                    <div id="swiper-wrapper_popup" class="swiper-wrapper">

                                    </div>
                                </div>
                            </div>
                        </article>
                        <div class="page_prev"><i class="icon-img_swiper_prev"></i></div>
                        <div class="page_next"><i class="icon-img_swiper_next"></i></div>
                    </div>
                    <div class="pop-footer">
                        <div class="pagination js-imagesSwiper_pagination"></div>
                        <article class="thumbnail-article">
                            <ul id="thumbnail_image" class="thumbnail-list js-thumbnail-list">
                            </ul>
                        </article>
                        <!-- [0516]이동 -->
                        <div class="zoom-box">
                            <div class="btnitem">
                                <button class="zoomout js-zoomout"><i class="icon-zoom_out"></i></button>
                            </div>
                            <div class="btnitem">
                                <button class="zoomin js-zoomin"><i class="icon-zoom_in"></i></button>
                            </div>
                        </div>
                        <!-- //[0516]이동 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<%--낙찰 수수료 팝업 --%>
<jsp:include page="popup/bidCommissionPopup.jsp"/>

<%--경매 호가 팝업 --%>
<jsp:include page="popup/growBiddingPopup.jsp"/>
<%--경매 호가 스크립트 --%>
<script>
    let dataArray = [];

    //라이브 경매 호가
    dataArray.push({'up': null, 'down': '100만', 'price': 50000});
    dataArray.push({'up': '100만', 'down': '200만', 'price': 100000});
    dataArray.push({'up': '200만', 'down': '400만', 'price': 200000});
    dataArray.push({'up': '400만', 'down': '1000만', 'price': 300000});
    dataArray.push({'up': '1,000만', 'down': '2,000만', 'price': 500000});
    dataArray.push({'up': '2,000만', 'down': '3,000만', 'price': 1000000});
    dataArray.push({'up': '3,000만', 'down': '5,000만', 'price': 2000000});
    dataArray.push({'up': '5,000만', 'down': '1억', 'price': 3000000});
    dataArray.push({'up': '1억', 'down': '2억', 'price': 5000000});
    dataArray.push({'up': '2억', 'down': '3억', 'price': 10000000});
    dataArray.push({'up': '3억', 'down': '5억', 'price': 20000000});
    dataArray.push({'up': '5억', 'down': '10억', 'price': 30000000});
    dataArray.push({'up': '10억', 'down': '20억', 'price': 50000000});
    dataArray.push({'up': '20억', 'down': null, 'price': 100000000});

    $.each(dataArray, function (idx, item) {
        let text = (item.up != null ? item.up + ' 이상' : '') + ' ~ ' + (item.down != null ? item.down + ' 미만' : '');
        let html = '<tr><td><span>' + text + '</span>'
            + '</td><td>'
            + '<span>' + numberWithCommas(item.price) + '</span>'
            + '</td></tr>';
        $("#grow_off_tbody").append(html);
    });

    var popup_alert3 = $(".js-popup_alert3").trpLayerFixedPopup("#popup_alert3-wrap");
    $(popup_alert3.getBtn).on("click", function ($e) {
        $e.preventDefault();
        popup_alert3.open(this); // or false
        popup_fixation("#popup_alert3-wrap"); // pc 스크롤
        popup_motion_open("#popup_alert3-wrap"); // mb 모션
    });

    $("body").on("click", "#popup_alert3-wrap .js-closepop, #popup_alert3-wrap .popup-dim", function ($e) {
        $e.preventDefault();
        popup_alert3.close();
        popup_motion_close("#popup_alert3-wrap");
    });
</script>
<!-- swiper function-->
<script>
    document.cookie = "crossCookie=bar; SameSite=None; Secure";


    /* 섬네일 활성화 */
    function view_thumnailActive($index) {
        $(".js-view_thumnail .slide").removeClass("active");
        $(".js-view_thumnail .slide").eq($index).addClass("active");
    };

    /* 섬네일 클릭 */
    $(".js-view_thumnail .slide.images").on("click", function () {
        var _index = $(this).index();
        console.log(_index);
        view_thumnailActive(_index);
        view_visualActive(_index);
    });

    /* 비주얼 활성화 */
    function view_visualActive($index, view_visual) {
        view_visual.slideTo($index)
    };
</script>
<!-- [0516] 셀렉트 드롭다운 -->
<script>
    let dropdown = $(".js-dropdown-btn").trpDropdown({
        list: ".trp-dropdown_list-box",
        area: ".trp-dropdown-area"
    });
    $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function ($e) {
        $e.preventDefault();
        var _this = $(this);
        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn em").text($("em", _this).text());
        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
        dropdown.getClose();
    });
</script>

<script>
    let _hold_info = $(".js-product_detail-article").trpScrollSyncTopView({
        topStart: 172,
        topMagin: 172,
        bottomStop: 1065
    });
    $(window).on("scroll resize", function ($e) {
        renewalFn();
    });

    function renewalFn() {
        var _headerH = $("header.header").height();
        var _footerH = $("footer.footer").height();
        var _bottomH = $(".type_panel-product_view > .panel-footer").height();
        var _tem = 110 + _bottomH + 120 + _footerH;
        _hold_info.setTopStart(_headerH + 56);
        _hold_info.setBottomStop(_tem);
    }
</script>

<!-- angular js -->
<script>

    // 현재가 처리
    app.filter('date_format', function(){
        return function(val) {
            if (val === undefined) {
                return '';
            }
            return (val === '')?'':new Date(val).format('MM/dd(E)');
        };
    });

    app.filter('locale_format', function(){
        return function(val) {
            if (val === undefined) {
                return '';
            }
            return locale === 'ko' ? val.ko : val.en;
        };
    });

    const locale = document.documentElement.lang;
    app.value('locale', 'ko');
    app.value('is_login', true);
    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);


    const CUST_NO = ${member.userNo};
    const IS_REGULAR = ${isRegular};
    const IS_EMPLOYEE = ${isEmployee};
    const IS_CUST_REQUIRED = ${isCustRequired};
    const SALE_NO = ${saleNo};
    const LOT_NO = ${lotNo};

    app.controller('ctl', function ($scope, consts, common, is_login, locale, $filter) {
        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.sale_no = SALE_NO;
        $scope.lot_no = LOT_NO;

        /* call API */
        const getSaleInfo = (saleNo) => {
            try {
                return axios.get('/api/auction/live/sales/${saleNo}/one');
            } catch (error) {
                console.error(error);
            }
        };

        const getLotNaviList = (saleNo) => {
            try {
                return axios.get('/api/auction/live/sale_images/'+saleNo);
            } catch (error) {
                console.error(error);
            }
        }

        const getLotInfo = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/live/lot_info/${saleNo}/${lotNo}');
            } catch (error) {
                console.error(error);
            }
        };

        const getLotImages = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/live/lot_images/${saleNo}/${lotNo}');
            } catch (error) {
                console.error(error);
            }
        };

        const getViewScaleImages = (saleNo, lotNo) => {
            console.log("getViewScaleImages : ", saleNo, lotNo);
            try {
                return axios.get('/api/auction/getViewScaleImage/'+saleNo+'/'+lotNo);
            } catch (error) {
                console.error(error);
            }
        }

        const getArtistInfo = (artistNo) => {
            try {
                return axios.get('/api/auction/live/artist_info/'+artistNo);
            } catch (error) {
                console.error(error);
            }
        }

        /* data binding */
        const setArtistInfo = (artistData) => {
            console.log('artistData', artistData)
            if (!artistData) {
                $("#artist_layer").css("display", "none");
            } else {
                let articlesList = JSON.parse(artistData.articles).articles;
                let artistYoutubeImages = JSON.parse(artistData.media).youtube;
                let artistImageList = artistData.images;
                let title = '';
                $.each(articlesList, function (index, el) {
                    if (locale == 'ko') {
                        title += el.titleKo + '</br>';
                    } else {
                        title += el.titleEn + '</br>';
                    }
                });

                $("#artistName").html(JSON.parse(artistData.name).ko + ' ' + artistData.birth + '~' + artistData.death);
                $("#artistProfile").html(JSON.parse(artistData.profile).ko + '</br>' + title);

                let html = '<div class="video_img-box">';
                $.each(artistYoutubeImages, function (index, el) {
                    $.each(artistImageList, function (s3Index, el) {
                        //일단은 youtube만 뿌리기로
                        if (artistImageList[s3Index].tag == 'youtube' + index) {
                            html += '<a href="' + artistYoutubeImages[index] + '"><div class="dim"><i class="icon-video_play_white"></i></div><img src=" ' + artistImageList[s3Index].cdn_url + ' " alt="" /></a>';
                        }
                    });
                });
                html += '</div>';
                $("#artistMedia").html(html);
            }
        }

        const setSaleInfo = (data) => {
            console.log(data);
            $scope.displaySaleTitle = $filter('localeOrdinal')(data.SALE_TH)+" "+ JSON.parse(data.TITLE_JSON)[locale];
            console.log($scope.displaySaleTitle);
        }
        const setLotInfo = (data) => {
            console.log(data);
        }
        const setLotImage = (data) => {
            console.log(data);
        }
        const setLotNaviList = (data) => {
            console.log(data);
        }
        const setViewScale = (data) => {
            console.log(data);
        }

        /* event handler  */
        $scope.urlCopy = function () {
            let url = location.href;
            let $temp = $('<input>');
            $('body').append($temp);
            $temp.val(url).select();
            document.execCommand('copy');
            $temp.remove();
            alert('URL이 복사되었습니다.');
        }

        /* init */
        $scope.load = function () {
            let init = async function () {
                let [r1, r2, r3, r4, r5] = await Promise.all([
                    getSaleInfo($scope.sale_no), //1
                    getLotInfo($scope.sale_no, $scope.lot_no), //2
                    getLotImages($scope.sale_no, $scope.lot_no), //3
                    getLotNaviList($scope.sale_no, $scope.lot_no), //4
                    getViewScaleImages($scope.sale_no, $scope.lot_no)]); //5

                $scope.saleInfo = r1.data.data;
                $scope.lotInfo = r2.data.data;
                $scope.lotImages = r3.data.data;
                $scope.lotNaviData = r4.data.data;
                $scope.viewSacaleData = r5.data.data;

                //경매정보
                setSaleInfo($scope.saleInfo);
                //랏정보
                setLotInfo($scope.lotInfo);
                //랏이미지
                //랏필터
                //뷰스케일
                //작가정보
               /* const artistNo = $scope.lotInfo.ARTIST_NO;
                const Artist_result = await getArtistInfo(artistNo);
                $scope.artistInfo = Artist_result.data.data;
                setArtistInfo($scope.artistInfo);*/




                // popup setting
                /*let imgUrl;
                if($scope.lotImages[0]) {
                    imgUrl = $scope.lotImages[0].IMAGE_URL +
                        $scope.lotImages[0].FILE_PATH + "/" + $scope.lotImages[0].FILE_NAME;
                }

                $("#bidding_title").html($scope.lotInfo.TITLE_KO_TXT);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.lotInfo.ARTIST_NAME_KO_TXT);
                $("#born_year").html("(" + $scope.lotInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.lotInfo.LOT_NO);

                $scope.$apply();

                // 카카오 init
                Kakao.init('cf2233f55e74d6d0982ab74909c97835');

                Kakao.Link.createDefaultButton({
                    container: "#kakao-share",
                    objectType: "feed",
                    content: {
                        title: $scope.saleInfo.SALE_TITLE_KO,
                        description: $scope.lotInfo.TITLE_KO_TXT,
                        imageUrl: imgUrl,
                        link: {
                            mobileWebUrl: window.location.href,
                            webUrl: window.location.href,
                        },
                    },
                    social: {
                        likeCount: 286,
                        commentCount: 45,
                        sharedCount: 845,
                    },
                })*/

                // swiper
                let view_visual = new Swiper(".js-view_visual .gallery_center", {
                    loop: true,
                    paginationClickable: true,
                    spaceBetween: 10,
                    effect: "fade",
                    simulateTouch: true,
                    pagination: {
                        el: '.js-view_visual .pagination',
                        type: 'bullets',
                    },
                    breakpoints: {
                        1023: {
                            effect: "fade",
                            simulateTouch: true,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    // on: {
                    //     slideChange: function () {
                    //         $scope.activeIndex = view_visual.activeIndex;
                    //         view_thumnailActive(view_visual.activeIndex);
                    //     }
                    // }
                });

                // $(".js-view_thumnail .slide").on("click", function () {
                //     var _index = $(this).index();
                //     view_thumnailActive(_index);
                //     view_visualActive(_index, view_visual);
                // });

                // $(window).on("resize", function () {
                //     view_visual.update();
                // });

                /*const viewScaleImages = $scope.viewScaleImages;
                $scope.isUseViewScale = viewScaleImages.length > 0 && !$scope.lotInfo.IMAGE_MAGNIFY; // || viewScaleImages.isUseViewScale;
                const lot_images = $scope.lotImages;
                let firstCheck = 0;

                console.log(viewScaleImages, $scope.isUseViewScale);
                if($scope.isUseViewScale) {
                    const el = viewScaleImages[0];
                    let size1 = 0;
                    let size2 = 0;
                    let unitCd = '';
                    let lot_no = el.LOT_NO;
                    if (el.LOT_SIZE_JSON.length > 0) {
                        size1 = el.LOT_SIZE_JSON[0].SIZE1;
                        size2 = el.LOT_SIZE_JSON[0].SIZE2;
                        unitCd = el.LOT_SIZE_JSON[0].UNIT_CD;
                    }

                    let img_url = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;
                    let swiper_slide_item = '';

                    swiper_slide_item = `<div class="swiper-slide">
                        <div class="img-area">
                            <div class="img-box">
                                <div class="size_x"><span>` + size2 + unitCd + `</span></div>
                                <div class="size_y"><span>` + size1 + unitCd + `</span></div>
                                <div class="images">
                                    <img class="imageViewer" src="` + img_url + `" alt="" size-x="` + size2 + `" size-y="` + size1 + `" lot_no="` + lot_no + `"/>
                                </div>
                            </div>
                        </div>
                    </div>`;

                    $("#popup_image_viewer-wrap .gallery_center").html(swiper_slide_item);
                }

                $.each(lot_images, function (index, el) {
                    let popup_lot_no = el.LOT_NO;
                    let popup_img_url = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;
                    let popup_swiper_slide_item = '';
                    let popup_swiper_mini_slide_item = '';

                    //if (size1 > 160) {
                    popup_swiper_slide_item = `<div class="swiper-slide">
                                            <div class="img-area">
                                                <div class="img-box">
                                                    <div class="images">
                                                        <img class="imageViewerpopup" src="` + popup_img_url + `" alt="" lot_no="` + popup_lot_no + `" />
                                                    </div>
                                                </div>
                                            </div>
                        </div>`
                    $("#swiper-wrapper_popup").append(popup_swiper_slide_item);


                    popup_swiper_mini_slide_item = `<li class="active">
                                            <a href="#">
                                                <div class="imgs-item">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="` + popup_img_url + `" alt="" />
                                                        </div>
                                                    </figure>
                                                    <div class="line"></div>
                                                    </div>
                                                </a>
                                            </li>`
                    $("#thumbnail_image").append(popup_swiper_mini_slide_item);
                });
*/
                /* 싸이즈 버튼 */
                var size_btn_toggle = $(".js-size_btn").trpToggleBtn(
                    function ($this) {
                        $($this).closest(".viewer-article").addClass("active");
                    },
                    function ($this) {
                        $($this).closest(".viewer-article").removeClass("active");
                    });

                /* 스와이퍼 */
                /* [2022-0708] 수정 */
                var imageViewer = new Swiper('.js-image_viewer .gallery_center', {
                    loop: true,
                    on: {
                        transitionStart: function() {
                            // 움직임이 시작하면 실행
                            imagesResizePcMb();
                        },
                        transitionEnd: function() {
                            // 움직임이 끝나면 실행
                            imagesResizePcMb();
                        },
                    },
                });


                $.each($(".swiper-slide"), function () {
                    let data = $(this).attr("data-swiper-slide-index");
                    let lot_no = $(this).find(".imageViewer").attr("lot_no");
                    if (lot_no === Scope().lot_no) {
                        console.log(data, lot_no, Scope().lot_no);
                        $("#view_lot_no").attr("sel-data-index", lot_no);
                        $("#view_lot_no").html("LOT " + lot_no);
                    }
                });

                var popup_image_viewer = $(".js-popup_image_viewer").trpLayerFixedPopup("#popup_image_viewer-wrap");
                $(popup_image_viewer.getBtn).on("click", function ($e) {
                    $e.preventDefault();
                    popup_image_viewer.open(this); // or false
                    imagesResizePcMb();
                    imageViewer.update();
                    imageViewer.slideTo(parseInt($("#view_lot_no").attr("sel-data-index")) - $scope.chk, 0);
                });
                // 좌우버튼
                $('.view_paging-area .page_prev').on('click', function ($e) {
                    $e.preventDefault();
                    imageViewer.slidePrev();
                    $("#view_lot_no").html("LOT " + $(".swiper-slide-active .imageViewer").attr('lot_no'));

                });
                $('.view_paging-area .page_next').on('click', function ($e) {
                    $e.preventDefault();
                    imageViewer.slideNext();
                    $("#view_lot_no").html("LOT " + $(".swiper-slide-active .imageViewer").attr('lot_no'));

                });

                /* PC,MB images resize */
                $(window).on("resize", function () {
                    imagesResizePcMb();
                });

                $("body").on("click", "#popup_image_viewer-wrap .js-closepop, #popup_image_viewer-wrap .popup-dim", function ($e) {
                    $e.preventDefault();
                    popup_image_viewer.close();
                });

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

                // sns
                let toggle_sns = $(".js-sns_share").trpToggleBtn(
                    function ($this) {
                        $($this).addClass("on");
                        $($this).closest(".btn-box").find(".sns_layer-area").fadeIn("fast");
                    },
                    function ($this) {
                        $($this).removeClass("on");
                        $($this).closest(".btn-box").find(".sns_layer-area").fadeOut("fast");
                    });

                $(".js-share_kakao, .js-share_url").on("click", function ($e) {
                    $e.preventDefault();
                    toggle_sns.toggleAllSet(false);
                })


                var popup_images = $(".js-popup_images").trpLayerFixedPopup("#popup_images-wrap");
                $(".js-popup_images").on("click", function ($e) {
                    $e.preventDefault();
                    popup_images.open(this); // or false
                    for (var o = $(".imageViewerpopup"), e = 0; e < o.length; e++) {
                        if (!o[e]) return !1;
                        var windowW = screen.availWidth;
                        var windowH = screen.availHeight;
                        o[e].width = windowW;
                        o[e].height = windowH;
                    }
                    //imagesResizePcMb();
                    imagesSwiper.update();
                    imagesSwiper.slideTo($scope.activeIndex + 1, 0);
                });
                $("body").on("click", "#popup_images-wrap .js-closepop, #popup_images-wrap .popup-dim", function ($e) {
                    $e.preventDefault();
                    popup_images.close();
                });
                // popup_images.open(false);     // or false
                // imagesResizePcMb();


                /* === zoom ===  panzoom.reset()*/
                var zoom_range = document.querySelector('.js-zoom_inout');
                var panzoom = "";

                function panzoom_set() {
                    console.log("=====================>panzoom_set");

                    panzoom = Panzoom(zoom_range, {
                        /* disablePan: true, */
                        maxScale: 4, // (Default: 4)
                        minScale: 1 // (Default: 0.125)
                    });
                    $(".js-zoomin").on("click", function () {
                        panzoom.zoomIn();
                    });
                    $(".js-zoomout").on("click", function () {
                        panzoom.zoomOut();
                    });
                    panzoom.zoom(1, {
                        animate: true
                    })
                }

                function panzoom_reset() {
                    console.log("-------------------------->panzoom_reset");
                    panzoom.reset();
                    panzoom.destroy();
                    panzoom = "";
                    $(".js-zoomin").off("click");
                    $(".js-zoomout").off("click");
                }

                if ($("body").hasClass("is_pc")) {
                    panzoom_set();
                }

                /* === 스와이퍼 === */
                /* [0708]  스크립트 수정 */
                console.log("스와이퍼 set");
                var imagesSwiperIndex = 0;
                var imagesSwiper = new Swiper('.js-imagesSwiper .gallery_center', {
                    loop: true,
                    simulateTouch: true,
                    //pagination: ".js-imagesSwiper_pagination",
                    pagination: {
                        el: '.js-imagesSwiper_pagination',
                        type: 'bullets',
                    },
                    paginationClickable: true,
                    breakpoints: {
                        1023: {
                            effect: "slide",
                            simulateTouch: true,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    // onSlideChangeStart: function (swiper) { // 움직임이 시작하면 실행
                    //     imagesResizePcMb();
                    //     if ($("body").hasClass("is_pc")) {
                    //         panzoom.reset(); // zoom reset
                    //     }
                    // },
                    // onSlideChangeEnd: function (swiper) { // 움직임이 끝나면 실행
                    //     imagesResizePcMb();
                    //     thumbnailActive(swiper.realIndex);
                    //     console.log(">>> ", swiper.realIndex)
                    // }
                    on: {
                        transitionStart: function() {
                            // 움직임이 시작하면 실행
                            imagesResizePcMb();
                            if ($("body").hasClass("is_pc")) {
                                panzoom.reset(); // zoom reset
                            }
                        },
                        transitionEnd: function() {
                            // 움직임이 끝나면 실행
                            if (imagesSwiper != undefined) {
                                imagesSwiperIndex = imagesSwiper.realIndex;
                            }
                            imagesResizePcMb();
                            thumbnailActive();
                        },
                    },
                })
                // 좌우버튼
                $('.images-popup .page_prev').on('click', function ($e) {
                    $e.preventDefault();
                    imagesSwiper.slidePrev();
                })
                $('.images-popup .page_next').on('click', function ($e) {
                    $e.preventDefault();
                    console.log("next")
                    imagesSwiper.slideNext();
                })

                /* 섭네일 클릭 */
                $(".js-thumbnail-list a").on("click", function ($e) {
                    $e.preventDefault();
                    var _index = $(this).closest("li").index();
                    imagesSwiper.slideTo(_index + 1);
                    thumbnailActive(_index);
                })

                function thumbnailActive($index) {
                    $(".js-thumbnail-list li").removeClass("active")
                    $(".js-thumbnail-list li").eq($index).addClass("active");
                }


                /* PC,MB images resize */
                $(window).on("resize", function () {
                    imagesResizePcMb();
                    if ($("body").hasClass("is_mb")) {
                        if (panzoom != "") {
                            panzoom_reset();
                        }
                    } else {
                        /* pc */
                        if (panzoom == "") {
                            panzoom_set();
                        }
                    }
                });
            }
            init();
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

        $(".js-bidding_tab .bottombtn-area .btn_set").removeClass("active");
        $(".js-bidding_tab .bottombtn-area .btn_set").eq(_index).addClass("active");
    });
</script>

<!-- BIDING-->
<!-- 웹소켓 -->
<script type="text/javascript">
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

<!-- [0728]비디오 세로사이즈 -->
<script>
  var _videoAnchor = $(".video_img-box a");
  var _videoAnchorImg = $(".video_img-box a img");
  _videoAnchorImg.each(function() {
    _videoAnchor = $(this).parent(_videoAnchor);

    if ($(this).width() < $(this).height()) {
      _videoAnchor.addClass("vertical");
    } else {
      _videoAnchor.removeClass("vertical");
    }
  })
</script>
<!-- //[0728]비디오 세로사이즈 -->
<!-- [0728]탭 -->
<script>
  $('.js-left_mm a').on('click', function(e) {
    e.preventDefault();
    var tar = $(this).position().left;
    var scrollX = tar - ($(".js-left_mm").parents(".tab-area").width() / 2) + $(this).width() / 2;

    if ($(this).parents('li').hasClass('active')) {
      return false;
    } else {
      $(".js-left_mm li").removeClass('active');
      $(this).parents('li').addClass('active');

      $(".js-left_mm").parents(".tab-area").scrollLeft(scrollX);
    }
  });
</script>
<!-- [0728]탭 -->

</body>
</html>