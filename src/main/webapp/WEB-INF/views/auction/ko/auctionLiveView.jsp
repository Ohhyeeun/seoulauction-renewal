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
<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass type-details_view">
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <%--        <link rel="stylesheet" href="/css/plugin/csslibrary.css">--%>
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
                                                    <a href="#" onclick="window.history.back()" title="뒤로가기">
                                                        <i class="icon-page_back"></i>
                                                    </a>
                                                    <span ng-bind="saleInfo.SALE_TITLE_KO"></span>
                                                </div>
                                            </div>
                                            <div class="col_item">
                                                <!-- [0516]select 변경 -->
                                                <div class="select-box">
                                                    <div class="trp-dropdown-area h42-lines">
                                                        <button class="js-dropdown-btn">
                                                            <span>LOT {{lotInfo.LOT_NO}}</span><i
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
                                                                <!--  -->
                                                                <div ng-repeat="item in lotImages"
                                                                     ng-class="{'swiper-slide':$index>-1,'swiper-slide-active':$index == 0}"
                                                                     data-index="$index">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
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
                                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"
                                                                                 alt=""/>
                                                                        </div>
                                                                    </figure>
                                                                    <div class="line"></div>
                                                                </div>
                                                            </div>

                                                            <div class="slide"
                                                                 data-index="4"> <%-- 이미지 없을 시 클래스 slide만 남겨놔야 함. --%>
                                                                <figure class="img-ratio">
                                                                    <div class="img-align">
                                                                        <img src="/images/pc/auction/view_thumbnail_bg.jpg"
                                                                             alt=""/>
                                                                    </div>
                                                                </figure>
                                                                <div class="line"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="view_scale-area" ng-if="lotInfo.VIEW_SCALE_YN == 'Y'">
                                                <a class="js-popup_image_viewer" href="#">
                                                    <i class="icon-view_scale"></i><span>VIEW SCALE</span></a>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col_item">
                                        <article class="product_detail-article js-product_detail-article">
                                            <div class="index-area">
                                                <div class="index-box"><span ng-bind="lotInfo.LOT_NO">10</span></div>
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
                                                    <strong ng-bind="lotInfo.ARTIST_NAME_KO_TXT"></strong>
                                                    <span>b.{{lotInfo.BORN_YEAR}}</span>
                                                </div>
                                                <div class="desc">
                                                    <span class="text-over span_block"
                                                          ng-bind="lotInfo.TITLE_KO_TXT"></span>
                                                </div>
                                            </div>
                                            <div class="price-area">
                                                <dl class="price-list">
                                                    <dt>추정가</dt>
                                                    <dd ng-bind="estimatedRange"></dd>
                                                </dl>
                                                <%--                                                <dl class="price-list">--%>
                                                <%--                                                    <dt>시작가</dt>--%>
                                                <%--                                                    <dd id="start_cost"><!--WEB SOCKET--></dd>--%>
                                                <%--                                                </dl>--%>
                                                <%--                                                <dl class="price-list">--%>
                                                <%--                                                    <dt>현재가</dt>--%>
                                                <%--                                                    <dd><strong id="cur_cost"><!--WEB SOCKET--></strong><em--%>
                                                <%--                                                            id="bid_cnt">(응찰 <!--WEB SOCKET-->)</em></dd>--%>
                                                <%--                                                </dl>--%>
                                                <dl class="price-list">
                                                    <dt>마감일</dt>
                                                    <dd><b id="end_date_time" ng-bind="lotInfo.LOT_EXPIRE_DATE | date_format"><!--WEB SOCKET--></b></dd>
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
                                                        <%--                                                        <div class="op_hover">--%>
                                                        <%--                                                            <a class="btn btn_black btn_2 btn_lg js-popup_alert1"--%>
                                                        <%--                                                               role="button">--%>
                                                        <%--                                                                <em>현재가 기준</em>--%>
                                                        <%--                                                                <strong>1,584,000</strong>--%>
                                                        <%--                                                            </a>--%>
                                                        <%--                                                        </div>--%>
                                                    </div>
                                                    <div class="btn_item only-mb">
                                                        <a class="btn btn_default btn_lg js-delivery_price js-popup_alert1"
                                                           href="#"
                                                           role="button"><span>낙찰수수료</span></a>
                                                    </div>
                                                    <div class="btn_item">
                                                        <%--                                                        <a class="btn btn_default btn_lg" href="#" role="button"><span>배송비안내</span></a> --%>
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
                                                {{lotInfo.MATE_NM_EN}} <br/>
                                                <span ng-repeat="size in lotInfo.LOT_SIZE_JSON">
                                                        <span>{{::size.SIZE1}}X{{::size.SIZE2}}X{{::size.SIZE3}}cm</span>
                                                    </span><br/>
                                                <span bind-html-compile="lotInfo.SIGN_INFO_JSON.ko"></span>
                                            </div>
                                        </div>
                                        <div class="info-box">
                                            <div class="title">Condition Report</div>
                                            <div class="desc" ng-bind="lotInfo.COND_RPT_JSON.ko">
                                            </div>
                                        </div>

                                        <div class="info-box">
                                            <div class="title">작가정보</div>
                                            <div class="desc" id="artistName">
                                            </div>
                                            <div class="desc" id="artistProfile">
                                            </div>
                                            <div class="desc" id="artistMedia">
                                            </div>
                                        </div>

                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">
                                <article class="product_recent_work-article">
                                    <div class="article-header">
                                        <div class="title"><span>이 경매의 최근 본 작품</span></div>
                                    </div>
                                    <div class="article-body">
                                        <div class="scroll-type">
                                            <div class="product-area">
                                                <ul id="recently_views" class="product-list">
                                                    <li class="" ng-repeat="item in recentlyViews">
                                                        <div class="li-inner">
                                                            <a href="#">
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
                                                                                <span class="num">{{item.LOT_NO}}</span>
                                                                                <a ng-class="{'heart':item.FAVORITE_YN,'js-work_heart':item.FAVORITE_YN,'on':item.FAVORITE_YN==='Y'}"
                                                                                   ng-click="favorite2(item.SALE_NO, item.LOT_NO, $index);"><i
                                                                                        class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <a href="#">
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
                                                                                <div class="name"><span>LOT 5</span>
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
                            <button>
                                <div class="txt">전체 LOT</div>
                                <i class="form-select_arrow_view-2x"></i>
                            </button>
                        </div>
                        <div class="btn-box">
                            <button ng-click="moveToBidding(lotInfo)">응찰하기</button>
                        </div>
                    </div>
                </article>
                <input type="hidden" id="sale_no" value="{{sale_no}}"/>
                <input type="hidden" id="lot_no" value="{{lot_no}}"/>
                <input type="hidden" id="lot_expr_date" value="{{lotInfo.LOT_EXPIRE_DATE}}"/>
            </div>
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
<!--  응찰하기(온라인)  -->
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
                                                    <img id="img_url" alt="LOT 02">
                                                </div>
                                            </div>
                                        </div>
                                        <figcaption class="view-typo">
                                            <div class="typo-header">
                                                <div class="title"><span id="artist_nm"></span><em id="born_year"></em>
                                                </div>
                                                <div class="desc"><span id="bidding_title">Air (From The Series The Elements)</span>
                                                </div>
                                            </div>
                                            <div class="typo-body">
                                                <span>spray paint on canvas</span>
                                                <ul>
                                                    <li>80.9 X73.4cm</li>
                                                    <li>2021</li>
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
                                            <div class="price-name"><span>현재가</span></div>
                                            <div class="price-amount"><em id="bid_cost_val"></em> <span
                                                    id="bid_cost_cnt"></span></div>
                                        </div>
                                        <div class="list-body scroll-type">
                                            <ul id="bid_lst" class="product-list">
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="topbtn-area">
                                        <div class="btn_set">
                                            <div class="btn_item"><a class="btn btn_default btn_lg" href="#"
                                                                     role="button"><span>1회 응찰</span></a></div>
                                            <div class="btn_item"><a class="btn btn_gray btn_lg" href="#" role="button"><span>자동응찰</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="caution-area">
                                        <ul class="mark_char-list">
                                            <li class="accent"><span>응찰하기 버튼을 누르시면 취소가 불가능합니다.</span></li>
                                            <li class=""><span>동시 응찰자 경우, 서버시각 기준 우선순위가 부여됩니다.</span></li>
                                        </ul>
                                    </div>
                                    <div class="bottombtn-area">
                                        <div class="btn_set active">
                                            <div class="btn_item"><a class="btn btn_point btn_lg typo-pc_mb-line"
                                                                     id="bid_new_cost_val" href="javascript:bid();"
                                                                     role="button" value=""><span
                                                    id="bid_new_cost"></span> <span>응찰하기</span></a></div>
                                        </div>
                                        <div class="btn_set type-pc_mb-column">
                                            <div class="btn_item">
                                                <div class="select-box ">
                                                    <!-- disabled 옵션 -->
                                                    <select class="select2Basic56_line" id="reservation_bid">
                                                        <option value="1800000">KRW 1,800,000</option>
                                                        <option value="1900000">KRW 1,900,000</option>
                                                        <option value="2000000">KRW 2,000,000</option>
                                                        <option value="2100000">KRW 2,100,000</option>
                                                        <option value="2200000">KRW 2,200,000</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="btn_item"><a class="btn btn_point btn_lg"
                                                                     href="javascript:autoBid();"
                                                                     role="button"><span>응찰하기</span></a></div>
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

