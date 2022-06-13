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
    <title>전시 상세 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass type-details_view">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();">
            <div id="contents" class="contents">
                <section class="basis-section last-section auction_view-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_view">
                            <div class="panel-header">
                                <div class="header-inner">
                                    <article class="page_name-article js-page_name-article">
                                        <div class="row-box">
                                            <div class="col_item">
                                                <div class="page_title">
                                                    <a href="#" ng-click="goExhibit();" title="뒤로가기">
                                                        <i class="icon-page_back"></i>
                                                    </a>
                                                    <span ng-bind="saleInfo.SALE_TITLE_KO"></span>
                                                </div>
                                            </div>
                                            <div class="col_item">
                                                <!-- [0516]select 변경 -->
                                                <div class="select-box">
                                                    <div class="trp-dropdown-area h42-lines">
                                                        <button class="js-dropdown-btn">
                                                            <span>LOT {{lotInfo.LOT_NO}}</span><i class="form-select_arrow_md"></i>
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
                                                                                        <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
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

                                                                <div ng-repeat="item in lotImages"
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
                                                                <div ng-repeat="item in lotImages"
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
                                                <div class="index-box"><span ng-bind="lotInfo.LOT_NO">10</span></div>
                                                <div class="btn-box">
                                                    <a href="#" title="" class="sns_share js-sns_share" id>
                                                        <i class="icon-view_sns"></i></a>


                                                    <div class="sns_layer-area">
                                                        <div class="sns-layer">
                                                            <div class="sns-item">
                                                                <button id="kakao-share" class="js-share_kakao">
                                                                    <i class="icon-share_sns_kakao"></i>
                                                                    <div class="txt"><span>카카오톡</span></div>
                                                                </button>
                                                            </div>
                                                            <div class="sns-item">
                                                                <button class="js-share_url">
                                                                    <i class="icon-share_url_copy"></i>
                                                                    <div class="txt" ng-click="urlCopy();"><span>URL 복사</span></div>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="artist-area">
                                                <div class="name">
                                                    <strong ng-bind="lotInfo.ARTIST_NAME_KO_TXT">김선우</strong>
                                                    <span>b.{{lotInfo.BORN_YEAR}}</span>
                                                </div>
                                                <div class="desc">
                                                    <span ng-bind="lotInfo.TITLE_KO_TXT">Flight of 3 Dodos</span>
                                                </div>
                                            </div>


                                            <div class="saleprice-area">
                                                <dl>
                                                    <dt>전시가</dt>
                                                    <dd id="exhibitPrice"></dd>
                                                </dl>
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
                                                {{lotInfo.MATE_NM_EN}} <br />
                                                <span ng-repeat="size in lotInfo.LOT_SIZE_JSON">
                                                        <span>{{::size.SIZE1}}X{{::size.SIZE2}}X{{::size.SIZE3}}cm</span>
                                                    </span> <br />
                                                <span bind-html-compile="lotInfo.SIGN_INFO_JSON.ko"> <br />
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
                                                {{lotInfo.ARTIST_NAME_KO_TXT}} {{lotInfo.ARTIST_NAME_EN_TXT}}
                                                b.{{lotInfo.BORN_YEAR}}
                                            </div>
                                            <div class="desc" ng-bind-html="lotInfo.PROFILE_JSON.ko">
                                            </div>
                                        </div>

                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">

                                <div class="btn_set_more">
                                    <button class="btn btn_gray_line" type="button" ng-click="goExhibit();"><span>목록</span></button>
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
<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- [0516]삭제
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->

<!-- visual swiper -->


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
                return axios.get('/api/auction/sale_images/${saleNo}');
            } catch (error) {
                console.error(error);
            }
        }

        const insertRecentlyView =  (saleNo, lotNo) => {
            try {
                return axios.post('/api/auction/insertRecentlyView', {
                    sale_no: saleNo,
                    lot_no: lotNo,
                    cust_no: 1
                });
            } catch (error) {
                console.error(error);
            }
        }

        const getRecentlyView = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/recently/${saleNo}/${lotNo}');
            } catch (error) {
                console.error(error);
            }
        }

        $scope.goLot = function (saleNo, lotNo) {
            window.location.href = '/privatesale/exhibitView/' + saleNo + '/' + lotNo;
        }

        $scope.goInquery = function () {
            window.location.href = '/mypage/inquiryList';
        }

        $scope.goExhibit = function () {
            window.location.href = '/privatesale/exhibit/first';
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
                let [r1, r2, r3, r4, _, r6] = await Promise.all([getSaleInfo($scope.sale_no),
                    getLotInfo($scope.sale_no, $scope.lot_no),
                    getLotImages($scope.sale_no, $scope.lot_no),
                    getSaleImages($scope.sale_no, $scope.lot_no),
                    insertRecentlyView($scope.sale_no, $scope.lot_no),
                    getRecentlyView($scope.sale_no, $scope.lot_no)]);

                $scope.saleInfo = r1.data.data;
                $scope.lotInfo = r2.data.data;
                $scope.lotImages = r3.data.data;
                $scope.saleImages = r4.data.data;
                let baseFromPrice = '';
                let baseToPrice = '';

                $scope.recentlyViews = r6.data.data;

                //전시가 처리
                if($scope.lotInfo.EXHIBITION_PRICE_JSON.length <= 2){
                    $(".saleprice-area").hide();
                }else{
                    $(".saleprice-area").show();
                    $("#exhibitPrice").html($scope.lotInfo.EXHIBITION_PRICE_JSON);
                }



                // popup setting
                let imgUrl = $scope.lotImages[0].IMAGE_URL +
                    $scope.lotImages[0].FILE_PATH + "/" + $scope.lotImages[0].FILE_NAME;

                $("#bidding_title").html($scope.lotInfo.TITLE_KO_TXT);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.lotInfo.ARTIST_NAME_KO_TXT);
                $("#born_year").html("(" + $scope.lotInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.lotInfo.LOT_NO);
                // 시작
                //startBidProcess($scope.lotInfo.SALE_NO, $scope.lotInfo.LOT_NO, 2, "PKH*****D");
                $scope.$apply();

                // 카카오 init
                Kakao.init('cf2233f55e74d6d0982ab74909c97835');

                Kakao.Link.createDefaultButton({
                    container: "#kakao-share",
                    objectType: "feed",
                    content: {
                        title: $scope.saleInfo.SALE_TITLE_KO,
                        description: $scope.lotInfo.TITLE_KO_TXT,
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
                /*
                for (let i = 0 ; i < $scope.recentlyViews.length;i++) {
                    if ($scope.recentlyViews[i].FAVORITE_YN === 'Y'){
                        //console.log($("#recently_views .js-work_heart").eq(i).addClass("on"));
                        $("#recently_views .js-work_heart").eq(i).addClass("on");
                    }
                }*/

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
</script>
<!-- // [2022-0516] 사용 -->

</body>

</html>