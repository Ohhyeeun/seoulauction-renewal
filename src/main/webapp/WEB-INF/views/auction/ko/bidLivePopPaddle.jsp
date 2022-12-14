<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- head.jsp Begin -->
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
    <meta name="naver-site-verification" content="e43736eddfc3d46038024a9d2132da077391aadf"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
    <title>Seoul Auction</title>

    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/favic/apple-icon-57x57.png">
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/favic/apple-icon-60x60.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/favic/apple-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/favic/apple-icon-76x76.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/favic/apple-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/favic/apple-icon-120x120.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/favic/apple-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/favic/apple-icon-152x152.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/images/favic/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/images/favic/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/images/favic/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/images/favic/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/images/favic/favicon-16x16.png">
    <link rel="manifest" href="/webapp/manifest.json">
    <link rel="icon" type="image/png" href="/images/favic/favicon-32x32.png" sizes="32x32"/>
    <link rel="icon" type="image/png" href="/images/favic/android-icon-192x192.png" sizes="192x192"/>
    <link rel="icon" type="image/png" href="/images/favic/favicon-16x16.png" sizes="16x16"/>
    <link rel="apple-touch-icon" sizes="180x180" href="/iamges/favic/apple-touch-icon.png">


    <link href="/css/old/common.css" rel="stylesheet">
    <link href="/css/old/onepcssgrid_live.css" rel="stylesheet">
    <link href="/css/old/sa.common.2.0.css" rel="stylesheet">
    <link href="/css/old/bidLivepop.css" rel="stylesheet">

    <script type="text/javascript" src="/js/angular/angular.min.js"></script>
    <script src="/js/angular/angular-sanitize.js"></script>
    <script type="text/javascript" src="/js/angular/angular-bind-html-compile.js"></script>
    <script type="text/javascript" src="/js/angular/app.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>

    <%--Axios--%>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<%--    <script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>--%>
    <script defer src="/js/common/axios.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script src="/js/plugin/prefixfree.min.js"></script>
    <script src="/js/plugin/swiper.min.js" type="text/javascript"></script>
    <%--<script src="https://code.angularjs.org/1.5.8/angular.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-duration-format/1.3.0/moment-duration-format.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ng-dialog/0.5.6/js/ngDialog.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
</head> 

<script>
    app.value('locale', 'ko');
    app.value('is_login', 'false');
    app.value('_csrf', '${_csrf.token}');
    app.value('_csrf_header', '${_csrf.headerName}');	// default header name is X-CSRF-TOKEN

    $(document).ready(function () {
    });
</script>

