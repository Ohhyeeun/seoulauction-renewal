<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../common/angular.jsp"/>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <!-- header -->
    <meta name="naver-site-verification" content="e43736eddfc3d46038024a9d2132da077391aadf"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="미술품 경매를 통해 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.">
    <meta name="keywords" content="미술품,경매,작품,미술,근현대,고미술,와인,보석,구매,판매,위탁,경매회사,갤러리,케이옥션,K옥션,seoulauction,auction">
    <meta name="author" content="SeoulAuction">
    <meta name="Copyright" content="SeoulAuction" />
    <meta name="Classification" content="회사소개, 미술품소개, 경매, 구매, 위탁" />
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.seoulauction.com">
    <meta property="og:title" content="SeoulAuction">
    <meta property="og:description" content="미술품 경매를 통해 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.">
    <meta property="og:image" content="/images/pc/thumbnail/201508122329463497773394954126.jpg"/>
    <meta property="al:web:url" content="https://www.seoulauction.com">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/images/favic/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <meta name="application-name" content="SeoulAuction" />
    <!— Windows 8.1 + IE11 and above —>
    <meta name="msapplication-config" content="/webapp/browserconfig.xml" />
    <title>오프라인 응찰하기 | Seoul Auction</title>
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/favic/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/favic/apple-icon-57x57.png">
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/favic/apple-icon-60x60.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/favic/apple-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/favic/apple-icon-76x76.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/favic/apple-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/favic/apple-icon-120x120.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/favic/apple-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/favic/apple-icon-152x152.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/images/favic/apple-icon-180x180.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/iamges/favic/apple-touch-icon.png">
    <link rel="icon" type="image/svg+xml" href="/images/favic/favicon.svg">
    <link rel="icon" type="image/png" href="/images/favic/favicon.png">
    <link rel="mask-icon" href="/images/favic/sa-full-icon.svg">
    <link rel="manifest" href="/webapp/manifest.json">
    <link rel="icon" type="image/png" href="/images/favic/android-icon-192x192.png" sizes="192x192"/>

    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css"/>
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" href="/css/live_auction.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <header class="win_header">
            <div class="header-inner">
                <a href="/" class="header_logo"><span class="blind-text">logo</span></a>
            </div>
        </header>
        <!-- //header -->
        <!-- container -->
        <div id="container" ><%-- ng-controller="ctl" data-ng-init="load();" ng-cloak--%>
            <div id="contents" class="contents">
                <section class="basis-section last-section bidding_offline-section">
                    <div class="section-inner">
                        <div class="section-header">
                            <div class="title-area">
                                <div class="title">
                                    <span id="sale_title"></span>
                                </div>
                            </div>
                            <div class="btn-area">
                                <div class="select-box pc-ver">
                                    <select id="pc-currency-select-box" >
                                        <%-- <option ng-repeat="item in currencyTypes" value="{{item.value}}">
                                             {{item.name}}
                                         </option>--%>
                                    </select>
                                    <i class="form-bidding_select_arrow"></i>
                                </div>
                            </div>
                        </div>
                        <div class="section-body">
                            <div class="bidding_pc pcVer">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-left">
                                        <div class="lotlist-wrap">
                                            <div class="lotlist-header">
                                                <div class="header_top">
                                                    <p class="totalcount">
                                                        <span class="num" lots-total-count></span>
                                                        <span class="unit">LOT</span>
                                                    </p>
                                                </div>
                                                <div class="lotlist-tabmenu" lot-list-menu>
                                                    <%-- lot list tab menu 바인딩 영역--%>
                                                </div>
                                            </div>
                                            <div class="lotlist-tabCont">
                                                <div class="mCustomScrollbar">
                                                    <div class="lotlist-box">
                                                        <ul class="lotlist-inner" lot-list-ul>
                                                            <%-- lot List 바인딩 영역 --%>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="bidding-offline-center">
                                        <div class="notice notice-swiper" style="overflow: hidden">
                                            <i class="icon-notice"></i>
                                            <span class="swiper-wrapper"></span>
                                        </div>
                                        <div class="video_area">
                                            <div class="view_box">
                                                <!-- Youtube -->
                                                <video id="llnw-rts-subscriber" width="100%" height="331" autoplay controls muted>
                                                </video>
                                            </div>
                                            <div class="view_info">
                                                <%--                                                <p class="view_count">--%>
                                                <%--                                                    <i class="icon-viewer"></i><span class="unit">시청자</span> <span class="num" ng-bind="viewers"></span>--%>
                                                <%--                                                </p>--%>
                                                <button class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>동영상 새로고침</button>
                                            </div>
                                        </div>
                                        <div class="my_lot my_lot_type3-box" my-info-tab>
                                            <div class="my_lot_info">
                                                <%--tab Control 영역--%>
                                            </div>
                                            <div class="my_lot_wrap">
                                                <%-- tab Elements 영역 --%>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="bidding-offline-right">
                                        <figure class="view-area lot-view">
                                            <div class="lot-view_top">
                                                <div class="view-img_wrap">
                                                    <div class="view-img">
                                                        <div class="img-box">
                                                            <div class="box-inner">
                                                                <img now-lot-image src="/images/temp/temp_img1_big.jpg" alt="LOT 02">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <figcaption class="view-typo">
                                                    <div class="typo-header">
                                                        <div class="num"><span now-lot-no></span></div>
                                                        <div class="title"><span now-lot-artist-name></span></div>
                                                        <div class="year"><span now-lot-artist-birthOfDeath></span></div>
                                                        <div class="desc"><span now-lot-title></span></div>
                                                    </div>
                                                    <div class="typo-body">
                                                        <div class="price_won"><span now-lot-expe-price></span></div>
                                                        <div class="price_other"><span now-lot-expe-price-currency></span></div>
                                                    </div>
                                                </figcaption>
                                            </div>
                                            <div class="biddingprice_wrap">
                                                <div class="now_price">
                                                    <p class="txt">현재가</p>
                                                    <p class="price_unit1" now-lot-price></p>
                                                    <p class="price_unit2" now-lot-price-currency></p><%-- selected currency (USD 9,999,999)--%>
                                                </div>
                                                <%-- 응찰 버튼 바인딩 영역 (응찰하기 | viewonly) --%>
                                                <div class="bid_price view_only" biding-button-div>
                                                    <button biding-button class="btn_bid" onclick="clickBidingButton(this);" disabled>
                                                    </button>
                                                </div>
                                            </div>
                                        </figure>
                                        <div class="bidding_situation">
                                            <div class="alert_wrap" biding-notice-div>
                                                <p class="situ_alert" ></p>
                                            </div>
                                            <div class="mCustomScrollbar">
                                                <ul class="situation_list" biding-row>
                                                    <%-- 응찰 Row 바인딩 영역  --%>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <!-- mobile 버전 -->
                            <div class="bidding_mo mobileVer m-ver" >
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-center">
                                        <div class="notice notice-swiper" style="overflow: hidden;">
                                            <i class="icon-notice"></i>
                                            <span class="swiper-wrapper"></span>
                                        </div>
                                        <div class="video_area">
                                            <div class="view_box">
                                                <!-- Youtube -->
                                                <video id="llnw-rts-subscriber2" style="width:100%;margin:0 auto;" autoplay controls muted></video>
                                            </div>
                                            <div class="view_info">
                                                <p class="view_count">
                                                    <%--                                                    <i class="icon-viewer"></i><span class="unit">시청자</span> <span--%>
                                                    <%--                                                        class="num" ng-bind="viewers"></span>--%>
                                                </p>
                                                <button class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>새로고침</button>
                                            </div>
                                        </div>
                                        <div class="my_lot my_lot_type3-box">
                                            <div class="my_lot_wrap">
                                                <div class="my_lot_live">
                                                    <div class="view-img_wrap">
                                                        <div class="view-img">
                                                            <div class="img-box">
                                                                <div class="box-inner">
                                                                    <img now-lot-image src="/images/temp/temp_img1_big.jpg" alt="LOT 02">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="type1_info_box">
                                                        <div>
                                                            <div class="select-box">
                                                                <select id="mo-currency-select-box" >

                                                                </select>
                                                                <i class="form-bidding_select_arrow"></i>
                                                            </div>
                                                            <div class="num"><span now-lot-no>2</span> <em class="live_box">LIVE</em> </div>
                                                            <div class="title"><span now-lot-artist-name></span></div>
                                                            <div class="year"><span now-lot-artist-birthOfDeath></span></div>
                                                            <div class="desc"><span now-lot-title></span></div>
                                                            <div class="price"><span now-lot-expe-price></span></div>
                                                            <div class="price_other"><span now-lot-expe-price-currency></span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="view-area lot-view">
                                            <div class="biddingprice_wrap">
                                                <div class="now_price">
                                                    <p class="txt">현재가</p>
                                                    <p class="price_unit1" now-lot-price></p>
                                                    <p class="price_unit2" now-lot-price-currency></p>
                                                </div>
                                                <%-- 모바일 응찰 버튼 바인딩 영역 (응찰하기 | viewonly) --%>
                                                <div class="bid_price view_only" biding-button-div>
                                                    <button biding-button class="btn_bid" onclick="clickBidingButton(this);" disabled>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="my_lot">
                                            <div class="my_lot_wrap" mobile-regular-notice-tab>
                                                <%-- 정회원 안내 영역 --%>
                                            </div>
                                        </div>

                                        <div class="bidding_situation">
                                            <div class="alert_wrap" biding-notice-div>
                                                <p class="situ_alert" ></p>
                                            </div>
                                            <div class="mobile_scroll-type">
                                                <ul class="situation_list" biding-row>
                                                    <%-- 모바일 응찰 Row 바인딩 영역  --%>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="my_lot" my-info-tab>
                                            <div class="my_lot_info">
                                                <%-- 모바일 tab Control 영역 --%>
                                            </div>
                                            <div class="my_lot_wrap" >
                                                <%-- 모바일 tab Elements 영역 --%>
                                            </div>
                                        </div>

                                    </article>
                                </div>
                            </div>
                            <!-- //mobile 버전 -->
                        </div>
                        <div class="section-footer">
                            <div class="tac">
                                <a class="btn btn_default " href="javascript:self.close();" role="button"><span>닫기</span></a>
                            </div>
                        </div>

                    </div>
                </section>

            </div>
        </div>
        <!-- //container -->
        <!-- stykey -->
        <div class="scroll_top-box">
            <div class="box-inner">
                <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
            </div>
        </div>
        <!-- // stykey -->
    </div>

    <!-- 전체 LOT 보기 -->
    <div class="m-ver mobileVer">
        <aside class="allview_fixed-wrap">
            <div class="popup-dim"></div>
            <!-- [0712]외부영역 클릭 시 닫힘:class(js-modal) 추가 -->
            <div class="fixed-panel js-modal">
                <div class="panel-header">
                    <button class="js-fixed_total"><span>전체 LOT 보기</span><i class="icon-fixed_arrow-2x"></i></button>
                </div>
                <div class="panel-body">
                    <article class="bidding-offline-left">
                        <div class="lotlist-wrap">
                            <div class="lotlist-header">
                                <div class="header_top">
                                    <p class="totalcount">
                                        <span class="num" lots-total-count></span>
                                        <span class="unit">LOT</span></p>
                                </div>

                                <div class="lotlist-tabmenu" lot-list-menu>
                                    <%-- 모바일 lot list tab menu 바인딩 영역--%>
                                </div>
                            </div>
                            <div class="lotlist-tabCont">
                                <div class="mobile_scroll-type">
                                    <div class="lotlist-box">
                                        <ul class="lotlist-inner" lot-list-ul>
                                            <%-- 모바일 lot List 바인딩 영역 --%>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </aside>
    </div>
    <%-- 전체 lot 보기 END --%>


    <!-- 통화안내 -->
    <div id="money_help-wrap" class="trp popupfixed-wrap auction_info-popup  ">
        <div class="popup-dim"></div>
        <div class="popup-align mode-ms mode-mb_center">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <article class="auction_info-article">
                                    <div class="img">
                                        <img class="only_ib-pc" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                        <img class="only_ib-mb" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                    </div>
                                    <div class="title"><span>Seoul Auction 안내</span></div>
                                    <div class="gray-box">
                                        <ul class="mark_dot-list">
                                            <!-- [0613]텍스트수정 -->
                                            <li>원화(KRW) 이외의 통화는 해외 응찰자들의 참고를 위해 제공됩니다.</li>
                                            <!-- //[0613]텍스트수정 -->
                                            <li>모든 응찰 및 결제는 원화(KRW)로 이뤄집니다.</li>
                                            <li>서울옥션은 환율 적용 과정에서 생기는 차이 및 실수에 대해서 책임을
                                                부담하지 않습니다.</li>
                                        </ul>
                                    </div>

                                    <div class="check-box">
                                        <span class="trp checkbox-box">
                                            <input id="checkbox_check" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox_check">동의합니다.</label>
                                        </span>
                                    </div>
                                    <div class="btn_set-float tac">
                                        <button class="btn btn_point js-checkbox_check" onclick="confirmEnd()"><span>확인</span></button>
                                    </div>
                                </article>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../../common/commonJs.jsp"/>
    <jsp:include page="../../common/commonJSNotMain.jsp"/>
    <script src="/js/pages_common_ko.js" type="text/javascript"></script>


    <%-- 전체 lot 보기 --%>
    <script>
        $(".allview_fixed-wrap .js-fixed_total").trpToggleBtn(function($this) {
            $($this).addClass("on");
            $($this).closest(".allview_fixed-wrap").addClass("active");
        }, function($this) {
            $($this).removeClass("on");
            $($this).closest(".allview_fixed-wrap").removeClass("active");
        });
    </script>

    <!-- [0712]외부영역 클릭 시 닫힘 -->
    <script>
        $(document).mouseup(function(e) {
            closeTotalLotList(e);
        });

        const closeTotalLotList = (e) =>{
            e.preventDefault();
            if ($(".js-modal").has(e.target).length === 0) {
                $(".js-modal").parent(".allview_fixed-wrap").removeClass("active");
                $(".js-modal").closest(".js-fixed_total").removeClass("on");
            }
        }
    </script>


    <!-- youtube -->
    <script>
        var tag = document.createElement('script');

        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        var player;

        function onYouTubeIframeAPIReady() {
            player = new YT.Player('thevideo', {
                height: '360',
                width: '640',
                videoId: 'IwATrgHOefo'
            });
        }

        $('.video_wrap').on('click', function ($e) {
            $e.preventDefault();
            player.playVideo();
            $('.video_thumbnail').hide();
            $('.ic_video_play').hide();
        })

        function Scope() {
            var scope = angular.element(document.getElementById("container")).scope();
            return scope;
        }
        function confirmEnd() {
            $(".js-closepop").click();
            Scope().selectedCurrencyType = Scope().currencyType;
            Scope().$apply();
        }
        /* 통화 전환 시 */
        function selectCurrency(){
            const Currency = document.getElementsByName('js-money_help');

            var money_help = $(".js-money_help").trpLayerFixedPopup("#money_help-wrap");
            $(money_help.getBtn).on("click", function($e) {
                $e.preventDefault();
                money_help.open(this); // or false
                popup_fixation("#money_help-wrap");
            });

            $("body").on("click", "#money_help-wrap .js-closepop, #money_help-wrap .popup-dim", function($e) {
                $e.preventDefault();
                money_help.close();
            });

            $("#checkbox_check").on("change", function($e) {
                if ($(this).prop("checked")) {
                    $(".js-checkbox_check").prop("disabled", false);
                } else {
                    $(".js-checkbox_check").prop("disabled", true);
                }
            });
        }


    </script>

    <script>
        const is_login = false;
        const locale = document.documentElement.lang;
        let deviceKind = 'is_pc';
        let classForDevice = '.pcVer';

        const saleNo = ${saleNo}; //경매번호
        const userId = '${member.loginId}';
        const userNo = ${member.userNo};
        const baseCurrency = 'KRW';
        let saleNoticeSwiper;

        let lotList = [{}];
        let lotTotalCount = 0;
        let currentLotNo = 0; //진행중인 랏 번호
        let prevLotNo = 0;
        let myBidingList = [{}];

        // const viewers = 0; //시청자
        let authKind = 'ready'; //권한여부(응찰준비, 응찰가능, 최고가응찰중)
        let selectedType = 'category'
        let selectedCategory = 'all'

        let paddleNo = 0; //패들번호

        const selectedCurrencyType = "KRW";

        /*임시 데이터*/
        const dumy_currencyTypes = [
            {curr_cd : 'CNY', base_price:1, rate : 192.070},
            {curr_cd : 'EUR', base_price:1, rate : 1360.040},
            {curr_cd : 'HKD', base_price:1, rate : 163.830},
            {curr_cd : 'JPY', base_price:1, rate : 9.490},
            {curr_cd : 'USD', base_price:1, rate : 1285.600}
        ]

        window.onload = async () => {
            await init();


        }

        window.onresize = async () =>{
            await init();

        }



        async function init (){
            deviceKind = document.body.getAttribute('data-device');
            classForDevice = deviceKind === 'is_pc'? '.pcVer' : '.mobileVer';

            saleNoticeSwiper = new Swiper(`\${classForDevice} .notice-swiper`, {
                autoplay: {
                    delay: 4000,
                },
                initialSlide : 1,
                allowTouchMove:false, // 마우스 및 손가락 터치 시 슬라이드 이동 가능여부
                touchMoveStopPropagation: true,    //touchmove 중지
                direction:'vertical',
                loop: true,
            });

            const dataInit = async function () {
                let [paddleInfoData, saleInfoData, currencyInfoData, noticesData, categoriesData, lotListData] = await Promise.all([
                    getPaddleInfo(saleNo),
                    getSaleInfo(saleNo),
                    getCurrencyTypes(saleNo),
                    getNotices(saleNo),
                    getCategories(saleNo),
                    getLotList(saleNo, selectedType, selectedCategory),
                ]);

                /* 정적 데이터 */
                //패들번호
                paddleNo = paddleInfoData.data.data;
                bindingElementsByAuth(paddleNo);

                //경매정보
                const saleInfo = saleInfoData.data.data;
                bindingSaleInfo(saleInfo);

                //공지사항
                const noticeList = noticesData.data.data;
                bindingNoticeInfo(noticeList);

                //통화
                const currencyTypes = currencyInfoData;
                currencyTypes.unshift({curr_cd:baseCurrency});
                bindingCurrencyInfo(currencyTypes);

                //카테고리
                const categories = categoriesData.data.data;
                categories.unshift({CD_ID:'all', CD_NM:'전체', CD_NM_EN : 'All'});
                bindingCategoriesInfo(categories);


                /* 동적 데이터 */
                //랏 목록
                lotList = lotListData.data.data;
                lotTotalCount = lotList.length;
                if(lotTotalCount > 0)
                    bindingLotListInfo(lotList, lotTotalCount);

            }

            await dataInit();
            setInterval(await getPollingData, 1000);

        }

        async function getPollingData(){
            let [currentLotData, noticesData] = await Promise.all([
                getCurrentLotInfo(saleNo),
                getNotices(saleNo)
            ]);

            const noticeList = noticesData.data.data;
            if(noticeList.length > 0){
                // bindingNoticeInfo(noticeList);
            }

            const currentLotInfo = currentLotData.data.data;
            currentLotNo = currentLotInfo.LOT_NO;
            bindingCurrentLotInfo(currentLotInfo);

            if(currentLotNo !== prevLotNo ){
                prevLotNo = currentLotNo;
                clickLotItem(currentLotNo);
                moveScrollToCurrentLot();
            }

            if(currentLotNo !== 0) {
                const bidingData = await getCurrentLotBiddingInfo(saleNo, currentLotNo);
                const bidingInfo = bidingData.data.data;
                bindingCurrentLotBidingInfo(bidingInfo);

                const lotListData = await getLotList(saleNo, selectedType, selectedCategory);
                lotList = lotListData.data.data;
                lotTotalCount = lotList.length;
                if (lotTotalCount > 0)
                    bindingLotListInfo(lotList, lotTotalCount);

                if (authKind !== 'viewonly') {
                    const myBidingData = await getMyBidingList(saleNo);
                    myBidingList = myBidingData.data.data;
                    bindingMyBidingInfo(myBidingList);
                }
            }
        }


        /*통화 목록*/
        const getCurrencyTypes = (saleNo) =>{
            return dumy_currencyTypes;
        }

        /*공지사항*/
        function getNotices(){
            try {
                return axios.get('/api/auction/live/sales/'+saleNo+'/bid-notice');
            } catch (error) {
                console.error(error);
            }
        }

        /*패들정보*/
        const getPaddleInfo = (saleNo) =>{
            try {
                return axios.get('/api/auction/paddles/'+saleNo);
            } catch (error) {
                console.error(error);
            }
        }

        /*경매정보*/
        const getSaleInfo =(saleNo)=>{
            try {
                return axios.get('/api/auction/live/sales/'+saleNo);
            } catch (error) {
                console.error(error);
            }
        }

        /*카테고리*/
        const getCategories = (saleNo) => {
            try {
                return axios.get('/api/auction/live/sales/'+saleNo+'/types');
            } catch (error) {
                console.error(error);
            }
        }


        /*진행중인 랏 정보*/
        function getCurrentLotInfo(){
            try {
                return axios.get('/api/auction/live/sales/'+saleNo+'/bidding-lot-now');
            } catch (error) {
                console.error(error);
            }
        }

        /*실시간 응찰 내역*/
        function getCurrentLotBiddingInfo(saleNo, lotNo){
            try {
                return axios.get('/api/auction/live/sales/'+saleNo+'/lots/'+lotNo+'/site-bidding');
            } catch (error) {
                console.error(error);
            }
        }

        /*랏 목록*/
        const getLotList=(saleNo, type, cd_id)=>{
            try {
                const paramQuery = cd_id !== 'all'? '?'+type+'='+encodeURI(cd_id) : '';
                return axios.get('/api/auction/live/sales/'+saleNo+'/lots'+paramQuery);
            } catch (error) {
                console.error(error);
            }
        }

        /* 내 응찰 내역 */
        const getMyBidingList = (saleNo) =>{
            try {
                return axios.get('api/auction/live/sales/'+saleNo+'/my-bidding');
            } catch (error) {
                console.error(error);
            }
        }

        /* 데이터 바인딩 */
        const bindingSaleInfo = (data) => {
            const saleThTitle = localeOrdinal(data.SALE_TH,locale) + data.SALE_TITLE_JSON[locale];
            document.getElementById("sale_title").innerText = saleThTitle;
        }



        const bindingNoticeInfo = (data) => {
            saleNoticeSwiper.removeAllSlides();

            let noticeSlide = [];
            data.forEach(item => {
                noticeSlide.push(`<span class="swiper-slide txt">`+item.CONTENT_JSON[locale]+`</span>`);
            })
            saleNoticeSwiper.appendSlide(noticeSlide);
            saleNoticeSwiper.update();

            const el_noticeSwiper = document.querySelector(`\${classForDevice} .notice-swiper`);
            el_noticeSwiper.style.height = classForDevice === '.pcVer'? '50px' : '58px';
        }

        const bindingCurrencyInfo = (data) => {
            let currencyDom = "";
            data.map(item => {
                currencyDom += `<option value="`+item.curr_cd+`">
                                    `+item.curr_cd+`
                                </option>;`
            })
            const selectorName = classForDevice === '.pcVer'? 'pc-currency-select-box' : 'mo-currency-select-box';
            const currencyArea = document.getElementById(selectorName);
            currencyArea.innerHTML = currencyDom
        }

        const bindingElementsByAuth = (paddleNo) =>{
            authKind = paddleNo > 0? 'ready' : 'viewonly';
            setDisplayMyTabArea(authKind);
            if(authKind !== 'viewonly'){
                document.getElementById("paddleNo").innerText = paddleNo;
            }
        }

        const setBidingButton = (authKind, nextBidPrice) => {
            const el_bidPriceButton = document.querySelector(`\${classForDevice} [biding-button-div]`);

            let btnContentDom = ``;
            switch (authKind){
                case 'ready' :
                    el_bidPriceButton.classList.add("view_only");
                    el_bidPriceButton.querySelector(".btn_bid").setAttribute("disabled",true);
                    btnContentDom = `<p class="txt">응찰 준비</p>`;
                    break;
                case 'closed' :
                    el_bidPriceButton.classList.add("view_only");
                    el_bidPriceButton.querySelector(".btn_bid").setAttribute("disabled",true);
                    btnContentDom = `<p class="txt">응찰 마감</p>`;
                    break;
                case 'highest' :
                    el_bidPriceButton.classList.remove("view_only");
                    el_bidPriceButton.querySelector(".btn_bid").setAttribute("disabled",true);
                    el_bidPriceButton.querySelector(".btn_bid").setAttribute("data-bid-price", nextBidPrice);
                    btnContentDom = `<p class="txt">최고가 응찰중</p>
                                     <p class="price_unit1">\${baseCurrency} \${numberWithCommas(nextBidPrice)}</p>
                                     <p class="price_unit2"></p>`;
                    break;
                case 'biding' :
                    el_bidPriceButton.classList.remove("view_only");
                    el_bidPriceButton.querySelector(".btn_bid").removeAttribute("disabled");
                    el_bidPriceButton.querySelector(".btn_bid").setAttribute("data-bid-price", nextBidPrice);
                    btnContentDom = `<p class="txt">응찰하기</p>
                                     <p class="price_unit1">\${baseCurrency} \${numberWithCommas(nextBidPrice)}</p>
                                     <p class="price_unit2"></p>`;
                    break;
                default :
                    el_bidPriceButton.classList.add("view_only");
                    el_bidPriceButton.querySelector(".btn_bid").setAttribute("disabled",true);
                    btnContentDom = `<p class="txt">VIEW ONLY</p>`;
                    break;
            }
            el_bidPriceButton.querySelector(`[biding-button]`).innerHTML = btnContentDom;
        }

        const clickBidingButton = ($this) => {
            const bidPrice = $this.getAttribute("data-bid-price");
            try{
                axios.post('/api/auction/live/sales/'+saleNo+'/lots/'+currentLotNo+'/offline-bidding',{
                    "bidKindCd": "online",
                    "bidNotice": null,
                    "bidNoticeEn": null,
                    "bidPrice": bidPrice,
                }).then(function(res) {
                    if(res.data.success) {

                    }else{
                        alert(res.data.data.msg);
                    }
                });
            }catch(error){
                console.error(error);
            }
        }

        const setDisplayMyTabArea = (authKind) => {
            const el_myLotArea = document.querySelector(`\${classForDevice} [my-info-tab]`);
            let tabDom = ``;
            if(authKind !== 'viewonly'){
                const tabControlDom = `<div class="lotlist-tabmenu">
                                            <div class="btn_item">
                                                <a href="javascript:void(0);"
                                                   class="lot-btn_tabmenu on"
                                                   onClick="changeInfoTab(this, 1)"
                                                   role="button">LOT</a>
                                            </div>
                                            <div class="btn_item">
                                                <a href="javascript:void(0);"
                                                   class="lot-btn_tabmenu"
                                                   onClick="changeInfoTab(this, 2)"
                                                   role="button">내 응찰내역</a>
                                            </div>
                                        </div>
                                        <p class="count">
                                            <span class="txt">패들번호 : </span>
                                            <span id="paddleNo" class="num"></span>
                                        </p>`

                const tab1 = `<div class="my_lot_tab my_lot_type1" >
                                    <a href="#" id="btnMoveCurrentLot" onClick="moveCurrentLot(event)" class="lot_link" >현재 LOT 이동</a>
                                    <div class="view-img_wrap">
                                        <div class="view-img">
                                            <div class="img-box">
                                                <div class="box-inner">
                                                    <img src="/images/temp/temp_img1_big.jpg">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="type2_info_box">
                                        <div>
                                            <div class="num"><span info-lot-no></span>
                                            </div>
                                            <!-- [0516]년도내용수정 -->
                                            <div class="title"><span info-lot-artist-name></span></div>
                                            <div class="desc"><span info-lot-title></span></div>
                                            <div class="standard">
                                                <span class="lot-mate" info-lot-mate></span>
                                                <div class="size_year">
                                                    <span class="lot-size" info-lot-size></span>
                                                    <span class="lot-year" info-lot-year></span>
                                                </div>
                                            </div>
                                            <div class="detail">
                                                <a href="#" target="_blank" class="btn btn_gray" >상세보기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>`

                const tab2 = `<div class="my_lot_tab my_lot_type2" style='display:none' >
                                    <div class="my_lot_header">
                                        <table class="table_base my_lot_table">
                                            <colgroup>
                                                <col width="16%">
                                                <col width="">
                                                <col width="">
                                                <col width="14%">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>LOT</th>
                                                <th>최고응찰금액</th>
                                                <th>낙찰가</th>
                                                <th>현황</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="my_lot_body">
                                        <div class="\${classForDevice === '.pcVer' ? `mCustomScrollbar js-scroll_center` : `mobile_scroll-type`}">
                                            <div class="scroll-inner">
                                                <table class="table_base my_lot_table">
                                                    <colgroup>
                                                        <col width="16%">
                                                        <col width="">
                                                        <col width="">
                                                        <col width="14%">
                                                    </colgroup>
                                                    <tbody>
<!--                                                    <tr ng-repeat="item in userBids">-->
<!--                                                        <td ng-bind="item.customer.lot_no"></td>-->
<!--                                                        <td ng-bind="item.bid_cost | currency"></td>-->
<!--                                                        <td ng-bind="item.max_bid_cost | currency"></td>-->
<!--                                                        <td><span class="lot-stat" ng-bind="item.winner_state | winnerText"></span></td>-->
<!--                                                    </tr>-->
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>`

                tabDom +=  tab1 + tab2 ;
                el_myLotArea.querySelector('.my_lot_info').innerHTML = tabControlDom;
                el_myLotArea.querySelector(".my_lot_wrap").innerHTML = tabDom;
            }else{
                tabDom = `<div class="my_lot_type3">
                                <p class="title">
                                    라이브 경매 응찰은 <span>정회원부터 가능</span>합니다.
                                </p>
                                <p class="txt">
                                    정회원은 유료로 운영되며 서울옥션이 발행하는 <br>
                                    간행물(각종 도록, 전시 안내 등)을 받으실 수 있습니다.
                                </p>
                               <!-- <div class="member_price">
                                    &lt;!&ndash; [0613]삭제
                                  <p class="p_txt">정회원 연회비 : 라이브 경매 응찰은 사전 신청한 정회원만 가능합니다.</p>
                                  // &ndash;&gt;
                                    <a href="#" class="btn btn_member">정회원 결제</a>
                                </div>-->
                            </div>`

                if(classForDevice === '.pcVer'){
                    el_myLotArea.querySelector(".my_lot_wrap").innerHTML = tabDom;
                }else{
                    document.querySelector("[mobile-regular-notice-tab]").innerHTML = tabDom;
                }
            }

        }

        const bindingCategoriesInfo = (data) => {
            let categoryDom = ``;
            data.map(item => {
                const isSelect = item.CD_ID === 'all'? 'on' : '';
                const categoryName = locale === 'ko'? item.CD_NM : item.CD_NM_EN;
                categoryDom += `<div class="btn_item">
                                    <a href="javascript:void(0);" onClick="changeCategory(this,'\${item.TYPE}','\${item.CD_ID}')" class="lot-btn_tabmenu `+isSelect+`" >`+categoryName+`</a>
                                </div>`;
            });
            document.querySelector(`\${classForDevice} [lot-list-menu]`).innerHTML =  categoryDom;
        }

        const bindingLotListInfo = (lotList, totalCount) => {
            //총 개수
            document.querySelector(`\${classForDevice} [lots-total-count]`).innerText = totalCount;

            //랏 리스트
            let lotListDom = "";
            lotList.map((item) =>{
                //출품 취소 : reentry, 출품 : entry
                if(item.STAT_CD === 'reentry'){
                    lotListDom += `<li class="lotitem cancel" data-status="\${item.STAT_CD}">
                                        <p class="txt">
                                            LOT `+item.LOT_NO+`<br>
                                            출품이 취소되었습니다.
                                        </p>
                                    </li>`;
                }else{
                    const artistName = isNotObjectEmpty(item.ARTIST_NAME_JSON) ? item.ARTIST_NAME_JSON[locale]: '';
                    const lotTitle = item.LOT_TITLE_JSON[locale];
                    const isFavoriteStatus = item.FAVORITE_YN? 'on' : '';
                    const isClosed = item.CLOSE_YN && item.MAX_BID_PRICE !== null;
                    const isCurrent = item.LOT_NO === currentLotNo;
                    const liveBadge = `<em class="live_box">LIVE</em>`;

                    lotListDom += `<li class="lotitem \${isCurrent? 'active live' : ''}" data-lotIdx="\${item.LOT_NO}" data-status="\${item.STAT_CD}" ><!-- bidded -->
                                        <div class="js-select_lotitem lotitem_wrap">
                                            <div class="view-img">
                                                <div class="img-box">
                                                    <div class="box-inner">
                                                        <img src="https://www.seoulauction.com/nas_img/\${item.LOT_IMG_PATH}/\${item.LOT_IMG_NAME}" alt="LOT \${item.LOT_NO}">
                                                    </div>
                                                </div>
                                            </div>
                                            \${classForDevice === '.pcVer' ?
                                                `<div class="item-cont">
                        <div class="num"><span class="snum">\${item.LOT_NO}</span>\${isCurrent? liveBadge : ``}</div>
                    <div class="title"><span>\${ artistName }</span></div>
                    <div class="desc"><span>\${ lotTitle }</span></div>
                    <div class="price ">
                        \${ isClosed ? `<span style='color:#DB1B1B'>낙찰가 \${baseCurrency} \${numberWithCommas(item.MAX_BID_PRICE)}</span>` : `<span>\${baseCurrency} \${numberWithCommas(item.EXPE_PRICE_FROM_JSON[baseCurrency])}~\${numberWithCommas(item.EXPE_PRICE_TO_JSON[baseCurrency])}</span>`}
                                                    </div>
                                                </div>`
                :
                    `<div class="item-cont">
                                                    <div class="num-box">
                                                        <div class="num"><span class="snum">\${item.LOT_NO}</span></div>
                                                    </div>
                                                    <div class="typo-box">
                                                        <div class="title"><span>\${artistName}</span></div>
                                                        <div class="desc"><span>\${lotTitle}</span></div>
                                                    </div>
                                                    <div class="btn-box">
                                                        <button id="btnFav\${item.LOT_NO}" data-status="\${isFavoriteStatus}" onclick="toggleFavoriteLot(event,\${item.LOT_NO})" class="btn-lotChk js-work_heart \${isFavoriteStatus}">Favorite</button>
                                                    </div>
                                               </div>`
                }
            </div>
                \${classForDevice === '.pcVer'? `<button id="btnFav\${item.LOT_NO}" data-status="\${isFavoriteStatus}" onclick="toggleFavoriteLot(event,\${item.LOT_NO})" class="btn-lotChk js-work_heart \${isFavoriteStatus}">Favorite</button>` : ``}
                </li>`;
            }

        });

        document.querySelector(`\${classForDevice} [lot-list-ul]`).innerHTML = lotListDom;

        /*binding onclick event*/

        const lotItemList = document.querySelectorAll(".lotlist-inner .lotitem[data-status='entry']");
        lotItemList.forEach(item =>{
            item.addEventListener('click', (e) =>{
                e.preventDefault();
                const lotIdx = item.getAttribute('data-lotIdx');
                clickLotItem(lotIdx);
            });
        });



        }

        const clickLotItem = (lotIdx) =>{
            if(classForDevice === '.mobileVer'){
                $(document).mouseup();//close lot list layer
            }
            const data = lotList.filter(item => item.LOT_NO == lotIdx)[0];

            const lotSizeArray = JSON.parse(data.LOT_SIZE_ARRAY);
            const el_lotImage = document.querySelector(".my_lot_type1 .view-img_wrap img");
            const el_lotInfo = document.querySelector(".my_lot_type1 .type2_info_box");

            if(lotIdx === currentLotNo){
                document.getElementById("btnMoveCurrentLot").style.display = 'none';
            }else{
                document.getElementById("btnMoveCurrentLot").style.display = 'block';
            }

            el_lotImage.src = `https://www.seoulauction.com/nas_img/\${data.LOT_IMG_PATH}/\${data.LOT_IMG_NAME}`
            el_lotInfo.querySelector(".num span").innerHTML = data.LOT_NO;
            el_lotInfo.querySelector(".title span").innerHTML = isNotObjectEmpty(data.ARTIST_NAME_JSON) ? data.ARTIST_NAME_JSON[locale] : '';
            el_lotInfo.querySelector(".desc span").innerHTML = data.LOT_TITLE_JSON[locale];
            el_lotInfo.querySelector(".standard .lot-mate").innerHTML = isNotObjectEmpty(data.MATE_CD)? data.MATE_CD[locale] : '';
            el_lotInfo.querySelector(".standard .size_year .lot-size").innerHTML = js_size_text_cm(lotSizeArray);
            el_lotInfo.querySelector(".detail a").href = "/auction/live/view/"+saleNo+"/"+data.LOT_NO;
            if(isNotObjectEmpty(data.MAKE_YEAR_JSON)){
                el_lotInfo.querySelector(".standard .size_year .lot-year").style.display = 'inline-block';
                el_lotInfo.querySelector(".standard .size_year .lot-year").innerHTML = data.MAKE_YEAR_JSON[locale];
            }else{
                el_lotInfo.querySelector(".standard .size_year .lot-year").style.display = 'none';
            }
        }

        const bindingCurrentLotInfo = (data) =>{
            const el_nowLotImg = document.querySelector(`\${classForDevice} [now-lot-image]`);
            el_nowLotImg.src = `https://www.seoulauction.com/nas_img/\${data.LOT_IMG_PATH}/\${data.LOT_IMG_NAME}`;
            el_nowLotImg.alt = "LOT "+ data.LOT_NO;

            const el_nowLotNo = document.querySelector(`\${classForDevice} [now-lot-no]`);
            const el_artistName = document.querySelector(`\${classForDevice} [now-lot-artist-name]`);
            const el_birthOfDeath = document.querySelector(`\${classForDevice} [now-lot-artist-birthOfDeath]`);
            const el_lotTitle = document.querySelector(`\${classForDevice} [now-lot-title]`);
            const el_expePriceFromTo = document.querySelector(`\${classForDevice} [now-lot-expe-price]`);

            //info
            el_nowLotNo.innerHTML = data.LOT_NO;
            el_artistName.innerHTML = data.ARTIST_NAME_JSON[locale]? data.ARTIST_NAME_JSON[locale] : '';
            if(data.BORN_YEAR){
                const dieYear = data.DIE_YEAR? "-"+data.DIE_YEAR : '';
                el_birthOfDeath.innerHTML = "b."+ data.BORN_YEAR + dieYear;
            }
            el_lotTitle.innerHTML = data.LOT_TITLE_JSON[locale];
            el_expePriceFromTo.innerHTML = baseCurrency+' '+numberWithCommas(data.EXPE_PRICE_FROM_JSON[baseCurrency])+' ~ '+numberWithCommas(data.EXPE_PRICE_TO_JSON[baseCurrency]);

        }

        const bindingCurrentPrice = (data) => {
            //price(polling)
            const el_currentPrice = document.querySelector(`\${classForDevice} [now-lot-price]`);

            if(data.CURRENT_PRICE != null && data.CURRENT_PRICE > 0){
                el_currentPrice.innerHTML = baseCurrency +' '+ numberWithCommas(data.CURRENT_PRICE);
            }else{
                el_currentPrice.innerHTML = baseCurrency +' '+ 0;
            }
            const nextBidPrice = data.CURRENT_PRICE + data.GROW_PRICE;

            setBidingButton(authKind, nextBidPrice);
        }

        const bindingCurrentLotBidingInfo = (data) =>{
            /* price */
            const el_currentPrice = document.querySelector(`\${classForDevice} [now-lot-price]`);
            if(data.CURRENT_PRICE != null && data.CURRENT_PRICE > 0){
                el_currentPrice.innerHTML = baseCurrency +' '+ numberWithCommas(data.CURRENT_PRICE);
            }else{
                el_currentPrice.innerHTML = baseCurrency +' '+ 0;
            }
            const nextBidPrice = data.CURRENT_PRICE + data.GROW_PRICE;

            /* set button */
            const bidData = data.BID_DATA;

            if(authKind !== 'viewonly'){
                if(data.LIVE_CLOSE_YN && !data.IS_WIN && bidData.length < 1) authKind = 'ready';
                if(data.LIVE_CLOSE_YN && bidData.length > 0) authKind = 'closed';
                if(!data.LIVE_CLOSE_YN) authKind = 'biding';
                if(!data.LIVE_CLOSE_YN && data.IS_WIN) authKind = 'highest';
            }

            setBidingButton(authKind, nextBidPrice);

            /* bidding list */
            if(bidData.length > 0){
                const el_notice = document.querySelector(`\${classForDevice} [biding-notice-div]`);
                const el_bidRow = document.querySelector(`\${classForDevice} [biding-row]`);

                if(bidData[0].BID_NOTICE !== null){
                    el_notice.querySelector('.situ_alert').innerHTML = bidData[0].BID_NOTICE;
                    el_notice.style.display = 'block';
                }else{
                    el_notice.style.display = 'none';
                }

                let bidRowDom =``;

                bidData.filter(item => item.BID_NOTICE === null)
                    .forEach(item => {
                        const bidKind = item.BID_KIND_CD !== 'online'? "현장응찰" : item.ONLINE_BID_ID;
                        const bidPrice = item.BID_PRICE !== null ? numberWithCommas(item.BID_PRICE) : item.BID_PRICE;
                        bidRowDom += `<li class="st_item">
                                    <p class="txt">\${bidKind}</p>
                                    <p class="price ">\${bidPrice}</p>
                                </li>`
                    });
                el_bidRow.innerHTML = bidRowDom;
            }
        }

        const bindingMyBidingInfo = (data) => {
            const el_myBidTable = document.querySelector(".my_lot_body .my_lot_table tbody");

            let myBidRowDom = ``;

            data.forEach(item => {
                const hammerPrice = item.HAMMER_BID_PRICE !== null ? item.HAMMER_BID_PRICE : '';
                const hammerStatus = item.HAMMER_STAT === 'hammer' ? '낙찰' : '';
                myBidRowDom += `<tr>
                                <td>\${item.LOT_NO}</td>
                                <td>\${numberWithCommas(item.LAST_BID_PRICE)}</td> <!-- 최고응찰가 -->
                                <td>\${numberWithCommas(hammerPrice)}</td> <!-- 낙찰가 -->
                                <td><span class="lot-stat" >\${hammerStatus}</span></td>
                            </tr>`
            });

            el_myBidTable.innerHTML = myBidRowDom;

        }

        /* 이벤트 핸들러 */
        const moveScrollToCurrentLot = (e) => {
            const currLotElem = document.querySelector(`.lotitem[data-lotIdx='\${currentLotNo}']`);
            if(currLotElem) {
                $(`\${classForDevice} .lotlist-tabCont .mCustomScrollBox`).animate({
                    scrollTop: $(currLotElem).offset().top - 400,
                    behavior: 'smooth'
                });
            }
        }

        const moveCurrentLot = async (e) => {
            e.preventDefault();
            await clickLotItem(currentLotNo);
            moveScrollToCurrentLot();
        }

        const changeCategory = async ($this, type, cd_id) =>{
            selectedType = type;
            selectedCategory = cd_id;

            const el_tab = document.querySelectorAll(".lotlist-tabmenu .lot-btn_tabmenu");
            el_tab.forEach(item => {
                item.classList.remove('on');
            })
            $this.classList.add('on');

            const lotListData = await getLotList(saleNo, type, cd_id);
            lotList = lotListData.data.data;
            lotTotalCount = lotList.length;
            if(lotTotalCount > 0)
                bindingLotListInfo(lotList, lotTotalCount);

            moveScrollToCurrentLot();
        }

        const changeInfoTab = ($this, tabId) => {
            const el = $this;
            const el_tab = document.querySelector(".my_lot_type"+tabId);
            const tabMenuList = document.querySelectorAll(".my_lot_info .lot-btn_tabmenu");
            const tabList = document.querySelectorAll(".my_lot_tab");

            //menu selected class toggle
            tabMenuList.forEach(item => {
                item.classList.remove('on');
            });
            el.classList.add('on');

            //tab display toggle
            tabList.forEach(item => {
                item.style.display = 'none'
            });
            el_tab.style.display = '';

        }


        const toggleFavoriteLot = (e, lotNo) => {
            e.preventDefault();
            e.stopPropagation();
            const el = document.getElementById("btnFav"+lotNo);
            const status = el.getAttribute('data-status');
            if(status === 'on'){
                try {
                    axios.post("/api/auction/live/delCustInteLot", { sale_no:saleNo, lot_no: lotNo })
                        .then((res)=>{
                            if(res.data.success){
                                document.getElementById("btnFav"+lotNo).classList.remove('on');
                                el.setAttribute("data-status", 'off')
                            }
                        });
                } catch (error) {
                    console.error(error);
                }
            }else {
                try {
                    axios.post("/api/auction/live/addCustInteLot", {sale_no: saleNo, lot_no: lotNo})
                        .then((res) => {
                            if (res.data.success) {
                                document.getElementById("btnFav" + lotNo).classList.add('on');
                                el.setAttribute("data-status", 'on')
                            }
                        });
                } catch (error) {
                    console.error(error);
                }
            }
        }




    </script>

</div>
<script type="text/javascript" src="https://llrtsprod.s.llnwi.net/v1/sdk/html/current/llnwrtssdk.min.js"></script>
<script src="/js/simple.js?ver=1.0.0"></script>
</body>
</html>