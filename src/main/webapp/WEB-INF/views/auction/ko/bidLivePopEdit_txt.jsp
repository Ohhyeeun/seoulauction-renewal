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

    /*app.controller('liveAuctionCtl', function ($scope, consts, common, $interval) {
        $scope.cnt_price = 0;
        $scope.lot_move_init = "NO";

        $scope.init = function () {
            $scope.loadliveLotInfo();
            $scope.loadLiveAuction();
        }


        $scope.loadLiveAuction = function () {
            $d = {
                "baseParms": {"sale_no": $scope.sale_no, "lot_no": $scope.lot_no, "mid_lot_no": $scope.mid_lot_no},
                "actionList": [
                    {"actionID": "liveSaleInfo", "actionType": "select", "tableName": "SALE"},
                    {"actionID": "offBidList", "actionType": "select", "tableName": "BID_OFF_LIST"}, 						// Live 진행 LOT번호 응찰금액 호출 추가(2018.04.18 YDH)
                    //{"actionID":"liveLotNaviList", "actionType":"select", "tableName":"LOT_NAVI", "parmsList":[{}]}, 	// navi 최신화. Edit모드에서만 실행할 것
                ]
            };
            common.callActionSet($d, $s);
        }

        var $s = function (data, status) {
            $scope.offBidList = data["tables"]["BID_OFF_LIST"]["rows"];	// Live 진행 LOT번호 응찰금액 호출 추가(2018.04.18 YDH)
            $scope.sale = data["tables"]["SALE"]["rows"][0];
            $scope.base_currency = $scope.sale.CURR_CD;
            $scope.sub_currency = ($scope.sale.CURR_CD == "KRW" ? "HKD" : "KRW");
            $scope.max_lot_no = $scope.sale.MAX_LOT_NO;  	// LOT 번호 MAX 번호
            $scope.sale_no = $scope.sale.SALE_NO;			// 현재 진행중인 SALE 번호
            $scope.live_lot_no = $scope.sale.ING_LOT_NO;  		// 현재 진행중인 LOT 번호
            console.log("####loadLiveAuction####")
            console.log($scope.lot_no);
            if ($scope.lot_no == null || $scope.lot_no == "" || $scope.lot_no == 'undefined' || $scope.lot_move_init == "YES") {//alert($scope.lot_no);
                console.log("####loadLiveAuction---lot_no####")
                console.log($scope.sale.ING_LOT_NO);
                $scope.lot_no = $scope.sale.ING_LOT_NO;	//현재  LOT 번호
                //$("#lotNumber").val($scope.lot_no);
            }
            //$scope.lot_navi = data["tables"]["LOT_NAVI"]["rows"];		// Live 진행 LOT번호 5건 호출 추가(2018.04.19 YDH). Edit모드에서만 실행할 것
        }

        $scope.loadliveLotInfo = function () {
            $d = {
                "baseParms": {"sale_no": $scope.sale_no, "lot_no": $scope.lot_no, "mid_lot_no": $scope.mid_lot_no},
                "actionList": [
                    {"actionID": "liveLotInfo", "actionType": "select", "tableName": "LOT"},
                    {
                        "actionID": "get_customer_by_cust_no",
                        "actionType": "select",
                        "tableName": "CUST_INFO",
                        "parmsList": []
                    },

                ]
            };

            common.callActionSet($d, function (data, status) {
                $scope.custInfo = data["tables"]["CUST_INFO"]["rows"][0];
                $scope.lot = data["tables"]["LOT"]["rows"][0];

                if ($scope.lot_no == null || $scope.lot_no == "" || $scope.lot_no == 'undefined' || $scope.lot_move_init == "YES") {//alert($scope.lot_no);
                    $scope.lot_no = $scope.lot.LOT_NO;	//현재  LOT 번호
                    $("#lotNumber").val($scope.lot_no);
                }

                // 2018.05.08 호가 설정. Lot 동기화할경우만 반영. 추정가 별도인경우 제외
                if ($scope.lot.EXPE_PRICE_INQ_YN == 'N') {
                    $scope.start_price = $scope.commaSetting($scope.lot.START_PRICE);
                    $scope.bid_price_input_online = $scope.commaSetting($scope.lot.LAST_PRICE + $scope.lot.GROW_PRICE); 	//고객용 응찰금액(최고가+호가) 설정
                    $scope.bid_price_input_online_KO = $scope.numberToKorean($scope.lot.LAST_PRICE + $scope.lot.GROW_PRICE);//고객용 응찰금액(최고가+호가) 설정

                    //var price_len = $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency].toString().length; //호가 생성 기준
                    if ($scope.bid_price_input_grow1 == "" || $scope.bid_price_input_grow1 == null || $scope.lot_move_init == "YES") {
                        //$scope.bid_price_input_grow1 = $scope.commaSetting(1 * Math.pow(10, parseInt(price_len)-2));
                        $scope.bid_price_input_grow1 = $scope.commaSetting(1 * $scope.growPriceOffline($scope.lot.START_PRICE != null ? $scope.lot.START_PRICE : $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency]));
                        $("#bidPriceInputGrow1").val($scope.bid_price_input_grow1);
                    }
                    if ($scope.bid_price_input_grow2 == "" || $scope.bid_price_input_grow2 == null || $scope.lot_move_init == "YES") {
                        //$scope.bid_price_input_grow2 = $scope.commaSetting(2 * Math.pow(10, parseInt(price_len)-2));
                        $scope.bid_price_input_grow2 = $scope.commaSetting(2 * $scope.growPriceOffline($scope.lot.START_PRICE != null ? $scope.lot.START_PRICE : $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency]));
                        $("#bidPriceInputGrow2").val($scope.bid_price_input_grow2);
                    }
                    if ($scope.bid_price_input_grow3 == "" || $scope.bid_price_input_grow3 == null || $scope.lot_move_init == "YES") {
                        //$scope.bid_price_input_grow3 = $scope.commaSetting(3 * Math.pow(10, parseInt(price_len)-2));
                        $scope.bid_price_input_grow3 = $scope.commaSetting(3 * $scope.growPriceOffline($scope.lot.START_PRICE != null ? $scope.lot.START_PRICE : $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency]));
                        $("#bidPriceInputGrow3").val($scope.bid_price_input_grow3);
                    }
                    if ($scope.bid_price_input_grow4 == "" || $scope.bid_price_input_grow4 == null || $scope.lot_move_init == "YES") {
                        //$scope.bid_price_input_grow4 = $scope.commaSetting(5 * Math.pow(10, parseInt(price_len)-2));
                        $scope.bid_price_input_grow4 = $scope.commaSetting(5 * $scope.growPriceOffline($scope.lot.START_PRICE != null ? $scope.lot.START_PRICE : $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency]));
                        $("#bidPriceInputGrow4").val($scope.bid_price_input_grow4);
                    }
                    if ($scope.bid_price_input_grow5 == "" || $scope.bid_price_input_grow5 == null || $scope.lot_move_init == "YES") {
                        $scope.bid_price_input_grow5 = $scope.commaSetting($scope.lot.START_PRICE != null ? $scope.lot.START_PRICE : $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency]);
                        $("#bidPriceInputGrow5").val($scope.bid_price_input_grow5);
                    }
                    if ($scope.bid_price_input_grow6 == "" || $scope.bid_price_input_grow6 == null || $scope.lot_move_init == "YES") {
                        $scope.bid_price_input_grow6 = "";
                        $("#bidPriceInputGrow6").val($scope.bid_price_input_grow6);
                    }

                    if ($scope.bidPriceInputStart == "undefined" || $scope.bidPriceInputStart == null || $scope.bidPriceInputStart == "" || $scope.lot_move_init == "YES") {
                        $scope.bidPriceInputStart = $scope.bid_price_input_grow5;
                    }
                    //직원용 현재가 설정. 응찰금액이 없는 경우 시작가 설정. 시작가가 null이면 낮은추정가 설정. 응찰금액이 있는 경우 응찰금액으로 설정	$scope.bidPriceInputStart.replace(/[^\d]+/g,'') < $scope.lot.LAST_PRICE &&
                    if ($scope.lot.LAST_PRICE != null && $scope.lot.LAST_PRICE != '' && $scope.cnt_price == 0) {
                        $scope.bidPriceInputStart = $scope.commaSetting($scope.lot.LAST_PRICE);
                        $("#bidPriceInputStart").val($scope.bidPriceInputStart);
                    } else {
                        if (($scope.lot_move_init == "YES" || $scope.lot_move_init == "undefined") && ($scope.cnt_price == 0 || $scope.cnt_price == "undefined")) {
                            $scope.bidPriceInputStart = $scope.commaSetting($scope.lot.START_PRICE != null ? $scope.lot.START_PRICE : $scope.lot.EXPE_PRICE_FROM_JSON[$scope.base_currency]);
                            $("#bidPriceInputStart").val($scope.bidPriceInputStart);
                        }
                    }
                }
            });
        }


        //최초 시작가 기준으로 호가 반영 Function
        $scope.growPriceOffline = function ($input) {
            $scope.outGrowPrice;
            if ($scope.base_currency == 'HKD') {
                if (parseInt($input) < 10000) {
                    $scope.outGrowPrice = 100;
                } else if (parseInt($input) >= 10000 && parseInt($input) < 100000) {
                    $scope.outGrowPrice = 1000;
                } else if (parseInt($input) >= 100000 && parseInt($input) < 2000000) {
                    $scope.outGrowPrice = 10000;
                } else if (parseInt($input) >= 2000000) {
                    $scope.outGrowPrice = 100000
                    ;
                } else {
                    $scope.outGrowPrice = 0;
                }
            } else {
                if (parseInt($input) < 20000000) {
                    $scope.outGrowPrice = 100000;
                } else if (parseInt($input) >= 20000000 && parseInt($input) < 200000000) {
                    $scope.outGrowPrice = 1000000;
                } else if (parseInt($input) >= 200000000 && parseInt($input) < 2000000000) {
                    $scope.outGrowPrice = 10000000;
                } else if (parseInt($input) >= 2000000000) {
                    $scope.outGrowPrice = 100000000;
                } else {
                    $scope.outGrowPrice = 0;
                }
            }

            return $scope.outGrowPrice;
        };

        // Live 진행 LOT번호 설정 로직 추가(2018.04.14 YDH)
        $scope.liveLotSave = function ($input) {
            $scope.sale_no = $("#saleNumber").val();
            $scope.lot_no = $("#lotNumber").val();
            var $d = {
                "baseParms": {"sale_no": $scope.sale_no, "lot_no": $scope.lot_no},
                "actionList": [
                    {"actionID": "modLiveLot", "actionType": "update", "tableName": "LIVE_LOT", "parmsList": [{}]}
                ]
            };

            common.callActionSet($d, function (data, status) {
                $scope.bidPriceInputStart = "";
                $scope.price_len = "";

                $("#bidPriceInputGrow1").val("");
                $("#bidPriceInputGrow2").val("");
                $("#bidPriceInputGrow3").val("");
                $("#bidPriceInputGrow4").val("");
                $("#bidPriceInputGrow5").val("");
                $("#bidPriceInputGrow6").val("");

                $scope.bid_price_input_grow1 = "";
                $scope.bid_price_input_grow2 = "";
                $scope.bid_price_input_grow3 = "";
                $scope.bid_price_input_grow4 = "";
                $scope.bid_price_input_grow5 = "";
                $scope.bid_price_input_grow6 = "";

                $scope.bidPriceInputStart = "";

                //$scope.loadliveLotInfo();
                //$scope.loadLiveAuction();
                $scope.init();
            })
            $scope.cnt = 0; // 네비게이션 실행여부 확인(2018.04.25)
            $scope.cnt_price = 0; //금액수정 건수
            $scope.lot_move_init = "YES";	// lot_no 초기화.
        };
        //LOT 마감/마감해제 관련 function. lot.LIVE_CLSOE_YN = 'Y'면 고객 응찰 불가처리
        $scope.liveLotClose = function ($input) {
            $scope.sale_no = $("#saleNumber").val();
            $scope.lot_no = $("#lotNumber").val();

            if ($scope.lot.LIVE_CLOSE_YN == 'Y') {
                $scope.liveLotBidNoticeSave('응찰이 시작되었습니다.', 'Bidding Started');
            }

            var $d = {
                "baseParms": {"sale_no": $scope.sale_no, "lot_no": $scope.lot_no},
                "actionList": [
                    {"actionID": "closeLiveLot", "actionType": "update", "tableName": "CLOSE_LOT", "parmsList": [{}]}
                ]
            };

            common.callActionSet($d, function (data, status) {
// 				$scope.loadLiveAuction();
                $scope.init();
            })
        };

        $scope.liveLotBidNoticeSave = function ($input, $input_en) {
            var $d = {
                "baseParms": {
                    "sale_no": $scope.sale_no,
                    "lot_no": $scope.lot_no,
                    "bid_kind_cd": 'floor',
                    "bid_notice": $input,
                    "bid_notice_en": $input_en
                },
                "actionList": [
                    {
                        "actionID": "addOffBidPrice",
                        "actionType": "insert",
                        "tableName": "BID_OFFLINE",
                        "parmsList": [{}]
                    }
                ]
            };
            common.callActionSet($d, function (data, status) {
                //$scope.loadLiveAuction();
// 				$scope.init();
            })
        };

        // Live 진행 LOT번호 응찰금액 로직 추가(2018.04.17 YDH), bid_price는 콤마(,)제거
        $scope.liveLotBidPriceSave = function ($input) {
            if ($input == 'online') {
                $scope.bid_price_input_online = $("#bid_price_input_online").val();
                $scope.bid_price = $scope.bid_price_input_online.replace(/[^\d]+/g, '');
            } else {
                $scope.bidPriceInputStart = $("#bidPriceInputStart").val();
                $scope.bid_price = $scope.bidPriceInputStart.replace(/[^\d]+/g, '');
            }
            ;

            var $d = {
                "baseParms": {
                    "sale_no": $scope.sale_no,
                    "lot_no": $scope.lot_no,
                    "bid_price": $scope.bid_price,
                    "bid_kind_cd": $input
                },
                "actionList": [
                    {
                        "actionID": "addOffBidPrice",
                        "actionType": "insert",
                        "tableName": "BID_OFFLINE",
                        "parmsList": [{}]
                    }
                ]
            };
            common.callActionSet($d, function (data, status) {
                $scope.loadLiveAuction();
                //$scope.init();
            })

            $scope.cnt_price = $scope.cnt_price + 1; //응찰 건수 기록
        };

        // Live 하단 네비게이션 리스트
         $scope.liveLotNaviList = function($input){
            $scope.sale_no = $("#saleNumber").val();
            $scope.lot_no = $("#lotNumber").val();
            var $d = {"baseParms":{"sale_no":$scope.sale_no, "lot_no":$scope.lot_no, "mid_lot_no":$input},
                        "actionList":[
                        {"actionID":"liveLotNaviList", "actionType":"select", "tableName":"LOT_NAVI", "parmsList":[{}]}
                    ]};

            common.callActionSet($d, function(data, status) {
                $scope.lot_navi = data["tables"]["LOT_NAVI"]["rows"];// Live 진행 LOT번호 5건 호출 추가(2018.04.19 YDH)
                $scope.mid_lot_navi = data["tables"]["LOT_NAVI"]["rows"][0]; // Live 진행 MID_LOT_NO 호출 추가(2018.04.19 YDH)

                $scope.mid_lot_no = $scope.mid_lot_navi.MID_LOT_NO;

                $scope.loadLiveAuction();
            })
        };

        $scope.lotMove = function ($input) {
            $scope.sale_no = $("#saleNumber").val();
            $scope.lot_no = $("#lotNumber").val();
            if ($scope.lot_no == null || $scope.lot_no == 'undefined') {
                $scope.lot_no = 0;
            }
            ;

            if (parseInt($scope.lot_no) + $input > 0 && parseInt($scope.lot_no) + $input < $scope.max_lot_no + 1) {
                $scope.lot_no = parseInt($scope.lot_no) + $input;
            }

            $("#lotNumber").val($scope.lot_no)

            $scope.lot_move_init = "NO";	// lot_no 변경되고 있는중.
        };

        $scope.naviMove = function($input){
            $scope.cnt = $scope.cnt + 1; //네비게이션 실행한 Count 누적

            if($scope.mid_lot_no == null || $scope.mid_lot_no == 'undefined'){
                if($scope.live_lot_no < 3){
                    $scope.live_lot_no = 3;
                }
                $scope.mid_lot_no = $scope.live_lot_no;
            } ;

            $scope.mid_lot_no = $scope.mid_lot_no + $input;

            // lot_no가 3이하일경우 3로 설정, 최대 lot_no Over일 경우 최대lot_no-2로 설정. 기본 5건 보여주기위해서 처리
            if($scope.mid_lot_no < 3){
                $scope.mid_lot_no = 3;
            } else if ($scope.mid_lot_no > $scope.max_lot_no-2){
                $scope.mid_lot_no = $scope.max_lot_no-2;
            }

            $scope.liveLotNaviList($scope.mid_lot_no);
        };

         $scope.naviMoveInit = function($input){
            $scope.cnt = 0; //네비게이션 실행 Count 초기화

            // lot_no가 3이하일경우 3로 설정, 최대 lot_no Over일 경우 최대lot_no-2로 설정. 기본 5건 보여주기위해서 처리
            $scope.mid_lot_no = $input;

            if($scope.mid_lot_no < 3){
                $scope.mid_lot_no = 3;
            } else if ($scope.mid_lot_no > $scope.max_lot_no-2){
                $scope.mid_lot_no = $scope.max_lot_no-2;
            }

            $scope.liveLotNaviList($scope.mid_lot_no);
        };

        $scope.liveLotBidPriceInputPlus = function ($input) {
            console.log("##InputPlus###");
            console.log($input);
            $scope.inputPrice = 0;
            //데이터 바인딩 초기화 문제로 재할당함.(YDH)
            if ($input == 1) {
                $scope.inputPrice = $("#bidPriceInputGrow1").val();
            } else if ($input == 2) {
                $scope.inputPrice = $("#bidPriceInputGrow2").val();
            } else if ($input == 3) {
                $scope.inputPrice = $("#bidPriceInputGrow3").val();
            } else if ($input == 4) {
                $scope.inputPrice = $("#bidPriceInputGrow4").val();
            } else if ($input == 5) {
                $scope.inputPrice = $("#bidPriceInputGrow5").val();
            } else if ($input == 6) {
                $scope.inputPrice = $("#bidPriceInputGrow6").val();
            }
            console.log($scope.inputPrice);

            if ($scope.bidPriceInputStart == null || $scope.bidPriceInputStart == "") {
                $scope.current_bid_price = 0;
            } else {
                //$scope.current_bid_price = $scope.bidPriceInputStart.replace(/[^\d]+/g,'');
                $scope.current_bid_price = $("#bidPriceInputStart").val().replace(/[^\d]+/g, '');
            }

            //var price_grow = parseInt($scope.current_bid_price) + (parseInt($input.replace(/[^\d]+/g,''))*1);
            var price_grow = parseInt($scope.current_bid_price) + (parseInt($scope.inputPrice.replace(/[^\d]+/g, '')) * 1);

            $scope.bidPriceInputStart = $scope.commaSetting(price_grow);
            $("#bidPriceInputStart").val($scope.commaSetting(price_grow));

            $scope.cnt_price = $scope.cnt_price + 1; //응찰 건수 기록
            $scope.lot_move_init = "NO";			 //LOT 동기화 초기여부. 최초 'YES'
        };

        $scope.liveLotBidPriceInputMinus = function ($input) {
            console.log("##InputMinus###");
            console.log($input);
            $scope.inputPrice = 0;
            //데이터 바인딩 초기화 문제로 재할당함.(YDH)
            if ($input == 1) {
                $scope.inputPrice = $("#bidPriceInputGrow1").val();
            } else if ($input == 2) {
                $scope.inputPrice = $("#bidPriceInputGrow2").val();
            } else if ($input == 3) {
                $scope.inputPrice = $("#bidPriceInputGrow3").val();
            } else if ($input == 4) {
                $scope.inputPrice = $("#bidPriceInputGrow4").val();
            } else if ($input == 5) {
                $scope.inputPrice = $("#bidPriceInputGrow5").val();
            } else if ($input == 6) {
                $scope.inputPrice = $("#bidPriceInputGrow6").val();
            }
            console.log($scope.inputPrice);

            if ($scope.bidPriceInputStart == null) {
                $scope.current_bid_price = 0;
            } else {
                //$scope.current_bid_price = $scope.bidPriceInputStart.replace(/[^\d]+/g,'');
                $scope.current_bid_price = $("#bidPriceInputStart").val().replace(/[^\d]+/g, '');
            }

            var price_grow = parseInt($scope.current_bid_price) + (parseInt($scope.inputPrice.replace(/[^\d]+/g, '')) * -1);

            $scope.bidPriceInputStart = $scope.commaSetting(price_grow);
            $("#bidPriceInputStart").val($scope.commaSetting(price_grow));

            $scope.cnt_price = $scope.cnt_price + 1; //응찰 건수 기록
            $scope.lot_move_init = "NO";			 //LOT 동기화 초기여부. 최초 'YES'
        };

        // Lot Refresh : 1초단위, Navi Refresh : 30초단위
        $interval(function () {
            $scope.loadLiveAuction();
        }, 1000);
         $interval(function(){$scope.naviMove();},30000);  //네비게이션 동기화는 버튼 클릭시만 진행

        $scope.commaSetting = function (inNum) {
            // 콤마(,)표시			//var inNum = $input;
            var rgx2 = /(\d+)(\d{3})/;
            var outNum;

            outNum = inNum.toString();

            while (rgx2.test(outNum)) {
                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
            }
            return outNum;
        }

        $scope.numberToKorean = function (number) {
            var inputNumber = number < 0 ? false : number;
            var unitWords = ['', '만', '억', '조', '경'];
            var splitUnit = 10000;
            var splitCount = unitWords.length;
            var resultArray = [];
            var resultString = '';

            for (var i = 0; i < splitCount; i++) {
                var unitResult = (inputNumber % Math.pow(splitUnit, i + 1)) / Math.pow(splitUnit, i);
                unitResult = Math.floor(unitResult);
                if (unitResult > 0) {
                    resultArray[i] = $scope.commaSetting(unitResult);
                }
            }

            for (var i = 0; i < resultArray.length; i++) {
                if (!resultArray[i]) continue;
                resultString = String(resultArray[i]) + unitWords[i] + resultString;
            }
            $scope.bidPriceInputKO = resultString;
            return resultString;
        }

        $scope.bidOffDel = function ($input) {
            if ($scope.locale == 'ko') {
                var retVal = confirm("삭제하시겠습니까?");
            } else {
                var retVal = confirm("Do you want to delete continue?");
            }

            if (retVal == true) {
                var $d = {
                    "baseParms": {"bid_no": $input},
                    "actionList": [
                        {
                            "actionID": "offBidDel",
                            "actionType": "delete",
                            "tableName": "BID_OFFLINE_DEL",
                            "parmsList": [{}]
                        }
                    ]
                };
                common.callActionSet($d, function (data, status) {
                    $scope.del_cnt = data["tables"]["BID_OFFLINE_DEL"]["rows"];

                    if ($scope.del_cnt.length > 0) {
                        alert("삭제되었습니다.");
                        $scope.loadLiveAuction();
                        return true;
                    } else {
                        alert("실패하셨습니다.\n다시 시도해주세요.");
                    }
                })
            } else {
                return false;
            }
        }
    });*/