<!-- 이미지 뷰어 -->
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
                            <div class="view_paging-area">
                                <button class="page_prev"><i class="icon-view_paging_left"></i></button>
                                <span id="view_lot_no"></span>
                                <button class="page_next"><i class="icon-view_paging_right"></i></button>
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
<%--<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="/js/plugin/html5shiv.js"></script> <![endif]-->
--%>
<%--<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
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

<!-- [0628]모바일 LOT 버튼 클릭시 액션 추가 -->
<script>
    $(".js-lotbox-btn").click(function () {
        $(this).parent(".btn_lot-box").toggleClass("on")
    })
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
    function Scope() {
        var scope = angular.element(document.getElementById("container")).scope();
        return scope;
    }

    app.value('locale', 'ko');
    app.value('is_login', true);

    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    // 현재가 처리
    app.filter('date_format', function(){
        return function(val) {
            if (val === undefined) {
                return '';
            }
            return (val === '')?'':new Date(val).format('MM/dd(E) 00:00');
        };
    })

    app.controller('ctl', function ($scope, consts, common, is_login, locale) {

        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.sale_no = "${saleNo}";
        $scope.lot_no = "${lotNo}";
        $scope.cust_no =  ${member.userNo};


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

        const getSaleImages = (saleNo) => {
            try {
                return axios.get('/api/auction/sale_images/${saleNo}');
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

        $scope.goLot = function (saleNo, lotNo) {
            window.location.href = '/auction/live/view/' + saleNo + '/' + lotNo;
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
                    cust_no: 1
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
                    cust_no: 1
                });
            } catch (error) {
                console.error(error);
            }
        }

        $scope.moveToBidding = function (item) {

            console.log(item);

            //로그인 했는지 여부.
            if (!checkLogin()) {
                return;
            }

            //정회원 여부.
            let isRegular = ${isRegular};
            if (!isRegular) {
                alert('정회원만 서면/전화 응찰 신청이 가능합니다.')
                return;
            }

            //필수값 있는지 여부. ( 생년월일 , 성별 )
            let isCustRequired = ${isCustRequired};
            if (!isCustRequired) {
                if (confirm('서면/전화 응찰 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')) {
                    location.href = '/mypage/custModify';
                }
                return;
            }

            //전부 다 조건을 만족햇을경우.
            location.href = '/auction/live/sale/' + item.SALE_NO + '/lot/' + item.LOT_NO + '/biding';
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

        // 호출 부
        $scope.load = function () {
            let run = async function () {
                let [r1, r2, r3, r4, , r6] = await Promise.all([getSaleInfo($scope.sale_no),
                    getLotInfo($scope.sale_no, $scope.lot_no),
                    getLotImages($scope.sale_no, $scope.lot_no),
                    getSaleImages($scope.sale_no, $scope.lot_no),
                    insertRecentlyView($scope.sale_no, $scope.lot_no),
                    getRecentlyView($scope.sale_no, $scope.lot_no)]);

                $scope.saleInfo = r1.data.data;
                $scope.lotInfo = r2.data.data;
                $scope.lotImages = r3.data.data;
                $scope.saleImages = r4.data.data;

                console.log($scope.lotInfo);

                $scope.estimatedRange = $scope.lotInfo.EXPE_PRICE_INQ_YN === 'Y' ? '별도 문의' : $scope.lotInfo.BASE_EXPE_FROM_PRICE + ' ~ ' + $scope.lotInfo.BASE_EXPE_TO_PRICE;

                $scope.recentlyViews = r6.data.data;

                //artist 번호
                $scope.artistNo = $scope.lotInfo.ARTIST_NO;

                $scope.activeIndex = 0;

                // popup setting
                let imgUrl = $scope.lotImages[0].IMAGE_URL +
                    $scope.lotImages[0].FILE_PATH + "/" + $scope.lotImages[0].FILE_NAME;

                $("#bidding_title").html($scope.lotInfo.TITLE_KO_TXT);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.lotInfo.ARTIST_NAME_KO_TXT);
                $("#born_year").html("(" + $scope.lotInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.lotInfo.LOT_NO);
                // 시작
                startBidProcess($scope.lotInfo.SALE_NO, $scope.lotInfo.LOT_NO, 2,
                    '${member.loginId}', ${member.userNo});
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
                    on: {
                        slideChange: function () {
                            $scope.activeIndex = view_visual.activeIndex;
                            view_thumnailActive(view_visual.activeIndex);
                        }
                    }
                });

                $(".js-view_thumnail .slide").on("click", function () {
                    var _index = $(this).index();
                    view_thumnailActive(_index);
                    view_visualActive(_index, view_visual);
                });

                $(window).on("resize", function () {
                    view_visual.update();
                });

                let sale_images = $scope.saleImages;
                let lot_images = $scope.lotImages;

                $.each(sale_images, function (index, el) {
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

                    //if(size1 > 160) {
                    swiper_slide_item = `<div class="swiper-slide">
                                            <div class="img-area">
                                                <div class="img-box">
                                                    <div class="size_x"><span>` + size1 + unitCd + `</span></div>
                                                    <div class="size_y"><span>` + size2 + unitCd + `</span></div>
                                                    <div class="images">
                                                        <img class="imageViewer" src="` + img_url + `" alt="" size1="` + size1 + `" size2="` + size2 + `" lot_no="` + lot_no + `" />
                                                    </div>
                                                </div>
                                            </div>
                        </div>`
                    $("#swiper-wrapper").append(swiper_slide_item);
                    //}
                });

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

                var popup_image_viewer = $(".js-popup_image_viewer").trpLayerFixedPopup("#popup_image_viewer-wrap");
                $(popup_image_viewer.getBtn).on("click", function ($e) {
                    $e.preventDefault();
                    popup_image_viewer.open(this); // or false
                    imagesResizePcMb();
                    imageViewer.update();
                    imageViewer.slideTo(parseInt($("#view_lot_no").attr("sel-data-index")) -1, 0);
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

                //작가 정보 admin에서 가져오도록 변경
                axios.get('/api/auction/artist_info/' + $scope.artistNo)
                    .then(function (response) {
                        const data = response.data;
                        let success = data.success;

                        if (success) {
                            let artistData = data.data;
                            if (!artistData) {
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

                                let html = '<div class="vide_img-box">';
                                $.each(artistYoutubeImages, function (index, el) {
                                    $.each(artistImageList, function (s3Index, el) {
                                        //일단은 youtube만 뿌리기로
                                        if (artistImageList[s3Index].tag == 'youtube' + index) {
                                            html += '<a href="' + artistYoutubeImages[index] + '"><img src=" ' + artistImageList[s3Index].cdn_url + ' " alt="" /></a>';
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
                console.log("스와이퍼 set");
                var imagesSwiper = new Swiper('.js-imagesSwiper .gallery_center', {
                    loop: true,
                    simulateTouch: false,
                    pagination: ".js-imagesSwiper_pagination",
                    paginationClickable: true,
                    breakpoints: {
                        1023: {
                            effect: "slide",
                            simulateTouch: true,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    onSlideChangeStart: function (swiper) { // 움직임이 시작하면 실행
                        imagesResizePcMb();
                        if ($("body").hasClass("is_pc")) {
                            panzoom.reset(); // zoom reset
                        }
                    },
                    onSlideChangeEnd: function (swiper) { // 움직임이 끝나면 실행
                        imagesResizePcMb();
                        thumbnailActive(swiper.realIndex);
                        console.log(">>> ", swiper.realIndex)
                    }
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
    });
</script>

<script>
    function Scope() {
        var scope = angular.element(document.getElementById("container")).scope();
        return scope;
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
            url = new WebSocket("https://dev-bid.seoulauction.xyz/bid");
        } else {
            url = new WebSocket("https://dev-bid.seoulauction.xyz/bid");
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
            url = new WebSocket("https://dev-bid.seoulauction.xyz/bid");
        } else {
            url = new WebSocket("https://dev-bid.seoulauction.xyz/bid");
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
        autoBiding(connect_info);
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
            w = new WebSocket("ws://dev-bid.seoulauction.xyz/ws");
        } else {
            w = new WebSocket("wss://dev-bid.seoulauction.xyz/ws");
        }
        w.onopen = function () {
            console.log("open");
        }
        w.onerror = function () {
            w.close();
            console.log('error');
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
        const packet_enum = {
            init: 1,
            bid_info: 2,
            time_sync: 3,
            bid_info_init: 4,
            end_time_sync: 5,
            winner: 6,
        }
        let d = JSON.parse(evt.data);

        if (d.msg_type === packet_enum.init) {

            // 현재 접속 세일/랏 정보
            connect_info.token = d.message.token
            connect_info.sale_no = saleNo;
            connect_info.lot_no = lotNo;
            connect_info.user_id = userId;
            connect_info.cust_no = custNo;

            let init_func_manual = async function (req) {
                let response = await fetch('http://ec2-3-34-229-127.ap-northeast-2.compute.amazonaws.com:8002/init', {
                    method: "POST",
                    body: JSON.stringify({
                        token: req.message.token,
                        sale_no: saleNo,
                        lot_no: lotNo,
                        sale_type: saleType,
                        user_id: userId,
                    }),
                });
                return response;
            }
            init_func_manual(d);

        } else if (d.msg_type === packet_enum.bid_info) {

            if (d.message.bid != null && d.message.bid.length > 0) {
                // popup layer Values
                let bid = document.getElementById("bid_cost_val");
                let bid_cnt = document.getElementById("bid_cost_cnt");
                let quote_unit = document.getElementById("quote_unit");
                let bid_new_cost = document.getElementById("bid_new_cost");

                let len = d.message.bid.length;

                // View page values
                let start_cost = document.getElementById("start_cost");
                let bid_cnt2 = document.getElementById("bid_cnt");
                let cur_cost = document.getElementById("cur_cost");
                //let end_date_time2 = document.getElementById("end_date_time");

                let curCostValue = (d.message.bid[len - 1].bid_cost === 0) ?
                    "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR') :
                    "KRW " + d.message.bid[len - 1].bid_cost.toLocaleString('ko-KR');

                start_cost.innerText = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                bid_cnt2.innerText = "(응찰" + d.message.bid[len - 1].bid_count + ")"
                cur_cost.innerText = curCostValue;
                //end_date_time2.innerText = new Date(d.message.bid[len - 1].end_bid_time).format('MM/dd(E) hh:mm');

                bid.innerText = curCostValue
                bid_cnt.innerText = "(응찰" + d.message.bid[len - 1].bid_count + ")"

                end_bid_time = d.message.bid[len - 1].end_bid_time;
                quote_unit.innerText = "KRW " + d.message.bid[len - 1].bid_quote.toLocaleString('ko-KR');

                bid_new_cost.innerText = "KRW " + (((d.message.bid[len - 1].bid_cost === 0) ?
                    d.message.bid[len - 1].open_bid_cost :
                    d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote).toLocaleString('ko-KR');

                document.getElementById("bid_new_cost_val").setAttribute("value", ((d.message.bid[len - 1].bid_cost === 0) ?
                    d.message.bid[len - 1].open_bid_cost :
                    d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote);

                if (d.message.bid != null && d.message.bid.length > 0) {
                    let bid_hist_info = d.message.bid;
                    if (bid_hist_info != null && bid_hist_info.length > 0) {
                        let bid_lst = document.getElementById("bid_lst");
                        for (let i = 0; i < bid_hist_info.length; i++) {

                            let ddd = new Date(bid_hist_info[i].bid_time);
                            let li = document.createElement("li");

                            let user_id_ly = document.createElement("div");
                            if (bid_hist_info.user_id === "KYUNGHOON") {
                                user_id_ly.setAttribute("class", "product-user on_green");
                            } else {
                                user_id_ly.setAttribute("class", "product-user");
                            }


                            let user_id_span = document.createElement("span");
                            user_id_span.innerText = bid_hist_info[i].customer.user_id;

                            user_id_ly.appendChild(user_id_span);

                            let cost_ly = document.createElement("div");
                            cost_ly.setAttribute("class", "product-price");

                            let cost_ly_span = document.createElement("span");
                            cost_ly_span.innerText = bid_hist_info[i].bid_cost.toLocaleString('ko-KR');

                            cost_ly.appendChild(cost_ly_span);

                            let dt_ly = document.createElement("div");
                            dt_ly.setAttribute("class", "product-day");

                            // date
                            let dt_ly_span2 = document.createElement("span");
                            dt_ly_span2.innerText = ddd.format("yyyy-MM-dd");

                            // time
                            let dt_ly_span3 = document.createElement("span");
                            dt_ly_span3.innerText = ddd.format("hh:mm:ss");

                            // dt_ly.appendChild(dt_ly_span1);
                            dt_ly.appendChild(dt_ly_span2);
                            dt_ly.appendChild(dt_ly_span3);

                            li.appendChild(user_id_ly);
                            li.appendChild(cost_ly);
                            li.appendChild(dt_ly);

                            bid_lst.insertBefore(li, bid_lst.firstChild);
                        }
                    }
                }
            }

        } else if (d.msg_type === packet_enum.time_sync) {
            let expr_date = new Date($("#lot_expr_date").val()).format('yyyy-MM-dd 00:00:00');
            if (expr_date >= (new Date(d.message.tick_value).format('yyyy-MM-dd HH:mm:ss'))) {
                $("#show_btn").css("display", "");
            }

            /*
                        if (end_bid_time > 0 && end_bid_time >= d.message.tick_value) {

                            let endDate = new Date(end_bid_time);
                            var dateGap = endDate - ddd;
                            var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);

                            // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                            var diffDay = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                            var diffHour = timeGap.getHours();       // 시간
                            var diffMin = timeGap.getMinutes();      // 분
                            var diffSec = timeGap.getSeconds();      // 초

                            bid_tick.innerText = diffDay + "일 " + diffHour + "시간 " + diffMin + "분 " + diffSec + "초 남았습니다.";
                            bid_tick_main.innerText = diffDay + "일 " + diffHour + "시간 " + diffMin + "분 " + diffSec + "초 남았습니다.";
                        } else if (end_bid_time <= 0) {
                            bid_tick.innerText = "경매 시작 전입니다.";
                            bid_tick_main.innerText = "경매 시작 전입니다.";
                        } else {
                            bid_tick.innerText = "경매가 종료 되었습니다.";
                            bid_tick_main.innerText = "경매가 종료 되었습니다.";
                        }
            */
        } else if (d.msg_type == packet_enum.bid_info_init) {
            if (d.message.bids != null && d.message.bids.length > 0) {
                let bid_info = d.message.bids[0];

                // element
                let bid = document.getElementById("bid_cost_val");
                let bid_cnt = document.getElementById("bid_cost_cnt");
                let quote_unit = document.getElementById("quote_unit");
                let bid_new_cost = document.getElementById("bid_new_cost");


                //let start_cost = document.getElementById("start_cost");
                //let bid_cnt2 = document.getElementById("bid_cnt");
                //let cur_cost = document.getElementById("cur_cost");
                //let end_date_time2 = document.getElementById("end_date_time");

                let curCostValue = (bid_info.bid_cost === 0) ?
                    "KRW " + bid_info.open_bid_cost.toLocaleString('ko-KR') :
                    "KRW " + bid_info.bid_cost.toLocaleString('ko-KR');

                //start_cost.innerText = "KRW " + bid_info.open_bid_cost.toLocaleString('ko-KR');
                //bid_cnt2.innerText = "(응찰" + bid_info.bid_count + ")"
                //cur_cost.innerText = curCostValue;
                //end_date_time2.innerText = new Date(bid_info.end_bid_time).format('MM/dd(E) hh:mm');

                bid.innerText = curCostValue;
                bid_cnt.innerText = "(응찰" + bid_info.bid_count + ")"
                end_bid_time = bid_info.end_bid_time;


                quote_unit.innerText = "KRW " + bid_info.bid_quote.toLocaleString('ko-KR');

                bid_new_cost.innerText = "KRW " + (((bid_info.bid_cost === 0) ?
                    bid_info.open_bid_cost :
                    bid_info.bid_cost) + bid_info.bid_quote).toLocaleString('ko-KR');

                document.getElementById("bid_new_cost_val").setAttribute("value", ((bid_info.bid_cost === 0) ?
                    bid_info.open_bid_cost :
                    bid_info.bid_cost) + bid_info.bid_quote);

                let item = '';

                if (d.message.bids_hist != null && d.message.bids_hist.length > 0) {
                    let li = document.createElement("bid_lst");
                    let bid_hist_info = d.message.bids_hist;
                    if (bid_hist_info != null && bid_hist_info.length > 0) {
                        for (let i = 0; i < bid_hist_info.length; i++) {
                            if (bid_hist_info[i].value != null) {
                                for (let j = 0; j < bid_hist_info[i].value.length; j++) {
                                    let ddd = new Date(bid_hist_info[i].value[j].bid_time);
                                    let li = document.createElement("li");

                                    let user_id_ly = document.createElement("div");
                                    if (bid_hist_info[i].value[j].user_id === "KYUNGHOON") {
                                        user_id_ly.setAttribute("class", "product-user on_green");
                                    } else {
                                        user_id_ly.setAttribute("class", "product-user");
                                    }

                                    let user_id_span = document.createElement("span");
                                    user_id_span.innerText = bid_hist_info[i].value[j].customer.user_id;

                                    user_id_ly.appendChild(user_id_span);

                                    let cost_ly = document.createElement("div");
                                    cost_ly.setAttribute("class", "product-price");

                                    let cost_ly_span = document.createElement("span");
                                    cost_ly_span.innerText = bid_hist_info[i].value[j].bid_cost.toLocaleString('ko-KR');

                                    cost_ly.appendChild(cost_ly_span);

                                    let dt_ly = document.createElement("div");
                                    dt_ly.setAttribute("class", "product-day");

                                    let dt_ly_span1 = document.createElement("em");
                                    if (bid_info.winner_state === 2 && bid_hist_info[i].value.length - 1 == j) {
                                        // type
                                        dt_ly_span1.setAttribute("class", "type-success");
                                        dt_ly_span1.innerText = "낙찰";
                                    }

                                    // date
                                    let dt_ly_span2 = document.createElement("span");
                                    dt_ly_span2.innerText = ddd.format("yyyy-MM-dd");

                                    // time
                                    let dt_ly_span3 = document.createElement("span");
                                    dt_ly_span3.innerText = ddd.format("hh:mm:ss");

                                    if (bid_info.winner_state === 2) {
                                        dt_ly.appendChild(dt_ly_span1);
                                    }
                                    dt_ly.appendChild(dt_ly_span2);
                                    dt_ly.appendChild(dt_ly_span3);

                                    li.appendChild(user_id_ly);
                                    li.appendChild(cost_ly);
                                    li.appendChild(dt_ly);

                                    bid_lst.insertBefore(li, bid_lst.firstChild);
                                }
                            }
                        }
                    }
                }
                // 낙찰이 완료 되었다면
                if (bid_info.winner_state === 2) {
                    let bid_tick = document.getElementById("bid_tick");
                    let bid_tick_main = document.getElementById("end_date_time");
                    if (end_bid_time <= 0) {
                        bid_tick.innerText = "경매 시작 전입니다.";
                        bid_tick_main.innerText = "경매 시작 전입니다.";
                    } else if (end_bid_time < new Date().getTime()) {
                        bid_tick.innerText = "경매가 종료 되었습니다.";
                        bid_tick_main.innerText = "경매가 종료 되었습니다.";
                    }

                    let bid_lst = document.getElementById("bid_lst");
                    let dt_ly_span1 = document.createElement("em");
                    dt_ly_span1.setAttribute("class", "type-success");
                    dt_ly_span1.innerText = "낙찰";
                    bid_lst.firstChild.childNodes[2].insertBefore(dt_ly_span1, bid_lst.firstChild.childNodes[2].firstChild);

                    is_end_bid = true;
                    w.close();
                }
            }
        } else if (d.msg_type == packet_enum.end_time_sync) {
            if (d.message.value != null) {
                end_bid_time = d.message.value;
            }
        } else if (d.msg_type == packet_enum.winner) {
            if (d.message != null) {
                let bid_lst = document.getElementById("bid_lst");

                if (d.message.customer.user_id == bid_lst.firstChild.firstChild.innerText) {
                    let bid_tick = document.getElementById("bid_tick");
                    let bid_tick_main = document.getElementById("end_date_time");
                    bid_tick.innerText = "경매가 종료 되었습니다.";
                    bid_tick_main.innerText = "경매가 종료 되었습니다.";

                    let dt_ly_span1 = document.createElement("em");
                    dt_ly_span1.setAttribute("class", "type-success");
                    dt_ly_span1.innerText = "낙찰";


                    bid_lst.firstChild.childNodes[2].insertBefore(dt_ly_span1, bid_lst.firstChild.childNodes[2].firstChild);
                }

                is_end_bid = true;
                w.close();
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
</body>
</html>