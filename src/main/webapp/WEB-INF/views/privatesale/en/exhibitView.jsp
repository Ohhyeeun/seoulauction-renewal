<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="" ng-controller="ctl" data-ng-init="load();" style="opacity: 0" opacity=1>
<div class="wrapper">
    <div class="sub-wrap pageclass type-details_view">

        <!-- header -->
        <jsp:include page="../../include/en/nav.jsp" flush="false"/>
        <!-- //header -->
        <!-- container -->
        <div id="container">
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
                                                    <span ng-bind="saleInfo.SALE_TITLE_EN"></span>
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
                                                                <input type="search" placeholder="LOT number" id="search_lot" class="">
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
                                                            <div class="swiper-wrapper js-popup_images">

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
                                            <div class="view_scale-area" ng-if="lotInfo.VIEW_SCALE_YN == 'Y'">
                                                <a class="btn btn_default js-popup_image_viewer" href="#"><i class="icon-view_scale"></i><span>VIEW SCALE</span></a>
                                            </div>
                                        </article>

                                    </div>

                                    <div class="col_item">
                                        <article class="product_detail-article js-product_detail-article">
                                            <div class="index-area">
                                                <div class="index-box"><span ng-bind="lotInfo.LOT_NO">10</span></div>
                                                <div class="btn-box">
                                                    <a href="#" title="" class="sns_share js-sns_share"><i class="icon-view_sns"></i></a>
                                                    <div class="sns_layer-area">
                                                        <div class="sns-layer">
                                                            <div class="sns-item">
                                                                <button id="kakao-share" class="js-share_kakao">
                                                                    <i class="icon-share_sns_kakao"></i>
                                                                    <div class="txt"><span>kakaotalk</span></div>
                                                                </button>
                                                            </div>
                                                            <div class="sns-item" ng-click="urlCopy();">
                                                                <button class="js-share_url">
                                                                    <i class="icon-share_url_copy"></i>
                                                                    <div class="txt"><span>URL copy</span></div>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="artist-area">
                                                <div class="name">
                                                    <strong ng-bind="lotInfo.ARTIST_NAME_EN_TXT" title="{{lotInfo.ARTIST_NAME_EN_TXT}}">Kim SunWoo</strong>
                                                    <span title="{{'b.' + lotInfo.BORN_YEAR}}">b.{{lotInfo.BORN_YEAR}}</span>
                                                </div>
                                                <div class="desc">
                                                    <span ng-bind="lotInfo.TITLE_EN_TXT" title="{{lotInfo.TITLE_EN_TXT}}">Flight of 3 Dodos</span>
                                                </div>
                                            </div>


                                            <div class="saleprice-area">
                                                <dl>
                                                    <dt>Exhibitor</dt>
                                                    <dd id="exhibitPrice">5,000,000</dd>
                                                </dl>
                                            </div>
                                            <div class="inquirybtn-area">
                                                <div class="btnset">
                                                    <div class="btn-box">
                                                        <button class="btn btn_black btn_lg" type="button" ng-click="goInquery();"><span>1:1 Inquiry</span></button>
                                                    </div>
                                                    <div class="btn-box">
                                                        <button class="print-btn" ng-click="print(lotInfo.SALE_NO, lotInfo.LOT_NO);">
                                                            <i class="icon-view_print"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="inquiryinfo-area">
                                                <div class="inquiryinfo-box">
                                                    <i class="icon-view_inquiry"></i>
                                                    <div class="txt">
                                                        <!-- [0613]안내내용 수정 -->
                                                        Exhibited works can be purchased through inquiry. If you have any questions, please use the inquiry form.
                                                        <!-- //[0613]안내내용 수정 -->
                                                    </div>
                                                </div>
                                            </div>


                                        </article>
                                    </div>
                                </div>

                                <article class="product_detail_view-article">
                                    <div class="view_editor-warp">

                                        <div class="info-box">
                                            <div class="title">Work information</div>
                                            <div class="desc">
                                                {{lotInfo.MATE_NM_EN}} <br />
                                                <span ng-repeat="size in lotInfo.LOT_SIZE_JSON">
                                                        <span ng-bind="size | size_text_cm"></span>
                                                    </span> <br />
                                                <span bind-html-compile="lotInfo.SIGN_INFO_JSON.en"> <br />
                                            </div>
                                        </div>

                                        <div class="info-box">
                                            <div class="title">Condition Report</div>
                                            <div class="desc" ng-bind="lotInfo.COND_RPT_JSON.en">
                                            </div>
                                        </div>

                                        <div class="info-box">
                                            <div class="title">Author information</div>
                                            <div class="desc" id="artistName">
                                            </div>
                                            <div class="desc" id="artistProfile">
                                            </div>
                                            <div class="desc" id="artistMedia">
                                            </div>
                                        </div>

                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">

                                <div class="btn_set_more">
                                    <button class="btn btn_gray_line" type="button" ng-click="goExhibit();"><span>LIST</span></button>
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

