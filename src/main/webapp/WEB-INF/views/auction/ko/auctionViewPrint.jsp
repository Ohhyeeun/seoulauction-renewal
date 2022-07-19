<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <!-- header -->--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">--%>
<%--    <title>Seoul Auction</title>--%>
<%--    <link rel="stylesheet" href="/css/plugin/csslibrary.css">--%>
<%--    <link rel="stylesheet" href="/css/common.css" type="text/css" />--%>
<%--    <link rel="stylesheet" href="/css/pages_common_ko.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />--%>
<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">--%>
<%--    <!-- //header -->--%>
<%--</head>--%>

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
    <div class="wrapper">
        <div class="print-wrap">
            <!-- header -->
            <header class="print-header">
                <div class="header-inner">
                    <a href="/" class="header_logo"><img src="/images/pc/logo/SA_logo_black.svg" alt="Seoul Auction"></a>
                    <a class="header-print" onclick="return window.print();">
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
                                        <div id="print_sale_title" class="title">2월 e BID 프리미엄 온라인 경매</div>
                                        <div class="data">
                                            <span id="print_sale_to_date">마감일 : 4.22.목 14:00 </span>
                                            <span>전시장소 : 강남센터</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="section-inner">

                                    <article class="print_detail-article">
                                        <div class="image-area">
                                            <img id="print_img" src="" alt="">
                                        </div>

                                        <div class="artist-area">
                                            <div class="index-num"><span id="print_lot_no">10</span></div>
                                            <div class="name-info">
                                                <div class="name" id="print_artist_name">데미안허스트</div>
                                                <div class="desc">
                                                    <span id="print_year" lass="artist-b">b.1988</span>
                                                    <span id="print_title" >Flight of 3 Dodos </span>
                                                </div>
                                            </div>

                                            <div class="price-area">
                                                <dl id="print_expe_price" class="price-list">
                                                    <dt>추정가 : </dt>
                                                    <dd>KRW 9,900,000,000</dd>
                                                </dl>
                                            </div>
                                        </div>
                                    </article>

                                    <!-- [0718]작품정보 하위댑스 추가 -->
                                    <article class="print_view-article page-break">
                                        <div class="view_editor-warp">
                                            <div class="info-box">
                                                <div class="title">작품정보</div>
                                                <div id="price_lot_desc" class="desc">
                                                    gouache on canvas <br>
                                                    100.0X80.3cm (40) 2020 <br>
                                                    signed and dated on the right side <br>
                                                    signed titled and dated on the reverse
                                                </div>

                                                <!-- [0718]작품정보 하위댑스 추가 -->
                                                <article class="print_view-article no-line page-break">
                                                    <div class="view_editor-warp">
                                                        <div class="info-box">
                                                    <div class="info-sub-wrap">
                                                        <div class="info-sub-box">
                                                            <div class="tit">CONDITION</div>
                                                            <div class="desc">good condition 종이 작품의 경우, 재질 특성상 산화·울음이 있을 수 있습니다.</div>
                                                        </div>
                                                        <div class="info-sub-box">
                                                            <div class="tit">PROVENANCE</div>
                                                            <div class="desc">Tonari no Zingaro(Tokyo)</div>
                                                        </div>
                                                        <div class="info-sub-box">
                                                            <div class="tit">LITERATURE</div>
                                                            <div class="desc">
                                                                GRIMM Gallery, Amsterdam.<br>
                                                                Acquired from the above by the present owner.
                                                            </div>
                                                        </div>
                                                        <div class="info-sub-box">
                                                            <div class="tit">EXHIBITED</div>
                                                            <div class="desc">Online, Praz-Delavallade, Focus: Guy Yanai, 2020.</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                <%--<div class="info-box">
                                                <div class="title">Condition Report</div>
                                                <div id="cond_rpt" class="desc">
                                                    좌측 하단 미세 스크래치,우측 상단 이물질 있음
                                                </div>
                                            </div>--%>
                                    </article>
                                    <!-- [0718]작품설명, Notice 추가 -->
                                    <article class="print_view-article page-break">
                                        <div class="view_editor-warp">
                                            <div class="info-box">
                                                <div class="title">작품 설명</div>
                                                <div class="desc">
                                                    조디커윅은 혜성처럼 미술계에 나타난 호주 작가로 정규 미술 교육을 받지 않고 본인만의 독보적인 화풍을 발전시켜 화폭에 담아낸다.
                                                </div>
                                            </div>
                                            <div class="info-box">
                                                <div class="title">NOTICE</div>
                                                <div class="desc">
                                                    <ul class="mark_dot-list">
                                                        <li>서울옥션은 작가 및 작품명에 한하여 낙찰일로부터 3년간 낙찰자에 대해서만 보증하며, 사전 고지한 작품에 대해서는 보증책임을 부담하지 않습니다.</li>
                                                        <li>작품은 판매 당시 상태 그대로 판매되므로, 응찰 전 반드시 실물을 확인하여 주시기 바랍니다.<br>
                                                            홈페이지에 기재된 컨디션은 작품 상태에 대한 당사의 주관적 의견을 제시하는 것일 뿐이므로, 내재된 모든 결함, 수리, 변형 등을 언급하지 않을 수 있습니다. 또한 제작된 지 오랜 시간이 경과한 작품에 자연스럽게 확인되는 노화 현상(구김, 마모, 오염, 산화 등)에 대해서도 별도 언급이 없을 수 있습니다.<br>
                                                            컨디션은 작품만을 대상으로 하며 액자, 족자, 병풍, 좌대, 케이스 등 작품 구성품의 상태는 포함하지 않습니다. 온라인에 게재된 이미지로 작품의 일부 컨디션을 확인할 수 있으나 실제 상태를 정확하게 반영하지 못할 수 있으며 작품의 색상, 밝기 등이 실물과 다르게 보일 수 있습니다.<br>
                                                            실물을 확인하지 않고 발생되는 문제에 대한 책임은 응찰자에게 있으며, 이와 같은 유의사항을 반드시 확인하시고 신중히 응찰해 주시길 바랍니다.</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!-- //[0718]작품설명, Notice 추가 -->
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
<%--<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>--%>

