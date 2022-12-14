<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<spring:eval expression="@environment.getProperty('bid.domain')" var="bid_domain" />

<c:set var="isEmployee" value="false" />
<sec:authorize access="hasAuthority('ROLE_EMPLOYEE_USER')">
    <c:set var="isEmployee" value="true" />
</sec:authorize>

<body class="">
<div class="wrapper">
    <%--    <link rel="stylesheet" href="/css/plugin/csslibrary.css">--%>
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
                                                    <a href="/auction/list/{{saleInfo.SALE_NO}}" title="뒤로가기">
                                                        <i class="icon-page_back"></i>
                                                    </a>
                                                    <span ng-bind="fullTitle"></span>
                                                </div>
                                            </div>
                                            <div class="col_item">
                                                <!-- [0516]select 변경 -->
                                                <div class="select-box">
                                                    <div class="trp-dropdown-area h42-lines">
                                                        <button class="js-dropdown-btn">
                                                            <span ng-bind="'LOT '+lotInfo.LOT_NO"></span><i
                                                                class="form-select_arrow_md"></i>
                                                        </button>
                                                        <div class="trp-dropdown_list-box"
                                                             data-trp-focusid="js-user_support">
                                                            <div class="search-box">
                                                                <input id="search_lot" type="search" placeholder="LOT 번호 입력">
                                                                <i class="form-search_md"></i>
                                                            </div>
                                                            <div class="list-box scroll-type">
                                                                <ul id="sale_lot_list">
                                                                    <li ng-repeat="item in saleImages" data-index="{{item.LOT_NO}}">
                                                                        <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                            <div class="image-area">
                                                                                <figure class="img-ratio">
                                                                                    <!-- [0725]hover시 돋보기표시 -->
                                                                                    <!-- [0803]돋보기표시Dim삭제(원복)-->  
<%--                                                                                    <div class="dim">--%>
<%--                                                                                        <i class="icon-zoom_in"></i>--%>
<%--                                                                                    </div>--%>
                                                                                    <!-- //[0725]hover시 돋보기표시 -->
                                                                                    <div class="img-align">
                                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                                                    </div>
                                                                                </figure>
                                                                            </div>
                                                                            <div class="typo-area">
                                                                                <span ng-bind="'LOT '+item.LOT_NO"></span>
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
                                                                            <div class="img-align">
                                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
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

                                                                <div class="slide" data-index="4"> <%-- 이미지 없을 시 클래스 slide만 남겨놔야 함. --%>
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
                                            </div>
                                            <div class="view_scale-area"  ng-if="lotInfo.IMAGE_MAGNIFY && lotInfo.VIEW_SCALE_YN == 'Y' && ['traditional_painting', 'local_painting', 'foreign_painting'].indexOf(lotInfo.CATE_CD) > -1">
                                                <a class="js-popup_image_viewer" href="#">
                                                    <i class="icon-view_scale"></i>
                                                    <span>VIEW SCALE</span>
                                                </a>
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
                                                       ng-class="{'work_heart':lotInfo.FAVORITE_YN,'js-work_heart':lotInfo.FAVORITE_YN,'on':lotInfo.FAVORITE_YN==='Y'}"
                                                       ng-click="favorite(lotInfo.SALE_NO, lotInfo.LOT_NO);"><i
                                                            class="icon-view_heart_off"></i></a>

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
                                                    <span ng-show="lotInfo.BORN_YEAR" ng-bind="'b.' + lotInfo.BORN_YEAR" title="{{'b.' + lotInfo.BORN_YEAR}}"></span>
                                                </div>
                                                <div class="desc">
                                                    <span class="text-over span_block" title="{{lotInfo.TITLE_KO_TXT}}" ng-bind="lotInfo.TITLE_KO_TXT"></span>
                                                </div>
                                            </div>
                                            <div class="price-area">
                                                <dl class="price-list" >
                                                    <dt>추정가</dt>
                                                    <dd ng-bind="estimatedRange" ng-if="lotInfo.EXPE_PRICE_INQ_YN !== 'Y'"></dd>
                                                    <dd ng-if="lotInfo.EXPE_PRICE_INQ_YN === 'Y'">별도문의</dd>
                                                </dl>
                                                <dl class="price-list" ng-show="lotInfo.START_PRICE > 0">
                                                    <dt>시작가</dt>
                                                    <dd id="start_cost"><!--WEB SOCKET--></dd>
                                                </dl>
                                                <dl id="cur_cost_layer" class="price-list">
                                                    <dt id="cur_cost_text2"></dt>
                                                    <dd><strong id="cur_cost" ng-bind=""><!--WEB SOCKET--></strong><em
                                                            id="bid_cnt"></em></dd>
                                                </dl>
                                                <dl class="price-list">
                                                    <dt>마감일</dt>
                                                    <dd><b id="end_date_time"><!--WEB SOCKET--></b></dd>
                                                </dl>
                                            </div>
                                            <div class="button-area">
                                                <div class="btn_set only-pc">
                                                    <div class="btn_item">
                                                        <a class="btn btn_point btn_lg" href="#" role="button"
                                                           id="bid_btn"
                                                           ng-click="popSet(sale_no, lot_no, user_id, cust_no);"><span>응찰</span>
                                                        </a>
                                                        <%-- //0812 경매 마감 시 경매결과 보기 버튼 --%> 
                                                        <a class="btn btn_gray" href="#" role="button"><span>경매결과 보기</span></a>
                                                        <%-- //0812 경매 마감 시 경매결과 보기 버튼 --%>
                                                   </div>
                                                </div>
                                                <div class="btn_set cols_2">
                                                    <div class="btn_item hover_change only-pc">
                                                        <div class="op_default">
                                                            <a class="btn btn_default btn_lg "
                                                               role="button"><span>낙찰수수료</span></a>
                                                        </div>
                                                        <div class="op_hover">
                                                            <a class="btn btn_black btn_2 btn_lg js-popup_alert1"
                                                               role="button">
                                                                <em>현재가 기준</em>
                                                                <strong id="cost_add_vat"></strong>
                                                            </a>
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
                                                    <a href="/auction/view/print/{{lotInfo.SALE_NO}}/{{lotInfo.LOT_NO}}" target="_blank">
                                                        <button class="print-btn">
                                                            <i class="icon-view_print"></i>
                                                        </button>
                                                    </a>
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
                                               <%-- 재질--%>
                                                <span title="{{lotInfo.MATE_NM_EN}}" ng-bind="lotInfo.MATE_NM_EN"></span>
                                                <br/>

                                                <%-- 규격--%>
                                                <div ng-repeat="size in lotInfo.LOT_SIZE_JSON">
                                                    <span title="{{size | size_text_cm}}" bind-html-compile="size | size_text_cm"></span>
                                                </div>

                                                <%--에디션--%>
                                                <div ng-show="lotInfo.EDITION">
                                                    <span> {{lotInfo.EDITION}} </span>
                                                </div>

                                                <%--제작년도--%>
                                                <div ng-show="isNotObjectEmpty(lotInfo.MAKE_YEAR_JSON)">
                                                    <span title="{{lotInfo.MAKE_YEAR_JSON | locale_format }}">{{lotInfo.MAKE_YEAR_JSON | locale_format }}</span>
                                                </div>

                                                <%--서명 정보--%>
                                                <div ng-show="isNotObjectEmpty(lotInfo.SIGN_INFO_JSON)">
                                                    <span title="{{lotInfo.SIGN_INFO_JSON | locale_format }}">{{lotInfo.SIGN_INFO_JSON | locale_format }}</span>
                                                </div>

                                               <div ng-if="lotInfo.FRAME_CD!='none'">
                                                   <span>{{lotInfo.FRAME_CD}}</span>
                                               </div>
                                            </div>

                                            <!-- [0714]작품정보 하위댑스 추가 -->
                                            <div class="info-sub-wrap">
                                                <%-- CONDITION --%>
                                                <div ng-show="isNotObjectEmpty(lotInfo.COND_RPT_JSON)" class="info-sub-box">
                                                    <div class="tit tt5">CONDITION</div>
                                                    <div class="desc" bind-html-compile="lotInfo.COND_RPT_JSON[locale]"></div>
                                                </div>

                                                <%--PROVENANCE--%>
                                                <div ng-show="isNotObjectEmpty(lotInfo.PROV_INFO_JSON)" class="info-sub-box">
                                                    <div class="tit tt5">PROVENANCE</div>
                                                    <div class="desc" bind-html-compile="lotInfo.PROV_INFO_JSON[locale]"></div>
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
                                            </div>
                                            <!-- [0714]작품정보 하위댑스 추가 -->
                                        </div>

                                        <!-- [0714]작품설명 추가 -->
                                        <div ng-show="isNotObjectEmpty(lotInfo.CMMT_JSON)" class="info-box">
                                            <div class="title">작품 설명</div>
                                            <div class="desc txt-pre-line">{{lotInfo.CMMT_JSON | locale_format }}</div>
                                        </div>

                                        <!-- [0613]notice 추가 -->
                                        <div ng-show="isNotObjectEmpty(sale.NOTICE_DTL_JSON)" class="info-box">
                                            <!-- [0714]텍스트 대소문자 수정 -->
                                            <div class="title">NOTICE</div>
                                            <!-- //[0714]텍스트 대소문자 수정 -->

                                            <div class="desc txt-pre-line">
                                                <ul class="mark_dot-list" bind-html-compile="sale.NOTICE_DTL_JSON[locale]">
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- //[0613]notice 추가 -->
                                        <div class="info-box">
                                            <div id="artist_layer" class="info-box">
                                                <div class="title">작가정보</div>
                                                <%--0728 삭제 -%>
