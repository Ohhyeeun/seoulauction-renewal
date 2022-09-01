<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    /* API 호출 */
    const getCurrencyInfo = (today) => {
        try {
            return axios.get('/api/auction/live/admin/currency');
        } catch (error) {
            console.error(error);
        }
    };

    //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자
    //[0-9] => \d , [^0-9] => \D
    var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
    var rgx2 = /(\d+)(\d{3})/;
    function getNumber(obj) {
        var num01;
        var num02;
        num01 = obj.value;
        num02 = num01.replace(rgx1, "");
        num01 = setComma(num02);
        obj.value = num01;
    }
    function setComma(inNum) {
        var outNum;
        outNum = inNum;

        while (rgx2.test(outNum)) {
            outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
        }
        return outNum;
    }

    app.controller('currencyPopCtl', function($scope, common) {

        $scope.jsonCurrency = {};
        $scope.dataResult = "";

        $scope.vCommaKRW = function() {
            var inNum = $scope.delComma($scope.krwInput);

            $scope.k_calUSD = (inNum/$scope.delComma($scope.usdBase)).toFixed(0);
            $scope.k_calHKD = (inNum/$scope.delComma($scope.hkdBase)).toFixed(0);
            $scope.k_calCNH = (inNum/$scope.delComma($scope.cnhBase)).toFixed(0);
            $scope.k_calJPY = (inNum/$scope.delComma($scope.jpyBase)).toFixed(0);
            $scope.k_calEUR = (inNum/$scope.delComma($scope.eurBase)).toFixed(0);
        }

        $scope.vCommaHKD = function() {
            var inNum = $scope.delComma($scope.hkdInput) * $scope.hkdBase;

            $scope.h_calKRW = (inNum).toFixed(0);
            $scope.h_calUSD = (inNum/$scope.delComma($scope.usdBase)).toFixed(0);
            $scope.h_calCNH = (inNum/$scope.delComma($scope.cnhBase)).toFixed(0);
            $scope.h_calJPY = (inNum/$scope.delComma($scope.jpyBase)).toFixed(0);
            $scope.h_calEUR = (inNum/$scope.delComma($scope.eurBase)).toFixed(0);
        }

        $scope.getToday = function(){
            var today = new Date();

            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);

            var dateString = year + '-' + month  + '-' + day;

            return dateString;
        }

        $scope.delComma = function(str) {
            str = "" + str.replace(/,/gi,''); // 콤마 제거
            str = str.replace(/(^\s*)|(\s*$)/g, ""); // trim
            return (new Number(str));
        }

        $scope.init = function(){
            $scope.today = $scope.getToday();
            let run = async function () {
                let [currencyData] = await Promise.all([
                    getCurrencyInfo($scope.today)
                ]);

                $scope.jsonCurrency = currencyData.data.data;
                if($scope.jsonCurrency.length < 1) {
                    $scope.dataResult = "데이터 호출 실패";
                }
                else {
                    $scope.krwBase = $scope.jsonCurrency["KRW"]
                    $scope.usdBase = $scope.jsonCurrency["USD"];
                    $scope.hkdBase = $scope.jsonCurrency["HKD"];
                    $scope.cnhBase = $scope.jsonCurrency["CNH"];
                    $scope.jpyBase = $scope.jsonCurrency["JPY"];
                    $scope.eurBase = $scope.jsonCurrency["EUR"];

                    $scope.dataResult = "LAST UPDATE : " + $scope.today + " KST (평일 오전 9시 업데이트)";
                }
                $scope.$apply();
            }
            run();
        }
    });

