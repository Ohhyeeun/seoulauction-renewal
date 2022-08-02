<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../common/angular.jsp"/>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
    <!-- header -->
    <meta name="naver-site-verification" content="e43736eddfc3d46038024a9d2132da077391aadf"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="미술품 경매를 통해 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.">
    <meta name="keywords" content="미술품,경매,작품,미술,근현대,고미술,와인,보석,구매,판매,위탁,경매회사,갤러리,케이옥션,K옥션,seoulauction,auction">
    <meta name="author" content="SeoulAuction">
    <meta name="Copyright" content="SeoulAuction" />
    <meta name="Classification" content="회사소개, 미술품소개, 경매, 구매, 위탁" />
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.seoulauction.com">
    <meta property="og:title" content="SeoulAuction">
    <meta property="og:description" content="미술품 경매를 통해 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.">
    <meta property="og:image" content="/images/pc/thumbnail/201508122329463497773394954126.jpg"/>
    <meta property="al:web:url" content="https://www.seoulauction.com">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/images/favic/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <meta name="application-name" content="SeoulAuction" />
    <!— Windows 8.1 + IE11 and above —>
    <meta name="msapplication-config" content="/webapp/browserconfig.xml" />
    <title>오프라인 응찰하기 | Seoul Auction</title>
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/favic/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/favic/apple-icon-57x57.png">
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/favic/apple-icon-60x60.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/favic/apple-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/favic/apple-icon-76x76.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/favic/apple-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/favic/apple-icon-120x120.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/favic/apple-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/favic/apple-icon-152x152.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/images/favic/apple-icon-180x180.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/iamges/favic/apple-touch-icon.png">
    <link rel="icon" type="image/svg+xml" href="/images/favic/favicon.svg">
    <link rel="icon" type="image/png" href="/images/favic/favicon.png">
    <link rel="mask-icon" href="/images/favic/sa-full-icon.svg">
    <link rel="manifest" href="/webapp/manifest.json">
    <link rel="icon" type="image/png" href="/images/favic/android-icon-192x192.png" sizes="192x192"/>

    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css"/>
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
</head>

<%--<jsp:include page="../../include/ko/header.jsp" flush="false"/>--%>

