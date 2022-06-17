<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <!-- //header -->
</head>

<body class="">
    <div class="wrapper">
        <div class="print-wrap">
            <!-- header -->
            <header class="print-header">
                <div class="header-inner">
                    <a href="/" class="header_logo"><img src="/images/pc/logo/SA_logo_black.svg" alt="Seoul Auction"></a>
                    <a href="#none" class="header-print" onclick="return window.print();">
                        <i class="icon_print"></i> PRINT
                    </a>
                </div>
            </header>
            <!-- //header -->
            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="print-section">

                        <div class="print-panel">
                            <div class="panel-header">
                                <div class="section-inner">
                                    <div class="print-title">
                                        <div class="title">2월 e BID 프리미엄 온라인 경매</div>
                                        <div class="data">
                                            <span>마감일 : 4.22.목 14:00 </span>
                                            <span>전시장소 : 강남센터</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="section-inner">

                                    <article class="print_detail-article">
                                        <div class="image-area">
                                            <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                        </div>

                                        <div class="artist-area">
                                            <div class="index-num"><span>10</span></div>
                                            <div class="name-info">
                                                <div class="name">데미안허스트</div>
                                                <div class="desc">
                                                    <span class="artist-b">b.1988</span>
                                                    <span>Flight of 3 Dodos </span>
                                                </div>
                                            </div>

                                            <div class="price-area">
                                                <dl class="price-list">
                                                    <dt>추정가 : </dt>
                                                    <dd>KRW 9,900,000,000</dd>
                                                </dl>
                                            </div>
                                        </div>
                                    </article>

                                    <article class="print_view-article  page-break">
                                        <div class="view_editor-warp">
                                            <div class="info-box">
                                                <div class="title">작품정보</div>
                                                <div class="desc">
                                                    gouache on canvas <br>
                                                    100.0X80.3cm (40) 2020 <br>
                                                    signed and dated on the right side <br>
                                                    signed titled and dated on the reverse
                                                </div>
                                            </div>

                                            <div class="info-box">
                                                <div class="title">Condition Report</div>
                                                <div class="desc">
                                                    좌측 하단 미세 스크래치,우측 상단 이물질 있음
                                                </div>
                                            </div>
                                        </div>
                                    </article>

                                </div>
                            </div>

                            <div class="panel-footer page-break">
                                <div class="section-inner">
                                    <div class="footer-logo">
                                        <img src="/images/pc/logo/SA_logo_black.svg" alt="Seolu Auction">
                                    </div>
                                    <dl class="footer-info">
                                        <dt>본사</dt>
                                        <dd>서울특별시 종로구 평창31길 11Tel 02 395 0330 Fax 02 395 0338</dd>
                                        <dt>강남사옥</dt>
                                        <dd>서울특별시 강남구 언주로 864 Tel 02 395 0330</dd>
                                        <dt>홍콩SA+</dt>
                                        <dd>11F, H Queen’s, 80 Queen’s Road Central,Central, Hon Kong Tel 02 395 0330 Fax 02 395 0338</dd>
                                        <dt>부산</dt>
                                        <dd>부산광역시 수영구 좌수영로 125번길 14-3, 1층(전시장) Tel 051 744 2020</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->
        </div>
    </div>

</body>

<%--공통 footer 를 안쓰는관계로 필요 스크립트 다 import --%>

<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>


<script src="/js/pages_common_ko.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<%--Axios--%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>
<script defer src="/js/common/axios.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script src="/js/plugin/prefixfree.min.js"></script>
<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-duration-format/1.3.0/moment-duration-format.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/ng-dialog/0.5.6/js/ngDialog.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>--%>
<%--<script src="/js/common.js" type="text/javascript"></script>--%>

</html>