<script>
    //숫자를 천단위마다 콤마 해줌.
    function numberWithCommas(x) {
        if(x === undefined){
            return x;
        }
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
</script>
<body>
<div class="pop_wrap">
    <div class="title"><h2>Seoul Auction LIVE</h2></div>
    <!-- container -->
    <div id="container" >
<%--    <div ng-controller="ctl" data-ng-init="load();">--%>
        <!--main -->
        <div class="cont">
            <div class="cont_title02"><h3>라이브 경매</h3></div><!--cont_title02-->
            <div style="width:100%;">
                <div class="onerow"></div><!--clear-->
                <!-- 작품 정보 표시 영역 -->
                <!--col5--><!-- 작품 정보 표시 영역 -->
                <!-- 응찰 정보 표시 영역 -->
                <div id="" ng-style="winHeight()" class="bid_livebox_table PaddNo_width" style="width:48% !important;height: 906px;float:left;">
                    <span id="paddNo" class="posi_ab Paddtit_blue" style="right:20px;">PADD NO. </span>
                    <span id="lotNo" class="posi_ab ng-binding" style="left:20px;">Lot. </span>
                    <span id="bidKindTxt1" class="ng-binding"></span>
                </div>
                <div class="bidlive_currency" style="text-align:right;padding:3px;"><span>통화:</span>&nbsp;[KRW]</div>
                <div class="last bid_livebox clearfix" style="margin-left:2%;width:48%;float:left;">
                    <div class="fixed-table-container" style="height: auto;">
                        <div class="fixed-table-header"></div>
                        <div style="height: auto;">
                            <table id="tbl_employee" class="fixed-table">
                                <colgroup>
                                    <col/>
                                    <col style="width:20%"/>
                                    <col style="width:20%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="th-text client_th-text" style="width: 60%;">
                                            <span>Paddle No</span>
                                        </div>
                                    </th>
                                    <th scope="col">
                                        <div class="th-text client_th-text" style="width: 20%;">
                                            <span>응찰금액</span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="tblOffBidListBody"></tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- //col7 -->
                <div class="onerow"></div><!--clear-->
            </div> <!--onepcssgrid-1200-->
        </div> <!--cont-->
    </div> <!--liveAuctionCtl-->
    <!-- //container -->

    <!--footer-->
    <div style="background-color:#e4e4e4; padding:10px; text-align:left;">
        <div align="center" ng-if="locale == 'ko'">
            <p style="color: #000; font-size:11px; padding-top:20px; padding-bottom:20px; line-height:18px;">
                * LOT정보와 Current Bidding은 네트워크 속도에 따라 지연될 수 있습니다.
            </p>
        </div>
        <div align="center" ng-if="locale != 'ko'">
            <p style="color: #000; font-size:11px; padding-top:20px; padding-bottom:20px; line-height:18px;">
                * LOT information and Current Bidding may be delayed depending on network speed.
            </p>
        </div>
    </div><!--footer-->

</div> <!--pop_wrap-->

<script>

    const saleNo = ${saleNo};   //경매번호
    let currentLotNo = 0;       //진행중인 랏 번호

    window.onload = async () => {
        await init();
    }

    async function init (){
        setInterval(await getPollingData, 1000);
    }

    // app.controller('ctl', function ($scope, consts, common, locale, $filter) {});

    // 호출 부
    // $scope.load = function () {
        <%--if (${member.userNo} === 0){--%>
        <%--   location.href = "/login";--%>
        <%--   return;--%>
        <%--}--%>
    //     let run = async function () {
    //         setInterval(await getPollingData, 1000);
    //     }
    //     run();
    // }

    async function getPollingData(){
        let [currentLotData] = await Promise.all([
            getCurrentLotInfo(saleNo)
        ]);

        const currentLotInfo = currentLotData.data.data;
        currentLotNo = currentLotInfo.LOT_NO;
        bindingCurrentLotInfo(currentLotInfo);

        if(currentLotNo !== 0) {
            const bidingData = await getCurrentLotBiddingInfo(saleNo, currentLotNo);
            const bidingInfo = bidingData.data.data;
            bindingCurrentLotBidingInfo(bidingInfo);
        }
    }

    const bindingCurrentLotInfo = (data) =>{
        let lotNo = `Lot. ` + data.LOT_NO;
        document.getElementById("lotNo").innerText = lotNo;
    }

    const bindingCurrentLotBidingInfo = (data) =>{
        const bidData = data.BID_DATA;
        let bidNoticeDom =``;
        const el_notice = document.getElementById("tblOffBidListBody");
        const el_padd = document.getElementById("bidKindTxt1");

        if(bidData.length > 0){
            const paddNoLastBid = bidData[0].ONLINE_BID_ID === null ? "현장" : bidData[0].ONLINE_BID_ID;
            el_padd.innerText = paddNoLastBid;

            let bidRowDom =``;
            bidData.filter(item => item.BID_NOTICE === null)
                .forEach(item => {
                    const bidKind = item.BID_KIND_CD !== 'online'? "현장응찰" : item.ONLINE_BID_ID;
                    const bidPrice = item.BID_PRICE !== null ? numberWithCommas(item.BID_PRICE) : item.BID_PRICE;
                    bidRowDom += `<tr>
                                            <td>
                                                <span>\${bidKind}</span>
                                            </td>
                                            <td>
                                                <span>\${bidPrice}</span>
                                            </td>
                                        </tr>`
                });
            el_notice.innerHTML = bidRowDom;
        }
        else {
            bidNoticeDom += `<tr>
                                    <td colspan="3">
                                        <span">곧 응찰이 시작됩니다.</span>
                                    </td>
                                </tr>`
            el_notice.innerHTML = bidNoticeDom;
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

</script>
</body>
</html>