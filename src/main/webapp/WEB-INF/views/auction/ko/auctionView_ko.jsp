<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass type-details_view">
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>

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
                                                        <a href="#" conclick="window.history.back()" title="뒤로가기">
                                                            <i class="icon-page_back"></i>
                                                        </a>
                                                        <span ng-bind="saleInfo.SALE_TITLE_KO"></span>
                                                    </div>
                                                </div>
                                                <div class="col_item">
                                                    <!-- [0516]select 변경 -->
                                                    <div class="select-box">
                                                        <div class="trp-dropdown-area h42-lines">
                                                            <button class="js-dropdown-btn"><span>LOT {{lotInfo.LOT_NO}}</span><i class="form-select_arrow_md"></i>
                                                            </button>
                                                            <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                                <div class="search-box">
                                                                    <input type="search" placeholder="LOT 번호 입력" id="" class="">
                                                                    <i class="form-search_md"></i>
                                                                </div>
                                                                <div class="list-box scroll-type">
                                                                    <ul>
                                                                        <li ng-repeat="item in saleImages">
                                                                            <a href="#">
                                                                                <div class="image-area">
                                                                                    <figure class="img-ratio">
                                                                                        <div class="img-align">
                                                                                            <img ng-src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                                                        </div>
                                                                                    </figure>
                                                                                </div>
                                                                                <div class="typo-area">
                                                                                    <span>LOT {{item.LOT_NO}}</span>
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
                                                                <div class="swiper-wrapper">
                                                                    <div  ng-repeat="item in lotImages" class="swiper-slide " data-index="$index">
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
                                                                    <div ng-repeat="item in lotImages" class="slide images active" data-index="$index">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="" />
                                                                            </div>
                                                                        </figure>
                                                                        <div class="line"></div>
                                                                    </div>
                                                                    <div class="slide" data-index="4">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt="" />
                                                                            </div>
                                                                        </figure>
                                                                        <div class="line"></div>
                                                                    </div>
                                                                    <div class="slide" data-index="5">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt="" />
                                                                            </div>
                                                                        </figure>
                                                                        <div class="line"></div>
                                                                    </div>
                                                                    <div class="slide" data-index="5">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt="" />
                                                                            </div>
                                                                        </figure>
                                                                        <div class="line"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="view_scale-area">
                                                    <a href="#"><i class="icon-view_scale"></i><span>VIEW SCALE</span></a>
                                                </div>
                                            </article>

                                        </div>

                                        <div class="col_item">
                                            <article class="product_detail-article js-product_detail-article">
                                                <div class="index-area">
                                                    <div class="index-box"><span>10</span></div>
                                                    <div class="btn-box">
                                                        <a href="#" title="" class="sns_share js-sns_share"><i class="icon-view_sns"></i></a>
                                                        <a href="#" title="" class="work_heart js-work_heart"><i class="icon-view_heart_off"></i></a>

                                                        <div class="sns_layer-area">
                                                            <div class="sns-layer">
                                                                <div class="sns-item">
                                                                    <button class="js-share_kakao">
                                                                        <i class="icon-share_sns_kakao"></i>
                                                                        <div class="txt"><span>카카오톡</span></div>
                                                                    </button>
                                                                </div>
                                                                <div class="sns-item">
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
                                                        <span ng-bind="lotInfo.TITLE_KO_TXT"></span>
                                                    </div>
                                                </div>
                                                <div class="price-area">
                                                    <dl class="price-list">
                                                        <dt>추정가</dt>
                                                        <dd>{{lotInfo.BASE_EXPE_FROM_PRICE}}~{{lotInfo.BASE_EXPE_TO_PRICE}}</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>시작가</dt>
                                                        <dd><!--WEB SOCKET--></dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>현재가</dt>
                                                        <dd><strong><!--WEB SOCKET--></strong><em>(응찰 <!--WEB SOCKET-->)</em></dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>마감일</dt>
                                                        <dd><b><!--WEB SOCKET--></b></dd>
                                                    </dl>
                                                </div>
                                                <div class="button-area">
                                                    <div class="btn_set only-pc">
                                                        <div class="btn_item">
                                                            <a class="btn btn_point btn_lg" href="#" role="button"><span>응찰하기</span></a>
                                                        </div>
                                                    </div>
                                                    <div class="btn_set cols_2">
                                                        <div class="btn_item hover_change only-pc">
                                                            <div class="op_default">
                                                                <a class="btn btn_default btn_lg       " href="#" role="button"><span>낙찰수수료</span></a>
                                                            </div>
                                                            <div class="op_hover">
                                                                <a class="btn btn_black btn_2 btn_lg   " href="#" role="button">
                                                                    <em>현재가 기준</em>
                                                                    <strong>1,584,000</strong>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="btn_item only-mb">
                                                            <a class="btn btn_default btn_lg js-delivery_price" href="#" role="button"><span>낙찰수수료</span></a>
                                                        </div>
                                                        <div class="btn_item">
                                                            <a class="btn btn_default btn_lg" href="#" role="button"><span>배송비안내</span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-area">
                                                    <div class="inquiry-box">
                                                        <i class="icon-view_inquiry"></i>
                                                        <span>작품문의 02-395-0330</span>
                                                    </div>
                                                    <div class="print-box">
                                                        <button class="print-btn">
                                                            <i class="icon-view_print"></i>
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
                                                    {{lotInfo.MATE_NM_EN}} <br />
                                                    <span ng-repeat="size in lotInfo.LOT_SIZE_JSON">
                                                        <span>{{size.SIZE1}}X{{size.SIZE2}}X{{size.SIZE3}}cm</span>
                                                    </span><br />
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
                                                <div class="desc">
                                                    Artist <br />
                                                    {{lotInfo.ARTIST_NAME_KO_TXT}} {{lotInfo.ARTIST_NAME_EN_TXT}} b.{{lotInfo.BORN_YEAR}}
                                                </div>
                                                <div class="desc" ng-bind-html="lotInfo.PROFILE_JSON.ko">
                                                </div>
                                                <div class="desc">
                                                    <b>참고자료</b> <br />
                                                    <u>“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</u>
                                                </div>
                                                <div class="desc">
                                                    <div class="vide_img-box">
                                                        <a href="#"><img src="/images/temp/video_img-1.jpg" alt="" /></a>
                                                        <a href="#"><img src="/images/temp/video_img-2.jpg" alt="" /></a><br />
                                                        <a href="#"><img src="/images/temp/video_img-3.jpg" alt="" /></a>
                                                        <a href="#"><img src="/images/temp/video_img-4.jpg" alt="" /></a>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </article>

                                </div>
                                <div class="panel-footer">

                                    <article class="product_recent_work-article">
                                        <div class="article-header">
                                            <div class="title"><span>최근 본 작품</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="scroll-type">
                                                <div class="product-area">

                                                    <ul class="product-list">

                                                        <li class="">
                                                            <div class="li-inner">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <span class="num">1</span>
                                                                                <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <div class="title"><span>데미안허스트</span>
                                                                                    <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                                                                </div>
                                                                                <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span>LOT 5</span></div>
                                                                                <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </div>
                                                        </li>

                                                        <li class="">
                                                            <div class="li-inner">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <span class="num">2</span>
                                                                                <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <div class="title"><span>데미안허스트</span>
                                                                                    <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                                                                </div>
                                                                                <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span>LOT 5</span></div>
                                                                                <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </div>
                                                        </li>

                                                        <li class="">
                                                            <div class="li-inner">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <span class="num">3</span>
                                                                                <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <div class="title"><span>데미안허스트</span>
                                                                                    <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                                                                </div>
                                                                                <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span>LOT 5</span></div>
                                                                                <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </div>
                                                        </li>

                                                        <li class="">
                                                            <div class="li-inner">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <span class="num">4</span>
                                                                                <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <div class="title"><span>데미안허스트</span>
                                                                                    <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                                                                </div>
                                                                                <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span>LOT 5</span></div>
                                                                                <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
                                                            </div>
                                                        </li>

                                                        <li class="">
                                                            <div class="li-inner">
                                                                <article class="item-article">
                                                                    <div class="image-area">
                                                                        <figure class="img-ratio">
                                                                            <div class="img-align">
                                                                                <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                                            </div>
                                                                        </figure>
                                                                    </div>
                                                                    <div class="typo-area">
                                                                        <div class="product_info">
                                                                            <div class="num_heart-box">
                                                                                <span class="num">5</span>
                                                                                <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                                                            </div>
                                                                            <div class="info-box">
                                                                                <div class="title"><span>데미안허스트</span>
                                                                                    <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                                                                </div>
                                                                                <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_cancle-area">
                                                                        <div class="area-inner">
                                                                            <i class="icon-cancle_box"></i>
                                                                            <div class="typo">
                                                                                <div class="name"><span>LOT 5</span></div>
                                                                                <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </article>
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
                                <button>응찰하기</button>
                            </div>
                        </div>
                    </article>

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


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->
    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>


    <!-- visual swiper -->
    <script>
        var view_visual = new Swiper(".js-view_visual .gallery_center", {
            loop: false,
            paginationClickable: true,
            spaceBetween: 10,
            effect: "fade",
            simulateTouch: false,
            pagination: ".js-view_visual .pagination",
            paginationClickable: true,
            breakpoints: {
                1023: {
                    effect: "slide",
                    simulateTouch: true,
                    slidesPerView: 1,
                    spaceBetween: 10
                }
            },
            onSlideChangeEnd: function(swiper) { // 움직임이 끝나면 실행
                view_thumnailActive(swiper.activeIndex)
            }
        });

        /* 섬네일 클릭 */
        $(".js-view_thumnail .slide.images").on("click", function() {
            var _index = $(this).index();
            console.log(_index);
            view_thumnailActive(_index);
            view_visualActive(_index);
        });

        /* 섬네일 활성화 */
        function view_thumnailActive($index) {
            $(".js-view_thumnail .slide").removeClass("active");
            $(".js-view_thumnail .slide").eq($index).addClass("active");
        };
        /* 비주얼 활성화 */
        function view_visualActive($index) {
            view_visual.slideTo($index)
        };

        $(window).on("resize", function() {
            view_visual.update();
        });
    </script>


    <!--  sns 공유 -->
    <script>
        var toggle_sns;
        toggle_sns = $(".js-sns_share").trpToggleBtn(
            function($this) {
                $($this).addClass("on");
                $($this).closest(".btn-box").find(".sns_layer-area").fadeIn("fast");
            },
            function($this) {
                $($this).removeClass("on");
                $($this).closest(".btn-box").find(".sns_layer-area").fadeOut("fast");
            });

        $(".js-share_kakao, .js-share_url").on("click", function($e) {
            $e.preventDefault();
            toggle_sns.toggleAllSet(false);
        })
    </script>

    <!-- [0516] 셀렉트 드롭다운 -->
    <script>
        var dropdown = $(".js-dropdown-btn").trpDropdown({
            list: ".trp-dropdown_list-box",
            area: ".trp-dropdown-area"
        });
        $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
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
        var _hold_info = $(".js-product_detail-article").trpScrollSyncTopView({
            topStart: 172,
            topMagin: 172,
            bottomStop: 1065
        });
        $(window).on("scroll resize", function($e) {
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
    <!-- // [2022-0516] 사용 -->
    <script>
        app.value('locale', 'ko');
        app.value('is_login', true);

        app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

        app.controller('ctl', function($scope, consts, common, is_login, locale) {
            $scope.is_login = is_login;
            $scope.locale = locale;
            $scope.sale_no = "${saleNo}";
            $scope.lot_no = "${lotNo}";
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
                    return axios.get('/api/auction/sale_images/${saleNo}/${lotNo}');
                } catch (error) {
                    console.error(error);
                }

            }
            // 호출 부
            $scope.load = function(){
                let run = async function() {
                    let [r1, r2, r3, r4] = await Promise.all([getSaleInfo($scope.sale_no),
                        getLotInfo($scope.sale_no, $scope.lot_no),
                        getLotImages($scope.sale_no, $scope.lot_no),
                        getSaleImages($scope.sale_no, $scope.lot_no)]);

                    $scope.saleInfo = r1.data.data;
                    $scope.lotInfo = r2.data.data;
                    $scope.lotImages = r3.data.data;
                    $scope.saleImages = r4.data.data;

                    $scope.$apply();
                }
                run();
            }
        });
    </script>
</body>

</html>