</script>
<body>
<div class="pop_wrap" ng-controller="currencyPopCtl" data-ng-init="init()">
    <div class="title">
        <h2>환율 계산기</h2>
    </div>
    <!--main -->
    <div class="cont">
        <h3>{{dataResult}}</h3>
        <br/>
        <p>
            USD : <span ng-bind="usdBase"></span> │
            HKD : <span ng-bind="hkdBase"></span> │
            CNH : <span ng-bind="cnhBase"></span> │
            JPY : <span ng-bind="jpyBase"></span> │
            EUR : <span ng-bind="eurBase"></span>
        </p>
        <div class="onepcssgrid-1200">
            <div class="onerow"></div><!--clear-->
            <div class="col6" style="padding-bottom:40px;">
                <h2 style="padding-bottom:20px; font-size:28px; line-height:33px;">[국내경매]</h2>
                <div style="padding-bottom:20px; font-size:22px; line-height:30px;">
                    <p style="padding-bottom:20px;">
                        <label style="color:#f44336">KRW: </label>
                        <input type="text" placeholder="KRW" id="krwInput" ng-model="krwInput" onkeyup="getNumber(this)" ng-change="vCommaKRW();" style="padding:5px;"> 원
                    </p>
                    <p>USD: <span id="K_USD">{{ k_calUSD | number : 0 }}</span></p>
                    <p>HKD: <span id="K_HKD">{{ k_calHKD | number : 0 }}</span></p>
                    <p>CNH: <span id="K_CNH">{{ k_calCNH | number : 0 }}</span></p>
                    <p>JPY: <span id="K_JPY">{{ k_calJPY | number : 0 }}</span></p>
                    <p>EUR: <span id="K_EUR">{{ k_calEUR | number : 0 }}</span></p>
                </div>
            </div><!--col6-->


            <div class="col6 last">
                <h2 style="padding-bottom:20px; font-size:28px; line-height:33px;">[홍콩경매]</h2>
                <div style="padding-bottom:20px; font-size:22px; line-height:30px;">
                    <p style="padding-bottom:20px;">
                        <label style="color:#f44336">HKD: </label>
                        <input type="text" placeholder="HKD" id="hkdInput" ng-model="hkdInput" onkeyup="getNumber(this)" ng-change="vCommaHKD(this)" style="padding:5px;"> 달러
                    </p>
                    <p>KRW: <span id="H_KRW">{{ h_calKRW | number : 0 }}</span></p>
                    <p>USD: <span id="H_USD">{{ h_calUSD | number : 0 }}</span></p>
                    <p>CNH: <span id="H_CNH">{{ h_calCNH | number : 0 }}</span></p>
                    <p>JPY: <span id="H_JPY">{{ h_calJPY | number : 0 }}</span></p>
                    <p>EUR: <span id="H_EUR">{{ h_calEUR | number : 0 }}</span></p>
                </div>
            </div> <!--col6-->


            <div class="onerow"></div><!--clear-->


        </div> <!--onepcssgrid-1200-->
    </div> <!--cont-->
</div> <!--liveAuctionCtl-->

<!--footer-->
<div style="background-color:#e4e4e4; padding:10px; text-align:left;">
    <div class="web_only" align="center">
        <p style="color: #000; font-size:11px; padding-top:20px; padding-bottom:20px; line-height:18px;">* 환율정보는 경매 참고용입니다. *<br/>경매 당일 환율은 입금시 환율과 달라 질 수 있습니다.<br/><br/>
            * 서울외국환중개의 공시를 참고합니다. *<br/>http://www.smbs.biz/ExRate/TodayExRate.jsp<br/><br/>
            * 서울외국환중개홈페이지상 조회하여 출력한 환율 정보가 시스템 장애등으로 잘못 출력된 경우 서울외국환중개가 책임지지 않습니다. 이에 담당자분들게서는 계산시 참고 바랍니다.<br/><br/>IT팀에서는 경매당일 환율정보를 공시에 따라 프로그램에 제공합니다. 전광판과 연결된 것은 아닙니다.</p>
    </div><!--web_only-->
    <div class="m_only" align="center">
        <p style="color:#000; font-size:13px; padding-top:20px; padding-bottom:20px; line-height:18px;">* 환율정보는 경매 참고용입니다. *<br/>경매 당일 환율은 입금시 환율과 달라 질 수 있습니다.<br/><br/>* 서울외국환중개의 공시를 참고합니다. *<br/>http://www.smbs.biz/ExRate/TodayExRate.jsp<br/><br/>* 서울외국환중개홈페이지상 조회하여 출력한 환율 정보가 시스템 장애등으로 잘못 출력된 경우 서울외국환중개가 책임지지 않습니다. 이에 담당자분들게서는 계산시 참고 바랍니다.<br/><br/>IT팀에서는 경매당일 환율정보를 공시에 따라 프로그램에 제공합니다. 전광판과 연결된 것은 아닙니다.</p>
    </div><!--m_only-->
</div><!--footer-->

</div> <!--pop_wrap-->
</body>
</html>