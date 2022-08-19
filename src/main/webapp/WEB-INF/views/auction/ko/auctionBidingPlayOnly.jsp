<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>오프라인 응찰하기 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <!-- //header -->
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
                                    <span>163회 미술품 라이브 경매</span>
                                </div>
                            </div>
                        </div>
                        <div class="section-body">

                            <div class="bidding_pc">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-center">
                                        <div class="notice">
                                            <i class="icon-notice"></i><span class="txt">LOT 61, 65, 67 사정에 의해 취소 되었습니다. </span>
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
                                                <p class="view_count">
                                                    <i class="icon-viewer"></i><span class="unit">시청자</span> <span class="num">3,000</span>
                                                </p>
                                                <button class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>동영상 새로고침</button>
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
                                                        <!-- [0613]삭제
                          <p class="p_txt">정회원 연회비 : 라이브 경매 응찰은 사전 신청한 정회원만 가능합니다.</p>
                          //-->
                                                        <!-- <a href="#" class="btn btn_member">정회원 결제</a> -->
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
                                <a href="#" class="btn btn_default" role="button"><span>닫기</span></a>
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


<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>



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


</body>

</html>