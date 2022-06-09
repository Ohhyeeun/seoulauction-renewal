<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass type-width_list">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <link rel="stylesheet" href="/css/plugin/csslibrary.css">
        <!-- //header -->
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();">
            <div id="contents" class="contents">
                <!-- page title (ing, view) 경매정보   -->
                <section class="page_title-section list_page-section">
                    <div class="section-inner full_size">
                        <div class="padding-inner">
                            <article class="auction_head_info-article">
                                <div class="center-box ing">
                                    <h2 class="page_title"><span class="th1"
                                                                 ng_bind="saleInfo[0].SALE_TITLE_JSON.ko"></span>
                                    </h2>
                                    <ul class="event_day-list">
                                        <li><span class="colorB2">프리뷰</span><span class=""> : {{saleInfo[0].FROM_DT}} - {{saleInfo[0].TO_DT}}</span>
                                        </li>
                                        <li><span class="colorB2">경매일</span><span
                                                class=""> : {{saleInfo[0].TO_DT}}</span></li>
                                    </ul>
                                    <div class="btn_set">
                                        <a class="btn btn_white " href="#" role="button"><span>안내사항</span></a>
                                    </div>
                                </div>
                            </article>
                            <article class="proceeding-article">
                                <a href="#" title="진행중 Lot 10|김선우" ng-click="goLot(sale_no, CUR_LOT_NO);">
                                    <div class="article-inner">
                                        <div class="column ing">
                                            <strong class="note_msg">진행중 Lot</strong>
                                            <ul class="ac-list">
                                                <li><span id="cur_lot_no" class="count" ng-bind="CUR_LOT_NO"></span></li>
                                                <li><span id="cur_artist_name" class="name"  ng-bind="CUR_LOT_ARTIST_NAME"></span></li>
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
                                            <div class="select-box">
                                                <div class="trp-dropdown-area h42-line">
                                                    <button class="js-dropdown-btn">
                                                        <em>{{saleInfoAll.length}}</em><span>LOT</span><i
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
                                            <!-- 작가/작품서치  -->
                                            <div class="search-box">
                                                <input type="search" placeholder="작가/작품명" id="search_value"
                                                       ng-model="searchValue"
                                                       ng-keyup="searchArtist(event=$event)" class="h42">
                                                <i class="form-search_md" ng-click="searchArtist2()"></i>
                                            </div>
                                            <!-- 작가/작품서치 -->
                                        </div>
                                        <div class="col_item mb-col2">
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
                <section class="basis-section last-section auction_list-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list">
                            <div class="panel-body">
                                <ul class="product-list">
                                    <!-- 작품 리스트 -->
                                    <li class="" ng-repeat="item in saleInfo">
                                        <div class="li-inner">
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
                                                            <button class="heart js-work_heart"><i ng-class="item.FAVORITE_YN==='Y' ? 'icon-heart_off' : 'icon-heart_on'"
                                                                                                   ng-click="favorite(item);"
                                                            ></i></button>
                                                        </div>
                                                        <div class="info-box">
                                                            <div class="title"><span>{{item.ARTIST_NAME_JSON.ko}}</span><span
                                                                    class="sub">({{item.BORN_YEAR}})</span>
                                                            </div>
                                                            <div class="desc">
                                                                <span class="text-over span_block">{{item.LOT_TITLE_JSON.ko}}</span>
                                                            </div>
                                                            <div class="standard">
                                                                <span class="text-over span_block">{{item.CD_NM}}</span>
                                                                <div class="size_year">
                                                                    <span>{{item.SIZE1}} X {{item.SIZE2}} X {{item.SIZE3}}</span>
                                                                    <span>{{item.MAKE_YEAR_JSON.ko}}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="price-box">
                                                            <dl class="price-list">
                                                                <dt>추정가</dt>
                                                                <dd>KRW {{item.EXPE_PRICE_FROM_JSON.KRW}}</dd>
                                                                <dd>~ {{item.EXPE_PRICE_TO_JSON.KRW}}</dd>
                                                            </dl>
                                                            <dl class="price-list">
                                                                <dt>시작가</dt>
                                                                <dd>{{item.START_COST}}</dd>
                                                            </dl>
                                                            <dl class="price-list">
                                                                <dt>낙찰가</dt>
                                                                <dd>
                                                                    <strong>{{item.CUR_COST}}</strong><em>{{item.BID_COUNT}}</em>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                        <div class="bidding-box">
                                                            <div class="deadline_set"><span>{{item.BID_TICK}}</span>
                                                            </div>
                                                            <div class="btn_set"><a name="open_popup"
                                                                                    class="btn btn_point"
                                                                                    href="javascript:void(0);"
                                                                                    ng-click="popSet(item.SALE_NO,item.LOT_NO,'KYUNGHOON');"
                                                                                    role="button"><span>응찰</span></a>
                                                            </div>
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
                                    <div id="page_layer" class="only-pc">
                                        <div class="paging-area">
                                            <!-- paging -->
                                            <div class="paging">
                                                <a href="javascript:void(0);" class="prev_end icon-page_prevprev">FIRST</a><a href="javascript:void(0);"
                                                <a href="javascript:void(0);" ng-click="pageing(item);"
                                                   ng-repeat="item in pageingdata">
                                                    <strong ng-if="item === curpage" ng-class="{'on':item === curpage}"
                                                            ng-bind="item"></strong>
                                                    <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                <a href="javascript:void(0);" class="next icon-page_next "><em>NEXT</em></a><a href="#"
                                                                                                             class="next_end icon-page_nextnext">END</a>
                                            </div>
                                            <!-- paging -->
                                        </div>
                                    </div>
                                    <!-- 더보기 -->
                                    <div id="add_layer" class="only-mb">
                                        <button class="btn btn_gray_line" type="button" ng-click="addpage(curpage + 1);"><span>더보기</span></button>
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
        <!-- // stykey -->
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
                            <span id="pop_lot_no" class="txt_title">LOT </span>
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
                                                    <img id="pop_img_url" alt="LOT 02">
                                                </div>
                                            </div>
                                        </div>
                                        <figcaption class="view-typo">
                                            <div class="typo-header">
                                                <div class="title"><span id="pop_artist_nm"></span><em
                                                        id="pop_born_year"></em>
                                                </div>
                                                <div class="desc"><span id="pop_lot_title"></span>
                                                </div>
                                            </div>
                                            <div class="typo-body">
                                                <span id="pop_material"></span>
                                                <ul>
                                                    <li id="pop_size"></li>
                                                    <li id="pop_make_year"></li>
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
                                                    <select id="reservation_bid" class="select2Basic56_line">
                                                        <option value="1800000">KRW 1,800,000</option>
                                                        <option value="1900000">KRW 1,900,000</option>
                                                        <option value="2000000">KRW 2,000,000</option>
                                                        <option value="2100000">KRW 2,100,000</option>
                                                        <option value="2200000">KRW 2,200,000</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="btn_item"><a class="btn btn_point btn_lg" href="javascript:autoBid();"
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