<body>
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <header class="win_header">
            <div class="header-inner">
                <a href="/" class="header_logo"><span class="blind-text">logo</span></a>
            </div>
        </header>
        <!-- //header -->
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();" ng-cloak>
            <div id="contents" class="contents">
                <section class="basis-section last-section bidding_offline-section">
                    <div class="section-inner">
                        <div class="section-header">
                            <div class="title-area">
                                <div class="title">
                                    <span ng_bind="saleInfoAll[0].SALE_TITLE_JSON.ko"></span>
                                </div>
                            </div>
                            <div class="btn-area">
                                <div class="select-box pc-ver">
                                    <select class="" id="currency_type" ng-model="currencyType" ng-change="selectCurrency()">
                                        <option ng-repeat="item in currencyTypes" value="{{item.value}}">
                                            {{item.name}}
                                        </option>
                                    </select>
                                    <i class="form-bidding_select_arrow"></i>
                                </div>

                            </div>
                        </div>
                        <div class="section-body">
                            <div class="bidding_pc">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-left">
                                        <div class="lotlist-wrap">
                                            <div class="lotlist-header">
                                                <div class="header_top">
                                                    <p class="totalcount"><span class="num"
                                                                                ng-bind="saleInfoAll.length"></span>
                                                        <span class="unit">LOT</span></p>
                                                </div>
                                                <div class="lotlist-tabmenu">
                                                    <div class="btn_item"
                                                         ng-repeat="item in lotTags">
                                                        <a href="javascript:void(0);"
                                                           ng-class="{'lot-btn_tabmenu':item !== null, 'on':item.LOT_TAG === selectLotTag}"
                                                           role="button" ng-bind="item.LOT_TAG"
                                                           ng-click="searchLotTags(item.LOT_TAG);"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 왼쪽 LOTlist -->
                                            <div class="lotlist-tabCont">
                                                <div class="mCustomScrollbar">
                                                    <div class="lotlist-box">
                                                        <ul class="lotlist-inner">
                                                            <!-- bidded -->
                                                            <li ng-class="{lotitem: saleInfo !== null, bidded: item.CUR_YN ==='Y', cancel: item.STAT_CD ==='reentry'}"
                                                                ng-repeat="item in saleInfo">
                                                                <div ng-if="item.STAT_CD !== 'reentry'"
                                                                     class="js-select_lotitem lotitem_wrap"
                                                                    ng-click="showLot(item.SALE_NO, item.LOT_NO)">
                                                                    <div class="view-img">
                                                                        <div class="img-box">
                                                                            <div class="box-inner">
                                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"
                                                                                     alt="{{item.LOT_NO}}">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="item-cont ">
                                                                        <div class="num"><span class="snum"
                                                                                               ng-bind="item.LOT_NO"></span>
                                                                        </div>
                                                                        <div class="title"><span
                                                                                ng-bind="item.ARTIST_NAME_JSON.ko"></span>
                                                                        </div>
                                                                        <div class="desc"><span
                                                                                ng-bind="item.LOT_TITLE_JSON.ko"></span>
                                                                        </div>
                                                                        <div class="price">
                                                                            <span ng-show="item.IS_END_BID === false" class=""
                                                                                  ng-bind="'KRW ' + item.EXPE_PRICE_FROM_JSON.KRW + '~' + item.EXPE_PRICE_TO_JSON.KRW"></span>
                                                                            <span ng-show="item.IS_END_BID === true" style="color:#ff0000;"
                                                                                  ng-bind="item.CUR_COST"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <p ng-if="item.STAT_CD === 'reentry'" class="txt">
                                                                    LOT {{item.LOT_NO}} <br>
                                                                    출품이 취소되었습니다.
                                                                </p>
                                                                <button ng-if="item.STAT_CD !== 'reentry'"
                                                                        ng-class="{'btn-lotChk':item !== null, 'js-work_heart':item !== null, 'on':item.FAVORITE_YN==='N'}"
                                                                        ng-click="favorite(item);">Favorite
                                                                </button>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="bidding-offline-center">
                                        <div class="notice">
                                            <i class="icon-notice"></i><span class="txt">공지공지공지</span>
                                        </div>
                                        <div class="video_area">
                                            <div class="view_box">
                                                <!-- Youtube -->
                                                <video id="llnw-rts-subscriber" width="100%" height="331" autoplay controls muted>
                                                </video>
                                                <!--a href="#" class="video_wrap">
                                                        <span class="video_thumbnail_wrap">
                                                            <span class="video_thumbnail"
                                                                  style="background-image: url(/images/temp/temp_video_bg.jpg)"></span>
                                                            <div class="" id="thevideo"></div>
                                                            <iframe  src="https://www.youtube-nocookie.com/embed/IwATrgHOefo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                                        </span>
                                                    <span class="ic_video_play"></span>
                                                </a> -->
                                            </div>
                                            <div class="view_info">
                                                <p class="view_count">
                                                    <i class="icon-viewer"></i><span class="unit">시청자</span> <span
                                                        class="num" ng-bind="viewers"></span>
                                                </p>
                                                <button class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>동영상
                                                    새로고침
                                                </button>
                                            </div>
                                        </div>
                                        <div class="my_lot">
                                            <div class="my_lot_info" ng-show="paddNo > 0">
                                                <div class="lotlist-tabmenu">
                                                    <div class="btn_item">
                                                        <a href="javascript:void(0);"
                                                           ng-class="{'lot-btn_tabmenu':'' === '','on':selectUserTab === 1}"
                                                           ng-click="userTab(1)"
                                                           role="button">LOT</a>
                                                    </div>
                                                    <div class="btn_item">
                                                        <a href="javascript:void(0);"
                                                           ng-class="{'lot-btn_tabmenu':'' === '','on':selectUserTab === 2}"
                                                           ng-click="userTab(2)"
                                                           role="button">내 응찰내역</a>
                                                    </div>
                                                </div>
                                                <p class="count"><span class="txt">패들번호 : </span><span class="num"
                                                                                                       ng-bind="paddNo"></span>
                                                </p>
                                            </div>
                                            <div class="my_lot_wrap" ng-show="paddNo > 0">
                                                <div ng-if="selectUserTab === 1" ng-class="{'my_lot_type1':''===''}">
                                                    <a href="#" ng-click="moveCurrent()" class="lot_link"> 현재 LOT
                                                        이동 </a>
                                                    <div class="view-img_wrap">
                                                        <div class="view-img">
                                                            <div class="img-box">
                                                                <div class="box-inner">
                                                                    <img src="{{userLot.IMAGE_URL}}{{userLot.FILE_PATH}}/{{userLot.FILE_NAME}}"
                                                                         alt="LOT {{userLot.LOT_NO}}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="type2_info_box">
                                                        <div>
                                                            <div class="num"><span ng-bind="userLot.LOT_NO"></span>
                                                            </div>
                                                            <!-- [0516]년도내용수정 -->
                                                            <div class="title"><span
                                                                    ng-bind="userLot.ARTIST_NAME_JSON.ko"></span></div>
                                                            <div class="desc"><span
                                                                    ng-bind="userLot.LOT_TITLE_JSON.ko"></span></div>
                                                            <div class="standard">
                                                                <span ng-bind="userLot.CD_NM"></span>
                                                                <div class="size_year">
                                                                    <span ng-bind="userLot | size_text_cm"></span>
                                                                    <span ng-bind="userLot.MAKE_YEAR_JSON.ko" ng-if="userLot.MAKE_YEAR_JSON.ko !== undefined"></span>
                                                                </div>
                                                            </div>
                                                            <!-- // [0516]년도내용수정 -->
                                                            <div class="detail">
                                                                <a href="#" class="btn btn_gray"
                                                                   ng-click="goLot(userLot.SALE_NO, userLot.LOT_NO)">상세보기</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div ng-if="selectUserTab === 2" ng-class="{'my_lot_type2':''===''}">
                                                    <div class="my_lot_header">
                                                        <table class="table_base my_lot_table">
                                                            <colgroup>
                                                                <col width="16%">
                                                                <col width="">
                                                                <col width="">
                                                                <col width="14%">
                                                            </colgroup>
                                                            <thead>
                                                            <tr>
                                                                <th>LOT</th>
                                                                <th>최고응찰금액</th>
                                                                <th>낙찰가</th>
                                                                <th>현황</th>
                                                            </tr>
                                                            </thead>
                                                        </table>
                                                    </div>
                                                    <div class="my_lot_body">
                                                        <div class="mCustomScrollbar js-scroll_center">
                                                            <!-- [0516].scroll-inner 테그추가 -->
                                                            <div class="scroll-inner">
                                                                <table class="table_base my_lot_table">
                                                                    <colgroup>
                                                                        <col width="16%">
                                                                        <col width="">
                                                                        <col width="">
                                                                        <col width="14%">
                                                                    </colgroup>
                                                                    <tbody>
                                                                    <tr ng-repeat="item in userBids">
                                                                        <td ng-bind="item.customer.lot_no"></td>
                                                                        <td ng-bind="item.bid_cost | currency"></td>
                                                                        <td ng-bind="item.max_bid_cost | currency"></td>
                                                                        <td><span class="lot-stat" ng-bind="item.winner_state | winnerText"></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <!-- //[0516].scroll-inner 테그추가 -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="my_lot_wrap" ng-show="paddNo<=0">

                                                <div class="my_lot_type3">
                                                    <p class="title">
                                                        라이브 경매 응찰은 <span>정회원부터 가능</span>합니다.
                                                    </p>
                                                    <p class="txt">
                                                        정회원은 유료로 운영되며 서울옥션이 발행하는 <br>
                                                        간행물(각종 도록, 전시 안내 등)을 받으실 수 있습니다.
                                                    </p>
                                                    <div class="member_price">
                                                        <!-- [0613]삭제
                          <p class="p_txt">정회원 연회비 : 라이브 경매 응찰은 사전 신청한 정회원만 가능합니다.</p>
                          // -->
                                                        <!-- <a href="#" class="btn btn_member">정회원 결제</a> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="bidding-offline-right">
                                        <figure class="view-area lot-view">
                                            <div class="lot-view_top">
                                                <div class="view-img_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="{{curLot.IMAGE_URL}}{{curLot.FILE_PATH}}/{{curLot.FILE_NAME}}"
                                                                     alt="LOT {{curLot.LOT_NO}}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <figcaption class="view-typo">
                                                    <div class="typo-header">
                                                        <div class="num" ng-bind="curLot.LOT_NO"><span
                                                                ng-bind="curLot.LOT_NO"></span></div>
                                                        <!-- [0516]년도수정 -->
                                                        <div class="title"><span
                                                                ng-bind="curLot.ARTIST_NAME_JSON.ko"></span></div>
                                                        <!-- //[0516]년도수정 -->
                                                        <div class="desc"><span
                                                                ng-bind="curLot.LOT_TITLE_JSON.ko"></span></div>
                                                    </div>
                                                    <div class="typo-body">
                                                        <div class="price_won">
                                                            <span ng-show="curLot.EXPE_PRICE_FROM_JSON.KRW != undefined && selectedCurrencyType === 'KRW'">KRW {{curLot.EXPE_PRICE_FROM_JSON.KRW}} ~ {{curLot.EXPE_PRICE_TO_JSON.KRW}}</span>
                                                            <span ng-show="curLot.EXPE_PRICE_FROM_JSON.USD != undefined && selectedCurrencyType === 'USD'">USD {{curLot.EXPE_PRICE_FROM_JSON.USD | currency}} ~ {{curLot.EXPE_PRICE_TO_JSON.USD | currency}}</span>
                                                            <span ng-show="curLot.EXPE_PRICE_FROM_JSON.HKD != undefined && selectedCurrencyType === 'HKD'">HKD {{curLot.EXPE_PRICE_FROM_JSON.HKD}} ~ {{curLot.EXPE_PRICE_TO_JSON.HKD}}</span>
                                                            <span ng-show="curLot.EXPE_PRICE_FROM_JSON.JPY != undefined && selectedCurrencyType === 'JPY'">JPY {{curLot.EXPE_PRICE_FROM_JSON.JPY | currency}} ~ {{curLot.EXPE_PRICE_TO_JSON.JPY | currency}}</span>
                                                            <span ng-show="curLot.EXPE_PRICE_FROM_JSON.EUR != undefined && selectedCurrencyType === 'EUR'">EUR {{curLot.EXPE_PRICE_FROM_JSON.EUR | currency}} ~ {{curLot.EXPE_PRICE_TO_JSON.EUR | currency}}</span>
                                                        </div>
                                                        <!--div class="price_other">
                                                            <span>(USD {{curLot.EXPE_PRICE_FROM_JSON.en}})</span></div-->
                                                    </div>
                                                </figcaption>
                                            </div>
                                            <div class="biddingprice_wrap">
                                                <div class="now_price">
                                                    <p class="txt">현재가</p>
                                                    <p class="price_unit1" ng-bind="curLot.bid_cost"></p>
                                                    <p class="price_unit2"></p>
                                                </div>
                                                <div class="bid_price" ng-show="paddNo > 0">
                                                    <!-- [0603]버튼수정 : 로그인버튼 없앰 -->
                                                    <button class="btn_bid" ng-click="bid();">
                                                        <p class="txt">응찰하기</p>
                                                        <p class="price_unit1" ng-bind="curLot.bid_new_cost"></p>
                                                        <p class="price_unit2"></p>
                                                    </button>
                                                    <!-- //[0603]버튼수정 : 로그인버튼 없앰 -->
                                                </div>
                                                <div class="bid_price view_only" ng-show="paddNo <= 0">
                                                    <button class="btn_bid" disabled="">
                                                        <p class="txt">VIEW ONLY</p>
                                                    </button>
                                                </div>
                                            </div>
                                        </figure>
                                        <div class="bidding_situation">
                                            <div class="alert_wrap">
                                                <p class="situ_alert" ng-bind="notice.ko"></p>
                                            </div>
                                            <div class="mCustomScrollbar">
                                                <ul class="situation_list">
                                                    <li class="st_item" ng-repeat="item in bidHist">
                                                        <p class="txt" ng-bind="item.customer.user_id | floorUserCheck"></p>
                                                        <p class="price " ng-bind="item.bid_cost"></p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <!-- mobile 버전 -->
                            <div class="bidding_mo">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-center">
                                        <div class="notice">
                                            <i class="icon-notice"></i><span class="txt">공지공지공지</span>
                                        </div>
                                        <div class="video_area">
                                            <div class="view_box">
                                                <!-- Youtube -->
                                                <video id="llnw-rts-subscriber2" style="width:100%;margin:0 auto;" autoplay controls muted></video>
                                                <!--a href="#" class="video_wrap">
                                                        <span class="video_thumbnail_wrap">
                                                            <span class="video_thumbnail" style="background-image: url(/images/temp/temp_video_bg.jpg)"></span>
                                                            <div class="" id="thevideo"></div>
                                                            <iframe  src="https://www.youtube-nocookie.com/embed/IwATrgHOefo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                                        </span>
                                                    <span class="ic_video_play"></span>
                                                </a-->
                                            </div>
                                            <div class="view_info">
                                                <p class="view_count">
                                                    <i class="icon-viewer"></i><span class="unit">시청자</span> <span
                                                        class="num" ng-bind="viewers"></span>
                                                </p>
                                                <button class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>새로고침</button>
                                            </div>
                                        </div>
                                        <div class="my_lot">
                                            <div class="my_lot_wrap">
                                                <div class="my_lot_live">
                                                    <div class="view-img_wrap">
                                                        <div class="view-img">
                                                            <div class="img-box">
                                                                <div class="box-inner">
                                                                    <img src="{{curLot.IMAGE_URL}}{{curLot.FILE_PATH}}/{{curLot.FILE_NAME}}" alt="LOT {{curLot.LOT_NO}}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="type1_info_box">
                                                        <div>
                                                            <div class="select-box">
                                                                <select class="" id="currency_type2" ng-model="currencyType" ng-change="selectCurrency()">
                                                                    <option ng-repeat="item in currencyTypes" value="{{item.value}}">
                                                                        {{item.name}}
                                                                    </option>
                                                                </select>
                                                                <i class="form-bidding_select_arrow"></i>
                                                            </div>

                                                            <div class="num"><span ng-bind="curLot.LOT_NO">2</span> <em class="live_box">LIVE</em> </div>
                                                            <!-- [0516]년도수정 -->
                                                            <div class="title"><span ng-bind="curLot.ARTIST_NAME_JSON.ko"></span></div>
                                                            <!-- // [0516]년도수정  -->
                                                            <div class="desc"><span ng-bind="curLot.LOT_TITLE_JSON.ko"></span></div>
                                                            <div class="price">
                                                                <span ng-show="curLot.EXPE_PRICE_FROM_JSON.KRW != undefined && selectedCurrencyType === 'KRW'">KRW {{curLot.EXPE_PRICE_FROM_JSON.KRW}} ~ {{curLot.EXPE_PRICE_TO_JSON.KRW}}</span>
                                                                <span ng-show="curLot.EXPE_PRICE_FROM_JSON.USD != undefined && selectedCurrencyType === 'USD'">USD {{curLot.EXPE_PRICE_FROM_JSON.USD | currency}} ~ {{curLot.EXPE_PRICE_TO_JSON.USD | currency}}</span>
                                                                <span ng-show="curLot.EXPE_PRICE_FROM_JSON.HKD != undefined && selectedCurrencyType === 'HKD'">HKD {{curLot.EXPE_PRICE_FROM_JSON.HKD}} ~ {{curLot.EXPE_PRICE_TO_JSON.HKD}}</span>
                                                                <span ng-show="curLot.EXPE_PRICE_FROM_JSON.JPY != undefined && selectedCurrencyType === 'JPY'">JPY {{curLot.EXPE_PRICE_FROM_JSON.JPY | currency}} ~ {{curLot.EXPE_PRICE_TO_JSON.JPY | currency}}</span>
                                                                <span ng-show="curLot.EXPE_PRICE_FROM_JSON.EUR != undefined && selectedCurrencyType === 'EUR'">EUR {{curLot.EXPE_PRICE_FROM_JSON.EUR | currency}} ~ {{curLot.EXPE_PRICE_TO_JSON.EUR | currency}}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="view-area lot-view">
                                            <div class="biddingprice_wrap">
                                                <div class="now_price">
                                                    <p class="txt">현재가</p>
                                                    <p class="price_unit1" ng-bind="curLot.bid_cost"></p>
                                                    <p class="price_unit2"></p>
                                                </div>
                                                <div class="bid_price" ng-show="paddNo > 0">
                                                    <button class="btn_bid">
                                                        <p class="txt">응찰하기</p>
                                                        <p class="price_unit1" ng-bind="curLot.bid_new_cost"></p>
                                                        <p class="price_unit2"></p>
                                                        <!--p class="txt2" ng-bind="curLot.bid_new_cost">로그인</p-->
                                                    </button>
                                                </div>
                                                <!-- 준회원 일 시 -->
                                                <div class="bid_price view_only"  ng-show="paddNo <= 0">
                                                    <button class="btn_bid" disabled>
                                                        <p class="txt">VIEW ONLY</p>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="bidding_situation"  ng-show="paddNo > 0">
                                            <div class="alert_wrap">
                                                <p class="situ_alert" ng-bind="notice.msg"></p>
                                            </div>
                                            <div class="mobile_scroll-type">
                                                <ul class="situation_list">
                                                    <li class="st_item" ng-repeat="item in bidHist">
                                                        <p class="txt" ng-bind="item.customer.user_id | floorUserCheck"></p>
                                                        <p class="price " ng-bind="item.bid_cost"></p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="my_lot">
                                            <div class="my_lot_info" ng-show="paddNo > 0">
                                                <div class="lotlist-tabmenu">
                                                    <div class="btn_item">
                                                        <a href="javascript:void(0);"
                                                           ng-class="{'lot-btn_tabmenu':'' === '','on':selectUserTab === 1}"
                                                           ng-click="userTab(1)"
                                                           role="button">LOT</a>
                                                    </div>
                                                    <div class="btn_item">
                                                        <a href="javascript:void(0);"
                                                           ng-class="{'lot-btn_tabmenu':'' === '','on':selectUserTab === 2}"
                                                           ng-click="userTab(2)"
                                                           role="button">내 응찰내역</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="my_lot_wrap">
                                                <div class="my_lot_type1"  ng-show="paddNo > 0">
                                                    <a href="#" class="lot_link"> 현재 LOT 이동 </a>
                                                    <div class="view-img_wrap">
                                                        <div class="view-img">
                                                            <div class="img-box">
                                                                <div class="box-inner">
                                                                    <img src="{{userLot.IMAGE_URL}}{{userLot.FILE_PATH}}/{{userLot.FILE_NAME}}"
                                                                         alt="LOT {{userLot.LOT_NO}}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="type2_info_box">
                                                        <div>
                                                            <div class="num"><span ng-bind="userLot.LOT_NO">2</span></div>
                                                            <!-- [0516]년도수정 -->
                                                            <div class="title"><span ng-bind="userLot.ARTIST_NAME_JSON.ko"></span></div>
                                                            <!-- // [0516]년도수정  -->
                                                            <div class="desc"><span ng-bind="userLot.LOT_TITLE_JSON.ko"></span></div>
                                                            <div class="standard">
                                                                <span ng-bind="userLot.CD_NM"></span>
                                                                <div class="size_year">
                                                                    <span ng-bind="userLot | size_text_cm"></span>
                                                                    <span ng-bind="userLot.MAKE_YEAR_JSON.ko" ng-if="userLot.MAKE_YEAR_JSON.ko !== undefined"></span>
                                                                </div>
                                                            </div>
                                                            <div class="detail">
                                                                <a href="#" class="btn btn_gray"
                                                                   ng-click="goLot(userLot.SALE_NO, userLot.LOT_NO)">상세보기</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- 내 응찰내역 -->
                                                <div class="my_lot_type2" ng-show="paddNo > 0"> <!-- 임시주석 클래스 blind_none -->
                                                    <div class="my_lot_header">

                                                        <table class="table_base my_lot_table">
                                                            <colgroup>
                                                                <col width="44px">
                                                                <col width="">
                                                                <col width="">
                                                                <col width="54px">
                                                            </colgroup>
                                                            <thead>
                                                            <tr>
                                                                <th>LOT</th>
                                                                <th>최고응찰금액</th>
                                                                <th>낙찰가</th>
                                                                <th>현황</th>
                                                            </tr>
                                                            </thead>
                                                        </table>
                                                    </div>
                                                    <div class="my_lot_body">
                                                        <div class="mobile_scroll-type">
                                                            <!-- [0516].scroll-inner 테그추가 -->
                                                            <div class="scroll-inner">
                                                                <table class="table_base my_lot_table">
                                                                    <colgroup>
                                                                        <col width="44px">
                                                                        <col width="">
                                                                        <col width="">
                                                                        <col width="54px">
                                                                    </colgroup>
                                                                    <tbody>
                                                                    <tr ng-repeat="item in userBids">
                                                                        <td ng-bind="item.customer.lot_no"></td>
                                                                        <td ng-bind="item.bid_cost | currency"></td>
                                                                        <td ng-bind="item.max_bid_cost | currency"></td>
                                                                        <td><span class="lot-stat" ng-bind="item.winner_state | winnerText"></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <!-- // [0516].scroll-inner 테그추가 -->
                                                        </div>
                                                    </div>
                                                </div> <!--// my_lot_type2 -->

                                                <!-- 준회원 -->
                                                <div class="my_lot_type3" ng-show="paddNo <= 0"> <!-- 임시주석 클래스 blind_none -->
                                                    <p class="title">
                                                        라이브 경매 응찰은 <span>정회원부터 가능</span>합니다.
                                                    </p>
                                                    <p class="txt">
                                                        정회원은 유료로 운영되며 서울옥션이 발행하는 <br>
                                                        간행물(각종 도록, 전시 안내 등)을 받으실 수 있습니다.
                                                    </p>
                                                    <div class="member_price">
                                                        <!-- [0613]삭제
                          <p class="p_txt">정회원 연회비 : 라이브 경매 응찰은 사전 신청한 정회원만 가능합니다.</p>
                          // -->
                                                        <!-- <a href="#" class="btn btn_member">정회원 결제</a> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <!-- //mobile 버전 -->
                        </div>
                        <div class="section-footer">
                            <div class="tac">
                                <a class="btn btn_default " href="javascript:self.close();" role="button"><span>닫기</span></a>
                            </div>
                        </div>

                    </div>
                </section>

            </div>
        </div>
        <!-- //container -->
        <!-- stykey -->
        <div class="scroll_top-box">
            <div class="box-inner">
                <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
            </div>
        </div>
        <!-- // stykey -->
    </div>

    <!-- 전체 LOT 보기 -->
    <div class="m-ver">
        <aside class="allview_fixed-wrap">
            <div class="popup-dim"></div>
            <!-- [0712]외부영역 클릭 시 닫힘:class(js-modal) 추가 -->
            <div class="fixed-panel js-modal">
                <div class="panel-header">
                    <button class="js-fixed_total"><span>전체 LOT 보기</span><i class="icon-fixed_arrow-2x"></i></button>
                </div>
                <div class="panel-body">


                    <article class="bidding-offline-left">

                        <div class="lotlist-wrap">
                            <div class="lotlist-header">
                                <div class="header_top">
                                    <p class="totalcount"><span class="num">300</span> <span class="unit">LOT</span></p>
                                </div>

                                <div class="lotlist-tabmenu">

                                    <div class="btn_item">
                                        <a href="#" class="lot-btn_tabmenu on" role="button">근현대</a>
                                    </div>
                                    <div class="btn_item">
                                        <a href="#" class="lot-btn_tabmenu" role="button">고미술</a>
                                    </div>
                                    <div class="btn_item">
                                        <a href="#" class="lot-btn_tabmenu" role="button">시계</a>
                                    </div>

                                </div>
                            </div>
                            <div class="lotlist-tabCont">

                                <div class="mobile_scroll-type">
                                    <div class="lotlist-box">
                                        <ul class="lotlist-inner">
                                            <li class="lotitem bidded">
                                                <div class="js-select_lotitem lotitem_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="/images/temp/temp_img0.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-cont">
                                                        <div class="num-box">
                                                            <div class="num"><span class="snum">1</span> </div>
                                                        </div>
                                                        <div class="typo-box">
                                                            <div class="title"><span>데미안허스트</span></div>
                                                            <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn-lotChk js-work_heart on ">Favorite</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="lotitem live">
                                                <div class="js-select_lotitem lotitem_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="/images/temp/temp_img1.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-cont">
                                                        <div class="num-box">
                                                            <div class="num"><span class="snum">1</span> </div>
                                                        </div>
                                                        <div class="typo-box">
                                                            <!-- [0516]년도삭제 리스트공통// -->
                                                            <div class="title"><span>데미안허스트</span></div>
                                                            <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn-lotChk js-work_heart ">Favorite</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="lotitem">
                                                <div class="js-select_lotitem lotitem_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="/images/temp/temp_img2.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-cont">
                                                        <div class="num-box">
                                                            <div class="num"><span class="snum">1</span> </div>
                                                        </div>
                                                        <div class="typo-box">
                                                            <!-- [0516]년도삭제 리스트공통// -->
                                                            <div class="title"><span>데미안허스트</span></div>
                                                            <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn-lotChk js-work_heart ">Favorite</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="lotitem">
                                                <div class="js-select_lotitem lotitem_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="/images/temp/temp_img3.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-cont">
                                                        <div class="num-box">
                                                            <div class="num"><span class="snum">1</span> </div>
                                                        </div>
                                                        <div class="typo-box">
                                                            <!-- [0516]년도삭제 리스트공통// -->
                                                            <div class="title"><span>데미안허스트</span></div>
                                                            <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn-lotChk js-work_heart ">Favorite</button>
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
                                            <li class="lotitem">
                                                <div class="js-select_lotitem lotitem_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="/images/temp/temp_img4.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-cont">
                                                        <div class="num-box">
                                                            <div class="num"><span class="snum">1</span> </div>
                                                        </div>
                                                        <div class="typo-box">
                                                            <!-- [0516]년도삭제 리스트공통// -->
                                                            <div class="title"><span>데미안허스트</span></div>
                                                            <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn-lotChk js-work_heart ">Favorite</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="lotitem">
                                                <div class="js-select_lotitem lotitem_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img src="/images/temp/temp_img4.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-cont">
                                                        <div class="num-box">
                                                            <div class="num"><span class="snum">1</span> </div>
                                                        </div>
                                                        <div class="typo-box">
                                                            <!-- [0516]년도삭제 리스트공통// -->
                                                            <div class="title"><span>데미안허스트</span></div>
                                                            <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn-lotChk js-work_heart ">Favorite</button>
                                                        </div>
                                                    </div>
                                                </div>
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
    <%-- //전체 lot 보기 --%>
    </div>


    <!-- 통화안내 -->
    <div id="money_help-wrap" class="trp popupfixed-wrap auction_info-popup  ">
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
                                        <img class="only_ib-pc" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                        <img class="only_ib-mb" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                    </div>
                                    <div class="title"><span>Seoul Auction 안내</span></div>
                                    <div class="gray-box">
                                        <ul class="mark_dot-list">
                                            <!-- [0613]텍스트수정 -->
                                            <li>원화(KRW) 이외의 통화는 해외 응찰자들의 참고를 위해 제공됩니다.</li>
                                            <!-- //[0613]텍스트수정 -->
                                            <li>모든 응찰 및 결제는 원화(KRW)로 이뤄집니다.</li>
                                            <li>서울옥션은 환율 적용 과정에서 생기는 차이 및 실수에 대해서 책임을
                                                부담하지 않습니다.</li>
                                        </ul>
                                    </div>

                                    <div class="check-box">
                                        <span class="trp checkbox-box">
                                            <input id="checkbox_check" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox_check">동의합니다.</label>
                                        </span>
                                    </div>
                                    <div class="btn_set-float tac">
                                        <button class="btn btn_point js-checkbox_check" onclick="confirmEnd()"><span>확인</span></button>
                                    </div>
                                </article>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../../common/commonJs.jsp"/>
    <jsp:include page="../../common/commonJSNotMain.jsp"/>
    <script src="/js/pages_common_ko.js" type="text/javascript"></script>


    <%-- 전체 lot 보기 --%>
    <script>
        $(".allview_fixed-wrap .js-fixed_total").trpToggleBtn(function($this) {
            $($this).addClass("on");
            $($this).closest(".allview_fixed-wrap").addClass("active");
        }, function($this) {
            $($this).removeClass("on");
            $($this).closest(".allview_fixed-wrap").removeClass("active");
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


    <!-- youtube -->
    <script>
        var tag = document.createElement('script');

        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        var player;

        function onYouTubeIframeAPIReady() {
            player = new YT.Player('thevideo', {
                height: '360',
                width: '640',
                videoId: 'IwATrgHOefo'
            });
        }

        $('.video_wrap').on('click', function ($e) {
            $e.preventDefault();
            player.playVideo();
            $('.video_thumbnail').hide();
            $('.ic_video_play').hide();
        })

        function Scope() {
            var scope = angular.element(document.getElementById("container")).scope();
            return scope;
        }
        function confirmEnd() {
            $(".js-closepop").click();
            Scope().selectedCurrencyType = Scope().currencyType;
            Scope().$apply();
        }
        /* 통화 전환 시 */
        function selectCurrency(){
            const Currency = document.getElementsByName('js-money_help');

            var money_help = $(".js-money_help").trpLayerFixedPopup("#money_help-wrap");
            $(money_help.getBtn).on("click", function($e) {
                $e.preventDefault();
                money_help.open(this); // or false
                popup_fixation("#money_help-wrap");
            });

            $("body").on("click", "#money_help-wrap .js-closepop, #money_help-wrap .popup-dim", function($e) {
                $e.preventDefault();
                money_help.close();
            });

            $("#checkbox_check").on("change", function($e) {
                console.log(" $(this).val() >>>", $(this).prop("checked"))
                if ($(this).prop("checked")) {
                    $(".js-checkbox_check").prop("disabled", false);
                } else {
                    $(".js-checkbox_check").prop("disabled", true);
                }
            });
        }
    </script>
    <script>
        <!-- angular js -->
        app.value('locale', 'ko');
        app.value('is_login', false);
        app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

        // 현재가 처리
        app.filter('currency', function(){
            return function(val) {
                if (val == undefined || val === "") {
                    return val;
                }
                return val.toLocaleString('ko-KR');
            };
        })


        app.filter('floorUserCheck', function(){
            return function(val) {
                if (val == undefined || val === "") {
                    return '현장응찰';
                }
                return val;
            };
        })



        // 위너 처리
        app.filter('winnerText', function(){
            return function(val) {
                switch (val){
                    case 0:
                       return '';
                    case 1:
                       return '';
                    case 2:
                       return '낙찰';
                    default:
                       return '';
                }
            };
        })

        app.controller('ctl', function ($scope, consts, common, is_login, locale) {

            $scope.is_login = is_login;
            $scope.locale = locale;
            $scope.saleNo = ${saleNo};
            $scope.searchSaleInfoAll = [];
            $scope.selectLotTag = "전체";
            $scope.viewers = 0;
            $scope.userTabMenu = 1;
            $scope.paddNo = 0;
            $scope.curLot = {};
            $scope.userId = '${member.loginId}';
            $scope.custNo = ${member.userNo};
            $scope.notice = {
                msg: "라이브 경매에 오신것을 환영합니다.",
            }
            $scope.userBids = [];

            $scope.currencyTypes = [{
                name: "KRW", value: "KRW"
            }, {
                name: "USD", value: "USD"
            }, {
                name: "HKD", value: "HKD"
            }, {
                name: "JPY", value: "JPY"
            }, {
                name: "EUR", value: "EUR"
            },];

            $scope.currencyType = "KRW";
            $scope.selectedCurrencyType = "KRW";

            $scope.moveCurrent = function(){
                $scope.userLot = $scope.curLot;
            }

            $scope.showLot = function(saleNo, lotNo){
                for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                    if ($scope.saleInfoAll[i].SALE_NO === saleNo &&
                        $scope.saleInfoAll[i].LOT_NO === lotNo) {
                        $scope.userLot = $scope.saleInfoAll[i];
                        break
                    }
                }
            }

            $scope.userBidHist = function () {
                // get current_lot
                let func = async function () {
                    let url = '';
                    if (window.location.protocol !== "https:") {
                        url = 'http://dev-bid.seoulauction.xyz/user/bid/hist';
                    } else {
                        url = 'https://dev-bid.seoulauction.xyz/init2';
                    }
                    let resp = await fetch(url, {
                        method: "POST", body: JSON.stringify({
                            token:   $scope.token,
                            sale_no: $scope.saleNo,
                            lot_no:  0,
                            paddle:  $scope.paddNo,
                            cust_no: $scope.custNo,
                            user_id: '${member.loginId}',
                        }),
                    });
                    return resp;
                }
                func();
            }

            $scope.selectCurrency = function (){
                var money_help = $(".js-money_help").trpLayerFixedPopup("#money_help-wrap");
                money_help.open(this);
                popup_fixation("#money_help-wrap");
                $("body").on("click", "#money_help-wrap .js-closepop, #money_help-wrap .popup-dim", function($e) {
                    $e.preventDefault();
                    money_help.close();
                });
                //$scope.$apply();
            }

            $scope.goLot = function (saleNo, lotNo) {
                window.location.href = '/auction/live/view/' + saleNo + '/' + lotNo;
            }
            $scope.favorite = function (item) {
                if(!checkLogin()){
                    return;
                }
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

            const getLotTags = (saleNo) => {
                try {
                    return axios.get('/api/auction/lotTag/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            }

            const getPaddle = (saleNo) => {
                try {
                    return axios.get('/api/auction/paddles/${saleNo}');
                } catch (error) {
                    console.error(error);
                }
            }

            $scope.searchLotTags = function (lotTag) {
                $scope.selectLotTag = lotTag;
                let pp = [];
                if (lotTag === '전체') {
                    $scope.saleInfo = $scope.saleInfoAll;
                    return;
                }
                for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                    if ($scope.saleInfoAll[i].LOT_TAG === lotTag) {
                        pp.push($scope.saleInfoAll[i]);
                    }
                }
                $scope.saleInfo = pp;
            }

            // 호출 부
            $scope.load = function () {
                let run = async function () {
                    let [r1, r2, r3, r4] = await Promise.all([getSaleInfo($scope.saleNo),
                        getSaleImages($scope.saleNo),
                        getLotTags($scope.saleNo),
                        getPaddle($scope.saleNo)]);
                    $scope.saleInfoAll = r1.data.data;
                    $scope.saleImages = r2.data.data;
                    $scope.lotTags = r3.data.data;
                    $scope.paddNo = r4.data.data;
                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if ($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW != null) {
                            $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].IS_END_BID = false;
                        }
                    }
                    $scope.lotTags.unshift({
                        LOT_TAG: '전체',
                    })
                    if ($scope.lotTags.length > 0) {
                        $scope.saleInfo = $scope.saleInfoAll;
                        //$scope.searchLotTags($scope.lotTags[0].LOT_TAG);
                    }
                    $scope.$apply();
                    // 웹소켓 수행
                }
                run();
            }

            // 하단 탭메뉴
            $scope.selectUserTab = 1;
            $scope.userTab = function (tabMenu) {
                $scope.selectUserTab = tabMenu;
                if (tabMenu == 2) {
                    $scope.userBidHist()
                }
            }

            // connect 정보
            $scope.connectInfo = {};
            // 커넥션시도횟수
            $scope.conTryCnt = 0;
            // 비딩 종료 시간
            $scope.endBidTime = 0;
            // 비딩 종료 여부
            $scope.isEndBid = false;
            // 모든 비딩 정보
            $scope.bidsInfoAll = [];

        });
    </script>
</div>
<script type="text/javascript" src="https://llrtsprod.s.llnwi.net/v1/sdk/html/current/llnwrtssdk.min.js"></script>
<script src="/js/simple.js?ver=1.0.0"></script>
</body>
</html>