<%--                                                <div class="desc txt-pre-line" id="artistName">--%>
<%--                                                </div>--%>
<%--                                                <div class="desc txt-pre-line" id="artistProfile">--%>
<%--                                                </div>--%>
                                                <%--//0728 삭제 -%>
                                                <%--0728 추가--%>
                                                <div class="desc txt-pre-line" id="artistArticle">
                                                    <a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a><%--
                                                    --%><a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a><%--
                                                    --%><a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a><%----%>
                                                </div>
                                                <%--//0728 추가--%>
                                                <div class="desc" id="artistMedia">
                                                </div>
                                            </div>
                                        </div> <%-- //info-box --%>
                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">
                                <article ng-show="recentlyViews.length != 0" class="product_recent_work-article">
                                    <div class="article-header" ng-show="recentlyViews.length > 0">
                                        <div class="title"><span>이 경매의 최근 본 작품</span></div>
                                    </div>
                                    <div class="article-body">
                                        <div class="scroll-type">
                                            <div class="product-area">
                                                <ul id="recently_views" class="product-list">
                                                    <li class="" ng-repeat="item in recentlyViews">
                                                        <div class="li-inner">
                                                            <a href="/auction/online/view/{{item.SALE_NO}}/{{item.LOT_NO}}">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <a href="javascript:void(0);" class="img-align">
                                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                                            </a>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <%--<a href="#">--%><a
                                                                                    href="javascript:void(0);" class="num"
                                                                                    ng-bind="item.LOT_NO"></a><%--</a>--%>
                                                                                <a ng-class="{'heart':item.FAVORITE_YN,'js-work_heart':item.FAVORITE_YN,'on':item.FAVORITE_YN==='Y'}"
                                                                                   ng-click="favorite2(item.SALE_NO, item.LOT_NO, $index);"><i
                                                                                        class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <a href="/auction/live/online/{{item.SALE_NO}}/{{item.LOT_NO}}">
                                                                                    <div class="title">
                                                                                        <a href="javascript:void(0);">
                                                                                            <span ng-bind="item.ARTIST_NAME_BLOB_JSON.ko"></span>
                                                                                        </a>
                                                                                    </div>
                                                                                    <div class="desc">
                                                                                        <a href="javascript:void(0);">
                                                                                            <span ng-bind="item.TITLE_BLOB_JSON.ko"></span>
                                                                                        </a>
                                                                                    </div>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span>LOT 5</span></div>
                                                                                <div class="msg"><span>출물이 취소되었습니다.</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </a>
                                                            <%--                                                            </a>--%>
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
                        <!-- [0628]클릭 시 액션 추가 -->
                        <div class="btn_lot-box">
                            <button class="js-lotbox-btn">
                                <div class="txt">전체 LOT</div>
                                <i class="form-select_arrow_view-2x"></i>
                            </button>

                            <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                <div class="search-box">
                                    <input id="search_lot_mb" type="search" placeholder="LOT 번호 입력" id="" class="">
                                    <i class="form-search_md"></i>
                                </div>
                                <div class="list-box scroll-type">
                                    <ul id="sale_lot_list_mb">
                                        <li ng-repeat="item in saleImages"
                                             data-index="{{item.LOT_NO}}">
                                            <a href="javascript:void(0);" ng-click="goLot(item.SALE_NO,item.LOT_NO)">
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
                        <div class="btn-box">
                            <button id="bid_btn" ng-click="popSet(sale_no, lot_no, user_id, cust_no);">응찰</button>
                            <!-- [0824] 수정  -->
                            <button class="btn_gray">경매결과 보기</button>
                        </div>
                        <!-- // [0824] 수정  -->

                    </div>
                </article>
                <input type="hidden" id="sale_no" value="{{sale_no}}"/>
                <input type="hidden" id="lot_no" value="{{lot_no}}"/>
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
<%--                                    <div class="lotlist-tabmenu"> --%>
<%--                                        <div class="btn_item">--%>
<%--                                            <a href="#"--%>
<%--                                               ng-class="{'lot-btn_tabmenu': '1' === '1', 'on':'전체' === selectLotTag}"--%>
<%--                                               ng-click="searchLotTags('전체');" role="button">--%>
<%--                                                <span>전체</span>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                        <div class="btn_item" ng-repeat="ci in categories">--%>
<%--                                            <a href="#"--%>
<%--                                               ng-class="{'lot-btn_tabmenu': '1' === '1', 'on': ci.CD_NM === selectLotTag}"--%>
<%--                                               ng-click="searchLotTags(ci.CD_NM);">--%>
<%--                                                <span ng-bind="ci.CD_NM"></span>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                        <div class="btn_item" ng-repeat="li in lotTags">--%>
<%--                                            <a href="#"--%>
<%--                                               ng-class="{'lot-btn_tabmenu': '1' === '1', 'on': li.LOT_TAG === selectLotTag}"--%>
<%--                                               ng-click="searchLotTags(li.LOT_TAG);">--%>
<%--                                                <span ng-bind="li.LOT_TAG"></span>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                        <!-- [0728]탭수정 -->
                                    <div class="tab-area type-left_mm_3">
                                        <ul class="tab-list js-left_mm">
                                            <li class="active"><a href="#tab-cont-1"
                                                                  ng-class="{'lot-btn_tabmenu': '1' === '1', 'on':'전체' === selectLotTag}"
                                                                  ng-click="searchLotTags('전체');" role="button">
                                                <span>전체</span>
                                            </a></li>
                                            <li class=""><a href="#tab-cont-2"
                                                            ng-class="{'lot-btn_tabmenu': '1' === '1', 'on': ci.CD_NM === selectLotTag}"
                                                            ng-click="searchLotTags(ci.CD_NM);">
                                                <span ng-bind="ci.CD_NM"></span>
                                            </a></li>
                                            <li class=""><a href="#tab-cont-3"
                                                            ng-class="{'lot-btn_tabmenu': '1' === '1', 'on': li.LOT_TAG === selectLotTag}"
                                                            ng-click="searchLotTags(li.LOT_TAG);">
                                                <span ng-bind="li.LOT_TAG"></span>
                                            </a></li>
                                        </ul>
                                    </div>
                                    <!-- //[0728]탭수정 -->
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
                                                                <div class="title"><span ng-bind="item.ARTIST_NAME_JSON.ko"></span></div>
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

        <script>
            $(function () {

            });
        </script>
        <!-- //[0516] 이미지 팝업 -->
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
<!--  응찰(온라인)  -->
<div id="popup_biddingPopup1-wrap" class="trp popupfixed-wrap bidding-online-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-lg mode-mb_full">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span id="lot_title" class="txt_title">LOT </span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section  " style="display: block;">
                            <div class="bidding-online-wrap">
                                <article class="bidding-online-left">
                                    <figure class="view-area">
                                        <div class="view-img">
                                            <div class="img-box">
                                                <div class="box-inner">
                                                    <img id="img_url" alt="LOT">
                                                </div>
                                            </div>
                                        </div>
                                        <figcaption class="view-typo">
                                            <div class="typo-header">
                                                <div class="title"><span id="artist_nm"></span></div>
                                                <div class="year"><span id="born_year"></span></div>
                                                <div class="desc"><span id="bidding_title"></span>
                                                </div>
                                            </div>
                                            <div class="typo-body">
                                                <span id="lot_mt_nm"></span>
                                                <ul>
                                                    <li id="lot_size"></li>
                                                    <li id="lot_make_year"></li>
                                                </ul>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                                <article class="bidding-online-right js-bidding_tab">
                                    <div class="legend-area">
                                        <div class="side_time">
                                            <span id="bid_tick"></span>
                                        </div>
                                        <div class="unit">
                                            <span>호가단위 : </span>
                                            <em id="quote_unit"></em>
                                        </div>
                                    </div>
                                    <div class="product-list-area">
                                        <div class="list-header">
                                            <div class="price-name"><span id="cur_cost_text">현재가</span></div>
                                            <div class="price-amount"><em id="bid_cost_val"></em> <span
                                                    id="bid_cost_cnt"></span></div>
                                        </div>
                                        <div class="list-body scroll-type">
                                            <ul id="bid_lst" class="product-list">
                                            </ul>
                                            <!-- [0725]응찰내역없을때 추가 -->
                                            <div class="data-empty">
                                                <p class="txt_empty tb1">응찰내역이 없습니다.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="online_end" id="end_bid_true" style="display:none;">
                                        <div class="txt">
                                            현재 LOT의 경매가 <span>종료</span>되었습니다.
                                        </div>
                                    </div>
                                    <div class="topbtn-area" name="end_bid_false">
                                        <div class="btn_set">
                                            <div class="btn_item"><a class="btn btn_default btn_lg" href="#"
                                                                     role="button"><span>1회 응찰</span></a></div>
                                            <div class="btn_item"><a class="btn btn_gray btn_lg" href="#" role="button"><span>자동응찰</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="caution-area" name="end_bid_false">
                                        <ul class="mark_char-list">
                                            <li class="accent"><span>응찰 버튼을 누르시면 취소가 불가능합니다.</span></li>
                                            <li class=""><span>동시 응찰자 경우, 서버시각 기준 우선순위가 부여됩니다.</span></li>
                                        </ul>
                                    </div>
                                    <div class="bottombtn-area" name="end_bid_false">
                                        <div class="btn_set active">
                                            <div class="btn_item"><a class="btn btn_point btn_lg typo-pc_mb-line"
                                                                     id="bid_new_cost_val" href="javascript:bid();"
                                                                     role="button" value=""><span
                                                    id="bid_new_cost"></span> <span
                                                    id="bid_new_cost_btn">응찰</span></a></div>
                                        </div>
                                        <div class="btn_set type-pc_mb-column">
                                            <div class="btn_item">
                                                <div id="reservation_bid_layer" class="select-box ">
                                                    <!-- disabled 옵션 -->
                                                    <select class="select2Basic56_line" id="reservation_bid">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="btn_item"><a class="btn btn_point btn_lg"
                                                                     href="javascript:autoBid();"
                                                                     role="button"><span
                                                    id="auto_bid_txt">응찰</span></a></div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="popup/auctionConfirmPopup.jsp" flush="false"/>
