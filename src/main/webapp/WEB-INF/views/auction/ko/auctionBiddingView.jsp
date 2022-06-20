<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>오프라인 응찰하기 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css"/>
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">

    <%--angular 관련은 미리 로딩--%>
    <jsp:include page="../../common/angular.jsp" flush="false"/>
    <!-- //header -->
</head>
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
        <div id="container" ng-controller="ctl" data-ng-init="load();">
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
                                <div class="select-box">
                                    <select class="" id="">
                                        <option value="1">KRW</option>
                                        <option value="2">USD</option>
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
                                                            <li ng-class="{lotitem: saleInfo !== null, bidded: item.CUR_YN ==='Y', cancel: item.DISP_YN ==='N'}"
                                                                ng-repeat="item in saleInfo">
                                                                <div ng-if="item.DISP_YN === 'Y'"
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
                                                                            <span class=""
                                                                                  ng-bind="item.CUR_COST"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <p ng-if="item.DISP_YN === 'N'" class="txt">
                                                                    LOT {{item.LOT_NO}} <br>
                                                                    출품이 취소되었습니다.
                                                                </p>
                                                                <button ng-if="item.DISP_YN === 'Y'"
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
                                                <video id="llnw-rts-subscriber" width="582" height="331" autoplay controls muted>
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
                                            <div class="my_lot_info">
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
                                            <div class="my_lot_wrap">
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
                                                                        <td><span class="lot-stat" ng-bind="item.is_winner | isWinner"></span></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <!-- //[0516].scroll-inner 테그추가 -->
                                                        </div>
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
                                                            <span>KRW {{curLot.EXPE_PRICE_FROM_JSON.KRW}} ~ {{curLot.EXPE_PRICE_TO_JSON.KRW}}</span>
                                                        </div>
                                                        <div class="price_other">
                                                            <span>(USD {{curLot.EXPE_PRICE_FROM_JSON.en}})</span></div>
                                                    </div>
                                                </figcaption>
                                            </div>
                                            <div class="biddingprice_wrap">
                                                <div class="now_price">
                                                    <p class="txt">현재가</p>
                                                    <p class="price_unit1" ng-bind="curLot.bid_cost"></p>
                                                    <p class="price_unit2"></p>
                                                </div>
                                                <div class="bid_price">
                                                    <!-- [0603]버튼수정 : 로그인버튼 없앰 -->
                                                    <button class="btn_bid" ng-click="bid();">
                                                        <p class="txt">응찰하기</p>
                                                        <p class="price_unit1" ng-bind="curLot.bid_new_cost"></p>
                                                        <p class="price_unit2"></p>
                                                    </button>
                                                    <!-- //[0603]버튼수정 : 로그인버튼 없앰 -->
                                                </div>
                                            </div>
                                        </figure>
                                        <div class="bidding_situation">
                                            <div class="alert_wrap">
                                                <p class="situ_alert" ng-bind="notice.msg"></p>
                                            </div>
                                            <div class="mCustomScrollbar">
                                                <ul class="situation_list">
                                                    <li class="st_item" ng-repeat="item in bidHist">
                                                        <p class="txt" ng-bind="item.customer.user_id"></p>
                                                        <p class="price " ng-bind="item.bid_cost"></p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>

                        </div>
                        <div class="section-footer">
                            <div class="tac">
                                <a class="btn btn_default " href="#" role="button"><span>닫기</span></a>
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

    <jsp:include page="../../common/commonJs.jsp" flush="false"/>
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
    </script>
    <script>
        <!-- angular js -->
        app.value('locale', 'ko');
        app.value('is_login', false);
        app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

        // 현재가 처리
        app.filter('currency', function(){
            return function(val) {
                return val.toLocaleString('ko-KR');
            };
        })

        // 위너 처리
        app.filter('isWinner', function(){
            return function(val) {
                return (val?'낙찰':'')
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
                        url = 'http://localhost:8002/user/bid/hist';
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

            $scope.goLot = function (saleNo, lotNo) {
                window.location.href = '/auction/online/view/' + saleNo + '/' + lotNo;
            }
            $scope.favorite = function (item) {
                if ($scope.custNo === 0) {
                    alert('로그인을 진행해주세요.');
                    location.href = "/login";
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
                    $scope.bidstart('${member.loginId}', ${member.userNo});
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

            /*################ 웹소켓 #################*/
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

            let con_try_cnt = 0;
            // 웹소켓

            let w;

            let is_end_bid;

            // bidstart
            $scope.bidstart = function (user_id, custNo) {
                $scope.retry(parseInt($scope.saleNo), 0, 1, user_id, custNo);
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
                    w = new WebSocket("ws://localhost:8002/ws");
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
                            $scope.con_try_cnt++;
                            $scope.websocketTimeout = window.setTimeout(function () {
                                $scope.retry(saleNo, lotNo, saleType, userId, custNo);
                            }, 1000);
                        }
                    }
                }
                w.onmessage = function (evt) {
                    $scope.proc(evt, saleNo, lotNo, saleType, userId, custNo);
                }
                $scope.con_try_cnt = 0;
            }
            // 1회 응찰
            $scope.bid = function () {
                console.log('$scope.custNo', $scope.custNo)
                if ($scope.custNo === 0) {
                    location.href = "/login";
                    return;
                }
                let url = '';
                if (window.location.protocol !== "https:") {
                    url = 'http://localhost:8002/bid';
                } else {
                    url = 'https://localhost:8002/bid';
                }
                fetch(url, {
                    method: "POST", body: JSON.stringify({
                        customer: {
                            sale_no: $scope.saleNo,
                            lot_no: $scope.curLot.LOT_NO,
                            paddle: $scope.paddNo,
                            user_id: $scope.userId,
                            cust_no: $scope.custNo,
                            token: $scope.token,
                            sale_type: 1,
                            bid_type: 11,
                        },
                        bid_cost: $scope.curLot.bid_new_cost_num
                    }),
                });
            }

            // bid protocols
            $scope.proc = function (evt, saleNo, lotNo, saleType, userId, custNo) {
                const packet_enum = {
                    init: 1, bid_info: 2, time_sync: 3, bid_info_init: 4, end_time_sync: 5, winner: 6, viewers: 7, user_bid_hist: 8, lot_change:9
                }
                let d = JSON.parse(evt.data);
                if (d.msg_type === packet_enum.init) {
                    // 현재 토큰정보
                    $scope.token = d.message.token;
                    let init_func_manual = async function (req) {
                        let url = '';
                        if (window.location.protocol !== "https:") {
                            url = 'http://localhost:8002/init';
                        } else {
                            url = 'https://dev-bid.seoulauction.xyz/init';
                        }
                        let response = await fetch(url, {
                            method: "POST", body: JSON.stringify({
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
                        let curCostValue = (d.message.bid[len - 1].bid_cost === 0) ? "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR') : "KRW " + d.message.bid[len - 1].bid_cost.toLocaleString('ko-KR');

                        // 앵귤러 정보 삽입
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                            if (parseInt($scope.saleInfoAll[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no && parseInt($scope.saleInfoAll[i].LOT_NO) === d.message.bid[len - 1].customer.lot_no) {
                                $scope.saleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                                $scope.saleInfoAll[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                                $scope.saleInfoAll[i].BID_COST = curCostValue;

                                // 현재 랏의 새로운 응찰가 세팅
                                d.message.bid[len - 1].cur_cost = d.message.bid[len - 1].bid_cost;
                                $scope.curLot.bid_cost = curCostValue;


                                // 다음 응찰가
                                $scope.curLot.bid_new_cost = "KRW " + (((d.message.bid[len - 1].bid_cost === 0)
                                    ? d.message.bid[len - 1].open_bid_cost
                                    : d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote).toLocaleString('ko-KR');

                                $scope.curLot.bid_new_cost_num = (((d.message.bid[len - 1].bid_cost === 0)
                                    ? d.message.bid[len - 1].open_bid_cost
                                    : d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote)

                                d.message.bid[len - 1].bid_cost = curCostValue;

                                // 현재 랏정보 저장
                                $scope.bidHist.push(d.message.bid[len - 1]);

                                let v = $scope.bidHist;

                                if (v.length > 0) {
                                    // 응찰가 높은 순
                                    v.sort(function (a, b) {
                                        if (a.cur_cost > b.cur_cost) return -1;
                                        if (a.cur_cost === b.cur_cost) return 0;
                                        if (a.cur_cost < b.cur_cost) return 1;
                                    });
                                }


                                $scope.bidHist = v;
                                $scope.notice.msg = d.message.notice;
                                break
                            }
                        }

                        // 앵귤러 정보 삽입
                        for (let i = 0; i < $scope.saleInfo.length; i++) {
                            if (parseInt($scope.saleInfo[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no
                                && $scope.saleInfo[i].LOT_NO === d.message.bid[len - 1].customer.lot_no) {
                                $scope.saleInfo[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                                $scope.saleInfo[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                                $scope.saleInfo[i].CUR_COST = curCostValue;
                                break
                            }
                        }
                        $scope.$apply();
                        $scope.userBidHist();
                    }
                } else if (d.msg_type === packet_enum.time_sync) {
                    // 비드 틱 필요 없음
                    console.log(d.message.tick_value);
                } else if (d.msg_type === packet_enum.bid_info_init) {
                    if (d.message.is_list_popup) {
                        let bid_hist_info = d.message.bids_hist;
                        let bid_info = d.message.bids[0];
                        $scope.curLot.bid_new_cost = "KRW " + (((bid_info.bid_cost === 0)
                            ? bid_info.open_bid_cost
                            : bid_info.bid_cost) + bid_info.bid_quote).toLocaleString('ko-KR');

                        $scope.curLot.bid_new_cost_num = (((bid_info.bid_cost === 0)
                            ? bid_info.open_bid_cost
                            : bid_info.bid_cost) + bid_info.bid_quote)

                        $scope.viewers = d.message.viewers;

                        $scope.curLot.bid_cost = "KRW " + (((bid_info.bid_cost === 0)
                            ? bid_info.open_bid_cost
                            : bid_info.bid_cost)).toLocaleString('ko-KR');

                        if (bid_hist_info != null && bid_hist_info.length > 0) {
                            for (let i = 0; i < bid_hist_info.length; i++) {
                                if (bid_hist_info[i].value != null) {
                                    // 현재 랏의 새로운 응찰가 세팅
                                    $scope.bidHist = bid_hist_info[i].value;
                                    for (let j = 0; j < $scope.bidHist.length; j++) {
                                        $scope.bidHist[j].cur_cost = $scope.bidHist[j].bid_cost;
                                        $scope.bidHist[j].bid_cost = "KRW " + $scope.bidHist[j].bid_cost.toLocaleString('ko-KR');
                                    }
                                    break
                                }
                            }
                        }
                        let v = $scope.bidHist;
                        if (v != null) {
                            // 응찰가 높은 순
                            v.sort(function (a, b) {
                                if (a.cur_cost > b.cur_cost) return -1;
                                if (a.cur_cost === b.cur_cost) return 0;
                                if (a.cur_cost < b.cur_cost) return 1;
                            });
                        } else {
                            v = [];
                        }
                        $scope.bidHist = v;
                        $scope.$apply();
                        return;
                    } else {
                        if (d.message.bids != null && d.message.bids.length > 0) {
                            $scope.bidsInfoAll = d.message.bids;
                            $scope.viewUsers = d.message.bids[0].view_users;
                            let matching = new Map();

                            // 정보를 처음 가져왔을 때, 인덱스 매핑
                            for (let i = 0; i < $scope.bidsInfoAll.length; i++) {
                                matching.set($scope.bidsInfoAll[i].customer.sale_no + "-"
                                    + $scope.bidsInfoAll[i].customer.lot_no, i);
                            }

                            // 현재 curInfo 정보 변경
                            for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                                if ($scope.saleInfoAll[j].LOT_NO === $scope.bidsInfoAll[0].cur_lot_no) {
                                    $scope.curLot = $scope.saleInfoAll[j];
                                    $scope.userLot = $scope.curLot;
                                    //console.log(" $scope.curLot",  $scope.curLot);
                                    break;
                                }
                            }

                            for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                                let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-"
                                    + $scope.saleInfoAll[j].LOT_NO);
                                if (idx !== undefined) {
                                    let curCostValue = ($scope.bidsInfoAll[idx].bid_cost === 0) ? "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR') : "KRW " + $scope.bidsInfoAll[idx].bid_cost.toLocaleString('ko-KR');
                                    // 시작일자
                                    $scope.saleInfoAll[j].START_COST = "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR');
                                    // 현재가
                                    $scope.saleInfoAll[j].CUR_COST = curCostValue;

                                    // 낙찰이 완료 되었다면
                                    if ($scope.bidsInfoAll[idx].is_winner) {
                                        $scope.bidsInfoAll[idx].IS_END_BID = true;
                                    }
                                }
                            }

                            // 모두 낙찰되었다면 종료
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

                            // get current_lot
                            let currentLotInfoFunc = async function (token, saleNo, lotNo, saleType) {
                                let url = '';
                                if (window.location.protocol !== "https:") {
                                    url = 'http://localhost:8002/init2';
                                } else {
                                    url = 'https://dev-bid.seoulauction.xyz/init2';
                                }
                                let resp = await fetch(url, {
                                    method: "POST", body: JSON.stringify({
                                        token: token,
                                        sale_no: saleNo,
                                        lot_no: lotNo,
                                        sale_type: saleType,
                                        user_id: '${member.loginId}',
                                    }),
                                });
                                return resp;
                            }
                            // 현재 랏정보 가져옴
                            currentLotInfoFunc($scope.token, saleNo, $scope.curLot.LOT_NO, saleType);
                            //$scope.$apply();
                        }
                    }
                } else if (d.msg_type === packet_enum.winner) {
                    if (d.message != null) {
                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            if ($scope.saleInfoAll[j].SALE_NO === d.message.sale_no && $scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
                                // 낙찰가
                                $scope.saleInfoAll[j].SUCEED_COST = 0;
                                // 현재 랏정보
                                $scope.CUR_LOT_NO = d.message.cur_lot_no;
                                // 현재 랏 정보 삽입
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
                } else if (d.msg_type === packet_enum.viewers) {
                    $scope.viewers = d.message.viewers;
                }  else if (d.msg_type === packet_enum.user_bid_hist) {
                    $scope.userBids = d.message;
                    $scope.$apply();
                } else if (d.msg_type === packet_enum.lot_change) {
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].LOT_NO === d.message.cur_lot_no) {
                            $scope.curLot = $scope.saleInfoAll[j];
                            break;
                        }
                    }
                    $scope.$apply();
                }
            }
        });
    </script>
</div>
<script src="/js/simple.js?ver=1.0.0"></script>
</body>
</html>