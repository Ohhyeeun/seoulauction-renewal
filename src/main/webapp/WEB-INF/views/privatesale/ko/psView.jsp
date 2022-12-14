<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="" ng-controller="ctl" data-ng-init="load();" style="opacity: 0" opacity=1>
<div class="wrapper">
    <div class="sub-wrap pageclass type-details_view">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
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
                                                            <div class="swiper-wrapper js-popup_images">

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

                                            <div class="view_scale-area" ng-if="saleInfo.VIEW_SCALE_YN == 'Y' && ['local_painting', 'foreign_painting'].indexOf(saleInfo.CATE_CD) > -1">
                                                <a class="js-popup_image_viewer" href="#"><i class="icon-view_scale"></i><span>VIEW SCALE</span></a>
                                            </div>
                                        </article>

                                    </div>
                                    <div class="col_item">
                                        <article class="product_detail-article js-product_detail-article">
                                            <div class="index-area">
                                                <div class="index-box"><span ng-bind="saleInfo.AS_NO">10</span></div>
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
                                                    <strong ng-bind="saleInfo.ARTIST_NAME_KO" title="{{saleInfo.ARTIST_NAME_KO}}"></strong>
                                                    <span title="{{'b.' + saleInfo.ARTIST_NAME_KO}}">b.{{saleInfo.ARTIST_NAME_KO}}</span>
                                                </div>
                                                <div class="desc">
                                                    <span ng-bind="saleInfo.TITLE_KO" title="{{saleInfo.TITLE_KO}}"></span>
                                                </div>
                                            </div>
                                            <div class="inquirybtn-area">
                                                <div class="btnset">
                                                    <div class="btn-box">
                                                        <button class="btn btn_black btn_lg" type="button" ng-click="goInquery();"><span>1:1 문의하기</span></button>
                                                    </div>
                                                    <div class="btn-box">
                                                        <button class="print-btn" ng-click="print(saleInfo.SALE_AS_NO);">
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
                                                <span ng-bind="saleInfo | size_text_cm"></span> <span>{{saleInfo.MAKE_YEAR_KO}}</span> <br />
                                                <span bind-html-compile="saleInfo.SIGN_INFO_KO"><br /></span>

                                                <%--에디션--%>
                                                <div ng-show="saleInfo.EDITION">
                                                    <span> {{saleInfo.EDITION}} </span>
                                                </div>

                                                <%--제작년도--%>
                                                <div ng-show="isNotObjectEmpty(saleInfo.MAKE_YEAR_JSON)">
                                                    <span title="{{saleInfo.MAKE_YEAR_JSON | locale_format }}">{{saleInfo.MAKE_YEAR_JSON | locale_format }}</span>
                                                </div>

                                                <%--서명 정보--%>
                                                <div ng-show="isNotObjectEmpty(saleInfo.SIGN_INFO_JSON)">
                                                    <span title="{{saleInfo.SIGN_INFO_JSON | locale_format }}">{{saleInfo.SIGN_INFO_JSON | locale_format }}</span>
                                                </div>
                                            </div>
                                            <!-- [0714]작품정보 하위댑스 추가 -->
                                            <div class="info-sub-wrap">
                                                <%-- CONDITION --%>
                                                <div ng-show="isNotObjectEmpty(saleInfo.COND_RPT_JSON)" class="info-sub-box">
                                                    <div class="tit tt5">CONDITION</div>
                                                    <div class="desc" bind-html-compile="saleInfo.COND_RPT_JSON[locale]"></div>
                                                </div>

                                                <%--PROVENANCE--%>
                                                <div ng-show="isNotObjectEmpty(saleInfo.PROV_INFO_JSON)" class="info-sub-box">
                                                    <div class="tit tt5">PROVENANCE</div>
                                                    <div class="desc" bind-html-compile="saleInfo.PROV_INFO_JSON[locale]"></div>
                                                </div>

                                                <%--LITERATURE--%>
                                                <div ng-show="isNotObjectEmpty(saleInfo.LITE_INFO_JSON)" class="info-sub-box">
                                                    <div class="tit tt5">LITERATURE</div>
                                                    <div class="desc">{{saleInfo.LITE_INFO_JSON | locale_format }}</div>
                                                </div>

                                                <%--EXHIBITED--%>
                                                <div ng-show="isNotObjectEmpty(saleInfo.EXHI_INFO_JSON)" class="info-sub-box">
                                                    <div class="tit tt5">EXHIBITED</div>
                                                    <div class="desc">{{saleInfo.EXHI_INFO_JSON | locale_format }}</div>
                                                </div>
                                            </div>
                                            <!-- //[0714]작품정보 하위댑스 추가 -->
                                        </div>

