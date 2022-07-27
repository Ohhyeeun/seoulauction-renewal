<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
    <div class="wrapper">
        <div class="print-wrap">
            <!-- header -->
            <header class="print-header">
                <div class="header-inner">
                    <a href="/" class="header_logo"><img src="/images/pc/logo/SA_logo_black.svg" alt="Seoul Auction"></a>
                    <a class="header-print" href="javascript:window.print();">
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
                                            <span id="print_sale_prev"></span>
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

                                            <div class="price-area">
                                                <dl id="print_expe_price" class="price-list">
                                                    <dt></dt>
                                                    <dd></dd>
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
                                                </div>

                                                <!-- [0718]작품정보 하위댑스 추가 -->
                                                <article class="print_view-article no-line page-break">
                                                    <div class="view_editor-warp">
                                                        <div class="info-box">
                                                            <div id="print_info" class="info-sub-wrap">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                    </article>
                                    <!-- [0718]작품설명, Notice 추가 -->
                                    <article class="print_view-article page-break">
                                        <div class="view_editor-warp">
                                            <div id="print_desc" class="info-box">
                                            </div>
                                            <div id="print_notice" class="info-box">
                                            </div>

                                            <div id="artist_layer" class="info-box">
                                                <div class="title">작가정보</div>
                                                <div class="desc txt-pre-line" id="artistName">
                                                </div>
                                                <div class="desc txt-pre-line" id="artistProfile">
                                                </div>
                                                <div class="desc txt-pre-line" id="artistMedia">
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
                                        <img src="/images/pc/logo/SA_logo_black.svg" alt="Seoul Auction">
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
    return locale === 'ko' ? val.ko : val.en;
}

