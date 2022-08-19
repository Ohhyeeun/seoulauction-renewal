<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<c:set var="isRegular" value="false" />
<c:set var="isEmployee" value="false" />
<sec:authorize access="hasAuthority('ROLE_REGULAR_USER')">
    <c:set var="isRegular" value="true" />
</sec:authorize>
<sec:authorize access="hasAuthority('ROLE_EMPLOYEE_USER')">
    <c:set var="isEmployee" value="true" />
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
                                        <h2 class="page_title">
                                            <span class="th1">{{saleInfoData.SALE_TH | localeOrdinal}} {{saleInfoData.TITLE_JSON['ko']}}</span>
                                        </h2>

                                        <ul class="event_day-list">
                                            <li>
                                                <span class="colorB2">프리뷰</span>
                                                <span> : {{saleInfoData.displayPreviewFromDate}} - {{saleInfoData.displayPreviewToDate}}</span>
                                            </li>
                                            <li><span class="colorB2">경매일</span>
                                                <span> : {{saleInfoData.displayBidDate}}</span>
                                            </li>
                                        </ul>
                                        <div class="btn_set">
                                            <a ng-if="saleInfoData.WRITE_NO > 0" target="_blank" ng-href="/footer/notice/{{saleInfoData.WRITE_NO}}" role="button" class="btn btn_white ">
                                                <span>안내사항</span>
                                            </a>
                                            <a ng-repeat="item in saleInfoData.buttonList" ng-click="goBrochure(item.id, item.content.url)" role="button" class="btn btn_white ">
                                                <span ng-bind="{'pdf':'E-BOOK', 'ebook':'E-BOOK', 'vr':'VR보기'}[item.content_type]"></span>
                                            </a>
                                        </div>
                                    </div>
                                </article>

                                <%--라이브 응찰 신청기간--%>
                                <article ng-if="saleInfoData.LIVE_BID_YN == 'Y'" class="proceeding-article" >
                                    <a ng-click="goLiveBid();" class="js-terms_required">
                                        <div class="article-inner">
                                            <div class="column view">
                                                <strong class="note_msg" id="note_msg">{{paddNoteMsg}}</strong>
                                            </div>
                                            <div class="column">
                                                <div class="note_etc">
                                                    <span id="note_etc">{{paddNoteEtc}}</span><strong>{{btnPaddleNo}}</strong>
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
                                                <li ng-class="{active: item.CD_ID === selectCategory}" ng-repeat="item in categories">
                                                    <a href="" ng-click="changeCategory(item.TYPE, item.CD_ID);"><span ng-bind="item.CD_NM"></span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <article class="search_tab-article">
                                        <div class="article-body">
                                            <%-- totalCount, Lotlist 레이어 --%>
                                            <div class="col_item mb-col1">
                                                <div class="count tb1">
                                                    <span>ALL <em ng-bind="lotTotalCount"></em></span>
                                                </div>
                                                <div class="select-box only-pc">
                                                    <div class="trp-dropdown-area h42-line">
                                                        <button class="js-dropdown-btn">
                                                            <span>LOT</span><i class="form-select_arrow_md"></i>
                                                        </button>
                                                        <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                            <div class="search-box">
                                                                <input type="search" placeholder="LOT 번호 입력" id="search_lot" class="">
                                                                <i class="form-search_md"></i>
                                                            </div>
                                                            <div class="list-box scroll-type">
                                                                <ul id="sale_lot_list">
                                                                    <li ng-repeat="item in saleImages" data-index="{{item.LOT_NO}}">
                                                                        <a href="#" ng-click="goLot(item.SALE_NO, item.LOT_NO)">
                                                                            <div class="image-area">
                                                                                <figure class="img-ratio">
                                                                                    <div class="img-align">
                                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="LOT {{item.LOT_NO}}">
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
                                            </div>
                                            <%--검색, 정렬필터, 페이지 방식--%>
                                            <div class="col_item mb-col2">
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

                    <section ng-show="lotList.length <= 0" class="basis-section auction_result_list-section last-section">
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

                    <section ng-show="lotList.length > 0" class="basis-section last-section auction_list-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-product_list">
                                <div class="panel-body">
                                    <ul class="product-list">
                                        <li ng-repeat="item in lotList" ng-class="{cancel: item.STAT_CD === 'reentry'}">
                                            <div class="li-inner">
                                                <%--출품취소--%>
                                                <article ng-if="item.STAT_CD === 'reentry'" class="item-article">
                                                    <div class="product_cancle-area">
                                                        <div class="area-inner">
                                                            <i class="icon-cancle_box"></i>
                                                            <div class="typo">
                                                                <div class="name"><span>LOT 1</span></div>
                                                                <div class="msg"><span>출품이 취소되었습니다.</span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                                <%--출품--%>
                                                <article ng-if="item.STAT_CD !== 'reentry'" class="item-article">
                                                    <div class="image-area">
                                                        <figure class="img-ratio">
                                                            <a href="/auction/live/view/{{sale_no}}/{{item.LOT_NO}}">
                                                                <div class="img-align">
                                                                    <img src="{{item.IMAGE_FULL_PATH}}"  alt="LOT {{item.LOT_NO}}">
                                                                </div>
                                                            </a>
                                                        </figure>
                                                    </div>
                                                    <div class="typo-area">
                                                        <div class="product_info">
                                                            <div class="num_heart-box">
                                                                <span class="num">{{item.LOT_NO}}</span>
                                                                <button class="heart js-work_heart">
                                                                    <i ng-class="item.FAVORITE_YN ? 'icon-heart_on' : 'icon-heart_off'"ng-click="favorite(item);"></i>
                                                                </button>
                                                            </div>
                                                            <div class="info-box">
                                                                <div class="title"><span title="{{item.ARTIST_NAME_JSON[locale]}}">{{item.ARTIST_NAME_JSON[locale]}}</span>
                                                                </div>
                                                                <div class="desc">
                                                                    <span class="text-over span_block" title="{{item.LOT_TITLE_JSON[locale]}}">{{item.LOT_TITLE_JSON[locale]}}</span>
                                                                </div>
                                                                <div class="standard">
                                                                    <span class="text-over span_block">{{item.MATE_CD[locale]}}</span>
                                                                    <div class="size_year">
                                                                        <span>{{item.LOT_SIZE_ARRAY | size_text_cm}}</span>
                                                                        <span ng-bind="item.MAKE_YEAR_JSON[locale]"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="price-box">
                                                                <dl class="price-list">
                                                                    <dt>추정가</dt>
                                                                    <div ng-switch on="item.EXPE_PRICE_INQ_YN">
                                                                        <div ng-switch-when="true">
                                                                            <dd>별도 문의</dd>
                                                                            <dd>&nbsp;</dd>
                                                                            <dd>&nbsp;</dd>
                                                                        </div>
                                                                        <div ng-switch-when="false">
                                                                            <dd>{{base_currency}} {{item.EXPE_PRICE_FROM_JSON[base_currency]}}</dd>
                                                                            <dd> ~ {{item.EXPE_PRICE_TO_JSON[base_currency]}}</dd>
                                                                            <dd>{{sub_currency}} {{item.EXPE_PRICE_TO_JSON[sub_currency]}} ~ {{item.EXPE_PRICE_TO_JSON[sub_currency]}}</dd>
                                                                        </div>
                                                                    </div>
                                                                </dl>
                                                                <dl class="price-list" ng-show="item.isShowBidPrice" >
                                                                    <dt>낙찰가</dt>
                                                                    <div>
                                                                        <div>
                                                                            <dd><strong>KRW {{item.MAX_BID_PRICE}}</strong></dd>
                                                                        </div>
                                                                    </div>
                                                                </dl>
                                                            </div>
                                                            <div id="biding_req2" ng-show="sale_status === 'READY'" class="bidding-box col_2"> <%--ng-show="item.showBtn === 1"  --%>
                                                                <div class="deadline_set"><span>신청마감 {{ displayBidCloseDate }}</span></div>
                                                                <div class="btn_set">
                                                                    <a class="btn btn_point" href="" ng-click="moveToBidding(item)" role="button">
                                                                        <span>서면/전화 응찰 신청</span>
                                                                    </a>
                                                                </div>
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
                                        <div id="page_layer" ng-show="selectViewType == 'page'">
                                            <div class="paging-area">
                                                <!-- paging -->
                                                <div class="paging">
                                                    <a href="javascript:void(0);" ng-click="pageing(1);" class="prev_end icon-page_prevprev">FIRST</a>
                                                    <a href="javascript:void(0);" ng-click="pageingPrev();" class="prev icon-page_prev">PREV</a>
                                                    <a href="javascript:void(0);" ng-click="pageing(item);" ng-repeat="item in pageingdata" ng-class="{'on':item === curpage}">
                                                        <strong ng-if="item === curpage" ng-bind="item"></strong>
                                                        <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                    <a href="javascript:void(0);" ng-click="pageingNext();" class="next icon-page_next">NEXT</a>
                                                    <a href="javascript:void(0);" ng-click="pageing(pagelast);" class="next_end icon-page_nextnext">LAST</a>
                                                </div>
                                                <!-- paging -->
                                            </div>
                                        </div>
                                        <!-- 더보기 -->
                                        <div id="add_layer" class="only-mb2" ng-show="selectViewType == 'more'">
                                            <button class="btn btn_gray_line" type="button" ng-click="addpage(curpage + 1);"><span>더보기</span></button>
                                        </div>
                                        <!-- 더보기 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

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
            $scope.base_currency = 'KRW';
            $scope.sub_currency = 'USD';

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
                value: 'page'
            }, {
                name: "더보기 방식",
                value: 'more'
            }];

            $scope.selectSortType = 1;
            $scope.selectViewType = 'page';
            $scope.searchValue = "";
            $scope.searchlotList = [];
            $scope.selectCategory = 'all';

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
                for (let i = 0; i < $scope.lotList.length; i++) {

                    if($scope.lotList[i].ARTIST_NAME_JSON !=null && $scope.lotList[i].LOT_TITLE_JSON) {

                        if ($scope.lotList[i].ARTIST_NAME_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 ||
                            $scope.lotList[i].LOT_TITLE_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                            pp.push($scope.lotList[i]);
                        }
                    }
                }

                $scope.lotTotalCount = pp.length;
                $scope.searchlotList = pp;
                $scope.pageing(1);

            }

            $scope.goLot = function (saleNo, lotNo) {
                window.location.href = '/auction/live/view/' + saleNo + '/' + lotNo;
            }

            $scope.favorite = function(item , $e) {
                if(!checkLogin()){
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

                //필수 값 있는지 여부. ( 생년월일 , 성별 )
                let isCustRequired = ${isCustRequired};
                if(!isCustRequired){
                    if(confirm('서면/전화 응찰 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')){
                        location.href = '/mypage/custModify';
                    }
                    return;
                }

                location.href = '/auction/live/sale/' + $scope.sale_no + '/lot/' + item.LOT_NO + '/biding';
            }

            $scope.goLiveBid = function() {
                const saleStatus = $scope.sale_status;
                const paddleNo = $scope.paddNo;
                const isLogin = sessionStorage.getItem("is_login") === 'true';
                console.log(!isLogin)
                if(saleStatus === 'READY' && !isLogin){
                    //로그인 페이지 이동
                    if(!checkLogin()) return;
                }else if(saleStatus === 'READY' && ${isRegular} && paddleNo < 1){
                    //패들 발급 신청
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
                }else if(saleStatus === 'LIVE_ING' && !isLogin){
                    //player only 페이지 이동
                    window.open("/auction/live/bid/player","bidder", "resizable=no, status=no, menubar=no, toolbar=no, location=no, directories=no");
                    return;
                }else if(saleStatus === 'LIVE_ING' && isLogin){
                    //응찰페이지 이동
                    window.open("/auction/live/bidder/"+$scope.sale_no, "bidder", "resizable=no, status=no, menubar=no, toolbar=no, location=no, directories=no");
                    return;
                }
            }

            $scope.goLiveBidAgree = function() {
                if($(".js_all-terms #checkbox_all").is(":checked")) {
                    axios.post('/api/auction/paddle', { sale_no : '${saleNo}'})
                        .then(function (response) {
                            if (response.data.success) {
                                $scope.paddNo = response.data.data;
                                setPaddleButtonMsg($scope.sale_status, $scope.paddNo);
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

            const setSaleData = function(saleData) {
                //contents
                $scope.base_currency = $scope.saleInfoData.CURR_CD;

                $scope.bid_close_date =  moment($scope.saleInfoData.TO_DT).add('days', -1);
                $scope.displayBidCloseDate = $scope.bid_close_date.format('MM/DD(ddd) 24:00');

                saleData.displayBidDate = moment(saleData.TO_DT).format('MM.DD(ddd) HH:ss');
                saleData.displayPreviewFromDate = moment(saleData.PREV_FROM_DT).format('MM.DD(ddd)');
                saleData.displayPreviewToDate = moment(saleData.PREV_TO_DT).format('MM.DD(ddd)');

                saleData.TITLE_JSON = JSON.parse(saleData.TITLE_JSON);
                saleData.buttonList.map(item => {
                    item.content = JSON.parse(item.content);
                });

                //status
                let saleStatus = 'READY';
                const TO_DT_MMDD = moment(saleData.TO_DT).format('YYYYMMDD');
                const LIVE_BID_DT = moment(saleData.LIVE_BID_DT);
                const NOW_DATETIME = moment();
                const NOW_DATE = moment().format('YYYYMMDD');

                if(NOW_DATE < TO_DT_MMDD) {
                    saleStatus = 'READY';
                }else if((NOW_DATE >= TO_DT_MMDD) && (NOW_DATETIME < LIVE_BID_DT)) {
                    saleStatus = 'BID_END';
                }else if((NOW_DATE >= TO_DT_MMDD) && (NOW_DATETIME >= LIVE_BID_DT)) {
                    saleStatus = 'LIVE_ING';
                }else if((NOW_DATETIME > LIVE_BID_DT) && saleData.CLOSE_YN){
                    saleStatus = "END";
                    if (!${isEmployee} && sessionStorage.getItem("is_login") === 'false') {
                        alert("권한이 없거나 허용되지 않은 접근입니다.");
                    }
                }

                $scope.sale_status = saleStatus;

                $scope.$apply();
            }

            const setPaddleButtonMsg = (saleStatus, paddNo) =>{
                let paddNoteMsg = "라이브 응찰 신청";
                let paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";
                $("article.proceeding-article a.js-terms_required").css("cursor", "pointer");
                $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "");

                $scope.btnPaddleNo = '';

                const isLogin = sessionStorage.getItem("is_login");
                const isRegular = '${isRegular}';
                const paddleNo = paddNo;
                const sale_status = saleStatus;

                // console.log(sale_status, isLogin, isRegular, paddleNo);
                if(sale_status === 'READY') {
                    /* 로그인 & 준회원 & 정회원(패들x) */
                    if (!isLogin || !isRegular || (isRegular && paddleNo < 1)) {
                        paddNoteMsg = "라이브 응찰 신청";
                        paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";
                        $("article.proceeding-article a.js-terms_required").css("cursor", "pointer");
                        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "");
                    }else if(isRegular && paddleNo > 0) {
                        paddNoteMsg = "라이브 응찰 신청완료";
                        paddNoteEtc = "나의 패들번호 : ";
                        $scope.btnPaddleNo = paddleNo;
                        $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
                    }
                }else if(sale_status === 'BID_END'){
                    if(isRegular && paddleNo > 0) {
                        paddNoteMsg = "라이브 응찰 신청완료";
                        paddNoteEtc = "나의 패들번호 : ";
                        $scope.btnPaddleNo = paddleNo;
                        $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
                    }else{
                        const live_start_time_txt = moment($scope.saleInfoData.TO_DT).format('M/DD(ddd) HH');
                        paddNoteMsg = "라이브 경매 준비 중";
                        paddNoteEtc = live_start_time_txt + "시에 시작합니다.";
                        $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
                    }
                }else if(sale_status === 'LIVE_ING'){
                    if(!isLogin){
                        paddNoteMsg = "라이브 경매 참가";
                        paddNoteEtc = "나의 패들번호 ";
                    }else if(isLogin && paddleNo < 1){
                        paddNoteMsg = "라이브 경매 보기";
                        paddNoteEtc = "사전 신청한 회원만 응찰 가능합니다.";
                    }else if(isRegular && paddleNo > 0){
                        paddNoteMsg = "라이브 경매 참가";
                        paddNoteEtc = "나의 패들번호 : ";
                        $scope.btnPaddleNo = paddleNo;
                    }
                }

                $scope.paddNoteMsg = paddNoteMsg;
                $scope.paddNoteEtc = paddNoteEtc;
                $scope.$apply();
            }


            // 호출 부
            const getSaleInfo = (saleNo) => {
                try {
                    return axios.get('/api/auction/live/sales/'+saleNo+'/one');
                } catch (error) {
                    console.error(error);
                }
            };

            const getLotList = (type, cd_id) => {
                const saleNo = ${saleNo};
                try {
                    const paramQuery = cd_id !== 'all'? '?'+type+'='+cd_id : '';
                    return axios.get('/api/auction/live/list/'+saleNo+paramQuery);
                } catch (error) {
                    console.error(error);
                }
            };

            const getSaleImages = (saleNo) => {
                try {
                    return axios.get('/api/auction/sale_images/'+saleNo);
                } catch (error) {
                    console.error(error);
                }
            }

            const getCategories = (saleNo) => {
                try {
                    return axios.get('/api/auction/live/sales/'+saleNo+'/types');
                } catch (error) {
                    console.error(error);
                }
            }

            const getPaddleNumber = async (saleNo) =>{
                try {
                    return axios.get('/api/auction/paddles/'+saleNo);
                        /*.then(function(response) {
                            if (response.data.success) {
                                const paddleNumber = response.data.data;
                                return paddleNumber > 0? paddleNumber : 0;
                            }
                        });*/
                } catch (error) {
                    console.error(error);
                }
            }

            const setLotListData = (dataList) => {
                let baseCurrency = $scope.base_currency;
                let subCurrency = $scope.sub_currency;

                dataList.forEach(item => {
                    item.LOT_SIZE_ARRAY = JSON.parse(item.LOT_SIZE_ARRAY)[0];

                    item.EXPE_PRICE_FROM_JSON[baseCurrency] = numberWithCommas(item.EXPE_PRICE_FROM_JSON[baseCurrency]);
                    item.EXPE_PRICE_TO_JSON[baseCurrency] = numberWithCommas(item.EXPE_PRICE_TO_JSON[baseCurrency]);
                    item.EXPE_PRICE_FROM_JSON[subCurrency] = numberWithCommas(item.EXPE_PRICE_FROM_JSON[subCurrency]);
                    item.EXPE_PRICE_TO_JSON[subCurrency] = numberWithCommas(item.EXPE_PRICE_TO_JSON[subCurrency]);
                    item.MAX_BID_PRICE = item.MAX_BID_PRICE !== null? numberWithCommas(parseInt(item.MAX_BID_PRICE)) : null;

                    if ($scope.sale_status === 'LIVE_ING' && item.CLOSE_YN && item.MAX_BID_PRICE !== null && ${isRegular}) {
                        item.isShowBidPrice = true;
                    } else {
                        item.isShowBidPrice = false;
                    }

                } );
            }



            $scope.changeCategory = async function (type, category){
                $scope.selectCategory = category;
                const lotListData = await getLotList(type, category);
                $scope.lotList = lotListData.data.data;
                $scope.lotTotalCount = $scope.lotList.length;
                setLotListData($scope.lotList);
                $scope.pageing(1);
            }

            // 호출 부
            $scope.load = function () {
                let run = async function () {
                    let [saleInfoData, lotListData, lotNaviData, categories, paddleInfoData] = await Promise.all([
                        getSaleInfo($scope.sale_no),
                        getLotList('category', $scope.selectCategory),
                        getSaleImages($scope.sale_no),
                        getCategories($scope.sale_no),
                        getPaddleNumber($scope.sale_no),
                    ]);

                    $scope.saleInfoData = saleInfoData.data.data;
                    $scope.lotList = lotListData.data.data;
                    $scope.lotTotalCount = $scope.lotList.length;
                    $scope.saleImages = lotNaviData.data.data;
                    $scope.categories = categories.data.data;
                    $scope.categories.unshift({CD_ID : 'all', CD_NM : '전체', CD_NM_EN: 'All'});
                    $scope.paddNo = paddleInfoData.data.data;

                    await setSaleData($scope.saleInfoData);
                    await setLotListData($scope.lotList);
                    await setPaddleButtonMsg($scope.sale_status, $scope.paddNo);

                    $scope.saleInfo = $scope.lotList.slice(0, $scope.itemsize);

                    let p = [];
                    let endVal = 0;
                    let page = 1;

                    let etc = ($scope.lotTotalCount % $scope.itemsize > 0) ? 1 : 0;
                    let end = parseInt($scope.lotTotalCount / $scope.itemsize) + etc;

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
                    case 'page':
                        $scope.pageing($scope.curpage)
                        break;
                    case 'more':
                        $scope.addpage($scope.curpage);
                        break;
                }
                $scope.selectViewType = sst;
            }

            $scope.rerange = function () {
                let sst = parseInt($("#sortType").val())
                let v;

                for (let i = 0 ; i < $scope.lotTotalCount;i++ ){
                    if ($scope.lotList[i].EXPE_PRICE_TO_JSON.KRW === undefined) {
                        $scope.lotList[i].EXPE_PRICE_TO_JSON.KRW = 0;
                    }
                    if ($scope.lotList[i].EXPE_PRICE_FROM_JSON.KRW === undefined) {
                        $scope.lotList[i].EXPE_PRICE_FROM_JSON.KRW = 0;
                    }
                }
                v = $scope.lotList;

                for (let i = 0 ; i < $scope.searchlotList.length; i++){
                    if ($scope.searchlotList[i].EXPE_PRICE_TO_JSON.KRW === undefined) {
                        $scope.searchlotList[i].EXPE_PRICE_TO_JSON.KRW = 0;
                    }
                    if ($scope.searchlotList[i].EXPE_PRICE_FROM_JSON.KRW === undefined) {
                        $scope.searchlotList[i].EXPE_PRICE_FROM_JSON.KRW = 0;
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
                let v = $scope.lotList;

                if ($scope.searchValue.length > 0) {
                    v = $scope.searchlotList;
                } else {
                    if ($scope.searchlotList != null && $scope.searchlotList.length > 0) {
                        v = $scope.searchlotList;
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
                let v = $scope.lotList;
                if ($scope.searchValue.length > 0) {
                    v = $scope.searchlotList;
                } else {
                    if ($scope.searchlotList != null && $scope.searchlotList.length > 0) {
                        v = $scope.searchlotList;
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
                let v = $scope.lotList;
                let etc = (v.length % $scope.itemsize > 0) ? 1 : 0;
                let end = parseInt(v.length / $scope.itemsize) + etc;
                if ($scope.curpage + 1 > end) {
                    return;
                }
                if ($scope.searchValue.length > 0) {
                    v = $scope.searchlotList;
                } else {
                    if ($scope.searchlotList != null && $scope.searchlotList.length > 0) {
                        v = $scope.searchlotList;
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
                let v = $scope.lotList;
                if ($scope.searchValue.length > 0) {
                    v = $scope.searchlotList;
                } else {
                    if ($scope.searchlotList != null && $scope.searchlotList.length > 0) {
                        v = $scope.searchlotList;
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

            $scope.goBrochure = function (id, url) {
                axios.post('/api/auction/brochure/read', {id: id});
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