<div id="popup_online_confirm-wrap" class="trp popupfixed-wrap online_confirm-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_full">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span class="txt_title">온라인 경매 번호 인증</span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section">
                            <div class="text-area">
                                <P class="text-base">온라인 경매 회차당 한번 번호 인증 후 경매에 참여하실 수 있습니다.</P>
                            </div>
                            <div class="form-area">
                                <div class="form_label">
                                    <label for="name-1" class="mem_txt">휴대폰 인증</label>
                                    <i>*</i>
                                </div>
                                <div class="form_body">
                                    <div class="input-group">
                                        <input type="text" id="name-1" class="form-control" value="" placeholder="">
                                        <button class="btn btn_light_gray_line" type="button"><span>인증번호 요청</span></button>
                                    </div>
                                    <div class="re-check">
                                        <div class="form_body">
                                            <div class="input-group">
                                                <input type="text" id="name-2" class="form-control" value="" placeholder="인증번호 입력">
                                                <button class="btn btn_light_gray_line" type="button"><span>인증</span></button>
                                            </div>
                                            <p class="error_text tb2">안내 메시지 출력 영역</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-area policy_accordion">
                                <div class="check_all-wrap js_all-1">
                                    <ul class="accordion-list policy js-accordion_policy">
                                        <li class="trp_acitem">
                                            <div class="header-area">
                                                <div class="accordion_name">
                                                    <div class="trp checkbox-box">
                                                        <input id="checkbox_01" class="" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_01"><span class="required">[필수]</span> 온라인 응찰 안내</label>
                                                    </div>
                                                </div>
                                                <a href="#" class="acc_btn">
                                                    <i class="icon-accordion_arrow_down"></i>
                                                </a>
                                            </div>
                                            <div class="con-area">
                                                <div class="con-header">
                                                    <div class="policy_cont">
                                                        <div class="trp checkbox-box">
                                                            <input id="checkbox_01" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_01 tb1">확인 하였습니다.</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="con-body">
                                                    <div class="text-area scroll-type">
                                                        <ul>
                                                            <li>낙찰 시, 낙찰금의 18%(부가세별도)의 구매수수료가 발생합니다.</li>
                                                            <li class="point_item">응찰 및 낙찰은 취소가 불가능합니다. 낙찰 철회 시 낙찰가의 30%에 해당하는 낙찰철회비가 부과되오니 신중히 응찰 바랍니다.</li>
                                                            <li>응찰은 작품 컨디션 확인 후 진행 되는 것을 전제로 하며, 작품 컨디션에 액자 상태는 포함되지 않습니다.</li>
                                                            <li>마감시간 30초 내에 응찰이 있을 경우, 자동으로 30초 연장됩니다.</li>
                                                            <li>접속자의 컴퓨터, 인터넷 환경에 따라 반영 속도 차이가 있을 수 있으니 비딩 시 유의해 주시기 바랍니다.</li>
                                                            <li class="point_item">[1회 응찰] 또는 [자동 응찰] 버튼을 누르시면 ‘확인안내 없이’ 바로 응찰이 되어 취소가 가능합니다.</li>
                                                            <li class="point_item">남은 시간 1초 미만 시 응찰은 서버 반영 전 종료 될 수 있으니, 주의가 필요합니다.</li>
                                                            <li>[자동 응찰 중지하기]는 자동 응찰 ‘취소가 아닙니다’, 응찰자가 자동응찰을 중지하는 경우 중지 전까지의 응찰 및 낙찰은 유효합니다. 또한 자동응찰의 중지는 서버에 반영이 되는 시점에 효력이 발생하므로, <em>응찰자가 중지버튼을 클릭한 시점보다 더 높은 금액에 중지되고 이 금액에 낙찰 될 수 있습니다.</em></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="trp_acitem">
                                            <div class="header-area">
                                                <div class="accordion_name">
                                                    <div class="trp checkbox-box">
                                                        <input id="checkbox_02" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_02"><span class="required">[필수]</span> 약관 동의 안내</label>
                                                    </div>
                                                </div>
                                                <a href="#" class="acc_btn">
                                                    <i class="icon-accordion_arrow_down"></i>
                                                </a>
                                            </div>
                                            <div class="con-area">
                                                <div class="con-header">
                                                    <div class="policy_cont">
                                                        <div class="trp checkbox-box">
                                                            <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_all tb1">모두 동의합니다.</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="con-body">
                                                    <div class="text-area scroll-type check_item">
                                                        <ul class="">
                                                            <li>
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all1">본인은 서울옥션 경매약관(바로가기)을 모두 읽고 이해하였으며, 그 적용에 동의합니다.</label>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all2">응찰은 작품 실물 및 컨디션을 확인하였음을 전제로 합니다.</label>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다.</label>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all4">낙찰자가 ①지정된 기일에 낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을 낙찰철회(위약금)로 납부하여야 합니다.</label>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="text-area">
                                    <p class="tb2">응찰 관련 문의가 있으신 경우, 귀하의 담당자(<em>홍길동 02-2075-4411</em>)에게 <br class="only-pc">연락주시기 바랍니다.
                                    </p>
                                </div>
                            </div>
                            <div class="btn-area">
                                <div class="btn_set-float tac">
                                    <!-- [0523]a 버튼 href에 # 삽입 -->
                                    <a class="btn btn_gray_line" href="#" role="button">
                                        <span>취소</span>
                                    </a>
                                    <a class="btn btn_point" href="#" role="button">
                                        <span>확인</span>
                                    </a>
                                    <!-- //[0523]a 버튼 href에 # 삽입 -->
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<!-- [0516]삭제
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->
<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>


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
    var dropdown = $(".js-dropdown-btn").trpDropdown({
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

        $(".js-bidding_tab .bottombtn-area .btn_set").removeClass("active");
        $(".js-bidding_tab .bottombtn-area .btn_set").eq(_index).addClass("active");
    });