<%--<script src="/js/pages_common_ko.js"></script>--%>
<%--<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->--%>
<%--<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>

<%--Axios--%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>
<script defer src="/js/common/axios.js" type="text/javascript"></script>

<%--<!--[if lt IE 9]>--%>
<%--<!--[if lt IE 9]>--%>
<%--<script src="/js/plugin/html5shiv.js"></script> <![endif]-->--%>
<%--<script src="/js/plugin/prefixfree.min.js"></script>--%>
<%--<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>--%>

<script>

//숫자를 천단위마다 콤마 해줌.
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

//영어 요일을 한글 요일로
function enDayToHanDay(enDay){
    let hanDay;
    switch (enDay){
        case 'Mon' : hanDay = '월'; break;
        case 'Tue' : hanDay = '화'; break;
        case 'Wed' : hanDay = '수'; break;
        case 'Thu' : hanDay = '목'; break;
        case 'Fri' : hanDay = '금'; break;
        case 'Sat' : hanDay = '토'; break;
        case 'Sun' : hanDay = '일'; break;
    }

    return hanDay;
}
$(function(){

    init();

    function init(){


        axios.get('/api/auction/lot_info/${saleNo}/${lotNo}')
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){
                    let lotData = data.data;

                    let sale_title;
                    sale_title = ( lotData.SALE_TH === undefined || lotData.SALE_TH === '')  ? '' : ( '제' + lotData.SALE_TH + '회 ' );
                    sale_title += JSON.parse(lotData.SALE_TITLE_JSON).ko;

                    $("#print_sale_title").html(sale_title);
                    $("#print_sale_to_date").html('마감일 : ' +
                        lotData.LOT_EXPIRE_DATE_TIME_T.replace(lotData.LOT_EXPIRE_DATE_DAY , enDayToHanDay(lotData.LOT_EXPIRE_DATE_DAY) )
                    );

                    $("#print_img").attr('src' ,
                        'https://www.seoulauction.com/nas_img' + lotData.LOT_IMG_PATH + '/' + lotData.LOT_IMG_NAME );
                    $("#print_lot_no").html(lotData.LOT_NO);
                    $("#print_artist_name").html(lotData.ARTIST_NAME_KO_TXT);
                    $("#print_year").html('b.' + lotData.BORN_YEAR);
                    $("#print_title").html(lotData.TITLE_KO_TXT);


                    //가격 정보.
                    if(lotData.EXPE_PRICE_INQ_YN === 'N') {
                        $("#print_expe_price").html(
                            '<dd>'
                            + 'KRW '
                            + numberWithCommas(lotData.EXPE_PRICE_FROM_JSON.KRW)
                            + ' ~ ' + numberWithCommas(lotData.EXPE_PRICE_TO_JSON.KRW)
                            + '</dd>'
                            + '<br>'
                            + '<dd>'
                            + 'USD '
                            + numberWithCommas(lotData.EXPE_PRICE_FROM_JSON.USD)
                            + ' ~ ' + numberWithCommas(lotData.EXPE_PRICE_TO_JSON.USD)
                            + '</dd>'
                        );
                    } else {
                        $("#print_expe_price").html('<dd> 추정가 별도 문의 </dd>');
                    }


                    //작품 정보
                    $("#price_lot_desc").html(
                           lotData.MATE_NM_EN + '<br/>'
                        + '<span>'
                        + lotData.LOT_SIZE_JSON[0].SIZE1 + 'X'
                        + lotData.LOT_SIZE_JSON[0].SIZE2 + 'X'
                        + lotData.LOT_SIZE_JSON[0].SIZE3 + 'cm'
                        + '</span><br/>'
                        + '<span>'
                        + lotData.SIGN_INFO_JSON.ko
                    );







                    $("#cond_rpt").html(lotData.COND_RPT_JSON.ko);
                } else {
                    alert(data.data.msg);
                    history.back();
                }
            })
            .catch(function(error) {
                console.log(error);
            });

    }


});

</script>
</html>