<%--                                        <div class="info-box">--%>
<%--                                            <div class="title">Condition Report</div>--%>
<%--                                            <div class="desc">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

                                        <!-- [0714]작품설명 추가 -->
                                        <div ng-show="isNotObjectEmpty(saleInfo.CMMT_JSON)" class="info-box">
                                            <div class="title">작품 설명</div>
                                            <div class="desc txt-pre-line">{{saleInfo.CMMT_JSON | locale_format }}</div>
                                        </div>
                                        <!-- //[0714]작품설명 추가 -->

                                        <!-- [0714]Notice 추가 -->
                                        <div class="info-box">
                                            <div class="title">NOTICE</div>
                                            <div class="desc">
                                                <ul class="mark_dot-list">
                                                    <li class="txt-pre-line">서울옥션은 작가 및 작품명에 한하여 낙찰일로부터 3년간 낙찰자에 대해서만 보증하며, 사전 고지한 작품에 대해서는 보증책임을 부담하지 않습니다.</li>
                                                    <li class="txt-pre-line">작품은 판매 당시 상태 그대로 판매되므로, 응찰 전 반드시 실물을 확인하여 주시기 바랍니다.<br>
                                                        홈페이지에 기재된 컨디션은 작품 상태에 대한 당사의 주관적 의견을 제시하는 것일 뿐이므로, 내재된 모든 결함, 수리, 변형 등을 언급하지 않을 수 있습니다. 또한 제작된 지 오랜 시간이 경과한 작품에 자연스럽게 확인되는 노화 현상(구김, 마모, 오염, 산화 등)에 대해서도 별도 언급이 없을 수 있습니다.<br>
                                                        컨디션은 작품만을 대상으로 하며 액자, 족자, 병풍, 좌대, 케이스 등 작품 구성품의 상태는 포함하지 않습니다. 온라인에 게재된 이미지로 작품의 일부 컨디션을 확인할 수 있으나 실제 상태를 정확하게 반영하지 못할 수 있으며 작품의 색상, 밝기 등이 실물과 다르게 보일 수 있습니다.<br>
                                                        실물을 확인하지 않고 발생되는 문제에 대한 책임은 응찰자에게 있으며, 이와 같은 유의사항을 반드시 확인하시고 신중히 응찰해 주시길 바랍니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- [0714]//Notice 추가 -->

                                        <div id="artist_layer" class="info-box">
                                            <div class="title">작가정보</div>
                                            <%--0728 삭제--%>
<%--                                            <div class="desc txt-pre-line" id="artistName">--%>
<%--                                            </div>--%>
<%--                                            <div class="desc txt-pre-line" id="artistProfile">--%>
<%--                                            </div>--%>
                                        <%--//0728 삭제--%>
                                            <%--0728 추가--%>
                                            <div class="desc txt-pre-line" id="artistArticle">
                                                <a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a><%--
                                                    --%><a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a><%--
                                                    --%><a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a><%----%>
                                            </div>
                                            <%--//0728 추가--%> 
                                            <div class="desc" id="artistMedia">
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