<!-- 뷰스케일 레이어 팝업 -->
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
<%--                            LOT 이동 컨트롤 --%>
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
                    <div class="pop-body">
                        <article class="viewer-article js-zoom_inout">
                            <div class="gallery_view js-imagesSwiper" style="">
                                <div class="gallery_center">
                                    <div id="swiper-wrapper_popup"  class="swiper-wrapper">

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
<!-- 응찰 -->
<div id="bidding_go-wrap" class="trp popupfixed-wrap auction_info-popup  ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <article class="auction_info-article">
                                <div class="img">
                                    <img class="only_ib-pc"
                                         src="/images/pc/auction/symbol-none_data.png" alt="안내"/>
                                    <img class="only_ib-mb"
                                         src="/images/pc/auction/symbol-none_data.png" alt="안내"/>
                                </div>
                                <div class="title"><span>Seoul Auction 안내</span></div>
                                <div class="gray-box">
                                    <ul class="mark_dot-list">
                                        <li>자동응찰 중지하기 전까지의 응찰 낙찰 내역은 모두 기록되며 유효합니다.</li>
                                    </ul>
                                </div>

                                <div class="query"><span>응찰 하시겠습니까?</span></div>
                                <div class="btn_set">
                                    <a id="auto_on_cancel" class="btn btn_default" href="#"
                                       role="button"><span>취소</span></a>
                                    <a id="auto_on_ok" class="btn btn_point" href="#"
                                       role="button"><span>응찰</span></a>
                                </div>
                            </article>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 응찰중지 -->
<div id="bidding_stop-wrap" class="trp popupfixed-wrap auction_info-popup  ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">

                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <article class="auction_info-article">
                                <div class="img">
                                    <img class="only_ib-pc"
                                         src="/images/pc/auction/symbol-none_data.png" alt="안내"/>
                                    <img class="only_ib-mb"
                                         src="/images/pc/auction/symbol-none_data.png" alt="안내"/>
                                </div>
                                <div class="title"><span>Seoul Auction 안내</span></div>
                                <div class="gray-box">
                                    <ul class="mark_dot-list">
                                        <li>자동응찰 중지는 자동 응찰 취소가 아닙니다.</li>
                                        <li>비딩이 올라간 상태에서 정지됩니다.</li>
                                    </ul>
                                </div>

                                <div class="query"><span>자동 응찰을 중지 하시겠습니까?</span></div>
                                <div class="btn_set">
                                    <a id="auto_off_cancel" class="btn btn_default" href="#"
                                       role="button"><span>취소</span></a>
                                    <a id="auto_off_ok" class="btn btn_point" href="#"
                                       role="button"><span>자동응찰 중지</span></a>
                                </div>
                            </article>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>






<%--<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>--%>
<!--[if lt IE 9]>
<%-- <script src="/js/plugin/html5shiv.js"></script> --%> <![endif]-->
<%--<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
<script type="text/javascript" src="/js/auction/saleCert.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<%--낙찰 수수료 팝업 --%>
<jsp:include page="popup/bidCommissionPopup.jsp"/>

