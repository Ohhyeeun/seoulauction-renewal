<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>프라이빗 세일 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass ">

        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <link rel="stylesheet" href="/css/plugin/csslibrary.css">
        <!-- //header -->
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();">
            <div id="contents" class="contents">
                <!-- page title -->
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Private Sale</span></h2>
                            <div class="page_desc"><span class="tb1">프라이빗 세일</span></div>
                        </div>
                    </div>
                </section>

                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">
                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class=""><a href="#" onclick="goPsGuide();"><span>프라이빗세일 가이드</span></a></li>
                                    <li class="active"><a href="#" onclick="goPrivateSale();"><span>프라이빗세일</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <section class="basis-section last-section private_sale_list-section ">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list type_panel-private_sale" id="havePrivateSale">
                            <div class="panel-header">
                                <article class="search_tab-article">
                                    <div class="article-body">
                                        <div class="col_item mb-col1">

                                            <div class="select-box">
                                                <div class="trp-dropdown-area h42-line">
                                                    <button class="js-dropdown-btn"><em>{{saleInfoAll.length}}</em><span>LOT</span><i class="form-select_arrow_md"></i>
                                                    </button>
                                                    <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                        <div class="search-box">
                                                            <input type="search" placeholder="LOT 번호 입력" id="search_lot" class="">
                                                            <i class="form-search_md"></i>
                                                        </div>
                                                        <div class="list-box scroll-type">
                                                            <ul id="sale_lot_list">
                                                                <li ng-repeat="item in saleImages" data-index="{{item.AS_NO}}">
                                                                    <a href="#" ng-click="goLot(item.SALE_AS_NO, item.AS_NO);">
                                                                        <div class="image-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"  alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="typo-area">
                                                                            <span>LOT {{::item.AS_NO}}</span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="search-box">
                                                <input type="search" placeholder="작가/작품명" id="search_value"
                                                       ng-model="searchValue"
                                                       ng-keyup="searchArtist(event=$event)" class="h42">
                                                <i class="form-search_md" ng-click="searchArtist2()"></i>
                                            </div>
                                        </div>
                                        <div class="col_item mb-col2">
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
                            <div class="panel-body">
                                <ul class="product-list">
                                    <li class="" ng-repeat="item in saleInfo">
                                        <div class="li-inner">
                                            <article class="item-article" ng-click="goLot(item.SALE_AS_NO, item.AS_NO)">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <span class="num">{{item.AS_NO}}</span>
                                                        </div>
                                                        <div class="info-box">
                                                            <div class="title"><span>{{item.ARTIST_NAME_BLOB_KO}}</span>
                                                                <!-- [0516]삭제	<span class="sub">(1965)</span> -->
                                                            </div>
                                                            <div class="desc"><span>{{item.TITLE_BLOB_KO}}</span></div>
                                                            <div class="standard">
                                                                <span>{{item.CD_NM}}</span>
                                                                <div class="size_year">
                                                                    <span>{{item.SIZE1}} X {{item.SIZE2}} X {{item.SIZE3}}</span>
                                                                    <span>{{item.MAKE_YEAR_BLOB}}</span>
                                                                </div>
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
                                    <div id="page_layer" class="only-pc">
                                        <div class="paging-area">
                                            <div class="paging">
                                                <a href="javascript:void(0);" class="prev_end icon-page_prevprev">FIRST</a><a href="javascript:void(0);"
                                                <a href="javascript:void(0);" ng-click="pageing(item);"
                                                   ng-repeat="item in pageingdata">
                                                    <strong ng-if="item === curpage" ng-class="{'on':item === curpage}"
                                                            ng-bind="item"></strong>
                                                    <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                <a href="javascript:void(0);" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="add_layer" class="only-mb">
                                        <button class="btn btn_gray_line" type="button" ng-click="addpage(curpage + 1);"><span>더보기</span></button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!--작품 없을때 -->
                        <div class="content-panel type_panel-product_list" id="emptyPrivateSale">
                            <div class="panel-body">
                                <article class="comingsoon-article">
                                    <div class="article-inner">
                                        <div class="data-empty">
                                            <div class="txt_empty">
                                                <div class="title">작품을 준비중입니다.</div>
                                                <div class="desc">빠른시일 내에 다양한 작품을 준비하여 찾아 뵙겠습니다. <br />
                                                    감사합니다.
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </article>

                                <!-- 문의하기 -->
                                <article class="inquiry-article ">
                                    <div class="inquiry-box">
                                        <div class="typo-area">
                                            <div class="icon-box">
                                                <i class="icon-academy_inquiry"></i>
                                            </div>
                                            <div class="title-box">
                                                <strong>문의하기</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>서울옥션 브랜드 기획팀</span> <em>정은지 선임</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <em>02-2075-4442</em></li>
                                                        <li><span>E.</span> <a href="mailto:jej@seoulauctionl.com"><em>jej@seoulauctionl.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryList" role="button"><span>1:1 문의</span></a>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>

                    </div>
                </section>
                <input type="hidden" id="token" value="{{token}}"/>
                <input type="hidden" id="saleAsNo" value="48"/>
                <input type="hidden" id="lot_no" value=""/>
                <input type="hidden" id="user_id" value="${member.loginId}"/>
                <input type="hidden" id="cust_no" value="${member.userNo}"/>
            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/en/footer.jsp" flush="false"/>
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

