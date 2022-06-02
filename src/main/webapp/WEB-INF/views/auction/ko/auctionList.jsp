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
                                    <h2 class="page_title"><span class="th1" ng_bind="saleInfo.TITLE">2월 e BID 프리미엄 온라인 경매</span>
                                    </h2>
                                    <ul class="event_day-list">
                                        <li><span class="colorB2">프리뷰</span><span class=""> : {{saleInfo.START_DATE}} - {{saleInfo.END_DATE}}</span>
                                        </li>
                                        <li><span class="colorB2">경매일</span><span
                                                class=""> : {{saleInfo.END_DATE}}</span></li>
                                    </ul>
                                    <div class="btn_set">
                                        <a class="btn btn_white " href="#" role="button"><span>안내사항</span></a>
                                    </div>
                                </div>
                            </article>
                            <article class="proceeding-article">
                                <a href="#" title="진행중 Lot 10|김선우" onclick="goLot();">
                                    <div class="article-inner">
                                        <div class="column ing">
                                            <strong class="note_msg">진행중 Lot</strong>
                                            <ul class="ac-list">
                                                <li><span id="lot_no" class="count">10</span></li>
                                                <li><span id="artist_name" class="name">김선우</span></li>
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
                                            <li class="active"><a href="#tab-cont-1"><span>전체</span></a></li>
                                            <li><a href="#tab-cont-2"><span>근현대</span></a></li>
                                            <li><a href="#tab-cont-3"><span>고미술</span></a></li>
                                            <li><a href="#tab-cont-4"><span>시계</span></a></li>
                                            <li><a href="#tab-cont-5"><span>럭셔리</span></a></li>
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
                                                    <button class="js-dropdown-btn"><em>200</em><span>LOT</span><i
                                                            class="form-select_arrow_md"></i>
                                                    </button>
                                                    <div class="trp-dropdown_list-box"
                                                         data-trp-focusid="js-user_support">
                                                        <!-- 랏 서치 -->
                                                        <div class="search-box">
                                                            <input type="search" placeholder="LOT 번호 입력" id="" class="">
                                                            <i class="form-search_md"></i>
                                                        </div>
                                                        <!-- 랏 서치  -->
                                                        <!-- 랏 리스트 -->
                                                        <div class="list-box scroll-type">
                                                            <ul>
                                                                <li>
                                                                    <a href="#">
                                                                        <div class="image-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction01.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="typo-area">
                                                                            <span>LOT</span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <div class="image-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction02.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="typo-area">
                                                                            <span>LOT1</span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                                <li><a href="#">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/thumbnail/auction03.jpg"
                                                                                     alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <span>LOT2</span>
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
                                                <input type="search" placeholder="작가/작품명" id="" class="h42">
                                                <i class="form-search_md"></i>
                                            </div>
                                            <!-- 작가/작품서치 -->
                                        </div>
                                        <div class="col_item mb-col2">
                                            <div class="select-box">
                                                <select class="select2Basic42 select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                                    <option value="1" data-select2-id="3">LOT 번호순</option>
                                                    <option value="2" data-select2-id="10">추정가 높은 순</option>
                                                    <option value="3" data-select2-id="11">추정가 낮은 순</option>
                                                    <option value="4" data-select2-id="12">응찰가 높은 순</option>
                                                    <option value="5" data-select2-id="13">응찰가 낮은 순</option>
                                                    <option value="4" data-select2-id="14">응찰수 높은 순</option>
                                                    <option value="5" data-select2-id="15">응찰수 낮은 순</option>
                                                </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" data-select2-id="2" style="width: 152px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2--container"><span class="select2-selection__rendered" id="select2--container" role="textbox" aria-readonly="true" title="LOT 번호순">LOT 번호순</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                            </div>
                                            <div class="select-box">
                                                <select class="select2Basic42 js-select_page select2-hidden-accessible" id="" data-select2-id="4" tabindex="-1" aria-hidden="true">
                                                    <option value="1" data-select2-id="6">페이지 방식</option>
                                                    <option value="2">더보기 방식</option>
                                                </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="5" style="width: 152px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2--container"><span class="select2-selection__rendered" id="select2--container" role="textbox" aria-readonly="true" title="페이지 방식">페이지 방식</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
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
                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <span class="num">{{item.LOT_NO}}</span>
                                                            <button class="heart js-work_heart"><i
                                                                    class="icon-heart_off"></i></button>
                                                        </div>
                                                        <div class="info-box">
                                                            <div class="title"><span>{{item.ARTIST_NAME_JSON.ko}}</span><span class="sub">({{item.BORN_YEAR}})</span>
                                                            </div>
                                                            <div class="desc">
                                                                <span>{{item.LOT_TITLE_JSON.ko}}</span></div>
                                                            <div class="standard">
                                                                <span>{{item.CD_NM}}</span>
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
                                                                <dd id="start_cost"></dd>
                                                            </dl>
                                                            <dl class="price-list">
                                                                <dt>낙찰가</dt>
                                                                <dd><strong id="cur_cost"></strong><em id="bid_cnt"></em></dd>
                                                            </dl>
                                                        </div>
                                                        <div class="bidding-box">
                                                            <div class="deadline_set"><span id="end_date_time"></span></div>
                                                            <div class="btn_set"><a class="btn btn_point" href="#"
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
                                    <div class="only-pc">
                                        <div class="paging-area">
                                            <!-- paging -->
                                            <div class="paging">
                                                <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#"
                                                                                                            class="prev icon-page_prev">PREV</a>
                                                <strong class="on">1</strong>
                                                <a href="#"><em>2</em></a>
                                                <a href="#"><em>3</em></a>
                                                <a href="#"><em>4</em></a>
                                                <a href="#"><em>5</em></a>
                                                <a href="#"><em>6</em></a>
                                                <a href="#"><em>7</em></a>
                                                <a href="#"><em>8</em></a>
                                                <a href="#"><em>9</em></a>
                                                <a href="#"><em>10</em></a>
                                                <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#"
                                                                                                             class="next_end icon-page_nextnext">END</a>
                                            </div>
                                            <!-- paging -->
                                        </div>
                                    </div>
                                    <!-- 더보기 -->
                                    <div class="only-mb">
                                        <button class="btn btn_gray_line" type="button"><span>더보기</span></button>
                                    </div>
                                    <!-- 더보기 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

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

<!-- pc, mb select 값변경  -->
<script>
    $(function () {
        $(window).on("resize", function ($e) {
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

<!-- angular js -->
<script>
    app.value('locale', 'ko');
    app.value('is_login', true);

    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    app.controller('ctl', function ($scope, consts, common, is_login, locale) {
        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.sale_no = "${saleNo}";

        // 호출 부
        const getSaleInfo = (saleNo) => {
            try {
                return axios.get('/api/auction/list/${saleNo}');
            } catch (error) {
                console.error(error);
            }
        };
        // 호출 부
        $scope.load = function () {
            let run = async function () {
                let [r1] = await Promise.all([getSaleInfo($scope.sale_no)]);
                $scope.saleInfo = r1.data.data;
                $scope.$apply();
            }
            run();
        }
    });
</script>

</body>

</html>