<!-- 이미지 뷰어 -->
<<div id="popup_image_viewer-wrap" class="trp popupfixed-wrap image_viewer-popup">
    <div class="popup-dim"></div>
    <div class="popup-align">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_view_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body">
                        <article class="viewer-article">
                            <div class="gallery_view js-image_viewer" style="">
                                <div class="gallery_center">
                                    <div id="swiper-wrapper" class="swiper-wrapper">
                                    </div>
                                </div>
                            </div>
                            <div class="size-area">
                                <button class="size-btn js-size_btn">
                                    <i class="icon-viewer_size-off"></i>
                                    <i class="icon-viewer_size-on"></i>
                                </button>
                            </div>
                            <div class="view_paging-area">
                                <button class="page_prev"><i class="icon-view_paging_left"></i></button>
                                <span id="view_lot_no"></span>
                                <button class="page_next"><i class="icon-view_paging_right"></i></button>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- [0516] 이미지 뷰어 팝업 -->
<div id="popup_images-wrap" class="trp popupfixed-wrap images-popup">
    <div class="popup-dim"></div>
    <div class="popup-align">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body">
                        <article class="viewer-article js-zoom_inout">
                            <div class="gallery_view js-imagesSwiper" style="">
                                <div class="gallery_center">
                                    <div id="swiper-wrapper_popup"  class="swiper-wrapper">

                                    </div>
                                </div>
                            </div>
                        </article>
                        <div class="page_prev"><i class="icon-img_swiper_prev"></i></div>
                        <div class="page_next"><i class="icon-img_swiper_next"></i></div>
                    </div>
                    <div class="pop-footer">
                        <div class="pagination js-imagesSwiper_pagination"></div>
                        <article class="thumbnail-article">
                            <ul id="thumbnail_image" class="thumbnail-list js-thumbnail-list">
                            </ul>
                        </article>
                        <!-- [0516]이동 -->
                        <div class="zoom-box">
                            <div class="btnitem">
                                <button class="zoomout js-zoomout"><i class="icon-zoom_out"></i></button>
                            </div>
                            <div class="btnitem">
                                <button class="zoomin js-zoomin"><i class="icon-zoom_in"></i></button>
                            </div>
                        </div>
                        <!-- //[0516]이동 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
    app.value('locale', 'en');
    app.value('is_login', true);

    app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

    app.directive('opacity', opacity);
    function opacity($timeout) {
        return {
            link: function (scope, element, attrs) {
                var value = attrs.opacity;
                $timeout(function () {
                    element[0].style.opacity = value;
                },500);
            }
        }
    }

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
                return axios.get('/api/privatesale/lot_info/${saleNo}/${lotNo}');
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

        const getSaleImages = (saleNo, lotNo) => {
            try {
                return axios.get('/api/auction/sale_images/${saleNo}');
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

        $scope.print = function (saleNo, lotNo) {
            window.location.href = '/privatesale/exhibitView/print/' + saleNo + '/' + lotNo;
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
                let [r1, r2, r3, r4] = await Promise.all([getSaleInfo($scope.sale_no),
                    getLotInfo($scope.sale_no, $scope.lot_no),
                    getLotImages($scope.sale_no, $scope.lot_no),
                    getSaleImages($scope.sale_no, $scope.lot_no)]);

                $scope.saleInfo = r1.data.data;
                $scope.lotInfo = r2.data.data;
                $scope.lotImages = r3.data.data;
                $scope.saleImages = r4.data.data;

                $scope.activeIndex = 0;

                //artist 번호
                $scope.artistNo = $scope.lotInfo.ARTIST_NO;
                //전시가 처리
                if($scope.lotInfo.EXHIBITION_PRICE_JSON == undefined || $scope.lotInfo.EXHIBITION_PRICE_JSON.length <= 2){
                    $(".saleprice-area").hide();
                }else{
                    $(".saleprice-area").show();
                    $("#exhibitPrice").html($scope.lotInfo.EXHIBITION_PRICE_JSON);
                }

                // popup setting
                let imgUrl = $scope.lotImages[0].IMAGE_URL +
                    $scope.lotImages[0].FILE_PATH + "/" + $scope.lotImages[0].FILE_NAME;

                $("#bidding_title").html($scope.lotInfo.TITLE_EN_TXT);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.lotInfo.ARTIST_NAME_EN_TXT);
                $("#born_year").html("(" + $scope.lotInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.lotInfo.LOT_NO);
                $scope.$apply();

                // 카카오 init
                Kakao.init('cf2233f55e74d6d0982ab74909c97835');

                Kakao.Link.createDefaultButton({
                    container: "#kakao-share",
                    objectType: "feed",
                    content: {
                        title: $scope.saleInfo.SALE_TITLE_EN,
                        description: $scope.lotInfo.TITLE_EN_TXT,
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
                    simulateTouch: true,
                    pagination: {
                        el: '.js-view_visual .pagination',
                        type: 'bullets',
                    },
                    breakpoints: {
                        1023: {
                            effect: "fade",
                            simulateTouch: true,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    on: {
                        slideChange: function() {
                            $scope.activeIndex = view_visual.activeIndex;
                            view_thumnailActive(view_visual.activeIndex);
                        }
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

                let sale_images = $scope.saleImages;
                let lot_images = $scope.lotImages;
                let firstCheck = 0;

                $.each(sale_images, function (index, el) {

                    let size1 = 0;
                    let size2 = 0;
                    let unitCd = '';
                    let lot_no = el.LOT_NO;
                    if (el.LOT_SIZE_JSON.length > 0) {
                        size1 = el.LOT_SIZE_JSON[0].SIZE1;
                        size2 = el.LOT_SIZE_JSON[0].SIZE2;
                        unitCd = el.LOT_SIZE_JSON[0].UNIT_CD;

                    }
                    let img_url = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;
                    let swiper_slide_item = '';
                    if (firstCheck == 0) {
                        $scope.chk = parseInt(lot_no) - index -1;
                    }
                    firstCheck++;

                    //if(size1 > 160){
                    swiper_slide_item = `<div class="swiper-slide">
                                            <div class="img-area">
                                                <div class="img-box">
                                                    <div class="size_x"><span>` + size1 + unitCd +  `</span></div>
                                                    <div class="size_y"><span>` + size2 + unitCd + `</span></div>
                                                    <div class="images">
                                                        <img class="imageViewer"  src="` + img_url + `" alt="" index="` + index + `" size1="` + size1 + `" size2="` + size2 + `" lot_no="` + lot_no + `" />
                                                    </div>
                                                </div>
                                            </div>
                        </div>`
                    $("#swiper-wrapper").append(swiper_slide_item);
                    //}
                });

                $.each(lot_images, function (index, el) {

                    let popup_lot_no = el.LOT_NO;
                    let popup_img_url = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;
                    let popup_swiper_slide_item = '';
                    let popup_swiper_mini_slide_item = '';

                    //if (size1 > 160) {
                    popup_swiper_slide_item = `<div class="swiper-slide">
                                            <div class="img-area">
                                                <div class="img-box">
                                                    <div class="images">
                                                        <img class="imageViewerpopup" src="` + popup_img_url + `" alt="" lot_no="` + popup_lot_no + `"/>
                                                    </div>
                                                </div>
                                            </div>
                        </div>`
                    $("#swiper-wrapper_popup").append(popup_swiper_slide_item);


                    popup_swiper_mini_slide_item = `<li class="active">
                                            <a href="#">
                                                <div class="imgs-item">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="` + popup_img_url + `"  alt="" />
                                                        </div>
                                                    </figure>
                                                    <div class="line"></div>
                                                    </div>
                                                </a>
                                            </li>`
                    $("#thumbnail_image").append(popup_swiper_mini_slide_item);
                });

                /* 스와이퍼 */
                var imageViewer = new Swiper('.js-image_viewer .gallery_center', {
                    loop: true,
                    onSlideChangeStart: function (swiper) { // 움직임이 끝나면 실행
                        imagesResizePcMb();
                    },
                    onSlideChangeEnd: function (swiper) { // 움직임이 끝나면 실행
                        imagesResizePcMb();
                    },
                });

                $.each($(".swiper-slide"), function(){
                    let data = $(this).attr("data-swiper-slide-index");
                    let lot_no = $(this).find(".imageViewer").attr("lot_no");
                    if (lot_no === Scope().lot_no) {
                        console.log(data, lot_no, Scope().lot_no);
                        $("#view_lot_no").attr("sel-data-index", lot_no);
                        $("#view_lot_no").html("LOT " + lot_no);
                    }
                });

                var popup_image_viewer = $(".js-popup_image_viewer").trpLayerFixedPopup("#popup_image_viewer-wrap");
                $(popup_image_viewer.getBtn).on("click", function ($e) {
                    $e.preventDefault();
                    popup_image_viewer.open(this); // or false
                    imagesResizePcMb();
                    imageViewer.update();
                    imageViewer.slideTo(parseInt($("#view_lot_no").attr("sel-data-index")) - $scope.chk, 0);
                });
                // 좌우버튼
                $('.view_paging-area .page_prev').on('click', function ($e) {
                    $e.preventDefault();
                    imageViewer.slidePrev();
                    $("#view_lot_no").html("LOT " + $(".swiper-slide-active .imageViewer").attr('lot_no'));

                });
                $('.view_paging-area .page_next').on('click', function ($e) {
                    $e.preventDefault();
                    imageViewer.slideNext();
                    $("#view_lot_no").html("LOT " + $(".swiper-slide-active .imageViewer").attr('lot_no'));

                });

                /* PC,MB images resize */
                $(window).on("resize", function () {
                    imagesResizePcMb();
                });

                $("body").on("click", "#popup_image_viewer-wrap .js-closepop, #popup_image_viewer-wrap .popup-dim", function ($e) {
                    $e.preventDefault();
                    popup_image_viewer.close();
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

                var popup_image_viewer = $(".js-popup_image_viewer").trpLayerFixedPopup("#popup_image_viewer-wrap");
                $(popup_image_viewer.getBtn).on("click", function($e) {
                    $e.preventDefault();
                    popup_image_viewer.open(this); // or false
                    imagesResizePcMb();
                    imageViewer.update();
                    imageViewer.slideTo($("#view_lot_no").attr("sel-data-index"), 0);

                });

                $("body").on("click", "#popup_image_viewer-wrap .js-closepop, #popup_image_viewer-wrap .popup-dim", function($e) {
                    $e.preventDefault();
                    popup_image_viewer.close();
                });

                /* 싸이즈 버튼 */
                var size_btn_toggle = $(".js-size_btn").trpToggleBtn(
                    function($this) {
                        $($this).closest(".viewer-article").addClass("active");
                    },
                    function($this) {
                        $($this).closest(".viewer-article").removeClass("active");
                    });

                /* === 스와이퍼 === */
                console.log("스와이퍼 set");
                var imagesSwiper = new Swiper('.js-imagesSwiper .gallery_center', {
                    loop: true,
                    simulateTouch: false,
                    pagination: ".js-imagesSwiper_pagination",
                    paginationClickable: true,
                    breakpoints: {
                        1023: {
                            effect: "slide",
                            simulateTouch: true,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    onSlideChangeStart: function(swiper) { // 움직임이 시작하면 실행
                        imagesResizePcMb();
                        if ($("body").hasClass("is_pc")) {
                            panzoom.reset(); // zoom reset
                        }
                    },
                    onSlideChangeEnd: function(swiper) { // 움직임이 끝나면 실행
                        imagesResizePcMb();
                        thumbnailActive(swiper.realIndex);
                    }
                })
                // 좌우버튼
                $('.images-popup .page_prev').on('click', function($e) {
                    $e.preventDefault();
                    imagesSwiper.slidePrev();
                })
                $('.images-popup .page_next').on('click', function($e) {
                    $e.preventDefault();
                    console.log("next")
                    imagesSwiper.slideNext();
                })

                //작가 정보 admin에서 가져오도록 변경
                axios.get('/api/auction/artist_info/' + $scope.artistNo)
                    .then(function(response) {
                        const data = response.data;
                        let success = data.success;

                        if(success){
                            let artistData = data.data;
                            if(!artistData){
                            }
                            else{
                                let articlesList = JSON.parse(artistData.articles).articles;
                                let artistYoutubeImages = JSON.parse(artistData.media).youtube;
                                let artistImageList = artistData.images;

                                let title = '';
                                $.each(articlesList, function (index, el) {
                                    if(locale == 'ko'){
                                        title += el.titleKo + '</br>';
                                    }else{
                                        title += el.titleEn + '</br>';
                                    }
                                });

                                $("#artistName").html(JSON.parse(artistData.name).en + ' ' +  artistData.birth + '~' + artistData.death);
                                $("#artistProfile").html(JSON.parse(artistData.profile).en + '</br>' + title);

                                let html = '<div class="vide_img-box">';
                                $.each(artistYoutubeImages, function (index, el) {
                                    $.each(artistImageList, function (s3Index, el) {
                                        //일단은 youtube만 뿌리기로
                                        if(artistImageList[s3Index].tag == 'youtube' + index){
                                            html += '<a href="' + artistYoutubeImages[index] + '"><img src=" '+ artistImageList[s3Index].cdn_url + ' " alt="" /></a>';
                                        }
                                    });
                                });
                                html += '</div>';
                                $("#artistMedia").html(html);
                            }
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });

                var popup_images = $(".js-popup_images").trpLayerFixedPopup("#popup_images-wrap");
                $(".js-popup_images").on("click", function($e) {
                    $e.preventDefault();
                    popup_images.open(this); // or false
                    for (var o = $(".imageViewerpopup"), e = 0; e < o.length; e++) {
                        if (!o[e]) return !1;
                        var windowW = screen.availWidth;
                        var windowH = screen.availHeight;
                        o[e].width = windowW;
                        o[e].height = windowH;
                    }
                    //imagesResizePcMb();
                    imagesSwiper.update();
                    imagesSwiper.slideTo($scope.activeIndex +1, 0);
                });
                $("body").on("click", "#popup_images-wrap .js-closepop, #popup_images-wrap .popup-dim", function($e) {
                    $e.preventDefault();
                    popup_images.close();
                });

                /* === zoom ===  panzoom.reset()*/
                var zoom_range = document.querySelector('.js-zoom_inout');
                var panzoom = "";

                function panzoom_set() {
                    console.log("=====================>panzoom_set");

                    panzoom = Panzoom(zoom_range, {
                        /* disablePan: true, */
                        maxScale: 4, // (Default: 4)
                        minScale: 1 // (Default: 0.125)
                    });
                    $(".js-zoomin").on("click", function() {
                        panzoom.zoomIn();
                    });
                    $(".js-zoomout").on("click", function() {
                        panzoom.zoomOut();
                    });
                    panzoom.zoom(1, {
                        animate: true
                    })
                }

                function panzoom_reset() {
                    console.log("-------------------------->panzoom_reset");
                    panzoom.reset();
                    panzoom.destroy();
                    panzoom = "";
                    $(".js-zoomin").off("click");
                    $(".js-zoomout").off("click");
                }
                if ($("body").hasClass("is_pc")) {
                    panzoom_set();
                }

                /* 섭네일 클릭 */
                $(".js-thumbnail-list a").on("click", function($e) {
                    $e.preventDefault();
                    var _index = $(this).closest("li").index();
                    imagesSwiper.slideTo(_index + 1);
                    thumbnailActive(_index);
                })

                function thumbnailActive($index) {
                    $(".js-thumbnail-list li").removeClass("active")
                    $(".js-thumbnail-list li").eq($index).addClass("active");
                }


                /* PC,MB images resize */
                $(window).on("resize", function() {
                    imagesResizePcMb();
                    if ($("body").hasClass("is_mb")) {
                        if (panzoom != "") {
                            panzoom_reset();
                        }
                    } else {
                        /* pc */
                        if (panzoom == "") {
                            panzoom_set();
                        }
                    }
                });

            }
            run();
        }
    });
</script>
<!-- // [2022-0516] 사용 -->

<script>
    function Scope() {
        var scope = angular.element(document.getElementById("container")).scope();
        return scope;
    }

</script>
</body>
</html>