<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<!-- [0516]삭제
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->
<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>

<!-- 셀렉트 드롭다운 -->
<script>
    var dropdown = $(".js-dropdown-btn").trpDropdown({
        list: ".trp-dropdown_list-box",
        area: ".trp-dropdown-area"
    });
    $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
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
    $('.js-maintab_list a').on('click', function(e) {
        e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;

        if ($(this).parents('li').hasClass('active')) return false;
        var id = $(this).attr('href');
        if ($(id).length > 0) {
            $('.tab-cont').removeClass('active');
            $(id).addClass('active');
            $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');

            $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
        }

        return false;
    });
</script>


<!-- pc, mb select 값변경  -->
<script>
    $(function() {
        $(window).on("resize", function($e) {
            select_resize_change();
        });

        function select_resize_change() {
            if ($("body").hasClass("is_mb")) {
                $(".js-select_page").val("2");
            } else {
                $(".js-select_page").val("1");
            }
            $(".js-select_page").trigger('change');
        }
        select_resize_change();
    });
</script>
</body>

<script>
    function goPsGuide(){
        window.location.href = '/privatesale/psGuide/';
    }

    function goPrivateSale(){
        window.location.href = '/privatesale/psList';
    }
</script>

<script>
    <!-- angular js -->
    app.value('locale', 'ko');
    app.value('is_login', false);
    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    app.controller('ctl', function ($scope, consts, common, is_login, locale) {
        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.saleAsNo = "48";

        $scope.pagesize = 10;
        $scope.itemsize = 20;
        $scope.curpage = 1;

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
                if ($scope.saleInfoAll[i].ARTIST_NAME_BLOB_KO.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 || $scope.saleInfoAll[i].TITLE_BLOB_KO.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                    pp.push($scope.saleInfoAll[i]);
                }
            }
            $scope.searchSaleInfoAll = pp;
            $scope.pageing(1);

        }

        $scope.goLot = function (saleNo, lotNo) {

            window.location.href = '/auction/online/view/' + saleNo + '/' + lotNo;
        }

        // 호출 부
        const getSaleInfo = ( ) => {
            try {
                return axios.get('/api/privatesale/list');
            } catch (error) {
                console.error(error);
            }
        };

        const getSaleImages = (saleAsNo) => {
            try {
                console.log(saleAsNo);
                return axios.get('/api/privatesale/saleImages/47');
            } catch (error) {
                console.error(error);
            }
        }

        // 호출 부
        $scope.load = function () {
            let run = async function () {
                let [r1, r2] = await Promise.all([getSaleInfo(), getSaleImages($scope.saleAsNo)]);

                $scope.saleInfoAll = r1.data.data;
                $scope.saleImages = r2.data.data;

                if($scope.saleInfoAll.length < 1){
                    $("#emptyPrivateSale").show();
                    $("#havePrivateSale").hide();
                }else{
                    $("#havePrivateSale").show();
                    $("#emptyPrivateSale").hide();
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

                    // lot
                    $("#search_lot").on("keyup", function () {
                        window.event.preventDefault();
                        let v = $("#search_lot").val();
                        if (v.length == 0) {
                            $("#sale_lot_list li").each(function (i, item) {
                                $(item).css("display", "");
                            })
                            return;
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
            }
            run();
        }
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
        }
        //페이징 리스트 생성
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
    });
</script>

</html>