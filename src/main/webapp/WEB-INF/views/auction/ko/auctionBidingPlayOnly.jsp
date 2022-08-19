<!DOCTYPE html>
<html lang="en">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>Live Auction | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_en.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
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
                                    <span>The 163rd Seoul Auction Art Auction</span>
                                </div>
                            </div>
                        </div>
                        <div class="section-body">

                            <div class="bidding_pc">
                                <div class="bidding-offline-wrap">
                                    <article class="bidding-offline-center">
                                        <div class="notice">
                                            <i class="icon-notice"></i><span class="txt">LOT 61, 65, 67 It was canceled due to circumstances.</span>
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
                                                    <i class="icon-viewer"></i><span class="unit">Viewers</span> <span class="num">3,000</span>
                                                </p>
                                                <button class="btn btn_gray btn_refresh"><i class="ic_refresh"></i>Refresh</button>
                                            </div>
                                        </div>
                                        <div class="my_lot">
                                            <div class="my_lot_wrap">

                                                <div class="my_lot_type3">
                                                    <p class="txt">
                                                        Regular members are operated for a fee and can receive publications (various catalogs, exhibition guides, etc.) issued by Seoul Auction
                                                    </p>
                                                    <div class="member_price">
                                                        <!-- [0609]삭제
                          <p class="p_txt">Regular membership annual fee: Live auction bids are only available to regular members who have pre-registered.</p>
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
                                <a href="#" class="btn btn_default" role="button"><span>Closed</span></a>
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
<!-- [0516]삭제
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->


<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>






<!-- [0728]비디오 세로사이즈 -->
<script>
    var _videoAnchor = $(".video_img-box a");
    var _videoAnchorImg = $(".video_img-box a img");
    _videoAnchorImg.each(function() {
        _videoAnchor = $(this).parent(_videoAnchor);

        if ($(this).width() < $(this).height()) {
            _videoAnchor.addClass("vertical");
        } else {
            _videoAnchor.removeClass("vertical");
        }
    })
</script>
<!-- //[0728]비디오 세로사이즈 -->

<!-- [0809]마이페이지 사이드 유저네임 글자수제한 -->
<script>
    var asideUsername = $("aside .mem-name-wrap .tt2");
    asideUsername.each(function() {
        var asideUsernameTxt = $(this).text();
        var asideUsernameLimit = 9;
        if (asideUsernameTxt.length > asideUsernameLimit) {
            $(this).text(asideUsernameTxt.substr(0, asideUsernameLimit) + "...")
        }
    })
</script>
<!-- //[0809]마이페이지 사이드 유저네임 글자수제한 -->


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