<%--경매 호가 팝업 --%>
<jsp:include page="popup/growBiddingPopup.jsp"/>
<%--경매 호가 스크립트 --%>
<script>
    let dataArray = [];

    //온라인 경매 호가
    dataArray.push({'up': null, 'down': '100만', 'price': 50000});
    dataArray.push({'up': '100만', 'down': '300만', 'price': 100000});
    dataArray.push({'up': '300만', 'down': '500만', 'price': 200000});
    dataArray.push({'up': '500만', 'down': '1,000만', 'price': 300000});
    dataArray.push({'up': '1,000만', 'down': '3,000만', 'price': 500000});
    dataArray.push({'up': '3,000만', 'down': '5,000만', 'price': 1000000});
    dataArray.push({'up': '5,000만', 'down': '1억', 'price': 2000000});
    dataArray.push({'up': '1억', 'down': '2억', 'price': 3000000});
    dataArray.push({'up': '2억', 'down': null, 'price': 5000000});

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

<!-- [0628]모바일 LOT 버튼 클릭시 액션 추가 -->
<%--<script>--%>
<%--    $(".js-lotbox-btn").click(function () {--%>
<%--        $(this).parent(".btn_lot-box").toggleClass("on")--%>
<%--    }) --%>
<%--</script>--%>

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

