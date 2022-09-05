<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="../../common/angular.jsp"/>
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
        <div id="container">
            <div id="contents" class="contents">

                <section class="basis-section last-section bidding_offline-section type-non_member">
                    <div class="section-inner">

                        <div class="section-header">
                            <div class="title-area">
                                <div class="title">
                                    <span id="sale_title"></span>
                                </div>
                            </div>
                        </div>
                        <div class="section-body">
                            <div class="bidding_pc">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-center">
                                        <div class="notice notice-swiper" style="height: 50px;">
                                            <i class="icon-notice"></i>
                                            <span class="swiper-wrapper">
                                                <span class="swiper-slide txt">111</span>
                                                <span class="swiper-slide txt">222</span>
                                                <span class="swiper-slide txt">333</span>
                                            </span>
                                        </div>
                                        <div class="video_area">
                                            <div class="view_box">
                                                <!-- Youtube -->
                                                <a href="#" class="video_wrap">
                                                        <span class="video_thumbnail_wrap">
                                                            <span class="video_thumbnail" style="background-image: url(/images/temp/temp_video_bg.jpg)"></span>
                                                            <div class="" id="thevideo"></div>
                                                            <!-- <iframe  src="https://www.youtube-nocookie.com/embed/IwATrgHOefo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
                                                        </span>
                                                    <span class="ic_video_play"></span>
                                                </a>
                                            </div>
                                            <div class="view_info">
                                               <%-- <p class="view_count">
                                                    <i class="icon-viewer"></i><span class="unit">시청자</span> <span class="num">3,000</span>
                                                </p>--%>
                                                <button onclick="window.location.reload()" class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>동영상 새로고침</button>
                                            </div>
                                        </div>
                                        <div class="my_lot">
                                            <div class="my_lot_wrap">

                                                <div class="my_lot_type3">
                                                    <p class="title">
                                                        라이브 경매 응찰은 <span>정회원부터 가능</span>합니다.
                                                    </p>
                                                    <p class="txt">
                                                        정회원은 유료로 운영되며 서울옥션이 발행하는 <br>
                                                        간행물(각종 도록, 전시 안내 등)을 받으실 수 있습니다.
                                                    </p>
                                                    <div class="member_price">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </article>
                                </div>
                            </div>

                        </div>
                        <div class="section-footer">
                            <div class="tac">
                                <a href="javascript:self.close();" class="btn btn_default" role="button"><span>닫기</span></a>
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
</div>

<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="https://llrtsprod.s.llnwi.net/v1/sdk/html/current/llnwrtssdk.min.js"></script>

<jsp:include page="../../common/commonJs.jsp"/>
<jsp:include page="../../common/commonJSNotMain.jsp"/>
<script type="text/javascript" src="/js/pages_common_ko.js" ></script>



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

    $('.video_wrap').on('click', function($e) {
        $e.preventDefault();
        player.playVideo();
        $('.video_thumbnail').hide();
        $('.ic_video_play').hide();
    })
</script>
<script>
    const locale = document.documentElement.lang;
    const pathname = window.location.pathname;
    const pathSaleNo = pathname.replace(/^\/auction\/live\/bid\/player\/(\d+).*/, '$1');

    const SALE_NO = pathSaleNo ? Number(pathSaleNo) : null;


    window.onload = async () => {

        await init();
        // setInterval(await getPollingData, 10000);
    }



    /* call API */
    const getSaleInfo = (saleNo) =>{
        try {
            return axios.get('/api/auction/live/sales/'+saleNo);
        } catch (error) {
            console.error(error);
        }
    }

    const getNotices = (saleNo) =>{
        try {
            return axios.get('/api/auction/live/sales/'+saleNo+'/bid-notice');
        } catch (error) {
            console.error(error);
        }
    }

    const getPollingData = async () => {
        let [ noticesData] = await Promise.all([
            getNotices(SALE_NO),
        ]);

        //공지사항
        const noticeList = noticesData.data.data;
        if(noticeList.length > 0){
            bindingNoticeInfo(noticeList);
        }
    }

    const init = async () => {
        let [saleInfoData, noticesData] = await Promise.all([
            getSaleInfo(SALE_NO),
            getNotices(SALE_NO),
        ]);

        //경매정보
        const saleInfo = saleInfoData.data.data;
        bindingSaleInfo(saleInfo);

        //공지사항
        // const noticeList = noticesData.data.data;
        // if(noticeList.length > 0){
        //     bindingNoticeInfo(noticeList);
        // }
    }

    const bindingSaleInfo = (data) => {
        const saleThTitle = localeOrdinal(data.SALE_TH, locale) + data.SALE_TITLE_JSON[locale];
        document.getElementById("sale_title").innerText = saleThTitle;
    }

    const saleNoticeSwiper = new Swiper(`.notice-swiper`, {
        autoplay: {
            delay: 4000,
        },
        initialSlide : 1,
        allowTouchMove:false, // 마우스 및 손가락 터치 시 슬라이드 이동 가능여부
        touchMoveStopPropagation: true,    //touchmove 중지
        direction:'vertical',
        loop: true,
    });

    const bindingNoticeInfo = (data) => {
        let noticeSlide = [];
        saleNoticeSwiper.removeAllSlides();
        data.forEach(item => {
            noticeSlide.push(`<span class="swiper-slide txt">`+item.CONTENT_JSON[locale]+`</span>`);
        })
        saleNoticeSwiper.appendSlide(noticeSlide);
        saleNoticeSwiper.update();
    }

</script>
<script type="text/javascript" src="/js/pages_common_ko.js" ></script>
<script src="/js/simple.js?ver=1.0.0"></script>

</body>

</html>