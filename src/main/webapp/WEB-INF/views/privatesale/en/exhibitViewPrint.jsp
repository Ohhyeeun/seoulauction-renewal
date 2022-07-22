<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_en.css">
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
                                        <span></span>
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
                                        <div class="index-num"><span id="print_lot_no"></span></div>
                                        <div class="name-info">
                                            <div class="name" id="print_artist_name"></div>
                                            <div class="desc">
                                                <span id="print_year" lass="artist-b"></span>
                                                <span id="print_title" ></span>
                                            </div>
                                        </div>
                                        <!--
                                        <div class="price-area">
                                            <dl id="print_expe_price" class="price-list">
                                                <dt>추정가 : </dt>
                                                <dd>KRW 9,900,000,000</dd>
                                            </dl>
                                        </div>
                                        -->
                                    </div>
                                </article>

                                <article class="print_view-article  page-break">
                                    <div class="view_editor-warp">
                                        <div class="info-box">
                                            <div class="title">DETAILS</div>
                                            <div id="price_lot_desc" class="desc">
                                            </div>
                                        </div>

                                        <div class="info-box">
                                            <div class="title">Condition Report</div>
                                            <div id="cond_rpt" class="desc">
                                            </div>
                                        </div>
                                    </div>
                                </article>

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

<script src="/js/pages_common_en.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>

<%--Axios--%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<%--<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>--%>
<script defer src="/js/common/axios.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script src="/js/plugin/prefixfree.min.js"></script>
<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>


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


            axios.get('/api/privatesale/lot_info/${saleNo}/${lotNo}')
                .then(function(response) {
                    const data = response.data;
                    let success = data.success;
                    if(success){
                        let lotData = data.data;

                        $("#print_sale_title").html(JSON.parse(lotData.SALE_TITLE_JSON).en);
                        $("#print_sale_to_date").html('Closing Time : ' +
                            lotData.LOT_EXPIRE_DATE_TIME_T.replace(lotData.LOT_EXPIRE_DATE_DAY , lotData.LOT_EXPIRE_DATE_DAY )
                        );

                        $("#print_img").attr('src' ,
                            'https://www.seoulauction.com/nas_img' + lotData.LOT_IMG_PATH + '/' + lotData.LOT_IMG_NAME );
                        $("#print_lot_no").html(lotData.LOT_NO);
                        $("#print_artist_name").html(lotData.ARTIST_NAME_EN_TXT);
                        $("#print_year").html('b.' + lotData.BORN_YEAR);
                        $("#print_title").html(lotData.TITLE_EN_TXT);

                        $("#price_lot_desc").html(
                            lotData.MATE_NM_EN + '<br/>'
                            + '<span>'
                            + lotData.LOT_SIZE_JSON[0].SIZE1 + 'X'
                            + lotData.LOT_SIZE_JSON[0].SIZE2 + 'X'
                            + lotData.LOT_SIZE_JSON[0].SIZE3 + 'cm'
                            + '</span><br/>'
                            + '<span>'
                            + lotData.SIGN_INFO_JSON.en
                        );

                        $("#cond_rpt").html(lotData.COND_RPT_JSON.en);
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