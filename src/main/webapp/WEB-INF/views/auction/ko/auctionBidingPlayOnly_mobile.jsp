<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<c:set var="isRegular" value="false" />
<sec:authorize access="hasAuthority('ROLE_REGULAR_USER')">
    <c:set var="isRegular" value="true" />
</sec:authorize>
<body>
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <!-- //header -->

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <section class="basis-section last-section bidding_offline-section">
                    <div class="section-inner">
                        <div class="section-header">
                            <div class="title-area">
                                <div class="title">
                                    <span id="sale_title"></span>
                                </div>
                            </div>
                        </div>
                        <div class="section-body">
                            <div class="bidding_mo">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-center">
                                        <div class="notice notice-swiper" style="height: 58px;overflow: hidden">
                                            <i class="icon-notice"></i>
                                            <span class="swiper-wrapper"> </span>
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
                       <%-- <div class="section-footer">
                            <div class="tac">
                                <a href="javascript:self.close();" class="btn btn_default" role="button"><span>닫기</span></a>
                            </div>
                        </div>--%>

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

<%--
<jsp:include page="../../common/commonJs.jsp"/>
<jsp:include page="../../common/commonJSNotMain.jsp"/>
<script type="text/javascript" src="/js/pages_common_ko.js" ></script>--%>



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
    const pathSaleNo = pathname.replace(/^\/auction\/live\/bid\/player\/mobile\/(\d+).*/, '$1');
    const SALE_NO = pathSaleNo ? Number(pathSaleNo) : null;

    window.onload = async () => {

        await init();
        setInterval(await getPollingData, 10000);
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

    const init = async () => {
        let [saleInfoData, noticesData] = await Promise.all([
            getSaleInfo(SALE_NO),
            getNotices(SALE_NO),
        ]);

        //경매정보
        const saleInfo = saleInfoData.data.data;
        bindingSaleInfo(saleInfo);

        //공지사항
        const noticeList = noticesData.data.data;
        if(noticeList.length > 0){
            bindingNoticeInfo(noticeList);
        }
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
</body>

</html>