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
    <title>프라이빗 세일 상세 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass type-details_view">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <div id="contents" class="contents" ng-controller="ctl" data-ng-init="load();">
                <section class="basis-section last-section auction_view-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_view">
                            <div class="panel-header">
                                <div class="header-inner">
                                    <article class="page_name-article js-page_name-article">
                                        <div class="row-box">
                                            <div class="col_item">
                                                <div class="page_title">
                                                    <a href="#" onclick="goPrivateSale();" title="뒤로가기">
                                                        <i class="icon-page_back"></i>
                                                    </a>
                                                    <span ng-bind="saleInfo.SALE_AS_TITLE_KO">목록</span>
                                                </div>
                                            </div>
                                            <div class="col_item">
                                                <!-- [0516]select 변경 -->

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

                                                                <div ng-repeat="item in saleImages"
                                                                     ng-class="{'swiper-slide':$index>-1,'swiper-slide-active':$index == 0}"
                                                                     data-index="$index">

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
                                                                <div ng-repeat="item in saleImages"
                                                                     ng-class="{'slide':$index>-1,'images':$index>-1,'active':$index==0}"
                                                                     data-index="$index">
                                                                    <figure class="img-ratio">
                                                                        <div class="img-align">
                                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="" />
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
                                                <div class="index-box"><span ng-bind="saleInfo.SALE_AS_NO">10</span></div>
                                                <div class="btn-box">
                                                    <a href="#" title="" class="sns_share js-sns_share"><i class="icon-view_sns"></i></a>
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
                                                    <strong ng-bind="saleInfo.ARTIST_NAME_KO">김선우</strong>
                                                    <span>b.{{saleInfo.BORN_YEAR}}</span>
                                                </div>
                                                <div class="desc">
                                                    <span ng-bind="saleInfo.TITLE_KO">Flight of 3 Dodos</span>
                                                </div>
                                            </div>
                                            <div class="inquirybtn-area">
                                                <div class="btnset">
                                                    <div class="btn-box">
                                                        <button class="btn btn_black btn_lg" type="button" ng-click="goInquery();"><span>1:1 문의하기</span></button>
                                                    </div>
                                                    <div class="btn-box">
                                                        <button class="print-btn" ng-click="print();">
                                                            <i class="icon-view_print"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="inquiryinfo-area">
                                                <div class="inquiryinfo-box">
                                                    <i class="icon-view_inquiry"></i>
                                                    <div class="txt">
                                                        프라이빗 세일 작품은 문의하기를 통해서 구매가 가능
                                                        합니다. 작품에 관해 궁금한 부분이나 문의하실 사항이
                                                        있으시다면, 문의하기를 이용해주시기 바랍니다.
                                                    </div>
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
                                                {{saleInfo.MATE_NM}} <br />
                                                <span>{{saleInfo.SIZE1}}X{{saleInfo.SIZE2}}X{{saleInfo.SIZE3}}cm</span>
                                                | <span>{{saleInfo.MAKE_YEAR_KO}}</span> <br />
                                                <span bind-html-compile="saleInfo.SIGN_INFO_KO"> <br />
                                            </div>
                                        </div>

                                        <div class="info-box">
                                            <div class="title">Condition Report</div>
                                            <div class="desc" <div class="desc" ng-bind="saleInfo.COND_RPT_KO">>
                                            </div>
                                        </div>

                                        <div class="info-box">
                                            <div class="title">작가정보</div>
                                            <div class="desc">
                                                Artist <br />
                                                {{saleInfo.ARTIST_NAME_KO}} {{saleInfo.ARTIST_NAME_EN}}
                                                b.{{saleInfo.BORN_YEAR}}
                                            </div>
                                            <div class="desc" ng-bind-html="saleInfo.PROFILE_JSON.ko">
                                            </div>
                                        </div>

                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">

                                <div class="btn_set_more">
                                    <button class="btn btn_gray_line" type="button" onclick="goPrivateSale();"><span>목록</span></button>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>


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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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

<!--  sns 공유 -->

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

<script>
    document.cookie = "crossCookie=bar; SameSite=None; Secure";
    /* 섬네일 활성화 */
    function view_thumnailActive($index) {
        $(".js-view_thumnail .slide").removeClass("active");
        $(".js-view_thumnail .slide").eq($index).addClass("active");
    };

    /* 비주얼 활성화 */
    function view_visualActive($index, view_visual) {
        view_visual.slideTo($index)
    };
</script>


<!-- angular js -->
<script>
    app.value('locale', 'ko');
    app.value('is_login', true);

    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    app.controller('ctl', function ($scope, consts, common, is_login, locale) {

        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.saleAsNo = "${saleAsNo}";

        // 호출 부
        const getPrivateSaleInfo = (saleAsNo) => {
            try {
                return axios.get('/api/privatesale/saleAsInfo/${saleAsNo}');
            } catch (error) {
                console.error(error);
            }
        };

        const getPrivateSaleImages = (saleAsNo) => {
            try {
                return axios.get('/api/privatesale/saleImages/${saleAsNo}');
            } catch (error) {
                console.error(error);
            }
        }

        $scope.goLot = function (saleAsNo) {
            window.location.href = '/privatesale/psView/' + saleAsNo;
        }

        $scope.goInquery = function () {
            window.location.href = '/mypage/inquiryList';
        }

        $scope.goPrivateSaleList = function () {
            window.location.href = '/privatesale/psList';
        }

        $scope.print = function () {
            $("header").hide();
            window.print();
            $("header").show();
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
                let [r1, r2] = await Promise.all([getPrivateSaleInfo($scope.saleAsNo),
                    getPrivateSaleImages($scope.saleAsNo)]);

                $scope.saleInfo = r1.data.data;
                $scope.saleImages = r2.data.data;

                //전시가 처리
                /*
                if($scope.saleInfo.EXPE_PRICE_FROM_KRW == undefined ||
                    $scope.saleInfo.EXPE_PRICE_FROM_KRW.length <= 2){
                    $(".saleprice-area").hide();
                }else{
                    $(".saleprice-area").show();
                    $("#exhibitPrice").html($scope.saleInfo.EXPE_PRICE_FROM_KRW);
                }
                 */

                // popup setting
                let imgUrl = $scope.saleImages[0].IMAGE_URL +
                    $scope.saleImages[0].FILE_PATH + "/" + $scope.saleImages[0].FILE_NAME;

                $("#bidding_title").html($scope.saleInfo.TITLE_KO);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.saleInfo.ARTIST_NAME_KO);
                $("#born_year").html("(" + $scope.saleInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.saleInfo.SALE_AS_NO);
                $scope.$apply();

                // 카카오 init
                Kakao.init('cf2233f55e74d6d0982ab74909c97835');

                Kakao.Link.createDefaultButton({
                    container: "#kakao-share",
                    objectType: "feed",
                    content: {
                        title: $scope.saleInfo.SALE_AS_TITLE_KO,
                        description: $scope.saleInfo.TITLE_KO,
                        imageUrl:imgUrl,
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
                // swiper

                let view_visual = new Swiper(".js-view_visual .gallery_center", {
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
                    onSlideChangeEnd: function (swiper) { // 움직임이 끝나면 실행
                        view_thumnailActive(swiper.activeIndex)
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

            }
            run();
        }
    });

    function goPrivateSale(){
        window.location.href = '/privatesale/psList';
    }
</script>

<!-- // [2022-0516] 사용 -->
</body>

</html>