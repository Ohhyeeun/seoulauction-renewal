<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>오프라인 경매 | Seoul Auction</title>
    <!-- //header -->
</head>

<c:set var="isRegular" value="false" />
<sec:authorize access="hasAuthority('ROLE_REGULAR_USER')">
    <c:set var="isRegular" value="true" />
</sec:authorize>
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

                    <!-- page title (ing, view)   -->
                    <section class="page_title-section list_page-section">
                        <div class="section-inner full_size">
                            <div class="padding-inner">
                                <article class="auction_head_info-article">
                                    <div class="center-box view">
                                        <h2 class="page_title"><span class="th1">{{sale.TITLE_JSON['ko']}}</span></h2>

                                        <ul class="event_day-list">
                                            <li><span class="colorB2">프리뷰</span><span class=""> : {{sale.PREV_FROM_DT | date:'MM.dd'+'('+getWeek(sale.PREV_FROM_DT)+')'}} - {{sale.PREV_TO_DT| date:'MM.dd'+'('+getWeek(sale.PREV_TO_DT)+')'}}</span>
                                            </li>
                                            <li><span class="colorB2">경매일</span><span
                                                    class=""> : {{sale.TO_DT | date:'MM.dd'+'('+getWeek(sale.TO_DT)+')'}}</span></li>
                                        </ul>
                                        <div class="btn_set">
                                            <a class="btn btn_white " href="#" target="_blank" ng-href="/notices/{{sale.WRITE_NO}}" role="button" ng-if="sale.WRITE_NO > 0"><span>안내사항</span></a>
                                            <a class="btn btn_white " href="#" role="button"><span>E-BOOK</span></a>
                                            <a class="btn btn_white " href="#" role="button"><span>VR보기</span></a>
                                        </div>
                                    </div>
                                </article>

                                <%--라이브 응찰 신청기간--%>
                                <article class="proceeding-article" ng-if="sale.LIVE_BID_YN == 'Y'">
                                    <a href="#" ng-click="goLiveBid()" class="js-terms_required">
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
                                <div class="panel-body">
                                    <article class="search_tab-article">
                                        <div class="article-body">
                                            <div class="col_item mb-col1">
                                                <!-- [0617]카운트/LOT셀렉트박스 분리 -->
                                                <div class="count tb1">
                                                    <span>ALL <em>{{saleInfoAll.length}}</em></span>
                                                </div>
                                                <div class="select-box">
                                                    <div class="trp-dropdown-area h42-line">
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

                    <section class="basis-section last-section auction_list-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-product_list">
                                <div class="panel-body">

                                    <ul class="product-list">
                                        <li class="" ng-repeat="item in saleInfo">
                                            <div class="li-inner">
                                                <article class="item-article">
                                                    <div class="image-area">
                                                        <figure class="img-ratio">
                                                            <a href="/auction/live/view/{{item.SALE_NO}}/{{item.LOT_NO}}" target="_blank">
                                                                <div class="img-align">
                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"  alt="">
                                                                </div>
                                                            </a>
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
                                                                    <span class="text-over span_block">{{item.LOT_TITLE_JSON.ko}}</span></div>
                                                                <div class="standard">
                                                                    <span class="text-over span_block">{{item.CD_NM}}</span>
                                                                    <div class="size_year">
                                                                        <span>{{item.SIZE1}} X {{item.SIZE2}} X {{item.SIZE3}}</span>
                                                                       <%-- <span>{{item.MAKE_YEAR_JSON.ko}}</span>--%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="price-box">
                                                                <dl class="price-list">
                                                                    <dt>추정가</dt>

                                                                    <div ng-switch on="item.EXPE_PRICE_INQ_YN">
                                                                        <div ng-switch-when="Y">
                                                                            <dd>별도 문의</dd>
                                                                            <dd> </dd>
                                                                        </div>
                                                                        <div ng-switch-when="N">
                                                                            <dd>KRW {{item.EXPE_PRICE_FROM_JSON.KRW}}</dd>
                                                                            <dd>~ {{item.EXPE_PRICE_TO_JSON.KRW}}</dd>
                                                                        </div>
                                                                    </div>

                                                                </dl>
                                                            </div>
                                                            <div id="biding_req" class="bidding-box col_2">
                                                                <div class="deadline_set"><span>신청마감 {{ item.LOT_EXPIRE_DATE_HAN }}</span></div>
                                                                <div class="btn_set"><a class="btn btn_point" href="" ng-click="moveToBidding(item)"
                                                                                        role="button"><span>서면/전화 응찰 신청</span></a></div>
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

                </div>
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
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/auction/auctionLiveList.js" type="text/javascript"></script>
    <script>
        var terms_required = $(".js-terms_required").trpLayerFixedPopup("#terms_required-wrap");
        var paddle_number = $(".js-paddle_number").trpLayerFixedPopup("#paddle_number-wrap");

        app.value('locale', 'ko');
        app.value('is_login', true);

        app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

        app.controller('ctl', function ($scope, consts, common, is_login, locale, $filter) {
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
                window.location.href = '/auction/live/view/' + saleNo + '/' + lotNo;
            }

            $scope.favorite = function(item) {

                if (sessionStorage.getItem("is_login") === 'false') {
                    alert('로그인을 진행해주세요.');
                    location.href = "/login";
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

            $scope.moveToBidding = function(item) {

                //로그인 했는지 여부.
                if (sessionStorage.getItem("is_login") === 'false') {
                    alert('로그인을 진행해주세요.');
                    location.href = "/login";
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

            $scope.goLiveBid = function(item) {
                if(sessionStorage.getItem("is_login") === 'false'){
                    alert("미로그인");
                    location.href = "/login";
                    return;
                }

                const membership_yn = '${isRegular}';
                if(membership_yn === 'N') {
                    alert("준회원");
                    location.href = "/payment/member";
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

            $scope.goLiveBidAgree = function() {
                if($(".js_all-terms #checkbox_all").is(":checked")) {
                    axios.post('/api/auction/paddle', {sale_no : '${saleNo}'})
                        .then(function (response) {
                            if (response.data.success) {
                                $scope.paddNo = response.data.data;
                                $("em#paddle-number").html($scope.paddNo+"번");
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
                await axios.get('/api/auction/sales/' + saleNo)
                    .then(function (response) {
                        if (response.data.success) {
                            $scope.sale = response.data.data;
                            $scope.sale.TITLE_JSON = JSON.parse($scope.sale.TITLE_JSON);

                            var S_DB_NOW = $filter('date')($scope.sale.DB_NOW, 'yyyyMMddHHmm');
                            var S_DB_NOW_D = $filter('date')($scope.sale.DB_NOW, 'yyyyMMdd');
                            var FROM_DT_D = $filter('date')($scope.sale.FROM_DT, 'yyyyMMdd');
                            var TO_DT_D = $filter('date')($scope.sale.TO_DT, 'yyyyMMdd');
                            var END_DT = $filter('date')($scope.sale.END_DT, 'yyyyMMddHHmm');
                            var LIVE_START_DT = $filter('date')($scope.sale.LIVE_BID_DT, 'yyyyMMddHHmm');
                            // 오프라인 경매인 경우에는 SALE.TO_DT는 YYYY.MM.DD로 체크. 비교 서버시간은 S_DB_NOW_D (YDH. 2016.10.05)

                            //라이브 응찰 시간 체크
                            $scope.liveEnd = TO_DT_D;
                            $scope.nowTime = S_DB_NOW_D;
                            $scope.liveStartDt = LIVE_START_DT;
                            $scope.liveCheckDt = S_DB_NOW;

                            if (FROM_DT_D > S_DB_NOW_D && TO_DT_D > S_DB_NOW_D) {
                                $scope.sale_status = "READY";
                            } else if (FROM_DT_D <= S_DB_NOW_D && $scope.sale.CLOSE_YN != 'Y') {
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
                    return axios.get('/api/auction/list/${saleNo}?is_live=Y');
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

            // 호출 부
            $scope.load = function () {
                let run = async function () {
                    let [r1, r2, r3] = await Promise.all([getSaleInfo($scope.sale_no), getSaleImages($scope.sale_no), getLotTags($scope.sale_no)]);

                    $scope.saleInfoAll = r1.data.data;

                    //데이터가 없을 시 , 오프라인 경매인데 온라인으로 올 시 등등 접근 불가.
                    if($scope.saleInfoAll.length === 0){
                        alert('잘못된 접근 입니다.');
                        history.back();
                    }

                    $scope.saleImages = r2.data.data;
                    $scope.lotTags = r3.data.data;


                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {

                        //영문 요일 -> 한국 요일로 치환처리.
                        $scope.saleInfoAll[i].LOT_EXPIRE_DATE_HAN = $scope.saleInfoAll[i].LOT_EXPIRE_DATE_TIME_T.replace($scope.saleInfoAll[i].LOT_EXPIRE_DATE_DAY ,  enDayToHanDay($scope.saleInfoAll[i].LOT_EXPIRE_DATE_DAY) );

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

                    await $scope.setSale($scope.sale_no);
                    //get paddle number
                    $scope.paddNo = 0;
                    if(sessionStorage.getItem("is_login") === 'true'){
                        await axios.get('/api/auction/paddles/${saleNo}')
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
                    <%--$scope.bidstart('${member.loginId}', ${member.userNo});--%>
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
            $scope.bidstart = function () {
                $scope.retry(parseInt($scope.sale_no), 0, 2, "KYUNGHOON");
            }

            // websocket connection retry
            $scope.retry = function (saleNo, lotNo, saleType, userId) {
                window.clearTimeout($scope.websocketTimeout);
                if (w != null) {
                    w = null;
                }
                if (con_try_cnt > 5) {
                    con_try_cnt = 0
                    return
                }
                w = new WebSocket("ws://dev-bid.seoulauction.xyz/ws");
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
                                $scope.retry(saleNo, lotNo, saleType, userId);
                            }, 1000);
                        }
                    }
                }
                w.onmessage = function (evt) {
                    $scope.proc(evt, saleNo, lotNo, saleType, userId);
                }
                con_try_cnt = 0;
            }

            // bid protocols
            $scope.proc = function (evt, saleNo, lotNo, saleType, userId) {
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

                    let init_func_manual = async function (req) {
                        let response = await fetch('http://dev-bid.seoulauction.xyz/init', {
                            method: "POST",
                            body: JSON.stringify({
                                token: req.message.token,
                                sale_no: saleNo,
                                lot_no: 0,
                                sale_type: saleType,
                                user_id: userId,
                            }),
                        });
                        return response;
                    }
                    init_func_manual(d);
                } else if (d.msg_type === packet_enum.bid_info) {
                    if (d.message.bid != null && d.message.bid.length > 0) {
                        let curCostValue = (d.message.bid[len - 1].bid_cost === 0) ?
                            "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR') :
                            "KRW " + d.message.bid[len - 1].bid_cost.toLocaleString('ko-KR');

                        // 앵귤러 정보 삽입
                        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                            if ($scope.saleInfoAll[j].SALE_NO === d.message.bid[len - 1].sale_no &&
                                $scope.saleInfoAll[j].LOT_NO === d.message.bid[len - 1].lot_no) {
                                $scope.saleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                                $scope.saleInfoAll[i].BID_COUNT = "(응찰" + d.message.bid[len - 1].bid_count + ")";
                                $scope.saleInfoAll[i].CUR_COST = curCostValue;
                            }
                        }

                        // 앵귤러 정보 삽입
                        for (let i = 0; i < $scope.searchSaleInfoAll.length; i++) {
                            if ($scope.searchSaleInfoAll[j].SALE_NO === d.message.bid[len - 1].sale_no &&
                                $scope.searchSaleInfoAll[j].LOT_NO === d.message.bid[len - 1].lot_no) {
                                $scope.searchSaleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                                $scope.searchSaleInfoAll[i].BID_COUNT = "(응찰" + d.message.bid[len - 1].bid_count + ")";
                                $scope.searchSaleInfoAll[i].CUR_COST = curCostValue;
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
                    if (d.message.bids != null && d.message.bids.length > 0) {
                        $scope.bidsInfoAll = d.message.bids;
                        let matching = new Map();
                        // 정보를 처음 가져왔을 때, 인덱스 매핑
                        for (let i = 0; i < $scope.bidsInfoAll.length; i++) {
                            matching.set($scope.bidsInfoAll[i].customer.sale_no + "-" +
                                $scope.bidsInfoAll[i].customer.lot_no, i);
                        }
                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-" +
                                $scope.saleInfoAll[j].LOT_NO);

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
                            $scope.saleInfoAll[j].END_DT =  $scope.bidsInfoAll[idx].end_bid_time;

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
                if(!$scope.$$phase) {
                    $scope.$apply();
                }

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

            $scope.paddleStatus = function () {
                console.log("paddleStatus");
                let paddNoteMsg = "라이브 응찰 신청";
                let paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";

                const is_login = sessionStorage.getItem("is_login");
                const membership_yn = '${isRegular}';
                const padd_no = $scope.paddNo;
                const sale_status = $scope.sale_status;

                const live_start_dt = $filter('date')($scope.liveStartDt, 'M/d');
                const live_start_dt_date = $scope.getWeek($scope.liveStartDt);
                const live_start_dt_hour = $filter('date')($scope.liveStartDt, 'H');
                const live_start_dt_minute = $filter('date')($scope.liveStartDt, 'm');

                console.log("paddleStatus ", is_login, membership_yn, padd_no, sale_status);
                if(sale_status == 'ING' && $scope.liveCheckDt >= $scope.liveStartDt) {
                    // 경매 당일 응찰하기
                    console.log("1");
                    if (is_login === 'true' && membership_yn === 'true' && padd_no > 0) {
                        paddNoteMsg = "라이브 경매 참가";
                        paddNoteEtc = "나의 패들번호 : ";
                    } else {
                        paddNoteMsg = "라이브 경매 보기";
                        paddNoteEtc = "사전 신청한 회원만 응찰 가능합니다.";
                    }
                } else if(sale_status == 'ING' && $scope.nowTime == $scope.liveEnd && $scope.liveCheckDt < $scope.liveStartDt) {
                    // 경매 당일 패들번호 출력
                    console.log("2");
                    if(is_login === 'true' && membership_yn === 'true' && padd_no > 0){
                        paddNoteMsg = "라이브 경매 신청완료";
                        paddNoteEtc = live_start_dt+"("+live_start_dt_date+") "+live_start_dt_hour+"시";
                        if(live_start_dt_minute > 0) paddNoteEtc += " "+live_start_dt_minute+"분";
                        paddNoteEtc += "에 시작합니다.";
                    } else {
                        paddNoteMsg = "라이브 경매 준비 중";
                        paddNoteEtc = live_start_dt+"("+live_start_dt_date+") "+live_start_dt_hour+"시";
                        if(live_start_dt_minute > 0) paddNoteEtc += " "+live_start_dt_minute+"분";
                        paddNoteEtc += "에 시작합니다.";
                    }
                } else if(sale_status == 'ING' && $scope.nowTime < $scope.liveEnd) {
                    // 경매 당일 전 신청하기 자동생성
                    console.log("3");
                    if(is_login === 'true' && membership_yn === 'true' && padd_no > 0){
                        paddNoteMsg = "라이브 경매 신청완료";
                        paddNoteEtc = live_start_dt+"("+live_start_dt_date+") "+live_start_dt_hour+"시";
                        if(live_start_dt_minute > 0) paddNoteEtc += " "+live_start_dt_minute+"분";
                        paddNoteEtc += "에 시작합니다.";
                    } else {
                        paddNoteMsg = "라이브 응찰 신청";
                        paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";
                    }
                }

                $scope.paddNoteMsg = paddNoteMsg;
                $scope.paddNoteEtc = paddNoteEtc;
                $scope.$apply();
            }
        });

    (function() {
        //약관체크
        $(".js_all-terms").trpCheckBoxAllsImg(".js_all", ".js_item");
    })();


    </script>

</body>

</html>