</script>

<script>
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
</script>
<body>
<div class="pop_wrap">
    <div class="title"><h2>Seoul Auction LIVE</h2></div>
    <div ng-controller="ctl" data-ng-init="load();">
        <!--main -->
        <div class="cont">
            <div class="cont_title02"><h3>라이브 경매</h3></div><!--cont_title02-->
            <div class="onepcssgrid-1200 clearfix">
                <div class="onerow"></div><!--clear-->
                <!-- 작품 정보 표시 영역 -->
                <div class="col5 client_col5">
                    <!--img-->
                    <div class="client_web_only">
                        <div ng-show="curLot.LOT_NO != null" style="margin:0 auto; position:relative; overflow:hidden;"
                             align="center">
                            <div class="bid_live_img_box" align="center">
                                <img oncontextmenu="return false"
                                     ng-src="{{curLot.IMAGE_URL}}{{curLot.FILE_PATH}}/{{curLot.FILE_NAME}}"
                                     alt="{{curLot.TITLE}}"
                                     style="max-width: 100%; max-height: 100%; vertical-align: middle;"/>
                            </div>
                        </div>
                    </div><!--web_only-->
                    <div class="client_m_only client_m_vertical">
                        <div ng-show="lot.LOT_NO != null"
                             style="display:table; margin:auto; position:relative; overflow:hidden;" align="center">
                            <div class="bid_live_img_box" align="center">
                                <img oncontextmenu="return false"
                                     ng-src="{{curLot.IMAGE_URL}}{{curLot.FILE_NAME | imagePath1 : curLot.FILE_NAME : 'detail'}}"
                                     alt="{{curLot.TITLE}}"
                                     style="max-width: 100%; max-height: 100%; vertical-align:middle;"/>
                            </div>
                        </div>
                    </div><!--m_only-->
                    <!--img-->

                    <!--detail-->
                    <div class=""
                         style="padding-top:15px; padding-bottom:10px; line-height:30px; border-top: solid  #666 1px;">
                        <div class="bidlive_caption" style="padding-bottom:10px; line-height:30px;">
                            <span ng-show="curLot.LOT_NO == null" style="text-align:center;">진행 대기중</span>
                            <span ng-show="curLot.LOT_NO != null">
									<span style="font-size:30px; color:#999;">Lot.<strong><span
                                            ng-bind="curLot.LOT_NO"></span></strong></span>
                                <!-- 자세히보기 버튼 구성 -->
									<span class="btn_style01 green02" style="margin-left:10px;">
										<a ng-href="{{'http://re-dev.seoulauction.com/auction/online/view/' +
										 curLot.SALE_NO + '/' + curLot.LOT_NO}}"
                                           target="new">
										<span ng-if="locale == 'ko'">자세히 보기</span><span
                                                ng-if="locale != 'ko'">Detail</span></a>
									</span>
									<br/>
									<span style="font-size:18px;" ng-bind="curLot.ARTIST_NAME_JSON.ko"></span>
									<span style="font-size:18px;" ng-if="locale != 'en'"
                                          ng-bind="curLot.ARTIST_NAME_JSON.en"></span>
									<span style="font-size:18px;" class="txt_cn"
                                          ng-bind="curLot.ARTIST_NAME_JSON.zh"></span>
									<br/>
									<span ng-bind="curLot.TITLE_JSON.ko"></span>
									<span ng-bind="curLot.TITLE_JSON.en"></span>
									<p ng-if="curLot.TITLE_JSON.zh != curLot.TITLE_JSON.en">
		  								<span ng-bind="curLot.TITLE_JSON.zh"></span>
									</p>
								</span>
                        </div>
                    </div> <!--detail-->
                    <!--price-->
                    <div style="padding-top:10px; border-top: solid #e4e4e4 1px; line-height:22px;">
                        <!-- 추정가 별도문의 -->
                        <span class="krw" ng-if="curLot.EXPE_PRICE_INQ_YN == 'Y'">추정가 별도 문의</span>
                        <span ng-if="curLot.EXPE_PRICE_INQ_YN != 'Y'">
    							<!-- 기준통화 -->
								<p>
	    							<span ng-bind="curLot.EXPE_PRICE_FROM_JSON.KRW"></span> ~
	    							<span ng-bind="curLot.EXPE_PRICE_TO_JSON.KRW"></span>
								</p>
                            <!-- USD -->
								<p>
									<span ng-bind="curLot.EXPE_PRICE_FROM_JSON.USD"></span> ~
	    							<span ng-bind="curLot.EXPE_PRICE_TO_JSON.USD"></span>
								</p>
                            <!-- 서브통화 -->
							</span>
                    </div><!--price-->
                </div><!--col5--><!-- 작품 정보 표시 영역 -->
                <!-- 응찰 정보 표시 영역 -->
                <div class="col7 last bid_livebox clearfix">
                    <h3 ng-bind="notice.ko" style="color:#ff0000;padding:7px;background: #efefef;margin:10px;text-align: center; border-radius: 5px;font-weight: bold;"></h3>
                    <div class="fixed-table-container" style="height: 210px;">
                        <div class="fixed-table-header"></div>
                        <div class="fixed-table-wrap">
                            <table id="tbl_employee" class="fixed-table">
                                <colgroup>
                                    <col/>
                                    <col style="width:20%"/>
                                    <col style="width:20%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="th-text">
                                            <span ng-if="locale == 'ko'">응찰금액</span>
                                            <span ng-if="locale != 'ko'">Bid Price</span>
                                        </div>
                                    </th>
                                    <th scope="col">
                                        <div class="th-text">
                                            <span ng-if="locale == 'ko'">기준통화</span>
                                            <span ng-if="locale != 'ko'">Currency</span>
                                        </div>
                                    </th>
                                    <th scope="col">
                                        <div class="th-text">
                                            <span ng-if="locale == 'ko'">응찰구분</span><span
                                                ng-if="locale != 'ko'">Bidding</span>
                                        </div>
                                    </th>
                                    <th scope="col">
                                        <div class="th-text"><span ng-if="locale == 'ko'">ID</span><span
                                                ng-if="locale != 'ko'">ID</span>
                                        </div>
                                    </th>
                                    <th ng-show="bid.KIND_CD !='online'" scope="col">
                                        <div class="th-text">
                                            <span ng-if="locale == 'ko'">삭제</span><span
                                                ng-if="locale != 'ko'">Delete</span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="tblOffBidListBody">
                                <tr ng-repeat="item in bidHist">
                                    <td>
                                        <span>{{item.bid_cost}}</span>
                                    </td>
                                    <td>
                                        <span>KRW</span>
                                    </td>
                                    <td>
                                        <span>{{item.bid_kind_cd}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.customer.user_id | userIdTxt}}</span>
                                    </td>
                                    <td ng-show="item.BID_KIND_CD != 'online'">
                                        <button type="button" class="btn_insert" ng-click="deletebid(item.bid_token);">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- //col7 -->
                <!-- 경매 시작/마감 & 경매 문구 입력(직원용). 김예은, 양동호, 채수연, 이은미, 박지혜, 오지은, 김민채, 김희욱, 이송미 -->
                <div>
                    <div class="col7 last bid_livebox clearfix" style="text-align:left; margin-top: 20px;">
                        <!-- Lot동기화는 LOT의 시작과 마감을 모두 처리. -->
                        <div class="clearfix" style="padding: 10px;">
                            <div class="hogatable">
                                <label for="saleNumber">
                                    <font style="padding-left:15px; padding-right:5px; display:table-cell; vertical-align:middle;">경매번호</font>
                                </label>
                                <input type="text" ng-model="saleNo" id="saleNumber" name="saleNumber"
                                       style="width:35px;">
                                <label for="bidPriceInputGrow5">
                                    <font style="padding-left:15px; padding-right:5px; display:table-cell; vertical-align:middle;">Lot</font>
                                </label>
                                <input type="text" ng-model="newLot" id="lotNumber" name="lotNumber"
                                       style="width:35px;"/>&nbsp;
                                <span class="btn_style01 gray02 bidlive_btn"><button type="button"
                                                                                     ng-click="lotmove(-1);">-</button></span>
                                <span class="btn_style01 green02 bidlive_btn"><button type="button"
                                                                                      ng-click="lotmove(1);">+</button></span>
                                &nbsp;
                                <span class="btn_style01 green02 bidlive_btn"><button type="button"
                                                                                      ng-click="lotsync();">백업</button></span>
                                <span class="btn_style01 green02 bidlive_btn"><button type="button"
                                                                                      ng-click="lotwinner();">
										<span style="color:red; font-weight:bold;">복원</span></button>
								</span>
                            </div>
                        </div>
                        <!-- 테스트용 (직원용) -->
                        <div style="float:left; margin-right: 15px; padding: 10px;">
                            <!-- 시작가 & 호가 -->
                            <div class="hogatable" ng-repeat="item in noticeList">
                                <label for="bidPriceInputGrow5">
                                    <font style="padding-left:15px; padding-right:5px; display:table-cell; vertical-align:middle;">Notice {{$index + 1}}</font>
                                </label>
                                <input type="text" id="bidPriceInputGrow5" ng-model="item.ko"
                                       name="bidPriceInputGrow5" />
                                <input type="text" id="bidPriceInputGrow5" ng-model="item.en"
                                       name="bidPriceInputGrow5" />
                                <span class="btn_style01 gray02 bidlive_btn">
                                    <button type="button"
                                            ng-click="sendmsg(saleNo, $index);">전송</button></span>
                            </div>
                        </div><!-- //시작가 & 호가 -->
                    </div>
                </div><!-- 경매 시작/마감 & 경매 문구 입력(직원용)-->
                <div class="onerow"></div><!--clear-->
            </div> <!--onepcssgrid-1200-->
        </div> <!--cont-->
    </div> <!--liveAuctionCtl-->

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

    // 현재가 처리
    app.filter('userIdTxt', function(){
        return function(val) {
            if (val === undefined) {
                return '현장응찰';
            }
            return (val === '')?'현장응찰':val;
        };
    })

    app.controller('ctl', function ($scope, consts, common, locale, $filter) {

        // 로케일
        $scope.locale = locale;

        // 경매번호
        $scope.saleNo = ${saleNo};

        // 접속자 수
        $scope.viewers = 0;


        // 패들정보
        $scope.paddNo = 0;
        // 현재 랏 정보
        $scope.curLot = {};

        // 로그인아이디정보(임직원)
        $scope.userId = '${member.loginId}';
        $scope.custNo = ${member.userNo};
        $scope.newLot = 1;

        $scope.bidToken = "";

        $scope.qoute_list =[{
            step:100000
        },{
            step:200000
        },{
            step:300000
        },{
            step:500000
        },{
            step:1000000
        }]


        //안내
        $scope.notice = {
            msg: "라이브 경매에 오신것을 환영합니다.",
        }

        // 응찰내역
        $scope.bidHist = [];

        let url = '';
        if (window.location.protocol !== "https:") {
            url = 'http://dev-bid.seoulauction.xyz';
        } else {
            url = 'https://dev-bid.seoulauction.xyz';
        }

        //랏 이동
        $scope.lotmove = function (step) {
            $scope.newLot += step;
            fetch(url + "/lot/move", {
                method: "POST", body: JSON.stringify({
                    sale_no: $scope.saleNo,
                    lot_no: $scope.newLot,
                    user_id: $scope.userId,
                    cust_no: $scope.custNo,
                    token: $scope.token,
                    sale_type: 1,
                    bid_type: 11,
                }),
            });
        }

        // 랏 동기화
        $scope.lotsync = function (lotNo) {
            fetch(url + "/lot/start", {
                method: "POST", body: JSON.stringify({
                    customer: {
                        sale_no: $scope.saleNo,
                        user_id: $scope.userId,
                        lot_no: $scope.newLot,
                        cust_no: $scope.custNo,
                        token: $scope.token,
                        sale_type: 1,
                        bid_type: 11,
                    },
                }),
            });
        }

        // 낙찰
        $scope.lotwinner = function (lotNo) {
            fetch(url + "/lot/winner", {
                method: "POST", body: JSON.stringify({
                    customer: {
                        sale_no: $scope.saleNo,
                        lot_no: $scope.newLot,
                        user_id: $scope.userId,
                        cust_no: $scope.custNo,
                        paddle: $scope.paddNo,
                        token: $scope.token,
                        sale_type: 1,
                        bid_type: 11,
                    },
                }),
                // 현재가 전송
                bid_cost: $scope.curLot.bid_cost
            });
        }
        // 비딩 삭제
        $scope.deletebid = function (bidToken) {
            fetch(url + "/bid/hist/del", {
                method: "POST", body: JSON.stringify({
                    customer: {
                        sale_no: $scope.saleNo,
                        lot_no: $scope.curLot.LOT_NO,
                        paddle: $scope.paddNo,
                        user_id: $scope.userId,
                        cust_no: $scope.custNo,
                        sale_type: 1,
                        bid_type: 11,
                    },
                    // 비딩 고유키(HISTORY KEY)
                    bid_token: bidToken,
                }),
            });
        }
        // cost 변경
        $scope.biddown = function (cost) {
            $scope.bid_cost_temp -= cost;
        }
        $scope.bidup = function (cost) {
            $scope.bid_cost_temp += cost;
        }
        // 현재가 조정
        $scope.bidchange = function () {
            fetch(url + "/bid/change", {
                method: "POST", body: JSON.stringify({
                    customer: {
                        sale_no: $scope.saleNo,
                        lot_no: $scope.curLot.LOT_NO,
                        user_id: $scope.userId,
                        cust_no: $scope.custNo,
                        token: $scope.token,
                        sale_type: 1,
                        bid_type: 11,
                        // 현장응찰 여부
                        is_floor: true,
                    },
                    // 비딩 금액
                    bid_cost: parseInt($scope.bid_change_cost.replace(/,/gi, "")),
                    // 비딩 고유키(HISTORY KEY)
                    bid_token: $scope.bidToken,
                }),
            });
        }
        // 응찰
        $scope.bid = function () {
            fetch(url + "/bid", {
                method: "POST", body: JSON.stringify({
                    customer: {
                        sale_no: $scope.saleNo,
                        lot_no: $scope.curLot.LOT_NO,
                        paddle: $scope.paddNo,
                        user_id: '',
                        cust_no: 0,
                        token: $scope.token,
                        sale_type: 1,
                        bid_type: 11,
                        // 현장응찰 여부
                        is_floor: true,
                    },
                    bid_cost: parseInt($scope.bid_change_cost.replace(/,/gi, ""))
                }),
            });
        }

        // message 전송
        $scope.sendmsg = function (saleNo, idx) {
            fetch(url + "/notice", {
                method: "POST", body: JSON.stringify(
                   {
                        sale_no: saleNo,
                        msg: $scope.noticeList[idx],
                   },
                ),
            });
        }


        // 호출 부
        $scope.load = function () {
            <%--if (${member.userNo} === 0){--%>
            <%--    location.href = "/login";--%>
            <%--    return;--%>
            <%--}--%>
            let run = async function () {
                // 호출 부
                const getSaleInfo = (saleNo) => {
                    try {
                        return axios.get('/api/auction/list/${saleNo}');
                    } catch (error) {
                        console.error(error);
                    }
                };

                const getSaleImages = (saleNo, lotNo) => {
                    try {
                        return axios.get('/api/auction/sale_images/${saleNo}');
                    } catch (error) {
                        console.error(error);
                    }
                }

                let [r1, r2] = await Promise.all([getSaleInfo($scope.saleNo),
                    getSaleImages($scope.saleNo)]);
                $scope.saleInfoAll = r1.data.data;
                $scope.saleImages = r2.data.data;

                for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                    if ($scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW != null) {
                        $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_FROM_JSON.KRW.toLocaleString('ko-KR');
                        $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW = $scope.saleInfoAll[i].EXPE_PRICE_TO_JSON.KRW.toLocaleString('ko-KR');
                    }
                }
                $scope.$apply();
                // 웹소켓 수행
                $scope.bidstart('${member.loginId}', ${member.userNo});
            }
            run();
        }
        /*################ 웹소켓 #################*/
        // connect 정보
        $scope.connectInfo = {};
        // 커넥션시도횟수
        $scope.conTryCnt = 0;
        // 비딩 종료 시간
        $scope.endBidTime = 0;
        // 비딩 종료 여부
        $scope.isEndBid = false;
        // 모든 비딩 정보
        $scope.bidsInfoAll = [];

        $scope.noticeList = [{ko:'안녕하세요', en:'Hello'},{},{},{},{},{},{},{},{},{}];

        $scope.notice = {}
        let con_try_cnt = 0;
        // 웹소켓

        let w;

        let is_end_bid;

        // bidstart
        $scope.bidstart = function (user_id, custNo) {
            $scope.retry(parseInt($scope.saleNo), 0, 1, user_id, custNo);
        }



        // websocket connection retry
        $scope.retry = function (saleNo, lotNo, saleType, userId, custNo) {
            window.clearTimeout($scope.websocketTimeout);
            if (w != null) {
                w = null;
            }
            if (con_try_cnt > 5) {
                con_try_cnt = 0
                return
            }

            if (window.location.protocol !== "https:") {
                w = new WebSocket("ws://dev-bid.seoulauction.xyz/ws?sale_no=" +
                    saleNo + "&lot_no=" + lotNo + "&cust_no=" + custNo +
                    "&user_id=" + userId + "&paddle=0&sale_type=1&bid_type=11");
            } else {
                w = new WebSocket("wss://dev-bid.seoulauction.xyz/ws?sale_no=" +
                    saleNo + "&lot_no=" + lotNo + "&cust_no=" + custNo +
                    "&user_id=" + userId + "&paddle=0&sale_type=1&bid_type=11");
            }
            w.onopen = function () {
                console.log("open");
            }
            w.onerror = function () {
                w.close();
                console.log('error');
            }
            w.onclose = function () {
                if (w.readyState === w.CLOSED) {
                    if (!is_end_bid) {
                        $scope.con_try_cnt++;
                        $scope.websocketTimeout = window.setTimeout(function () {
                            $scope.retry(saleNo, lotNo, saleType, userId, custNo);
                        }, 1000);
                    }
                }
            }
            w.onmessage = function (evt) {
                $scope.proc(evt, saleNo, lotNo, saleType, userId, custNo);
            }
            $scope.con_try_cnt = 0;
        }


        // bid protocols
        $scope.proc = function (evt, saleNo, lotNo, saleType, userId, custNo) {
            const packet_enum = {
                init: 1,
                bid_info: 2,
                time_sync: 3,
                bid_info_init: 4,
                end_time_sync: 5,
                winner: 6,
                viewers: 7,
                user_bid_hist: 8,
                lot_change: 9,
                lot_start: 10,
                bid_change: 11,
                bid_delete: 12,
                notice: 13,
            }
            let d = JSON.parse(evt.data);
            if (d.msg_type === packet_enum.init) {
                // 현재 토큰정보
                $scope.token = d.message.token;
            } else if (d.msg_type === packet_enum.bid_info) {
                if (d.message.bid != null && d.message.bid.length > 0) {
                    let len = d.message.bid.length;
                    let curCostValue = (d.message.bid[len - 1].bid_cost === 0) ? "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR') : "KRW " + d.message.bid[len - 1].bid_cost.toLocaleString('ko-KR');
                    $scope.bidToken = d.message.bid[len - 1].bid_token;
                    // 앵귤러 정보 삽입
                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if (parseInt($scope.saleInfoAll[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no && parseInt($scope.saleInfoAll[i].LOT_NO) === d.message.bid[len - 1].customer.lot_no) {
                            $scope.saleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                            $scope.saleInfoAll[i].BID_COST = curCostValue;

                            // 현재 랏의 새로운 응찰가 세팅
                            d.message.bid[len - 1].cur_cost = d.message.bid[len - 1].bid_cost;
                            $scope.curLot.bid_cost = curCostValue;

                            // 다음 응찰가
                            $scope.curLot.bid_new_cost = "KRW " + (((d.message.bid[len - 1].bid_cost === 0)
                                ? d.message.bid[len - 1].open_bid_cost
                                : d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote).toLocaleString('ko-KR');

                            $scope.curLot.bid_new_cost_num = (((d.message.bid[len - 1].bid_cost === 0)
                                ? d.message.bid[len - 1].open_bid_cost
                                : d.message.bid[len - 1].bid_cost) + d.message.bid[len - 1].bid_quote)

                            d.message.bid[len - 1].bid_cost = curCostValue;

                            // 현재 랏정보 저장
                            $scope.bidHist.push(d.message.bid[len - 1]);

                            let v = $scope.bidHist;

                            if (v.length > 0) {
                                // 응찰가 높은 순
                                v.sort(function (a, b) {
                                    if (a.cur_cost > b.cur_cost) return -1;
                                    if (a.cur_cost === b.cur_cost) return 0;
                                    if (a.cur_cost < b.cur_cost) return 1;
                                });
                            }

                            $scope.bidHist = v;
                            //$scope.notice.msg = d.message.notice;
                            break
                        }
                    }

                    // 앵귤러 정보 삽입
                    for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                        if (parseInt($scope.saleInfoAll[i].SALE_NO) === d.message.bid[len - 1].customer.sale_no
                            && $scope.saleInfoAll[i].LOT_NO === d.message.bid[len - 1].customer.lot_no) {
                            $scope.saleInfoAll[i].START_PRICE = "KRW " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR');
                            $scope.saleInfoAll[i].BID_COUNT = "(응찰 " + d.message.bid[len - 1].bid_count + ")";
                            $scope.saleInfoAll[i].CUR_COST = curCostValue;
                            break
                        }
                    }
                    $scope.$apply();
                    $scope.userBidHist();
                }
            } else if (d.msg_type === packet_enum.time_sync) {
                console.log(d.message.tick_value);
            } else if (d.msg_type === packet_enum.bid_info_init) {
                if (d.message.is_list_popup) {
                    let bid_hist_info = d.message.bids_hist;
                    let bid_info = d.message.bids[0];

                    $scope.bidToken = d.message.bids[0].bid_token;

                    $scope.curLot.bid_new_cost = "KRW " + (((bid_info.bid_cost === 0)
                        ? bid_info.open_bid_cost
                        : bid_info.bid_cost) + bid_info.bid_quote).toLocaleString('ko-KR');

                    $scope.curLot.bid_new_cost_num = (((bid_info.bid_cost === 0)
                        ? bid_info.open_bid_cost
                        : bid_info.bid_cost) + bid_info.bid_quote)

                    $scope.viewers = d.message.viewers;

                    $scope.curLot.bid_cost = "KRW " + (((bid_info.bid_cost === 0)
                        ? bid_info.open_bid_cost
                        : bid_info.bid_cost)).toLocaleString('ko-KR');

                    $scope.bid_change_cost = (((bid_info.bid_cost === 0)
                        ? bid_info.open_bid_cost
                        : bid_info.bid_cost)).toLocaleString('ko-KR');


                    if (bid_hist_info != null && bid_hist_info.length > 0) {
                        for (let i = 0; i < bid_hist_info.length; i++) {
                            if (bid_hist_info[i].value != null) {
                                // 현재 랏의 새로운 응찰가 세팅
                                $scope.bidHist = bid_hist_info[i].value;
                                for (let j = 0; j < $scope.bidHist.length; j++) {
                                    $scope.bidHist[j].cur_cost = $scope.bidHist[j].bid_cost;
                                    $scope.bidHist[j].bid_cost = "KRW " + $scope.bidHist[j].bid_cost.toLocaleString('ko-KR');
                                }
                                break
                            }
                        }
                    }
                    let v = $scope.bidHist;
                    if (v != null) {
                        // 응찰가 높은 순
                        v.sort(function (a, b) {
                            if (a.cur_cost > b.cur_cost) return -1;
                            if (a.cur_cost === b.cur_cost) return 0;
                            if (a.cur_cost < b.cur_cost) return 1;
                        });
                    } else {
                        v = [];
                    }
                    $scope.bidHist = v;
                    $scope.$apply();
                } else {
                    if (d.message.bids != null && d.message.bids.length > 0) {
                        $scope.bidsInfoAll = d.message.bids;
                        $scope.viewUsers = d.message.bids[0].view_users;
                        let matching = new Map();

                        // 정보를 처음 가져왔을 때, 인덱스 매핑
                        for (let i = 0; i < $scope.bidsInfoAll.length; i++) {
                            matching.set($scope.bidsInfoAll[i].customer.sale_no + "-"
                                + $scope.bidsInfoAll[i].customer.lot_no, i);
                        }

                        // 현재 curInfo 정보 변경
                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            if ($scope.saleInfoAll[j].LOT_NO === $scope.bidsInfoAll[0].cur_lot_no) {
                                $scope.curLot = $scope.saleInfoAll[j];
                                $scope.userLot = $scope.curLot;
                                //console.log(" $scope.curLot",  $scope.curLot);
                                break;
                            }
                        }

                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            let idx = matching.get($scope.saleInfoAll[j].SALE_NO + "-"
                                + $scope.saleInfoAll[j].LOT_NO);
                            if (idx !== undefined) {
                                let curCostValue = ($scope.bidsInfoAll[idx].bid_cost === 0) ? "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR') : "KRW " + $scope.bidsInfoAll[idx].bid_cost.toLocaleString('ko-KR');
                                // 시작일자
                                $scope.saleInfoAll[j].START_COST = "KRW " + $scope.bidsInfoAll[idx].open_bid_cost.toLocaleString('ko-KR');
                                // 현재가
                                $scope.saleInfoAll[j].CUR_COST = curCostValue;

                                // 낙찰이 완료 되었다면
                                if ($scope.bidsInfoAll[idx].winner_state === 2) {
                                    $scope.bidsInfoAll[idx].IS_END_BID = true;
                                }
                            }
                        }

                        // 모두 낙찰되었다면 종료
                        let isCanClose = true;
                        for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                            if ($scope.saleInfoAll[j].IS_END_BID) {
                                isCanClose = false;
                                break;
                            }
                        }
                        if (!isCanClose) {
                            w.close();
                        }

                        // get current_lot
                        let currentLotInfoFunc = async function (token, saleNo, lotNo, saleType) {
                            let url = '';
                            if (window.location.protocol !== "https:") {
                                url = 'http://dev-bid.seoulauction.xyz/init2';
                            } else {
                                url = 'https://dev-bid.seoulauction.xyz/init2';
                            }
                            let resp = await fetch(url, {
                                method: "POST", body: JSON.stringify({
                                    token: token,
                                    sale_no: saleNo,
                                    lot_no: lotNo,
                                    sale_type: saleType,
                                    user_id: '${member.loginId}',
                                }),
                            });
                            return resp;
                        }

                        $scope.newLot = $scope.bidsInfoAll[0].cur_lot_no;
                        // 현재 랏정보 가져옴
                        currentLotInfoFunc($scope.token, saleNo, $scope.bidsInfoAll[0].cur_lot_no, saleType);
                    }
                }
            } else if (d.msg_type === packet_enum.winner) {
                if (d.message != null) {
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if ($scope.saleInfoAll[j].SALE_NO === d.message.sale_no && $scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
                            // 낙찰가
                            $scope.saleInfoAll[j].SUCEED_COST = 0;
                            // 현재 랏정보
                            $scope.CUR_LOT_NO = d.message.cur_lot_no;
                            // 현재 랏 정보 삽입
                            for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                                if ($scope.saleInfoAll[j].LOT_NO === d.message.cur_lot_no) {
                                    $scope.CUR_LOT_ARTIST_NAME = $scope.saleInfoAll[j].ARTIST_NAME_JSON.ko;
                                    break;
                                }
                            }
                        }
                    }
                    let isCanClose = true;
                    for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                        if (!$scope.saleInfoAll[j].IS_END_BID) {
                            isCanClose = false;
                            break
                        }
                    }
                    if (!isCanClose) {
                        w.close();
                    }
                }
            } else if (d.msg_type === packet_enum.viewers) {
                $scope.viewers = d.message.viewers;
            } else if (d.msg_type === packet_enum.user_bid_hist) {
                $scope.userBids = d.message;
                $scope.$apply();
            } else if (d.msg_type === packet_enum.lot_change) {
                for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                    if ($scope.saleInfoAll[j].LOT_NO === d.message.lot_no) {
                        $scope.curLot = $scope.saleInfoAll[j];
                        $scope.newLot = d.message.lot_no;

                        let currentLotInfoFunc = async function (token, saleNo, lotNo, saleType) {
                            let url = '';
                            if (window.location.protocol !== "https:") {
                                url = 'http://dev-bid.seoulauction.xyz/init2';
                            } else {
                                url = 'https://dev-bid.seoulauction.xyz/init2';
                            }
                            let resp = await fetch(url, {
                                method: "POST", body: JSON.stringify({
                                    token: token,
                                    sale_no: saleNo,
                                    lot_no: lotNo,
                                    sale_type: saleType,
                                    user_id: '${member.loginId}',
                                }),
                            });
                            return resp;
                        }
                        currentLotInfoFunc($scope.token, $scope.saleNo, $scope.newLot, 1)
                        break;
                    }
                }
                $scope.$apply();
            } else if (d.msg_type === packet_enum.lot_start) {
                for (let j = 0; j < $scope.saleInfoAll.length; j++) {
                    if ($scope.saleInfoAll[j].LOT_NO === d.message.customer.lot_no) {
                        $scope.curLot = $scope.saleInfoAll[j];
                        break;
                    }
                }
            } else if (d.msg_type === packet_enum.bid_change) {

                let bid_hist_info = d.message.bids_hist;
                let bid_info = d.message.bid[0];

                $scope.curLot.bid_new_cost = "KRW " + (((bid_info.bid_cost === 0)
                    ? bid_info.open_bid_cost
                    : bid_info.bid_cost) + bid_info.bid_quote).toLocaleString('ko-KR');

                $scope.curLot.bid_new_cost_num = (((bid_info.bid_cost === 0)
                    ? bid_info.open_bid_cost
                    : bid_info.bid_cost) + bid_info.bid_quote)

                $scope.viewers = d.message.viewers;

                $scope.curLot.bid_cost = "KRW " + (((bid_info.bid_cost === 0)
                    ? bid_info.open_bid_cost
                    : bid_info.bid_cost)).toLocaleString('ko-KR');

                if (bid_hist_info != null && bid_hist_info.length > 0) {
                    $scope.bidHist = bid_hist_info;
                    for (let j = 0; j < $scope.bidHist.length; j++) {
                        $scope.bidHist[j].cur_cost = $scope.bidHist[j].bid_cost;
                        $scope.bidHist[j].bid_cost = "KRW " + $scope.bidHist[j].bid_cost.toLocaleString('ko-KR');
                    }

                }
                let v = $scope.bidHist;
                if (v != null) {
                    // 응찰가 높은 순
                    v.sort(function (a, b) {
                        if (a.cur_cost > b.cur_cost) return -1;
                        if (a.cur_cost === b.cur_cost) return 0;
                        if (a.cur_cost < b.cur_cost) return 1;
                    });
                } else {
                    v = [];
                }
                $scope.bidHist = v;
                $scope.$apply();

            } else if (d.msg_type === packet_enum.bid_delete) {

                let bid_hist_info = d.message.bids_hist;
                let bid_info = d.message.bids[0];

                $scope.curLot.bid_new_cost = "KRW " + (((bid_info.bid_cost === 0)
                    ? bid_info.open_bid_cost
                    : bid_info.bid_cost) + bid_info.bid_quote).toLocaleString('ko-KR');

                $scope.curLot.bid_new_cost_num = (((bid_info.bid_cost === 0)
                    ? bid_info.open_bid_cost
                    : bid_info.bid_cost) + bid_info.bid_quote)

                $scope.viewers = d.message.viewers;

                $scope.curLot.bid_cost = "KRW " + (((bid_info.bid_cost === 0)
                    ? bid_info.open_bid_cost
                    : bid_info.bid_cost)).toLocaleString('ko-KR');

                if (bid_hist_info != null && bid_hist_info.length > 0) {
                    for (let i = 0; i < bid_hist_info.length; i++) {
                        if (bid_hist_info[i].value != null) {
                            // 현재 랏의 새로운 응찰가 세팅
                            $scope.bidHist = bid_hist_info[i].value;
                            for (let j = 0; j < $scope.bidHist.length; j++) {
                                $scope.bidHist[j].cur_cost = $scope.bidHist[j].bid_cost;
                                $scope.bidHist[j].bid_cost = "KRW " + $scope.bidHist[j].bid_cost.toLocaleString('ko-KR');
                            }
                            break
                        }
                    }
                }
                let v = $scope.bidHist;
                if (v != null) {
                    // 응찰가 높은 순
                    v.sort(function (a, b) {
                        if (a.cur_cost > b.cur_cost) return -1;
                        if (a.cur_cost === b.cur_cost) return 0;
                        if (a.cur_cost < b.cur_cost) return 1;
                    });
                } else {
                    v = [];
                }
                $scope.bidHist = v;
                $scope.$apply();
            } else if (d.msg_type === packet_enum.notice) {
                $scope.notice = d.message.msg;
                $scope.$apply();
            }
        }
    });
</script>
</body>
</html>