</script>

<!-- pc, mb select 값변경  -->
<script>
    $(function () {
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


</script>

<!-- angular js -->
<script>
    app.value('locale', 'ko');
    app.value('is_login', false);

    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    app.controller('ctl', function ($scope, consts, common, is_login, locale) {
        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.sale_no = "${saleNo}";

        $scope.pagesize = 10;
        $scope.itemsize = 20;
        $scope.curpage = 1;

        $scope.modelSortType = [{
            name: "LOT 번호순",
            value: 1
        }, {
            name: "추정가 높은순",
            value: 2
        }, {
            name: "추정가 낮은순",
            value: 3
        }, {
            name: "응찰가 높은순",
            value: 4
        }, {
            name: "응찰가 낮은순",
            value: 5
        }, {
            name: "응찰수 높은순",
            value: 6
        }, {
            name: "응찰수 낮은순",
            value: 7
        }];

        $scope.modelViewType = [{
            name: "페이징 방식",
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

        $scope.searchArtist = function (event) {
            if (event.keyCode === 13 || $scope.searchValue.length <= 0) {
                $scope.searchArtist2();
            }
        }

        $scope.searchArtist2 = function () {
            let pp = [];
            for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                if ($scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 ||
                    $scope.saleInfoAll[i].LOT_TITLE_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                    pp.push($scope.saleInfoAll[i]);
                }
            }
            $scope.searchSaleInfoAll = pp;
            $scope.pageing(1);

        }

        $scope.goLot = function (saleNo, lotNo) {
            window.location.href = '/auction/online/view/' + saleNo + '/' + lotNo;
        }

        $scope.favorite = function(item) {

            if(sessionStorage.getItem("is_login") === 'false'){
                alert('로그인을 진행해주세요.');
                return;
            }

            let url = item.FAVORITE_YN ==='N' ? "/api/auction/delCustInteLot" : "/api/auction/addCustInteLot";

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

        $scope.searchLotTags = function (lotTag) {
            $scope.selectLotTag = lotTag;
            let pp = [];
            for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                if ($scope.saleInfoAll[i].LOT_TAG === lotTag) {
                    pp.push($scope.saleInfoAll[i]);
                }
            }
            $scope.searchSaleInfoAll = pp;
            $scope.pageing(1);
        }

        $scope.popSet = function (saleNo, lotNo) {
            if (${member.userNo} === 0) {
                if(sessionStorage.getItem("is_login") === 'false'){
                    //history.push("/login");
                    location.href = "/login";
                    return;
                }
            } else {
                let a = true;
                if (!a) {
                    let popup_offline_payment = $(".js-popup_online_confirm").trpLayerFixedPopup("#popup_online_confirm-wrap");
                    popup_offline_payment.open(this); // or false
                    popup_fixation("#popup_online_confirm-wrap"); // pc 하단 붙이기

                    $("body").on("click", "#popup_online_confirm-wrap .js-closepop, #popup_online_confirm-wrap .popup-dim", function($e) {
                        $e.preventDefault();
                        popup_offline_payment.close();
                    });
                } else {
                    let popup_biddingPopup1 = $("a[name='open_popup']").trpLayerFixedPopup("#popup_biddingPopup1-wrap");
                    popup_biddingPopup1.open(this); // or false
                    popup_fixation("#popup_biddingPopup1-wrap");

                    let init_func_manual = async function (token, saleNo, lotNo, saleType) {
                        //console.log(token, saleNo, lotNo, saleType, userId);
                        let url ='';
                        if (window.location.protocol !== "https:") {
                            url = 'http://dev-bid.seoulauction.xyz/init2';
                        } else {
                            url = 'https://dev-bid.seoulauction.xyz/init2';
                        }
                        let resp = await fetch(url, {
                            method: "POST",
                            body: JSON.stringify({
                                token: $scope.token,
                                sale_no: saleNo,
                                lot_no: lotNo,
                                sale_type: saleType,
                                user_id: '${member.loginId}',
                            }),
                        });
                        return resp;
                    }

                    // 메타데이타
                    let lotInfo = {};

                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if ($scope.saleInfoAll[i].SALE_NO === saleNo &&
                            $scope.saleInfoAll[i].LOT_NO === lotNo) {
                            lotInfo = {
                                imageUrl: $scope.saleInfoAll[i].IMAGE_URL + $scope.saleInfoAll[i].FILE_PATH + "//" + $scope.saleInfoAll[i].FILE_NAME,
                                artistName: $scope.saleInfoAll[i].ARTIST_NAME_JSON.ko,
                                bornYear: $scope.saleInfoAll[i].BORN_YEAR,
                                lotTitle: $scope.saleInfoAll[i].LOT_TITLE_JSON.ko,
                                material: $scope.saleInfoAll[i].CD_NM,
                                lotSize: $scope.saleInfoAll[i].SIZE1 + "X" + $scope.saleInfoAll[i].SIZE2 + "X" + $scope.saleInfoAll[i].SIZE3,
                                makeYear:  $scope.saleInfoAll[i].MAKE_YEAR_JSON.ko,
                            }
                        }
                    }
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
                    $("#pop_size").html(lotInfo.lotSize);
                    $("#pop_make_year").html(lotInfo.makeYear);

                    init_func_manual(token, parseInt(saleNo), parseInt(lotNo), 2);

                    $("body").on("click", "#popup_biddingPopup1-wrap .js-closepop, #popup_biddingPopup1-wrap .popup-dim", function ($e) {
                        $e.preventDefault();
                        popup_biddingPopup1.close();
                    });
                }
            }
        }

        // 호출 부
        $scope.load = function () {
            let run = async function () {
                let [r1, r2, r3] = await Promise.all([getSaleInfo($scope.sale_no), getSaleImages($scope.sale_no), getLotTags($scope.sale_no)]);
                $scope.saleInfoAll = r1.data.data;
                $scope.saleImages = r2.data.data;
                $scope.lotTags = r3.data.data;


                for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                    if($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW !=null) {
                        $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW.toLocaleString('ko-KR');
                        $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW.toLocaleString('ko-KR');
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

                $scope.pageingdata = p;
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
                /*$(".select2Basic42").select2({
                    minimumResultsForSearch: Infinity,
                });*/
            }
            run();
        }


        /*################ 웹소켓 #################*/

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

        // bidstart
        $scope.bidstart = function (user_id, custNo) {
            $scope.retry(parseInt($scope.sale_no), 0, 2, user_id, custNo);
        }

        // websocket connection retry
        $scope.retry = function (saleNo, lotNo, saleType, userId, custNo) {
            window.clearTimeout($scope.websocketTimeout);
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

        // bid protocols
        $scope.proc = function (evt, saleNo, lotNo, saleType, userId, custNo) {
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
                connect_info.lot_no = 0;
                connect_info.user_id = userId;
                connect_info.cust_no = custNo;

                //$scope.popSet();
                $scope.token = d.message.token;

                let init_func_manual = async function (req) {
                    let url = '';
                    if (window.location.protocol !== "https:") {
                        url = 'http://dev-bid.seoulauction.xyz/init';
                    } else {
                        url = 'https://dev-bid.seoulauction.xyz/init';
                    }
                    console.log(custNo);
                    let response = await fetch(url, {
                        method: "POST",
                        body: JSON.stringify({
                            token: req.message.token,
                            sale_no: saleNo,
                            lot_no: 0,
                            sale_type: saleType,
                            user_id: userId,
                            cust_no: custNo,
                        }),
                    });
                    return response;
                }
                init_func_manual(d);
            } else if (d.msg_type === packet_enum.bid_info) {
                if (d.message.bid != null && d.message.bid.length > 0) {

                    let len = d.message.bid.length;
                    let curCostValue = (d.message.bid[len - 1].bid_cost === 0) ?
                        "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR') :
                        "KRW " + d.message.bid[len - 1].bid_cost.toLocaleString('ko-KR');
                    // 앵귤러 정보 삽입
                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if (parseInt($scope.saleInfoAll[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no &&
                            parseInt($scope.saleInfoAll[i].LOT_NO) === d.message.bid[len - 1].customer.lot_no) {
                            $scope.saleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                            $scope.saleInfoAll[i].CUR_COST = curCostValue;
                        }
                    }
                    // 앵귤러 정보 삽입
                    for (let i = 0; i < $scope.searchSaleInfoAll.length; i++) {
                        if (parseInt($scope.searchSaleInfoAll[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no &&
                            parseInt($scope.searchSaleInfoAll[i].LOT_NO) === d.message.bid[len - 1].customer.lot_no) {
                            $scope.searchSaleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                            $scope.searchSaleInfoAll[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                            $scope.searchSaleInfoAll[i].CUR_COST = curCostValue;
                        }
                    }
                    $scope.$apply();

                    if (parseInt($("#sale_no").val()) !== d.message.bid[len - 1].customer.sale_no
                        || parseInt($("#lot_no").val()) !== d.message.bid[len - 1].customer.lot_no) {
                        return
                    }

                    let bid = document.getElementById("bid_cost_val");
                    let bid_cnt = document.getElementById("bid_cost_cnt");
                    let quote_unit = document.getElementById("quote_unit");
                    let bid_new_cost = document.getElementById("bid_new_cost");

                    bid.innerText = curCostValue
                    bid_cnt.innerText = "(응찰 " + d.message.bid[len - 1].bid_count + ")"

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
                let ddd = new Date(d.message.tick_value);

                // 앵귤러 정보 삽입
                for (let j = 0; j < $scope.searchSaleInfoAll.length; j++) {
                    if ($scope.searchSaleInfoAll[j].END_DT > 0 && $scope.searchSaleInfoAll[j].END_DT >= d.message.tick_value) {
                        let endDate = new Date($scope.searchSaleInfoAll[j].END_DT);
                        let dateGap = endDate - ddd;
                        let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);
                        // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                        let diffDay = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                        let diffHour = timeGap.getHours();       // 시간
                        let diffMin = timeGap.getMinutes();      // 분
                        let diffSec = timeGap.getSeconds();      // 초
                        $scope.searchSaleInfoAll[j].BID_TICK = diffDay + "일 " +
                            diffHour + ":" + diffMin + ":" + diffSec;
                    } else if (end_bid_time <= 0) {
                        $scope.searchSaleInfoAll[j].BID_TICK = "경매시작 전입니다."
                    } else {
                        $scope.searchSaleInfoAll[j].BID_TICK = "경매가 종료되었습니다."
                    }
                }

                for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                    if ($scope.saleInfoAll[j].END_DT > 0 && $scope.saleInfoAll[j].END_DT >= d.message.tick_value) {
                        let endDate = new Date($scope.saleInfoAll[j].END_DT);
                        let dateGap = endDate - ddd;
                        let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);
                        // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                        let diffDay = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                        let diffHour = timeGap.getHours();       // 시간
                        let diffMin = timeGap.getMinutes();      // 분
                        let diffSec = timeGap.getSeconds();      // 초
                        $scope.saleInfoAll[j].BID_TICK = diffDay + "일 " +
                            diffHour + ":" + diffMin + ":" + diffSec;
                    } else if (end_bid_time <= 0) {
                        $scope.saleInfoAll[j].BID_TICK = "경매시작 전입니다."
                    } else {
                        $scope.saleInfoAll[j].BID_TICK = "경매가 종료되었습니다."
                    }
                }
                $scope.$apply();
            } else if (d.msg_type === packet_enum.bid_info_init) {
                // popup용 이라면
                if (d.message.is_list_popup) {
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

                        let curCostValue = (bid_info.bid_cost === 0) ?
                            "KRW " + bid_info.open_bid_cost.toLocaleString('ko-KR') :
                            "KRW " + bid_info.bid_cost.toLocaleString('ko-KR');

                        //start_cost.innerText = "KRW " + bid_info.open_bid_cost.toLocaleString('ko-KR');
                        //bid_cnt2.innerText = "(응찰" + bid_info.bid_count + ")"
                        //cur_cost.innerText = curCostValue;

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
                                            if (bid_info.is_winner && bid_hist_info[i].value.length - 1 == j) {
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
                                            if (bid_info.is_winner) {
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
                        if (bid_info.is_winner) {
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
                        }
                    }
                    return
                }
                if (d.message.bids != null && d.message.bids.length > 0) {
                    $scope.bidsInfoAll = d.message.bids;
                    let matching = new Map();

                    // 정보를 처음 가져왔을 때, 인덱스 매핑
                    for (let i = 0; i < $scope.bidsInfoAll.length; i++) {
                        matching.set($scope.bidsInfoAll[i].customer.sale_no + "-" +
                            $scope.bidsInfoAll[i].customer.lot_no, i);
                    }

                    //console.log("$scope.bidsInfoAll.length :", $scope.bidsInfoAll.length);
                    // 현재 랏정보
                    $scope.CUR_LOT_NO = $scope.bidsInfoAll[0].cur_lot_no;
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].LOT_NO === $scope.bidsInfoAll[0].cur_lot_no) {
                            $scope.CUR_LOT_ARTIST_NAME = $scope.saleInfoAll[j].ARTIST_NAME_JSON.ko;
                            break;
                        }
                    }

                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-" +
                            $scope.saleInfoAll[j].LOT_NO);
                        if (idx !== undefined) {
                            let curCostValue = ($scope.bidsInfoAll[idx].bid_cost === 0) ?
                                "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR') :
                                "KRW " + $scope.bidsInfoAll[idx].bid_cost.toLocaleString('ko-KR');
                            // 시작일자
                            $scope.saleInfoAll[j].START_COST = "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR');
                            // 현재가
                            $scope.saleInfoAll[j].CUR_COST = curCostValue;
                            // 응찰 수
                            $scope.saleInfoAll[j].BID_COUNT = "(응찰 : " + $scope.bidsInfoAll[idx].bid_count + ")";
                            // 종료일
                            $scope.saleInfoAll[j].END_DT = $scope.bidsInfoAll[idx].end_bid_time;


                            // 낙찰이 완료 되었다면
                            if ($scope.bidsInfoAll[idx].is_winner) {
                                if ($scope.bidsInfoAll[idx].end_bid_time <= 0) {
                                    $scope.saleInfoAll[j].BID_TICK = "경매 시작 전입니다.";
                                } else if ($scope.bidsInfoAll[idx].end_bid_time <= new Date().getTime()) {
                                    $scope.saleInfoAll[j].BID_TICK = "경매가 종료 되었습니다.";
                                }
                                $scope.bidsInfoAll[idx].IS_END_BID = true;
                            }
                        }

                    }
                    let isCanClose = true;
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].IS_END_BID) {
                            isCanClose = false;
                            break;
                        }
                    }
                    if (!isCanClose) {
                        w.close();
                    }
                    $scope.$apply();
                }
            } else if (d.msg_type === packet_enum.end_time_sync) {
                if (d.message.value != null) {
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].SALE_NO === d.message.sale_no &&
                            $scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
                            $scope.saleInfoAll[j].END_DT = d.message.value;
                        }
                    }
                }
            } else if (d.msg_type === packet_enum.winner) {
                if (d.message != null) {
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].SALE_NO === d.message.sale_no &&
                            $scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
                            $scope.saleInfoAll[j].BID_TICK = "경매가 종료 되었습니다.";
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
                    let isCanClose = true;
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if (!$scope.saleInfoAll[j].IS_END_BID) {
                            isCanClose = false;
                            break
                        }
                    }
                    if (!isCanClose) {
                        w.close();
                    }
                }
            }
        }
        /*##################### 웹소켓 끝 #####################*/

        $scope.chgViewType = function () {
            let sst = parseInt($("#viewType option:selected").val())
            switch (sst) {
                case 1:
                    $("#page_layer").removeClass('only-mb');
                    $("#page_layer").addClass('only-pc');
                    $("#add_layer").removeClass('only-pc');
                    $("#add_layer").addClass('only-mb');

                    $scope.pageing($scope.curpage)
                    break;
                case 2:
                    $("#page_layer").removeClass('only-pc');
                    $("#page_layer").addClass('only-mb');
                    $("#add_layer").removeClass('only-mb');
                    $("#add_layer").addClass('only-pc');

                    $scope.addpage($scope.curpage);
                    break;
            }
            $scope.selectViewType = sst;
        }
        $scope.rerange = function () {
            let sst = parseInt($("#sortType").val())
            let v = $scope.saleInfoAll;
            if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
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
                        if (a.EXPE_PRICE_TO_JSON.KRW > b.EXPE_PRICE_TO_JSON.KRW) return -1;
                        if (a.EXPE_PRICE_TO_JSON.KRW === b.EXPE_PRICE_TO_JSON.KRW) return 0;
                        if (a.EXPE_PRICE_TO_JSON.KRW < b.EXPE_PRICE_TO_JSON.KRW) return 1;
                    });
                    break;
                case 3:

                    // lot 추정가 낮은 순
                    v.sort(function (a, b) {
                        if (a.EXPE_PRICE_TO_JSON.KRW > b.EXPE_PRICE_TO_JSON.KRW) return 1;
                        if (a.EXPE_PRICE_TO_JSON.KRW === b.EXPE_PRICE_TO_JSON.KRW) return 0;
                        if (a.EXPE_PRICE_TO_JSON.KRW < b.EXPE_PRICE_TO_JSON.KRW) return -1;
                    });
                    break;
                case 4:

                    // 응찰가 높은 순
                    v.sort(function (a, b) {
                        if (a.CUR_COST > b.CUR_COST) return -1;
                        if (a.CUR_COST === b.CUR_COST) return 0;
                        if (a.CUR_COST < b.CUR_COST) return 1;
                    });
                    break;
                case 5:

                    // 응찰가 낮은 순
                    v.sort(function (a, b) {
                        if (a.CUR_COST > b.CUR_COST) return 1;
                        if (a.CUR_COST === b.CUR_COST) return 0;
                        if (a.CUR_COST < b.CUR_COST) return -1;
                    });
                    break;
                case 6:

                    // 응찰수 높은 순
                    v.sort(function (a, b) {
                        if (a.BID_COUNT > b.BID_COUNT) return -1;
                        if (a.BID_COUNT === b.BID_COUNT) return 0;
                        if (a.BID_COUNT < b.BID_COUNT) return 1;
                    });
                    break;
                case 7:
                    // 응찰수 낮은 순
                    v.sort(function (a, b) {
                        if (a.BID_COUNT > b.BID_COUNT) return 1;
                        if (a.BID_COUNT === b.BID_COUNT) return 0;
                        if (a.BID_COUNT < b.BID_COUNT) return -1;
                    });
                    break;
            }
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
        //paging
        $scope.makePageing = function (v, page) {
            let p = [];
            let endVal = 0;
            let etc = (v.length % $scope.itemsize > 0) ? 1 : 0;
            let end = parseInt(v.length / $scope.itemsize) + etc;

            if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
                endVal = end;
            } else {
                endVal = $scope.pagesize + (parseInt(page / $scope.pagesize) + 1);
            }
            for (let i = ($scope.pagesize * parseInt((page - 1) / $scope.pagesize)) + 1; i <= endVal; i++) {
                p.push(i);
            }
            return p;
        }
        /*$scope.$on('$viewContentLoaded', function(){
            popSet();
        });*/
    });