$(function(){
    init();
    function init(){
        axios.get('/api/auction/sales/${saleNo}').then(function(response) {
            const data = response.data;
            let success = data.success;
            if(success) {
                let sale = data.data;
                let sale_prev = JSON.parse(sale.PREVIEW_JSON);
                let print_sale_prev = "전시장소: ";
                for(let i = 0; i < sale_prev.length; i++) {
                    print_sale_prev += sale_prev[i].PLACE_JSON.ko+" ";
                }
                $("#print_sale_prev").html(sale_prev.length > 0 ? print_sale_prev : '');
            }
        });

        axios.get('/api/auction/lot_info/${saleNo}/${lotNo}')
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){
                    let lotData = data.data;

                    console.log(lotData);

                    let sale_title = ( lotData.SALE_TH === undefined || lotData.SALE_TH === '')  ? '' : ( '제' + lotData.SALE_TH + '회 ' );
                    sale_title += JSON.parse(lotData.SALE_TITLE_JSON).ko;

                    $("#print_sale_title").html(sale_title);
                    $("#print_sale_to_date").html('마감일 : ' +
                        lotData.LOT_EXPIRE_DATE_TIME_T.replace(lotData.LOT_EXPIRE_DATE_DAY , enDayToHanDay(lotData.LOT_EXPIRE_DATE_DAY) )
                    );

                    //
                    $("#print_img").attr('src', lotData.IMAGE_URL  + lotData.LOT_IMG_PATH + '/' + lotData.LOT_IMG_NAME );
                    $("#print_lot_no").html(lotData.LOT_NO);
                    $("#print_artist_name").html(lotData.ARTIST_NAME_KO_TXT);
                    $("#print_year").html(lotData.BORN_YEAR ? 'b.' + lotData.BORN_YEAR : '');
                    $("#print_title").html(lotData.TITLE_KO_TXT);

                    //가격 정보.
                    if(lotData.EXPE_PRICE_INQ_YN === 'N') {
                        let html = '<dd>'
                                    + 'KRW '
                                    + numberWithCommas(lotData.EXPE_PRICE_FROM_JSON.KRW)
                                    + ' ~ ' + numberWithCommas(lotData.EXPE_PRICE_TO_JSON.KRW)
                                    + '</dd>';

                        //라이브경매일경우 usd 추가.
                        if(lotData.SALE_KIND_CD === ('main') || lotData.SALE_KIND_CD === ('plan')  || lotData.SALE_KIND_CD === ('hongkong')  ) {
                            html +=
                                '<br>'
                                + '<dd>'
                                + 'USD '
                                + numberWithCommas(lotData.EXPE_PRICE_FROM_JSON.USD)
                                + ' ~ ' + numberWithCommas(lotData.EXPE_PRICE_TO_JSON.USD)
                                + '</dd>';
                        }

                        $("#print_expe_price").html(html);
                    } else {
                        $("#print_expe_price").html('<dd> 추정가 별도 문의 </dd>');
                    }

                    //작품정보
                    let LOT_SIZE = "";
                    for(let i = 0; i < lotData.LOT_SIZE_JSON.length; i++) {
                        LOT_SIZE += '<div>'+size_text_cm(lotData.LOT_SIZE_JSON[i])+'</div>';
                    }
                    $("#price_lot_desc").html(
                          lotData.MATE_NM_EN + '<br/>'
                        + LOT_SIZE
                        + (lotData.EDITION ? '<div>' + lotData.EDITION + '</div>' : '')
                        + (isNotObjectEmpty(lotData.MAKE_YEAR_JSON) ? '<div>' + lotData.MAKE_YEAR_JSON.ko + '</div>' : '')
                        + (isNotObjectEmpty(lotData.SIGN_INFO_JSON) ? '<div>' + lotData.SIGN_INFO_JSON.ko + '</div>' : '')
                        + (lotData.FRAME_CD!='none' ? '<div>' + lotData.FRAME_CD + '</div>' : '')
                    );

                    let print_info = '';

                    if(isNotObjectEmpty(lotData.COND_RPT_JSON)){
                        let locale = localeValue(lotData.COND_RPT_JSON);
                        print_info +=   '<div class="info-sub-box">'
                                       +'<div class="tit">CONDITION</div>'
                                       +'<div class="desc">' +locale + '</div>'
                                       +'</div>';
                    }

                    if(isNotObjectEmpty(lotData.PROV_INFO_JSON)) {
                        let locale = localeValue(lotData.PROV_INFO_JSON);
                        print_info +=   '<div class="info-sub-box">'
                                        +'<div class="tit">PROVENANCE</div>'
                                        +'<div class="desc">' +locale + '</div>'
                                        +'</div>';
                    }
                    if(isNotObjectEmpty(lotData.LITE_INFO_JSON)) {
                        let locale = localeValue(lotData.LITE_INFO_JSON);
                        print_info +=   '<div class="info-sub-box">'
                                        +'<div class="tit">LITERATURE</div>'
                                        +'<div class="desc">' +locale + '</div>'
                                        +'</div>';
                    }

                    if(isNotObjectEmpty(lotData.EXHI_INFO_JSON)) {
                        let locale = localeValue(lotData.EXHI_INFO_JSON);
                        print_info +=   '<div class="info-sub-box">'
                                        +'<div class="tit">EXHIBITED</div>'
                                        +'<div class="desc">' +locale + '</div>'
                                        +'</div>';
                    }

                    $("#print_info").html(print_info);

                    if(isNotObjectEmpty(lotData.CMMT_JSON)) {
                        let locale = localeValue(lotData.CMMT_JSON);
                        let html  =   '<div class="info-box">'
                                            +'<div class="title">작품 설명</div>'
                                            +'<div class="desc txt-pre-line">' + locale + '</div>'
                                            +'</div>';
                        $("#print_desc").html(html);
                    }

                    if(isNotObjectEmpty(lotData.NOTICE_DTL_JSON)) {
                        let locale = localeValue(lotData.NOTICE_DTL_JSON);
                        let html = '<div class="info-box">'
                            + '<div class="title">NOTICE</div>'
                            + '<div class="desc"></div>'
                            + ' <ul class="mark_dot-list txt-pre-line">' +  locale + ' </Ul>'
                            + '</div>';
                        $("#print_notice").html(html);
                    }

                    axios.get('/api/auction/artist_info/' + lotData.ARTIST_NO)
                        .then(function (response) {
                            const data = response.data;
                            let success = data.success;

                            if (success) {
                                let artistData = data.data;

                                console.log(artistData);

                                if (!artistData) {
                                    $("#artist_layer").css("display", "none");
                                } else {

                                    console.log('asdfasdfasdf');

                                    let articlesList = JSON.parse(artistData.articles).articles;
                                    let artistYoutubeImages = JSON.parse(artistData.media).youtube;
                                    let artistImageList = artistData.images;
                                    let title = '';
                                    $.each(articlesList, function (index, el) {
                                        if (locale === 'ko') {
                                            title += el.titleKo + '</br>';
                                        } else {
                                            title += el.titleEn + '</br>';
                                        }
                                    });

                                    $("#artistName").html(JSON.parse(artistData.name).ko + ' ' + artistData.birth + '~' + artistData.death);
                                    $("#artistProfile").html(JSON.parse(artistData.profile).ko + '</br>' + title);

                                    let html = '<div class="vide_img-box">';
                                    $.each(artistYoutubeImages, function (index, el) {
                                        $.each(artistImageList, function (s3Index, el) {
                                            //일단은 youtube만 뿌리기로
                                            if (artistImageList[s3Index].tag == 'youtube' + index) {
                                                html += '<a href="' + artistYoutubeImages[index] + '"><img src=" ' + artistImageList[s3Index].cdn_url + ' " alt="" /></a>';
                                            }
                                        });
                                    });
                                    html += '</div>';
                                    $("#artistMedia").html(html);
                                }
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });


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
</script>
</html>