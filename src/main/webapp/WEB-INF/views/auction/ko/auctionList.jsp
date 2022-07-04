<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<body class="">
<style>
    .select2-container {
        z-index: 999;
    }
</style>
<div class="wrapper">
    <div class="sub-wrap pageclass type-width_list">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <link rel="stylesheet" href="/css/plugin/csslibrary.css">
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
                                    <h2 class="page_title"><span class="th1">{{sale.SALE_TH | localeOrdinal}} {{sale.TITLE_JSON['ko']}}</span>
                                    </h2>
                                    <ul class="event_day-list">
                                        <li><span class="colorB2">프리뷰</span><span class=""> : {{sale.PREV_FROM_DT | date:'MM.dd'+'('+getWeek(sale.PREV_FROM_DT)+')'}} - {{sale.PREV_TO_DT| date:'MM.dd'+'('+getWeek(sale.PREV_TO_DT)+')'}}</span>
                                        </li>
                                        <li><span class="colorB2">경매일</span><span class=""> : {{sale.TO_DT | date:'MM.dd'+'('+getWeek(sale.TO_DT)+')'}}</span></li>
                                    </ul>
                                    <div class="btn_set">
                                        <a class="btn btn_white " href="#" target="_blank" ng-href="/footer/notice/{{sale.WRITE_NO}}" role="button" ng-if="sale.WRITE_NO > 0"><span>안내사항</span></a>
                                        <a class="btn btn_white " ng-click="goBrochure(item.id, item.content.url)" role="button" ng-repeat="item in sale.buttonList">
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
                                            <!-- [0617]카운트/LOT셀렉트박스 분리 -->
                                            <div class="count tb1">
                                                <span>ALL <em>{{saleInfoAll.length}}</em></span>
                                            </div>
                                            <div class="select-box">
                                                <div class="trp-dropdown-area h42-line">
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
                                                        <a href="/auction/online/view/{{item.SALE_NO}}/{{item.LOT_NO}}" target="_blank">
                                                            <div class="img-align">
                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"
                                                                     alt="">
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
                                                                <span class="text-over span_block">{{item.LOT_TITLE_JSON.ko}}</span>
                                                            </div>
                                                            <div class="standard">
                                                                <span class="text-over span_block">{{item.CD_NM}}</span>
                                                                <div class="size_year">
                                                                    <span ng-bind="item | size_text_cm"></span>
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
                                                                <dt ng-bind="onStateCostTxt">낙찰가</dt>
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
                                                                                    ng-click="popSet(item.SALE_NO,item.LOT_NO, user_id, cust_no);"
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
                                                <a href="javascript:void(0);" ng-click="pageing(1);" class="prev_end icon-page_prevprev">FIRST</a>
                                                <a href="javascript:void(0);" ng-click="pageing(pageprev);" ng-show="pageprev > -1" class="prev icon-page_prev">PREV</a>
                                                <a href="javascript:void(0);" ng-click="pageing(item);" ng-class="{'on':item === curpage}"
                                                   ng-repeat="item in pageingdata">
                                                    <strong ng-if="item === curpage" ng-bind="item"></strong>
                                                    <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                <a href="javascript:void(0);" ng-click="pageing(pagenext);" ng-show="pagenext > -1" class="next icon-page_next">NEXT</a>
                                                <a href="javascript:void(0);" ng-click="pageing(pagelast);" ng-show="pagelast > -1" class="next_end icon-page_nextnext">LAST</a>
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

        $scope.onStateCostTxt = "현재가";

        $scope.is_sale_cert = false;
        $scope.cust_hp = "";

        $scope.modelSortType = [{
            name: "LOT 번호순", value: 1
        }, {
            name: "추정가 높은순", value: 2
        }, {
            name: "추정가 낮은순", value: 3
        }, {
            name: "응찰가 높은순", value: 4
        }, {
            name: "응찰가 낮은순", value: 5
        }, {
            name: "응찰수 높은순", value: 6
        }, {
            name: "응찰수 낮은순", value: 7
        }];

        $scope.modelViewType = [{
            name: "페이징 방식", value: 1
        }, {
            name: "더보기 방식", value: 2
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
                if ($scope.saleInfoAll[i].ARTIST_NAME_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 || $scope.saleInfoAll[i].LOT_TITLE_JSON.ko.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                    pp.push($scope.saleInfoAll[i]);
                }
            }
            $scope.searchSaleInfoAll = pp;
            $scope.pageing(1);

        }

        $scope.goLot = function (saleNo, lotNo) {
            window.location.href = '/auction/online/view/' + saleNo + '/' + lotNo;
        }

        $scope.favorite = function (item) {

            checkLogin();

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

        $scope.popSet = function (saleNo, lotNo, userId, custNo) {
            if(sessionStorage.getItem("is_login") === 'false'){
                let login_message = ( getCookie('lang') === "" ||  getCookie('lang') === 'ko' ) ?
                    '로그인을 진행해주세요.' : 'Please Login in.';
                alert(login_message);
                location.href= '/login';
                return
            }

            const is_sale_cert = $scope.is_sale_cert;

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
                    let url = '';
                    if (window.location.protocol !== "https:") {
                        url = 'http://dev-bid.seoulauction.xyz/init2';
                    } else {
                        url = 'https://dev-bid.seoulauction.xyz/init2';
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
                            lotSize: $scope.saleInfoAll[i].SIZE1 + "X" + $scope.saleInfoAll[i].SIZE2 + "X" + $scope.saleInfoAll[i].SIZE3,
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
                $("#pop_size").html(lotInfo.lotSize);
                $("#pop_make_year").html(lotInfo.makeYear);

                popup_biddingPopup1.open(this); // or false
                popup_fixation("#popup_biddingPopup1-wrap");

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
                let [r1, r2, r3] = await Promise.all([getSaleInfo($scope.sale_no), getSaleImages($scope.sale_no), getLotTags($scope.sale_no)]);
                $scope.saleInfoAll = r1.data.data;
                $scope.saleImages = r2.data.data;
                $scope.lotTags = r3.data.data;

                if ($scope.saleInfoAll.length > 0) {
                    if ($scope.saleInfoAll[0].SALE_KIND_CD !== "online") {
                        alert('잘못된 접근 입니다.');
                        window.history.back();
                        return
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

                await $scope.setSale($scope.sale_no);
                //get sale cert
                if(sessionStorage.getItem("is_login") === 'true'){
                    await axios.get('/api/cert/sales/${saleNo}')
                        .then(function(response) {
                            if (response.data.success) {
                                if(response.data.data.CNT > 0) {
                                    $scope.is_sale_cert = true;
                                } else {
                                    $scope.popSet();
                                }
                                $("#cust_hp").val(response.data.data.HP);
                                $scope.cust_hp = response.data.data.HP;
                            }
                        });

                    await axios.get('/api/mypage/manager')
                        .then(function(response) {
                            if (response.data.success && response.data.data != undefined) {
                                $("em#manager").html(response.data.data.EMP_NAME + " " + response.data.data.HP);
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

        /*$scope.timeTickInterval = function(){
            let ddd = new Date();
            // 앵귤러 정보 삽입
            for (let j = 0; j < $scope.searchSaleInfoAll.length; j++) {
                if ($scope.searchSaleInfoAll[j].END_DT > 0 && $scope.searchSaleInfoAll[j].END_DT >= ddd.getTime()) {
                    let endDate = new Date($scope.searchSaleInfoAll[j].END_DT);
                    let dateGap = endDate - ddd;
                    let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);

                    // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                    var diffDay  = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10)?0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString():Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                    var diffHour = (timeGap.getHours() < 10)?0 + timeGap.getHours().toString():timeGap.getHours();       // 시간
                    var diffMin  = (timeGap.getMinutes() < 10)?0 + timeGap.getMinutes().toString():timeGap.getMinutes();   // 분
                    var diffSec  = (timeGap.getSeconds() < 10)?0 + timeGap.getSeconds().toString():timeGap.getSeconds();   // 초

                    if (diffDay == "00") {
                        diffDay = ""
                    } else {
                        diffDay += "일"
                    }
                    if (diffHour == "00") {
                        diffHour = ""
                    }else {
                        diffHour += ":"
                    }
                    if (diffMin == "00") {
                        diffMin = ""
                    }else {
                        diffMin += ":"
                    }
                    if (diffSec == "00") {
                        diffSec = ""
                    }
                    $scope.searchSaleInfoAll[j].BID_TICK = diffDay + diffHour + diffMin + diffSec;
                } else if (end_bid_time <= 0) {
                    $scope.searchSaleInfoAll[j].BID_TICK = "경매시작 전입니다."
                } else {
                    $scope.searchSaleInfoAll[j].BID_TICK = "경매가 종료되었습니다."
                }
            }
            // 앵귤러 정보 삽입
            for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                if ($scope.saleInfoAll[j].END_DT > 0 && $scope.saleInfoAll[j].END_DT >= ddd.getTime()) {
                    let endDate = new Date($scope.saleInfoAll[j].END_DT);
                    let dateGap = endDate - ddd;
                    let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);
                    // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                    var diffDay  = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10)?0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString():Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                    var diffHour = (timeGap.getHours() < 10)?0 + timeGap.getHours().toString():timeGap.getHours();       // 시간
                    var diffMin  = (timeGap.getMinutes() < 10)?0 + timeGap.getMinutes().toString():timeGap.getMinutes();   // 분
                    var diffSec  = (timeGap.getSeconds() < 10)?0 + timeGap.getSeconds().toString():timeGap.getSeconds();   // 초

                    if (diffDay === "00") {
                        diffDay = ""
                    } else {
                        diffDay += "일 "
                    }
                    if (diffHour === "00") {
                        diffHour = ""
                    }else {
                        diffHour += ":"
                    }
                    if (diffMin === "00") {
                        diffMin = ""
                    }else {
                        diffMin += ":"
                    }
                    if (diffSec === "00") {
                        diffSec = ""
                    }
                    $scope.saleInfoAll[j].BID_TICK = diffDay + diffHour + diffMin + diffSec;

                } else if (end_bid_time <= 0) {
                    $scope.saleInfoAll[j].BID_TICK = "경매시작 전입니다."
                } else {
                    $scope.saleInfoAll[j].BID_TICK = "경매가 종료되었습니다."
                }
            }

            for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                if (parseInt($("#sale_no").val()) === $scope.saleInfoAll[j].SALE_NO && parseInt($("#lot_no").val()) === $scope.saleInfoAll[j].LOT_NO) {
                    let endDate = new Date($scope.saleInfoAll[j].END_DT);
                    let dateGap = endDate - ddd;
                    let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);
                    // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                    var diffDay  = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10)?0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString():Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                    var diffHour = (timeGap.getHours() < 10)?0 + timeGap.getHours().toString():timeGap.getHours();       // 시간
                    var diffMin  = (timeGap.getMinutes() < 10)?0 + timeGap.getMinutes().toString():timeGap.getMinutes();   // 분
                    var diffSec  = (timeGap.getSeconds() < 10)?0 + timeGap.getSeconds().toString():timeGap.getSeconds();   // 초

                    if (diffDay == "00") {
                        diffDay = ""
                    } else {
                        diffDay += "일"
                    }
                    if (diffHour == "00") {
                        diffHour = ""
                    }else {
                        diffHour += ":"
                    }
                    if (diffMin == "00") {
                        diffMin = ""
                    }else {
                        diffMin += ":"
                    }
                    if (diffSec == "00") {
                        diffSec = ""
                    }
                    $scope.saleInfoAll[j].BID_TICK = diffDay + diffHour + diffMin + diffSec;
                    break
                }
            }
            //console.log($scope.saleInfoAll.length, ddd.getTime());
        }*/
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
                init: 1, bid_info: 2, time_sync: 3, bid_info_init: 4, end_time_sync: 5, winner: 6,auto_bid_sync:14
            }
            let d = JSON.parse(evt.data);
            if (d.msg_type === packet_enum.init) {
                // 현재 토큰정보
                $scope.token = d.message.token;

                let init_func_manual = async function (req) {
                    let url = '';
                    if (window.location.protocol !== "https:") {
                        url = 'http://dev-bid.seoulauction.xyz/init';
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
                            $scope.saleInfoAll[i].CUR_COST = curCostValue;
                        }
                    }
                    // 앵귤러 정보 삽입
                    for (let i = 0; i < $scope.searchSaleInfoAll.length; i++) {
                        if (parseInt($scope.searchSaleInfoAll[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no && parseInt($scope.searchSaleInfoAll[i].LOT_NO) === d.message.bid[len - 1].customer.lot_no) {
                            $scope.searchSaleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                            $scope.searchSaleInfoAll[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                            $scope.searchSaleInfoAll[i].CUR_COST = curCostValue;
                        }
                    }


                    if (parseInt($("#sale_no").val()) !== d.message.bid[len - 1].customer.sale_no || parseInt($("#lot_no").val()) !== d.message.bid[len - 1].customer.lot_no) {
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

                    bid_new_cost.innerText = "KRW " + (((d.message.bid[len - 1].bid_cost === 0) ? d.message.bid[len - 1].open_bid_cost : d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote).toLocaleString('ko-KR');

                    document.getElementById("bid_new_cost_val").setAttribute("value", ((d.message.bid[len - 1].bid_cost === 0) ? d.message.bid[len - 1].open_bid_cost : d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote);

                    if (d.message.bid != null && d.message.bid.length > 0) {
                        let bid_hist_info = d.message.bid;
                        if (bid_hist_info != null && bid_hist_info.length > 0) {
                            let bid_lst = document.getElementById("bid_lst");
                            for (let i = 0; i < bid_hist_info.length; i++) {

                                let ddd = new Date(bid_hist_info[i].bid_time);
                                let li = document.createElement("li");

                                let user_id_ly = document.createElement("div");
                                if (bid_hist_info[i].customer.cust_no === custNo) {
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
                    if (d.message.quotes != null && d.message.quotes.length > 0) {
                        let cnt = 1;
                        let viewCnt = 0;

                        let cost_tmp = (bid_info.bid_cost === 0) ?
                            bid_info.open_bid_cost :
                            bid_info.bid_cost;

                        while( viewCnt < 70 ) {
                            if (cnt > d.message.quotes.length - 1) {
                                quote_arr.push(cost_tmp)
                                cost_tmp = parseInt(cost_tmp) + parseInt(d.message.quotes[cnt - 1].quote_cost)
                                viewCnt++;
                                continue
                            }
                            if (d.message.quotes[cnt].cost >= cost_tmp){
                                quote_arr.push(cost_tmp)
                                cost_tmp = parseInt(cost_tmp) + parseInt(d.message.quotes[cnt - 1].quote_cost)
                                viewCnt++;
                                continue
                            }
                            cnt++
                        }
                        $("#reservation_bid").find("option").remove();
                        for(let i = 0; i < quote_arr.length; i++) {
                            $("#reservation_bid").append(`<option value="` + quote_arr[i] +`">KRW ` + quote_arr[i].toLocaleString("ko-KR") +`</option>`);
                        }
                    }
                }
                if (d.message.times !== null && d.message.times.length > 0){
                    let matching = new Map();
                    for (let j = 0; j < d.message.times.length; j++) {
                        matching.set(d.message.times[j].key, d.message.times[j].value);
                    }
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        $scope.saleInfoAll[j].END_DT = matching.get($scope.saleInfoAll[j].SALE_NO +
                            "-" + $scope.saleInfoAll[j].LOT_NO);
                    }
                    for (let j = 0; j < $scope.searchSaleInfoAll.length; j++) {
                        $scope.searchSaleInfoAll[j].END_DT = matching.get($scope.searchSaleInfoAll[j].SALE_NO +
                            "-" + $scope.searchSaleInfoAll[j].LOT_NO);
                    }
                }
                $scope.$apply();

            } else if (d.msg_type === packet_enum.time_sync) {
                let ddd = new Date(d.message.tick_value);
                let bid_tick = document.getElementById("bid_tick");
                // 앵귤러 정보 삽입
                for (let j = 0; j < $scope.searchSaleInfoAll.length; j++) {
                    // 시작일이 현재 일자보다 큰경우
                    if (new Date($scope.searchSaleInfoAll[j].FROM_DT_ORG).getTime() > d.message.tick_value) {
                        $scope.searchSaleInfoAll[j].BID_TICK = "경매시작 전 입니다."
                        // 현재일이 시작보다 크고 종료일자보다 작은경우
                    } else if (new Date($scope.searchSaleInfoAll[j].FROM_DT_ORG).getTime() <= d.message.tick_value && $scope.searchSaleInfoAll[j].END_DT >= d.message.tick_value) {
                        let endDate = new Date($scope.searchSaleInfoAll[j].END_DT);
                        let dateGap = endDate - ddd;
                        let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);

                        // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                        var diffDay  = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10)?0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString():Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                        var diffHour = (timeGap.getHours() < 10)?0 + timeGap.getHours().toString():timeGap.getHours();       // 시간
                        var diffMin  = (timeGap.getMinutes() < 10)?0 + timeGap.getMinutes().toString():timeGap.getMinutes();   // 분
                        var diffSec  = (timeGap.getSeconds() < 10)?0 + timeGap.getSeconds().toString():timeGap.getSeconds();   // 초

                        if (diffDay == "00") {
                            if (j === 0) {
                                $scope.showCurrentLot = true
                            }
                            diffDay = ""
                        } else {
                            $scope.showCurrentLot = false
                            diffDay += "일"
                        }
                        if (diffHour == "00") {
                            diffHour = ""
                        }else {
                            diffHour += ":"
                        }
                        if (diffMin == "00") {
                            diffMin = ""
                        }else {
                            diffMin += ":"
                        }
                        if (diffSec == "00") {
                            diffSec = ""
                        }
                        $scope.searchSaleInfoAll[j].BID_TICK = diffDay + diffHour + diffMin + diffSec;
                        //현재 일이 종료일보다 큰 경우
                    } else if ($scope.searchSaleInfoAll[j].END_DT < d.message.tick_value) {
                        $scope.onStateCostTxt = "낙찰가";
                        $scope.searchSaleInfoAll[j].BID_TICK = "경매가 종료되었습니다."
                    }
                }
                for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                    // 시작일이 현재 일자보다 큰경우
                    if (new Date($scope.saleInfoAll[j].FROM_DT_ORG).getTime() > d.message.tick_value) {
                        $scope.saleInfoAll[j].BID_TICK = "경매시작 전 입니다."
                    // 현재일이 시작보다 크고 종료일자보다 작은경우
                    } else if (new Date($scope.saleInfoAll[j].FROM_DT_ORG).getTime() <= d.message.tick_value && $scope.saleInfoAll[j].END_DT >= d.message.tick_value) {
                        let endDate = new Date($scope.saleInfoAll[j].END_DT);
                        let dateGap = endDate - ddd;
                        let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);

                        // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                        var diffDay  = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10)?0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString():Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                        var diffHour = (timeGap.getHours() < 10)?0 + timeGap.getHours().toString():timeGap.getHours();       // 시간
                        var diffMin  = (timeGap.getMinutes() < 10)?0 + timeGap.getMinutes().toString():timeGap.getMinutes();   // 분
                        var diffSec  = (timeGap.getSeconds() < 10)?0 + timeGap.getSeconds().toString():timeGap.getSeconds();   // 초

                        if (diffDay == "00") {
                            diffDay = ""
                        } else {
                            diffDay += "일"
                        }
                        if (diffHour == "00") {
                            diffHour = ""
                        }else {
                            diffHour += ":"
                        }
                        if (diffMin == "00") {
                            diffMin = ""
                        }else {
                            diffMin += ":"
                        }
                        if (diffSec == "00") {
                            diffSec = ""
                        }
                        $scope.saleInfoAll[j].BID_TICK = diffDay + diffHour + diffMin + diffSec;
                    //현재 일이 종료일보다 큰 경우
                    } else if ($scope.saleInfoAll[j].END_DT < d.message.tick_value) {
                        $scope.saleInfoAll[j].BID_TICK = "경매가 종료되었습니다."
                    }
                }

                for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                    if (parseInt($("#sale_no").val()) === $scope.saleInfoAll[j].SALE_NO && parseInt($("#lot_no").val()) === $scope.saleInfoAll[j].LOT_NO) {
                        if (new Date($scope.saleInfoAll[j].FROM_DT_ORG).getTime() > d.message.tick_value) {
                            bid_tick.innerText = "경매시작 전 입니다."
                            // 현재일이 시작보다 크고 종료일자보다 작은경우
                        }  else if (new Date($scope.saleInfoAll[j].FROM_DT_ORG).getTime() <= d.message.tick_value && $scope.saleInfoAll[j].END_DT >= d.message.tick_value) {

                            let endDate = new Date($scope.saleInfoAll[j].END_DT);
                            let dateGap = endDate - ddd;
                            let timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - ddd);
                            // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
                            var diffDay  = (Math.floor(dateGap / (1000 * 60 * 60 * 24)) < 10)?0 + (Math.floor(dateGap / (1000 * 60 * 60 * 24))).toString():Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수
                            var diffHour = (timeGap.getHours() < 10)?0 + timeGap.getHours().toString():timeGap.getHours();       // 시간
                            var diffMin  = (timeGap.getMinutes() < 10)?0 + timeGap.getMinutes().toString():timeGap.getMinutes();   // 분
                            var diffSec  = (timeGap.getSeconds() < 10)?0 + timeGap.getSeconds().toString():timeGap.getSeconds();   // 초

                            if (diffDay == "00") {
                                diffDay = ""
                            } else {
                                diffDay += "일"
                            }
                            if (diffHour == "00") {
                                diffHour = ""
                            }else {
                                diffHour += ":"
                            }
                            if (diffMin == "00") {
                                diffMin = ""
                            }else {
                                diffMin += ":"
                            }
                            if (diffSec == "00") {
                                diffSec = ""
                            }
                            bid_tick.innerText = diffDay + diffHour + diffMin + diffSec;
                        } else if ($scope.saleInfoAll[j].END_DT < d.message.tick_value) {
                            bid_tick.innerText = "경매가 종료되었습니다."
                        }
                        break
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

                        let curCostValue = (bid_info.bid_cost === 0) ? "KRW " + bid_info.open_bid_cost.toLocaleString('ko-KR') : "KRW " + bid_info.bid_cost.toLocaleString('ko-KR');

                        bid.innerText = curCostValue;
                        bid_cnt.innerText = "(응찰" + bid_info.bid_count + ")"
                        end_bid_time = bid_info.end_bid_time;

                        quote_unit.innerText = "KRW " + bid_info.bid_quote.toLocaleString('ko-KR');

                        bid_new_cost.innerText = "KRW " + (((bid_info.bid_cost === 0) ? bid_info.open_bid_cost : bid_info.bid_cost) + bid_info.bid_quote).toLocaleString('ko-KR');

                        document.getElementById("bid_new_cost_val").setAttribute("value", ((bid_info.bid_cost === 0) ? bid_info.open_bid_cost : bid_info.bid_cost) + bid_info.bid_quote);

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
                                            if (bid_hist_info[i].value[j].customer.cust_no === custNo) {
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
                                            console.log(bid_info.winner_state, bid_hist_info[i].value.length - 1,  j)
                                            if (bid_info.winner_state === 2 && bid_hist_info[i].value.length - 1 === j) {
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
                        let quote_arr = [];
                        if (d.message.quotes != null && d.message.quotes.length > 0) {
                            let cnt = 1;
                            let viewCnt = 0;

                            let cost_tmp = (bid_info.bid_cost === 0) ?
                                bid_info.open_bid_cost :
                                bid_info.bid_cost;

                            while( viewCnt < 70 ) {
                                if (cnt > d.message.quotes.length - 1) {
                                    quote_arr.push(cost_tmp)
                                    cost_tmp = parseInt(cost_tmp) + parseInt(d.message.quotes[cnt - 1].quote_cost)
                                    viewCnt++;
                                    continue
                                }
                                if (d.message.quotes[cnt].cost >= cost_tmp){
                                    quote_arr.push(cost_tmp)
                                    cost_tmp = parseInt(cost_tmp) + parseInt(d.message.quotes[cnt - 1].quote_cost)
                                    viewCnt++;
                                    continue
                                }
                                cnt++
                            }
                            $("#reservation_bid").find("option").remove();
                            for(let i = 0; i < quote_arr.length; i++) {
                                $("#reservation_bid").append(`<option value="` + quote_arr[i] +`">KRW ` + quote_arr[i].toLocaleString("ko-KR") +`</option>`);
                            }
                        }
                        // 낙찰이 완료 되었다면
                        if (bid_info.winner_state === 2) {
                            let bid_tick = document.getElementById("bid_tick");
                            if (end_bid_time <= 0) {
                                bid_tick.innerText = "경매 시작 전입니다.";
                            } else if (end_bid_time < new Date().getTime()) {
                                bid_tick.innerText = "경매가 종료 되었습니다.";
                            }
                            let bid_lst = document.getElementById("bid_lst");
                            let dt_ly_span1 = document.createElement("em");
                            dt_ly_span1.setAttribute("class", "type-success");
                            dt_ly_span1.innerText = "낙찰";
                            bid_lst.firstChild.childNodes[2].insertBefore(dt_ly_span1, bid_lst.firstChild.childNodes[2].firstChild);
                        }
                    }
                    if (d.message.reservation_bid != null) {
                        if ( d.message.reservation_bid.customer.sale_no > 0 &&
                            d.message.reservation_bid.customer.lot_no > 0) {
                            $("#reservation_bid").prop("disabled", true);
                            $("#auto_bid_txt").text("자동응찰 중지");
                            $("#reservation_bid").val(d.message.reservation_bid.bid_cost);
                        } else {
                            $("#reservation_bid").prop("disabled", false);
                            $("#auto_bid_txt").text("응찰하기");
                            $("#reservation_bid option:eq(0)").prop("selected", true);
                        }
                    }
                    return
                }
                if (d.message.bids != null && d.message.bids.length > 0) {
                    $scope.bidsInfoAll = d.message.bids;
                    let matching = new Map();

                    //d.message.bids[0].cur_lot_no

                    // 정보를 처음 가져왔을 때, 인덱스 매핑
                    for (let i = 0; i < $scope.bidsInfoAll.length; i++) {
                        matching.set($scope.bidsInfoAll[i].customer.sale_no + "-" + $scope.bidsInfoAll[i].customer.lot_no, i);
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
                        let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-" + $scope.saleInfoAll[j].LOT_NO);
                        if (idx !== undefined) {
                            let curCostValue = ($scope.bidsInfoAll[idx].bid_cost === 0) ? "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR') : "KRW " + $scope.bidsInfoAll[idx].bid_cost.toLocaleString('ko-KR');
                            // 시작일자
                            $scope.saleInfoAll[j].START_COST = "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR');
                            // 현재가
                            $scope.saleInfoAll[j].CUR_COST = curCostValue;
                            // 응찰 수
                            $scope.saleInfoAll[j].BID_COUNT = "(응찰 : " + $scope.bidsInfoAll[idx].bid_count + ")";
                            // 종료일
                            $scope.saleInfoAll[j].END_DT = $scope.bidsInfoAll[idx].end_bid_time;

                            // 낙찰이 완료 되었다면
                            if ($scope.bidsInfoAll[idx].winner_state === 2) {
                                if ($scope.bidsInfoAll[idx].open_bid_time > new Date().getTime()) {
                                    $scope.saleInfoAll[j].BID_TICK = "경매 시작 전입니다.";
                                } else if ($scope.bidsInfoAll[idx].end_bid_time <= new Date().getTime()) {
                                    $scope.saleInfoAll[j].BID_TICK = "경매가 종료 되었습니다.";
                                }
                                $scope.bidsInfoAll[idx].IS_END_BID = true;
                            }
                        }

                    }
                    /*let isCanClose = true;
                    for (let j = 0; j < $scope.bidsInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].winner_state !== 2) {
                            isCanClose = false;
                            break;
                        }
                    }
                    if (!isCanClose) {
                        $scope.auctionEnd = true;
                        w.close();
                    }*/
                    /*$scope.timeTickInterval();
                    promise = $interval(function(){
                        $scope.timeTickInterval();
                    },1000);*/
                    $scope.$apply();

                }
            } else if (d.msg_type === packet_enum.end_time_sync) {
                if (d.message.value != null) {
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].SALE_NO === d.message.sale_no && $scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
                            $scope.saleInfoAll[j].END_DT = d.message.value;
                        }
                    }
                }
            } else if (d.msg_type === packet_enum.winner) {
                if (d.message != null) {
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].SALE_NO === d.message.sale_no && $scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
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
            } else if (d.msg_type === packet_enum.auto_bid_sync) {
                if (d.message != null) {
                    if (d.message.reservation_bid != null) {
                        if ( d.message.reservation_bid.customer.sale_no > 0 &&
                            d.message.reservation_bid.customer.lot_no > 0) {
                            $("#reservation_bid").prop("disabled", true);
                            $("#auto_bid_txt").text("자동응찰 중지");
                            $("#reservation_bid").val(d.message.reservation_bid.bid_cost);
                        } else {
                            $("#reservation_bid").prop("disabled", false);
                            $("#auto_bid_txt").text("응찰하기");
                            $("#reservation_bid").val('');
                            $("#reservation_bid option:eq(0)").prop("selected", true);
                        }
                    }
                }
            }
        }
        /*##################### 웹소켓 끝 #####################*/
        //페이지방식, 더보기방식 변경
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
        // 정렬방식 설정
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
            $scope.pageprev = (page < $scope.pagesize)? - 1: ($scope.pagesize * parseInt((page - 1) / $scope.pagesize));

            if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
                endVal = end;
                $scope.pagelast = endVal;
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

        $scope.goBrochure = function (id, url) {
            axios.post('/api/auction/brochure/read', {id: id});
            window.open(url);
        }
    });
</script>
<script type="text/javascript" src="/js/auction/auctionOnlineList.js"></script>
</body>
</html>