</script>
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

    let autoBiding = async function(connect_info){
        let val = $("#reservation_bid").val();
        let datet = new Date();
        let response = await fetch('https://dev-bid.seoulauction.xyz/bid', {
            method:"POST",
            body: JSON.stringify({
                customer : {
                    sale_no: parseInt($("#sale_no").val()),
                    lot_no:  parseInt($("#lot_no").val()),
                    cust_no: parseInt($("#cust_no").val()),
                    paddle: 0,
                    user_id: $("#user_id").val(),
                    token:  $("#token").val(),
                    sale_type: 2,
                    bid_type: 22,
                },
                bid_cost:   parseInt(val),
            }),
        });
        let vv = response.json();
        return vv;
    }

    let biding = async function (connect_info) {
        let val = document.getElementById("bid_new_cost_val").getAttribute("value");
        let url = '';
        if (window.location.protocol !== "https:") {
            url = 'http://dev-bid.seoulauction.xyz/bid';
        } else {
            url = 'https://dev-bid.seoulauction.xyz/bid';
        }
        let response = await fetch(url, {
            method: "POST",
            body: JSON.stringify({
                customer: {
                    sale_no: parseInt($("#sale_no").val()),
                    lot_no: parseInt($("#lot_no").val()),
                    paddle: 0,
                    user_id: $("#user_id").val(),
                    cust_no: parseInt($("#cust_no").val()),
                    token: $("#token").val(),
                    sale_type: 2,
                    bid_type: 21,
                },
                bid_cost: parseInt(val),
            }),
        });
        let vv = response.json();
        return vv;
    }

    function bid() {
        biding(connect_info);
    }

    // 자동응찰
    function autoBid() {
        autoBiding(connect_info);
    }
</script>
</body>

</html>