<!-- hold side : positionTar2 : $(".js-page_name-article"), -->
<!-- [2022-0516] 사용 -->
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
    //약관체크
    $(".js_all-1").trpCheckBoxAllsImg(".js_all", ".js_item");

    let popup_offline_payment = $(".js-popup_online_confirm").trpLayerFixedPopup("#popup_online_confirm-wrap");
    //let popup_biddingPopup1 = $("#bid_btn").trpLayerFixedPopup("#popup_biddingPopup1-wrap");

    app.value('locale', 'ko');
    app.value('is_login', true);

    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    // 현재가 처리
    app.filter('title', function (locale) {
        return function (val, l) {
            if (!l) l = locale;
            if (val != "") {
                if (l == "ko") return "제" + val.SALE_TH + "회" + " " + val.TITLE_JSON.ko;
                var s = ["th", "st", "nd", "rd"],
                    v = val.SALE_TH % 100;
                return val.SALE_TH + (s[(v - 20) % 10] || s[v] || s[0]) + " " + val.TITLE_JSON.ko;
            }
        };
    })

    const locale = document.documentElement.lang;

    app.filter('locale_format', function(){
        return function(val) {
            if (val === undefined) {
                return '';
            }
            return locale === 'ko' ? val.ko : val.en;
        };
    });

    app.controller('ctl', function ($scope, consts, common, is_login, locale, $filter) {

        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.sale_no = "${saleNo}";
        $scope.lot_no = "${lotNo}";
        $scope.cust_no =  ${member.userNo};
        $scope.user_id = '${member.loginId}';

        $scope.is_sale_cert = false;
        $scope.cust_hp = "";

        $scope.onStateCostTxt = "";

        $scope.selectLotTag = "전체";

        $scope.endBid = false;

        // 호출 부
        const getSaleInfo = (saleNo) => {
            try {
                return axios.get('/api/auction/sale_info/${saleNo}');
            } catch (error) {
                console.error(error);
            }
        };
        const getLotInfo = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/lot_info/${saleNo}/${lotNo}');
            } catch (error) {
                console.error(error);
            }
        };

        const getLotImages = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/lot_images/${saleNo}/${lotNo}');
            } catch (error) {
                console.error(error);
            }
        };

        const getLotArtistOtherLots = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/lot_artist_other_lots');
            } catch (error) {
                console.error(error);
            }
        };

        const getLotCustomer = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/get_customer_by_cust_no');
            } catch (error) {
                console.error(error);
            }
        };

        const getSaleCertInfo = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/sale_cert_info');
            } catch (error) {
                console.error(error);
            }
        };

        const getSaleImages = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/sale_images/'+saleNo);
            } catch (error) {
                console.error(error);
            }
        }

        const getViewScaleImages = (saleNo, lotNo) => {
            console.log("getViewScaleImages : ", saleNo, lotNo);
            try {
                return axios.get('/api/auction/getViewScaleImage/'+saleNo+'/'+lotNo);
            } catch (error) {
                console.error(error);
            }
        }

        const insertRecentlyView = (saleNo, lotNo) => {
            try {
                return axios.post('/api/auction/insertRecentlyView', {
                    sale_no: saleNo,
                    lot_no: lotNo,
                    cust_no: $scope.cust_no,
                });
            } catch (error) {
                console.error(error);
            }
        }

        const getRecentlyView = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/recently/${saleNo}/${lotNo}');
            } catch (error) {
                console.error(error);
            }
        }

        const setSale = (saleNo) => {
            try {
                return axios.get('/api/auction/sales/' + saleNo);
            } catch (error) {
                console.error(error);
            }
        }

        // 호출 부
        const getSaleListInfo = (saleNo) => {
            try {
                return axios.get('/api/auction/list/${saleNo}');
            } catch (error) {
                console.error(error);
            }
        };

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
                let popup_biddingPopup1 = $("#bid_btn").trpLayerFixedPopup("#popup_biddingPopup1-wrap");
                popup_biddingPopup1.open(this); // or false
                popup_fixation("#popup_biddingPopup1-wrap");

                // 팝업시 1회응찰고정
                $(".js-bidding_tab .topbtn-area .btn_item:eq(0)").click();

                $("body").on("click", "#popup_biddingPopup1-wrap .js-closepop, #popup_biddingPopup1-wrap .popup-dim", function ($e) {
                    $e.preventDefault();
                    popup_biddingPopup1.close();
                });
            }
        }
        //오브젝트 or 배열 비었는지 확인
        $scope.isNotObjectEmpty = function (param) {

            if(param === undefined){
                return false;
            }
            return param.constructor === Object && Object.keys(param).length !== 0;
        }

        $scope.goLot = function (saleNo, lotNo) {
            window.location.href = '/auction/online/view/' + saleNo + '/' + lotNo;
        }

        $scope.favorite = function (saleNo, lotNo) {
            let url = "";
            if ($scope.lotInfo.FAVORITE_YN === 'Y') {
                url = "/api/auction/delCustInteLot";
                $scope.lotInfo.FAVORITE_YN = "N";

            } else if ($scope.lotInfo.FAVORITE_YN === 'N') {
                url = "/api/auction/addCustInteLot";
                $scope.lotInfo.FAVORITE_YN = "Y";
            }
            try {
                return axios.post(url, {
                    sale_no: saleNo,
                    lot_no: lotNo,
                    cust_no: $scope.cust_no
                });
            } catch (error) {
                console.error(error);
            }
        }

        $scope.favorite2 = function (saleNo, lotNo, index) {
            console.log("index", index);
            let url = "";
            if ($scope.recentlyViews[index].FAVORITE_YN === 'Y') {
                url = "/api/auction/delCustInteLot";
                $scope.recentlyViews[index].FAVORITE_YN = "N";

            } else if ($scope.recentlyViews[index].FAVORITE_YN === 'N') {
                url = "/api/auction/addCustInteLot";
                $scope.recentlyViews[index].FAVORITE_YN = "Y";
            }
            try {
                return axios.post(url, {
                    sale_no: saleNo,
                    lot_no: lotNo,
                    cust_no: $scope.cust_no
                });
            } catch (error) {
                console.error(error);
            }
        }
        $scope.favorite3 = function (saleNo, lotNo) {
            let url = "";
            for (let i = 0 ; i < $scope.saleLotList.length; i++) {
                if ($scope.saleLotList[i].SALE_NO === saleNo &&
                    $scope.saleLotList[i].LOT_NO === lotNo && $scope.saleLotList[i].FAVORITE_YN === 'Y') {
                    $scope.saleLotList[i].FAVORITE_YN = "N";
                    url = "/api/auction/addCustInteLot";
                    break
                } else if ($scope.saleLotList[i].SALE_NO === saleNo &&
                    $scope.saleLotList[i].LOT_NO === lotNo && $scope.saleLotList[i].FAVORITE_YN === 'N') {
                    $scope.saleLotList[i].FAVORITE_YN = "Y";
                    url = "/api/auction/delCustInteLot";
                    break
                }
            }
            try {
                axios.post(url, {
                    sale_no: saleNo,
                    lot_no: lotNo,
                    cust_no: $scope.cust_no,
                }).then(function(response) {
                    $scope.$apply();
                });
            } catch (error) {
                console.error(error);
            }
        }

        $scope.urlCopy = function () {
            let url = location.href;
            let $temp = $('<input>');
            $('body').append($temp);
            $temp.val(url).select();
            document.execCommand('copy');
            $temp.remove();
            alert('URL이 복사되었습니다.');
        }

        $scope.searchLotTags = function (lotTag) {
            $scope.selectLotTag = lotTag;

            let pp = [];
            if (lotTag === '전체') {
                for (let i = 0; i < $scope.saleLotList.length; i++) {
                    pp.push($scope.saleLotList[i]);
                }
            } else {
                for (let i = 0; i < $scope.saleLotList.length; i++) {
                    if ($scope.saleLotList[i].LOT_TAG === lotTag ||
                        $scope.saleLotList[i].CATE_CD_NM === lotTag) {
                        pp.push($scope.saleLotList[i]);
                    }
                }
            }
            if (pp.length > 0) {
                $scope.isEmpty = false;
            } else {
                $scope.isEmpty = true;
            }
            $scope.lotLength = pp.length;
            $scope.searchSaleLotList = pp;
            //$scope.$apply();
        }

        // 호출 부
        $scope.load = function () {
            let run = async function () {
                let [r1, r2, r3, r4, _, r6, r7, r8, r9, r10, r11] = await Promise.all(
                    [getSaleInfo($scope.sale_no), //1
                    getLotInfo($scope.sale_no, $scope.lot_no), //2
                    getLotImages($scope.sale_no, $scope.lot_no), //3
                    getSaleImages($scope.sale_no, $scope.lot_no), //4
                    insertRecentlyView($scope.sale_no, $scope.lot_no), //5
                    getRecentlyView($scope.sale_no, $scope.lot_no), //6
                    setSale($scope.sale_no), //7
                    getSaleListInfo($scope.sale_no), //8
                    getLotTags($scope.sale_no), //9
                    getCategories($scope.sale_no), //10
                    getViewScaleImages($scope.sale_no, $scope.lot_no)]); //11

                $scope.saleInfo = r1.data.data;
                $scope.lotInfo = r2.data.data;
                $scope.lotImages = r3.data.data;
                $scope.saleImages = r4.data.data;
                $scope.viewScaleImages = r11.data.data;
                // 0718
                $scope.saleLotList = r8.data.data;

                $scope.lotTags = r9.data.data;
                $scope.categories = r10.data.data;

                $scope.lotLength = $scope.saleLotList.length;
                let pp = [];
                for (let i = 0 ; i < $scope.saleLotList.length; i++){
                    pp.push($scope.saleLotList[i])
                }
                $scope.searchSaleLotList = pp;

                let sale_title;

                sale_title = ( $scope.lotInfo.SALE_TH === undefined || $scope.lotInfo.SALE_TH === '')  ? '' : ( '제' + $scope.lotInfo.SALE_TH + '회 ' );
                sale_title += JSON.parse($scope.lotInfo.SALE_TITLE_JSON).ko;
                $scope.fullTitle = sale_title;

                $scope.estimatedRange = $scope.lotInfo.BASE_EXPE_FROM_PRICE + ' ~ ' + $scope.lotInfo.BASE_EXPE_TO_PRICE;

                $scope.recentlyViews = r6.data.data;

                $scope.sale = r7.data.data;

                $scope.sale.TITLE_JSON = JSON.parse($scope.sale.TITLE_JSON);
                $scope.sale.buttonList.map(item => {
                    item.content = JSON.parse(item.content);
                });
                if ($scope.sale.NOTICE_DTL_JSON != undefined) {
                    $scope.sale.NOTICE_DTL_JSON = JSON.parse($scope.sale.NOTICE_DTL_JSON);
                }


                let S_DB_NOW = $filter('date')($scope.sale.DB_NOW, 'yyyyMMddHHmm');
                let S_DB_NOW_D = $filter('date')($scope.sale.DB_NOW, 'yyyyMMdd');
                let FROM_DT = $filter('date')($scope.sale.FROM_DT, 'yyyyMMdd');
                let TO_DT = $filter('date')($scope.sale.TO_DT, 'yyyyMMdd');
                let END_DT = $filter('date')($scope.sale.END_DT, 'yyyyMMddHHmm');
                let LIVE_START_DT = $filter('date')($scope.sale.LIVE_BID_DT, 'yyyyMMddHHmm');

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

                    if (sessionStorage.getItem("is_login") === 'false') {
                        alert("권한이 없거나 허용되지 않은 접근입니다.");
                        //history_back();
                    }
                }
                //artist 번호
                $scope.artistNo = $scope.lotInfo.ARTIST_NO;
                console.log("125540", $scope.artistNo);

                $scope.activeIndex = 0;

                // popup setting
                let imgUrl;
                if($scope.lotImages[0]) {
                    imgUrl = $scope.lotImages[0].IMAGE_URL + $scope.lotImages[0].FILE_PATH + "/" + $scope.lotImages[0].FILE_NAME;
                }

                $("#bidding_title").html($scope.lotInfo.TITLE_KO_TXT);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.lotInfo.ARTIST_NAME_KO_TXT);
                $("#born_year").html("(" + $scope.lotInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.lotInfo.LOT_NO);
                $("#lot_size").html(size_text_cm($scope.lotInfo.LOT_SIZE_JSON));
                if(isNotObjectEmpty($scope.lotInfo.MAKE_YEAR_JSON)) {
                    $("#lot_make_year").show();
                    $("#lot_make_year").html($scope.lotInfo.MAKE_YEAR_JSON.ko);
                } else {
                    $("#lot_make_year").hide();
                }

                $("#lot_mt_nm").html($scope.lotInfo.MATE_NM);

                startBidProcess($scope.lotInfo.SALE_NO, $scope.lotInfo.LOT_NO, 2, '${member.loginId}', $scope.cust_no);

                //await $scope.setSale($scope.sale_no);
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
                })
                /*
                for (let i = 0 ; i < $scope.recentlyViews.length;i++) {
                    if ($scope.recentlyViews[i].FAVORITE_YN === 'Y'){
                        //console.log($("#recently_views .js-work_heart").eq(i).addClass("on"));
                        $("#recently_views .js-work_heart").eq(i).addClass("on");
                    }
                }*/

                // swiper
                let view_visual = new Swiper(".js-view_visual .gallery_center", {
                    loop: false,
                    paginationClickable: false,
                    spaceBetween: 10,
                    effect: "fade",
                    allowTouchMove: false,
                    simulateTouch: false,
                    enabled:false,
                    pagination: {
                        el: '.js-view_visual .pagination',
                        type: 'bullets',
                    },
                    breakpoints: {
                        1023: {
                            effect: "fade",
                            simulateTouch: false,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    on: {
                        slideChange: function () {
                            $scope.activeIndex = view_visual.activeIndex;
                            view_thumnailActive(view_visual.activeIndex);
                        }
                    },

                });

                // $(".js-view_thumnail .slide").on("click", function () {
                //     var _index = $(this).index();
                //     view_thumnailActive(_index);
                    // view_visualActive(_index, view_visual);
                // });

                $(window).on("resize", function () {
                    view_visual.update();
                });

                const viewScaleImages = $scope.viewScaleImages;
                console.log(viewScaleImages);
                const lot_images = $scope.lotImages;
                let firstCheck = 0;

                // $.each(sale_images, function (index, el) {
                if(viewScaleImages.length > 0) {
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

                    if (['local_painting', 'foreign_painting'].indexOf($scope.lotInfo.CATE_CD) > -1) {
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
                    }

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

                /* 싸이즈 버튼 */
                var size_btn_toggle = $(".js-size_btn").trpToggleBtn(
                    function ($this) {
                        $($this).closest(".viewer-article").addClass("active");
                    },
                    function ($this) {
                        $($this).closest(".viewer-article").removeClass("active");
                    });


                /* 스와이퍼 */
                var imageViewer = new Swiper('.js-image_viewer .gallery_center', {
                    loop: true,
                    onSlideChangeStart: function (swiper) { // 움직임이 끝나면 실행
                        imagesResizePcMb();
                    },
                    onSlideChangeEnd: function (swiper) { // 움직임이 끝나면 실행
                        imagesResizePcMb();
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


                var popup_image_viewer =
                    $(".js-popup_image_viewer").trpLayerFixedPopup("#popup_image_viewer-wrap");
                $(popup_image_viewer.getBtn).on("click", function ($e) {
                    $e.preventDefault();
                    popup_image_viewer.open(this); // or false
                    imagesResizePcMb();
                    imageViewer.update();
                    // imageViewer.slideTo(parseInt($("#view_lot_no").attr("sel-data-index")) - $scope.chk, 0);
                });
                // 좌우버튼
                // $('.view_paging-area .page_prev').on('click', function ($e) {
                //     $e.preventDefault();
                //     imageViewer.slidePrev();
                //     $("#view_lot_no").html("LOT " + $(".swiper-slide-active .imageViewer").attr('lot_no'));
                //
                // })
                // $('.view_paging-area .page_next').on('click', function ($e) {
                //     $e.preventDefault();
                //     imageViewer.slideNext();
                //     $("#view_lot_no").html("LOT " + $(".swiper-slide-active .imageViewer").attr('lot_no'));
                //
                // })

                /* PC,MB images resize */
                $(window).on("resize", function () {
                    imagesResizePcMb();
                });

                $("body").on("click", "#popup_image_viewer-wrap .js-closepop, #popup_image_viewer-wrap .popup-dim", function($e) {
                    $e.preventDefault();
                    popup_image_viewer.close();
                });

            // lot
            $("#search_lot, #search_lot_mb").on("keyup", function () {
                window.event.preventDefault();
                let v = $(this).val();
                if (v.length == 0) {
                    $("#sale_lot_list li").each(function (i, item) {
                        $(item).css("display", "");
                    })
                    $("#sale_lot_list_mb li").each(function (i, item) {
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
                    $("#sale_lot_list_mb li").each(function (i, item) {
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

            //작가 정보 admin에서 가져오도록 로직변경
            axios.get('/api/auction/artist_info/' + $scope.artistNo)
                .then(function (response) {

                    const data = response.data;
                    let success = data.success;

                    if (success) {
                        let artistData = data.data;

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

                            $("#artistName").html(JSON.parse(artistData.name).ko + ' ' + artistData.birth + (artistData.death ? '~' + artistData.death : ''));
                            $("#artistProfile").html(JSON.parse(artistData.profile).ko + '</br>' + title);

                            let html = '<div class="video_img-box">';
                            $.each(artistYoutubeImages, function (index, el) {
                                $.each(artistImageList, function (s3Index, el) {
                                    //일단은 youtube만 뿌리기로
                                    if (artistImageList[s3Index].tag == 'youtube' + index) {
                                        html += '<a href="' + artistYoutubeImages[index] + '" target="_blank"><div class="dim"><i class="icon-video_play_white"></i></div><img src=" ' + artistImageList[s3Index].cdn_url + ' " alt="작가 작품비디오" /></a>';
                                    }
                                });
                            });
                            html += '</div>';
                            $("#artistMedia").html(html);
                        }
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });


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
                imagesSwiper.slideTo($scope.activeIndex +1, 0);
            });
            $("body").on("click", "#popup_images-wrap .js-closepop, #popup_images-wrap .popup-dim",
                function ($e) {
                    $e.preventDefault();
                    popup_images.close();
                });
            // popup_images.open(false); // or false
            // imagesResizePcMb();


            /* === zoom === panzoom.reset()*/
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
                    }
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
        run();
    }
    })
    ;
</script>

<script>
    function Scope() {
        var scope = angular.element(document.getElementById("container")).scope();
        return scope;
    }

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

    let connect_info = {};

    let w;
    let websocketTimeout;

    let con_try_cnt = 0;
    let end_bid_time = 0;
    let is_end_bid = false;

    let autoBiding = async function (connect_info) {
        let val = $("#reservation_bid").val();
        let datet = new Date();
        let url = '';
        if (window.location.protocol !== "https:") {
            url = "http${bid_domain}/bid";
        } else {
            url = "https${bid_domain}/bid";
        }

        let response = await fetch(url, {
            method: "POST",
            body: JSON.stringify({
                customer: {
                    sale_no: connect_info.sale_no,
                    lot_no: connect_info.lot_no,
                    cust_no: connect_info.cust_no,
                    paddle: 0,
                    user_id: connect_info.user_id,
                    token: connect_info.token,
                    sale_type: 2,
                    bid_type: 22,
                },
                bid_cost: parseInt(val),
            }),
        });
        let vv = response.json();
        return vv;
    }

    let biding = async function (connect_info) {
        console.log(new Date().getTime(), "bidding");
        let val = document.getElementById("bid_new_cost_val").getAttribute("value");
        let url = '';
        if (window.location.protocol !== "https:") {
            url = "http${bid_domain}/bid";
        } else {
            url = "https${bid_domain}/bid";
        }
        let response = await fetch(url, {
            method: "POST",
            body: JSON.stringify({
                customer: {
                    sale_no: connect_info.sale_no,
                    lot_no: connect_info.lot_no,
                    cust_no: connect_info.cust_no,
                    paddle: 0,
                    user_id: connect_info.user_id,
                    token: connect_info.token,
                    sale_type: 2,
                    bid_type: 21,
                },
                bid_cost: parseInt(val),
            }),
        });
        let vv = response.json();
        return vv;
    }

    // 1회응찰
    function bid() {
        biding(connect_info);
    }

    // 자동응찰
    function autoBid() {
        if ($("#reservation_bid").prop("disabled")) {
            let c = confirm("자동응찰 중지는 자동 응찰 취소가 아닙니다\n비딩이 올라간 상태에서 정지됩니다.\n\n자동 응찰을 중지 하시겠습니까??", "자동응찰중지", "취소");
            if (c) {
                autoBiding(connect_info);
            }
            /*var bidding_stop = $("#auto_bid_btn").trpLayerFixedPopup("#bidding_stop-wrap");
            bidding_stop.open(this); // or false
            popup_fixation("#bidding_stop-wrap");

            $("#bidding_stop-wrap .js-closepop, #bidding_stop-wrap .popup-dim, #auto_off_cancel, #auto_off_ok").bind("click", function ($e) {
                $e.preventDefault();
                if ($(this).attr("id") === "auto_off_ok") {

                    bidding_stop.close();
                    $("#bidding_stop-wrap .js-closepop, #bidding_stop-wrap .popup-dim, #auto_off_cancel, #auto_off_ok").unbind("click");
                    return
                }
                $("#bidding_stop-wrap .js-closepop, #bidding_stop-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").unbind("click");
                bidding_stop.close();
            });*/


        } else {
            let  c = confirm("자동응찰 중지하기 전까지의\n응찰 낙찰 내역은 모두 기록되며 유효합니다.\n\n응찰하시겠습니까?", "응찰", "취소");
            if (c) {
                autoBiding(connect_info);
            }
            /*var bidding_go = $("#auto_bid_btn").trpLayerFixedPopup("#bidding_go-wrap");
            bidding_go.open(this); // or false
            popup_fixation("#bidding_go-wrap");

            $("#bidding_go-wrap .js-closepop, #bidding_go-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").bind("click", function ($e) {
                $e.preventDefault();
                if ($(this).attr("id") === "auto_on_ok") {
                    autoBiding(connect_info);
                    bidding_go.close();
                    $("#bidding_go-wrap .js-closepop, #bidding_go-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").unbind("click");
                    return
                }
                $("#bidding_go-wrap .js-closepop, #bidding_go-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").unbind("click");
                bidding_go.close();
            });*/
        }
    }

    function retry(saleNo, lotNo, saleType, userId, custNo) {
        window.clearTimeout(websocketTimeout);
        if (w != null) {
            w = null;
        }
        if (con_try_cnt > 5) {
            con_try_cnt = 0
            return
        }

        if (window.location.protocol !== "https:") {
            w = new WebSocket("ws${bid_domain}/ws?sale_no=" +
                saleNo + "&lot_no=" + lotNo + "&cust_no=" + custNo +
                "&user_id=" + userId + "&paddle=0&sale_type=2&bid_type=21");
        } else {
            w = new WebSocket("wss${bid_domain}/ws?sale_no=" +
                saleNo + "&lot_no=" + lotNo + "&cust_no=" + custNo +
                "&user_id=" + userId + "&paddle=0&sale_type=2&bid_type=21");
        }

        w.onopen = function () {
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
                    websocketTimeout = window.setTimeout(function () {
                        retry(saleNo, lotNo, saleType, userId, custNo);
                    }, 1000);
                }
            }
        }
        w.onmessage = function (evt) {
            proc(evt, saleNo, lotNo, saleType, userId, custNo);
        }
        con_try_cnt = 0;
    }


    function proc(evt, saleNo, lotNo, saleType, userId, custNo) {
        let wt;
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
        const historyAdd = function (bidLst) {
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

        const quoteAdd = function (quoteLst, bidTopItem) {
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
        let url = '';
        let endBidTime;

        if (window.location.protocol !== "https:") {
            url = "http${bid_domain}";
        } else {
            url = "https${bid_domain}";
        }

        if (d.msg_type === PROCTOCOL.INIT) {
            // 현재 접속 세일/랏 정보
            connect_info.token = d.message.token
            connect_info.sale_no = saleNo;
            connect_info.lot_no = lotNo;
            connect_info.user_id = userId;
            connect_info.cust_no = custNo;

        } else if (d.msg_type === PROCTOCOL.BID_INFO) {
            if (d.message.bid != null && d.message.bid.length > 0) {
                $("#cur_cost_layer").css("display", "");
                // 비딩 정보를 받으면 현재가로 변경
                $("#bid_cost_text").text(transferWord("현재가", "ko-KR"));

                // 웹소켓 데이타
                let topBidItem = d.message.bid[d.message.bid.length - 1];
                let costView = topBidItem.bid_cost;
                let openCostView = topBidItem.open_bid_cost;
                let bidCountView = topBidItem.bid_count;
                endBidTime = topBidItem.end_bid_time

                // 현재 가격 관련 내용들
                let startCostLayer = $("#start_cost");
                let bidCntPopLayer = $("#bid_cnt");
                let bidCntLayer = $("#bid_cost_cnt");
                let curCostLayer = $("#cur_cost");
                let qouteUnitLayer = $("#quote_unit");

                // 새로운 비딩 가격 관련 DIV
                let bidNewCostLayer = $("#bid_new_cost");
                let bidNewCostValueLayer = $("#bid_new_cost_val");
                let bidNewCostBtnLayer = $("#bid_new_cost_btn");

                // 계산값
                let curCostValue = (bidCountView === 0) ? openCostView : costView;
                let costAddVat = (bidCountView === 0) ? openCostView * 1.18 : costView * 1.18;

                startCostLayer.text(bidCostFormat(openCostView, "ko-KR"));
                bidCostLayerValue.text(bidCostFormat(curCostValue, "ko-KR"));
                bidCntPopLayer.text(bidCountFormat(bidCountView, "ko-KR"));
                bidCntLayer.text(bidCountFormat(bidCountView, "ko-KR"));
                curCostLayer.text(bidCostFormat(curCostValue, "ko-KR"));
                qouteUnitLayer.text(bidCostFormat(topBidItem.bid_quote, "ko-KR"));

                $("#cost_add_vat").text(costAddVat.toLocaleString('ko-KR'));

                let bidNewCostValue = curCostValue
                if (bidCountView > 0) {
                    bidNewCostValue += topBidItem.bid_quote
                }
                bidNewCostLayer.text(bidCostFormat(bidNewCostValue, "ko-KR"));
                bidNewCostValueLayer.attr("value", bidNewCostValue);
                bidNewCostBtnLayer.text("응찰")

                if (d.message.bid != null && d.message.bid.length > 0) {
                    if (topBidItem.customer.cust_no === custNo) {
                        bidNewCostValueLayer.prop("disabled", true);
                        bidNewCostLayer.text("최고가 응찰 중");
                        bidNewCostBtnLayer.text("");
                    }
                    historyAdd(d.message.bid);
                }
                // 호가 추가
                if (!$("#reservation_bid").prop("disabled")) {
                    quoteAdd(d.message.quotes, bidTopItem);
                }
            }
        } else if (d.msg_type === PROCTOCOL.TIME_SYNC) {
            let bidTick = $("#bid_tick");
            let bidTickMain = $("#end_date_time");
            let ddd = d.message.tick_value;

            if (endBidTime > 0 && endBidTime >= ddd) {
                let endDate = new Date(endBidTime);
                var dateGap = endDate - ddd;
                var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);

                // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                var diffDay = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10) ? 0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString() : Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                var diffHour = (timeGap.getHours() < 10) ? 0 + timeGap.getHours().toString() : timeGap.getHours();       // 시간
                var diffMin = (timeGap.getMinutes() < 10) ? 0 + timeGap.getMinutes().toString() : timeGap.getMinutes();   // 분
                var diffSec = (timeGap.getSeconds() < 10) ? 0 + timeGap.getSeconds().toString() : timeGap.getSeconds();   // 초

                if (diffDay == "00") {
                    diffDay = ""
                } else {
                    diffDay += "일 "
                }
                bidTick.text(diffDay + diffHour + ":" + diffMin + ":" + diffSec);
                bidTickMain.text(diffDay + diffHour + ":" + diffMin + ":" + diffSec);
            } else if (end_bid_time <= 0) {
                bidTick.text("경매 시작 전입니다.");
                bidTickMain.text("경매 시작 전입니다.");
            } else {
                $("#end_bid_true").css("display", "");
                $("div[name='end_bid_false']").css("display", "none");
                $("#bid_lst li:eq(0) .product-day .type-auto").remove();
                $("#bid_lst li:eq(0) .product-day .type-success").remove();
                $("#bid_lst li:eq(0) .product-day").prepend("<em class=\"type-success\">낙찰</em>")
                bidTick.text("경매가 종료 되었습니다.");
                bidTickMain.text("경매가 종료 되었습니다.");
            }

        } else if (d.msg_type === PROCTOCOL.BID_INFO_INIT) {
            let curCostTextLayer = $("#cur_cost_text");
            let curCostTextPopLayer = $("#cur_cost_text2");
            curCostTextLayer.text("현재가");
            curCostTextPopLayer.text("현재가");

            if (d.message.bids != null && d.message.bids.length > 0) {
                // 웹소켓 데이타
                let topBidItem = d.message.bids[0];
                if (topBidItem.winner_state === 2) {
                    document.querySelector("#bid_btn span").text("경매결과 보기");
                }
                let costView = topBidItem.bid_cost;
                let openCostView = topBidItem.open_bid_cost;
                let bidCountView = topBidItem.bid_count;
                endBidTime = topBidItem.end_bid_time

                // 현재 가격 관련 내용들
                let startCostLayer = $("#start_cost");
                let bidCntPopLayer = $("#bid_cnt");
                let bidCntLayer = $("#bid_cost_cnt");
                let curCostLayer = $("#cur_cost");
                let qouteUnitLayer = $("#quote_unit");

                // 새로운 비딩 가격 관련 DIV
                let bidNewCostLayer = $("#bid_new_cost");
                let bidNewCostValueLayer = $("#bid_new_cost_val");
                let bidNewCostBtnLayer = $("#bid_new_cost_btn");

                // 계산값
                let curCostValue = (bidCountView === 0) ? openCostView : costView;
                let costAddVat = (bidCountView === 0) ? openCostView * 1.18 : costView * 1.18;

                $("#cost_add_vat").text(costAddVat.toLocaleString('ko-KR'));

                startCostLayer.text(bidCostFormat(openCostView, "ko-KR"));
                bidCostLayerValue.text(bidCostFormat(curCostValue, "ko-KR"));
                bidCntPopLayer.text(bidCountFormat(bidCountView, "ko-KR"));
                bidCntLayer.text(bidCountFormat(bidCountView, "ko-KR"));
                curCostLayer.text(bidCostFormat(curCostValue, "ko-KR"));
                qouteUnitLayer.text(bidCostFormat(topBidItem.bid_quote, "ko-KR"));

                let bidNewCostValue = curCostValue
                if (bidCountView > 0) {
                    bidNewCostValue += topBidItem.bid_quote
                }
                bidNewCostLayer.text(bidCostFormat(bidNewCostValue, "ko-KR"));
                bidNewCostValueLayer.attr("value", bidNewCostValue);
                bidNewCostBtnLayer.text("응찰")

                // 호가 추가
                if (!$("#reservation_bid").prop("disabled")) {
                    quoteAdd(d.message.quotes, bidTopItem);
                }

                if (d.message.reservation_bid != null) {
                    if (d.message.reservation_bid.customer.sale_no > 0 &&
                        d.message.reservation_bid.customer.lot_no > 0) {
                        $("#reservation_bid").prop("disabled", true);
                        $("#auto_bid_txt").text("자동응찰 중지");
                        $("#reservation_bid").val(d.message.reservation_bid.bid_cost);
                    } else {
                        $("#reservation_bid").prop("disabled", false);
                        $("#auto_bid_txt").text("응찰");
                        $("#reservation_bid option:eq(0)").prop("selected", true);
                    }
                }

                let item = '';
                let bidHistInfo = d.message.bid;
                if (topBidItem.customer.cust_no === custNo) {
                    bidNewCostValueLayer.attr("disabled", true);
                    bidNewCostLayer.text("최고가 응찰 중");
                    bidNewCostBtnLayer.text("");
                }

                if (bidHistInfo.length <= 0) {
                    $("#cur_cost_layer").css("display", "none");
                    $("#cur_cost_text").text("시작가");
                    $("#cur_cost_text2").text("");
                    $("#cur_cost").text("");
                    $("#bid_cost_cnt").text("");
                    $("#bid_cnt").text("");
                } else {
                    historyAdd(bidHistInfo);
                }
                // 낙찰이 완료 되었다면
                if (topBidItem.winner_state === 2) {
                    $("#end_bid_true").css("display", "");
                    $("div[name='end_bid_false']").css("display", "none");
                    let bidTick = $("#bid_tick");
                    let bidTickMain = $("#end_date_time");
                    if (endBidTime <= 0) {
                        bidTick.innerText = "경매 시작 전입니다.";
                        bidTickMain.innerText = "경매 시작 전입니다.";
                    } else if (endBidTime < new Date().getTime()) {
                        $("#end_bid_true").css("display", "");
                        $("div[name='end_bid_false']").css("display", "none");
                        $("#bid_lst li:eq(0) .product-day .type-auto").remove();
                        $("#bid_lst li:eq(0) .product-day .type-success").remove();
                        $("#bid_lst li:eq(0) .product-day").prepend("<em class=\"type-success\">낙찰</em>")
                        bidTick.innerText = "경매가 종료 되었습니다.";
                        bidTickMain.innerText = "경매가 종료 되었습니다.";
                    }
                    is_end_bid = true;
                    w.close();
                }
            }
        } else if (d.msg_type === PROCTOCOL.END_TIME_SYNC) {
            if (d.message.value != null) {
                end_bid_time = d.message.value;
            }
        } else if (d.msg_type === PROCTOCOL.WINNER) {
            if (d.message != null) {
                let bidTick = $("#bid_tick");
                let bidTickMain = $("#end_date_time");
                bidTick.text("경매가 종료 되었습니다.");
                bidTickMain.text("경매가 종료 되었습니다.");

                $("#end_bid_true").css("display", "");
                $("div[name='end_bid_false']").css("display", "none");
                $("#bid_lst li:eq(0) .product-day .type-auto").remove();
                $("#bid_lst li:eq(0) .product-day .type-success").remove();
                $("#bid_lst li:eq(0) .product-day").prepend("<em class=\"type-success\">낙찰</em>")

                $("#cur_cost_text").text("낙찰가");
                $("#cur_cost_text2").text("낙찰가");

                is_end_bid = true;
                w.close();
            }
        } else if (d.msg_type === PROCTOCOL.AUTO_BID_SYNC) {
            if (d.message != null) {
                if (d.message.reservation_bid != null) {
                    if (d.message.reservation_bid.customer.sale_no > 0 &&
                        d.message.reservation_bid.customer.lot_no > 0) {
                        $("#reservation_bid").val(d.message.reservation_bid.bid_cost);
                        $("#reservation_bid").prop("disabled", true);
                        $("#auto_bid_txt").text("자동응찰 중지");
                    } else {
                        $("#reservation_bid").prop("disabled", false);
                        $("#auto_bid_txt").text("응찰");
                        quoteAdd(d.message.quotes.quotes, d.message.bid)
                        $("#reservation_bid option:eq(0)").prop("selected", true);
                    }
               }
            }
        } else if (d.msg_type === PROCTOCOL.LOT_REFRESH) {
            if (d.message !== undefined && d.message != null) {
                if (d.message.data !== undefined && d.message.data != null) {
                    for (let j = 0; j < d.message.data.length; j++) {
                        if (d.message.data[j].SALE_NO === saleNo && d.message.data[j].LOT_NO === lotNo) {
                            $("#start_cost").text("KRW " + d.message.data[j].START_PRICE.toLocaleString('ko-KR'));
                            endBidTime = d.message.data[j].END_BID_TIME;
                        }
                    }
                }
            }
        }
    }

    function startBidProcess(saleNo, lotNo, saleType, userId, custNo) {
        /*this.saleNo = saleNo;
        this.lotNo = lotNo;
        this.saleType = saleType;
        this.userId = userId;*/
        retry(saleNo, lotNo, saleType, userId, custNo);
    }
</script>

<script>
    <!-- [0712]모바일 LOT 버튼 클릭시 팝업 변경(전체 LOT 보기 팝업) -->
    $(".js-lotbox-btn").on("click", function($e) {
        $(".allview_fixed-wrap.lot .js-fixed_total").addClass("on")
        $(".allview_fixed-wrap.lot").addClass("active");
    });
    $(".allview_fixed-wrap.lot .js-fixed_total").on("click", function() {
        $(this).removeClass("on");
        $(".allview_fixed-wrap.lot").removeClass("active");
    })
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