<%--<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>--%>
<%--<!--[if lt IE 9]> --><script src="/js/plugin/html5shiv.js"></script> <![endif]-->--%>
<%--<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 이미지 뷰어 -->
<div id="popup_image_viewer-wrap" class="trp popupfixed-wrap image_viewer-popup">
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
<%--                                <button class="page_prev"><i class="icon-view_paging_left"></i></button>--%>
<%--                                <span id="view_lot_no"></span>--%>
<%--                                <button class="page_next"><i class="icon-view_paging_right"></i></button>--%>
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
    const locale = document.documentElement.lang;

    app.filter('locale_format', function(){
        return function(val) {
            if (val === undefined) {
                return '';
            }
            let parse = JSON.parse(val);


            return locale === 'ko' ? parse.ko : parse.en;
        };
    });

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

        const getSaleList = ( ) => {
            try {
                return axios.get('/api/privatesale/list');
            } catch (error) {
                console.error(error);
            }
        };

        const getViewScaleList = (saleAsNo) => {
            console.log("getViewScaleList : ", saleAsNo);
            try {
                return axios.get('/api/privatesale/viewScaleList/${saleAsNo}');
            } catch (error) {
                console.error(error);
            }
        };

        $scope.goLot = function (saleAsNo) {
            window.location.href = '/privatesale/psView/' + saleAsNo;
        }

        $scope.goInquery = function () {
            window.location.href = '/mypage/inquiryList';
        }

        $scope.goPrivateSaleList = function () {
            window.location.href = '/privatesale/psList';
        }

        $scope.print = function (saleAsNo) {
            window.location.href = '/privatesale/psView/print/' + saleAsNo;
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
        //오브젝트 or 배열 비었는지 확인
        $scope.isNotObjectEmpty = function (param) {

            if(param === undefined){
                return false;
            }

            let object = JSON.parse(param);

            if(object === undefined){
                return false;
            }
            return object.constructor === Object && Object.keys(object).length !== 0;
        }

        // 호출 부
        $scope.load = function () {
            let run = async function () {
                let [r1, r2, r3, r4] = await Promise.all([getPrivateSaleInfo($scope.saleAsNo),
                    getPrivateSaleImages($scope.saleAsNo),
                    getSaleList(),
                    getViewScaleList($scope.saleAsNo)]);

                $scope.saleInfo = r1.data.data;
                $scope.saleImages = r2.data.data;
                $scope.saleList = r3.data.data;
                $scope.viewScaleList = r4.data.data;

                $scope.activeIndex = 0;
                // popup setting

                let imgUrl = $scope.saleImages[0].IMAGE_URL +
                    $scope.saleImages[0].FILE_PATH + "/" + $scope.saleImages[0].FILE_NAME;

                $("#bidding_title").html($scope.saleInfo.TITLE_KO);
                $("#img_url").attr("src", imgUrl);
                $("#artist_nm").html($scope.saleInfo.ARTIST_NAME_KO);
                $("#born_year").html("(" + $scope.saleInfo.BORN_YEAR + ")");

                $("#lot_title").html("LOT " + $scope.saleInfo.SALE_AS_NO);
                $scope.$apply();

                //artist 번호
                $scope.artistNo = $scope.saleInfo.ARTIST_NO;

                //작가 정보 admin에서 가져오도록 변경
                axios.get('/api/auction/artist_info/' + $scope.artistNo)
                    .then(function(response) {
                        const data = response.data;
                        let success = data.success;

                        if(success){
                            let artistData = data.data;

                            if(!artistData){
                                $("#artist_layer").css("display", "none");
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

                                $("#artistName").html(JSON.parse(artistData.name).ko + ' ' +  artistData.birth + '~' + artistData.death);
                                $("#artistProfile").html(JSON.parse(artistData.profile).ko + '</br>' + title);

                                let html = '<div class="video_img-box">';
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

                let sale_list = $scope.saleList;
                let viewScaleList = $scope.viewScaleList;
                let sale_images = $scope.saleImages;
                let firstCheck = 0;

                // $.each(sale_list, function (index, el) {

                const el = viewScaleList[0];
                    let size1 = 0;
                    let size2 = 0;
                    let unitCd = '';
                    let sale_as_no = el.SALE_AS_NO;

                    if (el.LOT_SIZE_JSON.length > 0) {
                        size1 = el.SIZE1;
                        size2 = el.SIZE2;
                        unitCd = el.UNIT_CD;

                    }
                    let img_url = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;

                    let swiper_slide_item = '';
                    // if (firstCheck == 0) {
                    //     $scope.chk = parseInt(sale_as_no) - index -1;
                    // }
                    // firstCheck++;
                    //if(size1 > 160) {
                    //     swiper_slide_item = `<div class="swiper-slide" id="swiper-private">
                    //                            <div class="img-area">
                    //                             <div class="img-box">
                    //                                 <div class="size_x"><span>` + size1 + unitCd + `</span></div>
                    //                                 <div class="size_y"><span>` + size2 + unitCd + `</span></div>
                    //                                 <div class="images">
                    //                                     <img class="imageViewer" src="` + img_url + `" alt="" size1="` + size1 + `" size2="` + size2 + `" lot_no="` + sale_as_no + `" />
                    //                                 </div>
                    //                             </div>
                    //                         </div>
                    //     </div>`
                    //     if(['traditional_painting'].indexOf($scope.saleInfo.CATE_CD) > -1){
                    //         swiper_slide_item = `<div class="swiper-slide" id="swiper-private">
                    //                             <div class="img-area">
                    //                                 <div class="img-box">
                    //                                     <div class="size_x"><span>` + size1 + unitCd + `</span></div>
                    //                                     <div class="size_y"><span>` + size2 + unitCd + `</span></div>
                    //                                     <div class="images">
                    //                                         <img class="imageViewer" src="` + img_url + `" alt="" " size-x="` + size1 + `" size-y="` + size2 + `" lot_no="` + sale_as_no + `"/>
                    //                                     </div>
                    //                                 </div>
                    //                             </div>
                    //                         </div>`;
                    //     }
                        if(['local_painting', 'foreign_painting'].indexOf($scope.saleInfo.CATE_CD) > -1) {
                            swiper_slide_item = `<div class="swiper-slide" id="swiper-private">
                                                <div class="img-area">
                                                    <div class="img-box">
                                                        <div class="size_x"><span>` + size2 + unitCd + `</span></div>
                                                        <div class="size_y"><span>` + size1 + unitCd + `</span></div>
                                                        <div class="images">
                                                            <img class="imageViewer" src="` + img_url + `" alt="" size-x="` + size2 + `" size-y="` + size1 + `" lot_no="` + sale_as_no + `"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>`;
                        }
                        $("#popup_image_viewer-wrap .gallery_center").html(swiper_slide_item);
                        // $("#swiper-wrapper").html(swiper_slide_item);
                        // $("#swiper-wrapper").append(swiper_slide_item);
                    //}

                // });

                $.each(sale_images, function (index, el) {

                    let popup_lot_no = el.SALE_AS_NO;
                    let popup_img_url = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;
                    let popup_swiper_slide_item = '';
                    let popup_swiper_mini_slide_item = '';

                    //if (size1 > 160) {
                    popup_swiper_slide_item = `<div class="swiper-slide">
                                            <div class="img-area">
                                                <div class="img-box">
                                                    <div class="images">
                                                        <img class="imageViewerpopup" src="` + popup_img_url + `" alt="" lot_no="` + popup_lot_no + `" />
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
                                                            <img src="` + popup_img_url + `" alt="" />
                                                        </div>
                                                    </figure>
                                                    <div class="line"></div>
                                                    </div>
                                                </a>
                                            </li>`
                    $("#thumbnail_image").append(popup_swiper_mini_slide_item);
                });

                /* 싸이즈 버튼 */
                var size_btn_toggle = $(".js-size_btn").trpToggleBtn(
                    function($this) {
                        $($this).closest(".viewer-article").addClass("active");
                    },
                    function($this) {
                        $($this).closest(".viewer-article").removeClass("active");
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
                    //imagesSwiper.slideTo($("#view_lot_no").attr("sel-data-index"), 0);
                });
                $("body").on("click", "#popup_images-wrap .js-closepop, #popup_images-wrap .popup-dim", function($e) {
                    $e.preventDefault();
                    popup_images.close();
                });

                /* 싸이즈 버튼 */
                var size_btn_toggle = $(".js-size_btn").trpToggleBtn(
                    function($this) {
                        $($this).closest(".viewer-article").addClass("active");
                    },
                    function($this) {
                        $($this).closest(".viewer-article").removeClass("active");
                    });


                /* PC,MB images resize */
                $(window).on("resize", function() {
                    imagesResizePcMb();
                });

                /* === 스와이퍼 === */
                /* [0708]  스크립트 수정 */
                console.log("스와이퍼 set");
                var imagesSwiperIndex = 0;
                var imagesSwiper = new Swiper('.js-imagesSwiper .gallery_center', {
                    loop: true,
                    simulateTouch: true,
                    //pagination: ".js-imagesSwiper_pagination",
                    pagination: {
                        el: '.js-imagesSwiper_pagination',
                        type: 'bullets',
                    },
                    paginationClickable: true,
                    breakpoints: {
                        1023: {
                            effect: "slide",
                            simulateTouch: true,
                            slidesPerView: 1,
                            spaceBetween: 10
                        }
                    },
                    // onSlideChangeStart: function(swiper) { // 움직임이 시작하면 실행
                    //     imagesResizePcMb();
                    //     if ($("body").hasClass("is_pc")) {
                    //         panzoom.reset(); // zoom reset
                    //     }
                    // },
                    // onSlideChangeEnd: function(swiper) { // 움직임이 끝나면 실행
                    //     imagesResizePcMb();
                    //     thumbnailActive(swiper.realIndex);
                    //     console.log(">>> ", swiper.realIndex)
                    // }
                    on: {
                        transitionStart: function() {
                            // 움직임이 시작하면 실행
                            imagesResizePcMb();
                            if ($("body").hasClass("is_pc")) {
                                panzoom.reset(); // zoom reset
                            }
                        },
                        transitionEnd: function() {
                            // 움직임이 끝나면 실행
                            if (imagesSwiper != undefined) {
                                imagesSwiperIndex = imagesSwiper.realIndex;
                            }
                            imagesResizePcMb();
                            thumbnailActive();
                        }
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


                /* === zoom ===  panzoom.reset()*/
                // var zoom_range = document.querySelector('.js-zoom_inout');
                // var panzoom = "";
                //
                // function panzoom_set() {
                //     console.log("=====================>panzoom_set");
                //
                //     panzoom = Panzoom(zoom_range, {
                //         /* disablePan: true, */
                //         maxScale: 4, // (Default: 4)
                //         minScale: 1 // (Default: 0.125)
                //     });
                //     $(".js-zoomin").on("click", function() {
                //         panzoom.zoomIn();
                //     });
                //     $(".js-zoomout").on("click", function() {
                //         panzoom.zoomOut();
                //     });
                //     document.addEventListener("wheel", function (e) {
                //         if (e.deltaY > 0) panzoom.zoomOut();
                //         else panzoom.zoomIn();
                //     });
                //     panzoom.zoom(1, {
                //         animate: true
                //     })
                // }
                //
                // function panzoom_reset() {
                //     console.log("-------------------------->panzoom_reset");
                //     panzoom.reset();
                //     panzoom.destroy();
                //     panzoom = "";
                //     $(".js-zoomin").off("click");
                //     $(".js-zoomout").off("click");
                // }
                // if ($("body").hasClass("is_pc")) {
                //     panzoom_set();
                // }

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

    function goPrivateSale(){
        window.location.href = '/privatesale/psList';
    }
</script>

<!-- // [2022-0516] 사용 -->
<script>

    function Scope() {
        var scope = angular.element(document.getElementById("container")).scope();
        return scope;
    }

</script>
<script>

    $(function() {

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
            document.addEventListener("wheel", function (e) {
                if (e.deltaY > 0) panzoom.zoomOut();
                else panzoom.zoomIn();
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


    });
</script>

</body>

</html>