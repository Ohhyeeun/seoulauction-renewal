<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <!-- header -->1--%>
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
                                    <div id="print_sale_title" class="title"></div>
                                    <div class="data">
                                        <span id="print_sale_to_date"></span>
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

<%--                                        <div class="price-area">--%>
<%--                                            <dl id="print_expe_price" class="price-list">--%>
<%--                                                <dt>추정가 : </dt>--%>
<%--                                                <dd>KRW 9,900,000,000</dd>--%>
<%--                                            </dl>--%>
<%--                                        </div>--%>
                                    </div>
                                </article>

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
                                        </div>

                                        <!-- [0718]삭제
                    <div class="info-box">
                      <div class="title">Condition Report</div>
                      <div class="desc">
                        좌측 하단 미세 스크래치,우측 상단 이물질 있음
                      </div>
                    </div> -->
                                    </div>
                                </article>
                                <!-- [0718]작품정보 하위댑스 추가 -->
                                <article class="print_view-article no-line page-break">
                                    <div class="view_editor-warp">
                                        <div class="info-box">
                                            <div id="print_info" class="info-sub-wrap">
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
                                <!-- //[0718]작품정보 하위댑스 추가 -->

                                <!-- [0718]작품설명, Notice 추가 -->
                                <article class="print_view-article page-break">
                                    <div class="view_editor-warp">
                                        <div id="print_desc" class="info-box">
                                        </div>
                                        <div id="print_notice" class="info-box">
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
<%--<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>--%>
<%--<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>--%>
<%--<script defer src="/js/common/axios.js" type="text/javascript"></script>--%>

<%--<!--[if lt IE 9]>--%>
<%--<script src="/js/plugin/html5shiv.js"></script> <![endif]-->--%>
<%--<script src="/js/plugin/prefixfree.min.js"></script>--%>
<%--<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>--%>


<script>
const locale = document.documentElement.lang;
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
//json 로캐일 별로 분기.
function localeValue(val){
    if (val === undefined) {
        return '';
    }

    let json = JSON.parse(val);

    return locale === 'ko' ? json.ko : json.en;
}
function size_text_cm(src) {
    if (src === null || src === undefined) {
        return;
    }

    var returnValue = "";
    var cmSize = ""

    cmSize = src.SIZE1 != 0 ? src.SIZE1.toFixed(1) : "";
    cmSize += src.SIZE2 != 0 ? "☓" + src.SIZE2.toFixed(1) : "";
    cmSize += src.SIZE3 != 0 ? "☓" + src.SIZE3.toFixed(1) +
        "(" + (src.MIX_CD == "depth" ? "d" : "h") + ")" : "";
    cmSize += cmSize != "" ? src.UNIT_CD : "";
    cmSize += cmSize != "" && src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

    returnValue = src.PREFIX;
    returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
    returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "");
    return returnValue;
}
$(function(){

    function isNotJSonObjectEmpty(param) {

        if(param === undefined ){
            return false;
        }

        let json = JSON.parse(param);

        return json.constructor === Object && Object.keys(json).length !== 0;
    }


    init();

    function init(){


        axios.get('/api/privatesale/saleAsInfo/${saleAsNo}')
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){
                    let saleData = data.data;

                    $("#print_sale_title").html(saleData.TITLE_KO);
                    $("#print_sale_to_date").html('마감일 : ' +
                        saleData.LOT_EXPIRE_DATE_TIME_T.replace(saleData.LOT_EXPIRE_DATE_DAY , enDayToHanDay(saleData.LOT_EXPIRE_DATE_DAY) )
                    );

                    $("#print_lot_no").html(saleData.AS_NO);
                    $("#print_artist_name").html(saleData.ARTIST_NAME_KO);
                    $("#print_year").html('b.' + saleData.BORN_YEAR);
                    $("#print_title").html(saleData.TITLE_KO);
                    //TODO 오프라인인경우 USD 달러 나와야함.

                    //작품정보
                    let LOT_SIZE = "";
                    let LOT_SIZE_JSON = JSON.parse(saleData.LOT_SIZE_JSON);

                    for(let i = 0; i < LOT_SIZE_JSON.length; i++) {
                        LOT_SIZE += '<div>'+size_text_cm(LOT_SIZE_JSON[i])+'</div>';
                    }


                    $("#price_lot_desc").html(
                        saleData.MATE_NM + '<br/>'
                        + LOT_SIZE
                        + (saleData.EDITION ? '<div>' + saleData.EDITION + '</div>' : '')
                        + (isNotJSonObjectEmpty(saleData.MAKE_YEAR_KO) ? '<div>' + saleData.MAKE_YEAR_KO + '</div>' : '')
                        + (isNotJSonObjectEmpty(saleData.SIGN_INFO_JSON) ? '<div>' + JSON.parse(saleData.SIGN_INFO_JSON).ko + '</div>' : '')
                    );

                    let print_info = '';

                    if(isNotJSonObjectEmpty(saleData.COND_RPT_JSON)){
                        let locale = localeValue(saleData.COND_RPT_JSON);
                        print_info +=   '<div class="info-sub-box">'
                            +'<div class="tit">CONDITION</div>'
                            +'<div class="desc">' +locale + '</div>'
                            +'</div>';
                    }

                    if(isNotJSonObjectEmpty(saleData.PROV_INFO_JSON)) {
                        let locale = localeValue(saleData.PROV_INFO_JSON);
                        print_info +=   '<div class="info-sub-box">'
                            +'<div class="tit">PROVENANCE</div>'
                            +'<div class="desc">' +locale + '</div>'
                            +'</div>';
                    }
                    if(isNotJSonObjectEmpty(saleData.LITE_INFO_JSON)) {
                        let locale = localeValue(saleData.LITE_INFO_JSON);
                        print_info +=   '<div class="info-sub-box">'
                            +'<div class="tit">LITERATURE</div>'
                            +'<div class="desc">' +locale + '</div>'
                            +'</div>';
                    }

                    if(isNotJSonObjectEmpty(saleData.EXHI_INFO_JSON)) {
                        let locale = localeValue(saleData.EXHI_INFO_JSON);
                        print_info +=   '<div class="info-sub-box">'
                            +'<div class="tit">EXHIBITED</div>'
                            +'<div class="desc">' +locale + '</div>'
                            +'</div>';
                    }

                    $("#print_info").html(print_info);

                    if(isNotJSonObjectEmpty(saleData.CMMT_JSON)) {
                        let locale = localeValue(saleData.CMMT_JSON);
                        let html  =   '<div class="info-box">'
                            +'<div class="title">작품 설명</div>'
                            +'<div class="desc txt-pre-line">' + locale + '</div>'
                            +'</div>';
                        $("#print_desc").html(html);
                    }

                } else {
                    alert(data.data.msg);
                    history.back();
                }
            })
            .catch(function(error) {
                console.log(error);
            });

        axios.get('/api/privatesale/saleImages/${saleAsNo}')
            .then(function(response) {

                const data = response.data;
                let success = data.success;

                if(success){
                    let saleImages = data.data;
                    let imgUrl = saleImages[0].IMAGE_URL +
                        saleImages[0].FILE_PATH + "/" + saleImages[0].FILE_NAME;

                    $("#print_img").attr('src' , imgUrl);
                }
                else {
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