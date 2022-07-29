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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="UTF-8">
    <title>서울옥션</title>

    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/icon/favic/apple-touch-icon-57x57.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/icon/favic/apple-touch-icon-72x72.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/icon/favic/apple-touch-icon-114x114.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/icon/favic/apple-touch-icon-120x120.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/icon/favic/apple-touch-icon-152x152.png"/>
    <link rel="icon" type="image/png" href="/images/icon/favic/favicon-32x32.png" sizes="32x32"/>
    <link rel="icon" type="image/png" href="/images/icon/favic/favicon-16x16.png" sizes="16x16"/>
    <meta name="application-name" content="SeoulAuction"/>

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
            <div class="clearfix">
                <div class="col7 last clearfix"  style="width:48% !important;">
                    <div class="fixed-table-container" style="">
                        <div>
                            <table id="tbl_employee" class="fixed-table">
                                <colgroup>
                                    <col style="width:20%"/>
                                    <col style="width:20%"/>
                                    <col/>
                                    <col style="width:20%"/>
                                </colgroup>
                                <thead>
                                <tr style="height: 30px;border-top:1px solid #e0e0e0;border-bottom:1px solid #e0e0e0;">
                                    <th scope="col">
                                            <span ng-if="locale == 'ko'">경매번호</span>
                                            <span ng-if="locale != 'ko'">SALE NO</span>
                                    </th>
                                    <th scope="col">
                                            <span ng-if="locale == 'ko'">작품번호</span>
                                            <span ng-if="locale != 'ko'">LOT NO</span>
                                    </th>
                                    <th scope="col">
                                            <span ng-if="locale == 'ko'">작품명</span><span
                                                ng-if="locale != 'ko'">LOT NAME</span>
                                    </th>
                                    <th scope="col">
                                            <span ng-if="locale == 'ko'">시작가</span><span
                                                ng-if="locale != 'ko'">LOT NAME</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="tblOffBidListBody">
                                <tr ng-repeat="item in saleInfoAll">
                                    <td>
                                        <span>{{item.SALE_NO}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.LOT_NO}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.LOT_TITLE_JSON.ko}}</span>
                                    </td>
                                    <td>
                                        <span>{{item.START_PRICE | currency}}</span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col7 last clearfix" style="margin:25px;width:48% !important;">
                    <button ng-click="reg();" style="width:200px;height:200px;background : #ededed;">경매등록</button>
                </div>
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
    Date.prototype.format = function (f) {
        if (!this.valueOf()) return " ";

        var weekName = ["일", "월", "화", "수", "목", "금", "토"];
        var d = this;

        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function ($1) {
            switch ($1) {
                case "yyyy":
                    return d.getFullYear();
                case "yy":
                    return (d.getFullYear() % 1000).zf(2);
                case "MM":
                    return (d.getMonth() + 1).zf(2);
                case "dd":
                    return d.getDate().zf(2);
                case "E":
                    return weekName[d.getDay()];
                case "HH":
                    return d.getHours().zf(2);
                case "hh":
                    return ((h = d.getHours() % 12) ? h : 12).zf(2);
                case "mm":
                    return d.getMinutes().zf(2);
                case "ss":
                    return d.getSeconds().zf(2);
                case "a/p":
                    return d.getHours() < 12 ? "오전" : "오후";
                default:
                    return $1;
            }
        });
    };
    String.prototype.string = function (len) {
        var s = '', i = 0;
        while (i++ < len) {
            s += this;
        }
        return s;
    };
    String.prototype.zf = function (len) {
        return "0".string(len - this.length) + this;
    };
    Number.prototype.zf = function (len) {
        return this.toString().zf(len);
    };
    // 현재가 처리
    app.filter('userIdTxt', function () {
        return function (val) {
            if (val === undefined) {
                return '현장응찰';
            }
            return (val === '') ? '현장응찰' : val;
        };
    })

    // 현재가 처리
    app.filter('currency', function () {
        return function (val) {
            if (val === undefined) {
                return 0;
            }
            return val.toLocaleString('ko-KR');
        };
    })

    app.controller('ctl', function ($scope, consts, common, locale, $filter) {
        // 로케일
        $scope.locale = locale;
        // 경매번호
        $scope.saleNo = ${saleNo};

        $scope.saleInfoAll = [];
        $scope.saleImages = [];

        $scope.qoute_list = [{
            step: 100000
        }, {
            step: 200000
        }, {
            step: 300000
        }, {
            step: 500000
        }, {
            step: 1000000
        }]
        let url = '';
        if (window.location.protocol !== "https:") {
            url = 'http://dev-bid.seoulauction.xyz';
        } else {
            url = 'https://dev-bid.seoulauction.xyz';
        }

        //랏 이동
        $scope.reg = function () {

            let lot_orders = [];
            let salet = 1;
            let winnerst = 1;
            let bt = 11;
            for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                if ($scope.saleInfoAll[i].SALE_KIND_CD === "main"){
                    salet = 1;
                    bt = 11;
                    winnerst = 0;
                } else {
                    salet = 2;
                    bt = 21;
                    winnerst = 1;
                }
                lot_orders.push(
                    {
                        customer: {
                            sale_no: $scope.saleNo,
                            lot_no: $scope.saleInfoAll[i].LOT_NO,
                            paddle: 0,
                            user_id: "sysadmin",
                            token: (new Date()).format("yyyymmddHHmmss") + "SYSADM",
                            sale_type: salet,
                            bid_type: bt
                        },
                        bid_cost: 0,
                        open_bid_cost: $scope.saleInfoAll[i].START_PRICE,
                        bid_quote: 0,
                        is_auto_bid: false,
                        end_bid_time: new Date($scope.saleInfoAll[i].TO_DT_ORG).getTime() + (i * 30 * 1000),
                        open_bid_time: new Date($scope.saleInfoAll[i].FROM_DT_ORG).getTime(),
                        winner_state: winnerst,
                        secret: "KENNYPARK"
                    }
                )
            }

            /*console.log(JSON.stringify({
                sale_type: 1,
                sale_no: $scope.saleNo,
                lot_orders: lot_orders,
            }));*/

            fetch(url + "/sale/reg", {
                method: "POST", body: JSON.stringify({
                    sale_type: salet,
                    sale_no: $scope.saleNo,
                    lot_orders: lot_orders,
                }),
            });

            let q;
            if ($scope.saleInfoAll[0].SALE_KIND_CD === "main"
                || $scope.saleInfoAll[0].SALE_KIND_CD === "hongkong"
                || $scope.saleInfoAll[0].SALE_KIND_CD === "plan"){
                q = {
                    sale_type: 1,
                    sale_no: $scope.saleNo,
                    quotes: [
                        {
                            cost: 0,
                            quote_cost: 50000,
                        },
                        {
                            cost: 1000000,
                            quote_cost: 100000,
                        },
                        {
                            cost: 2000000,
                            quote_cost: 200000,
                        },
                        {
                            cost: 4000000,
                            quote_cost: 300000,
                        },
                        {
                            cost: 10000000,
                            quote_cost: 500000,
                        },
                        {
                            cost: 20000000,
                            quote_cost: 1000000,
                        },
                        {
                            cost: 30000000,
                            quote_cost: 2000000,
                        },
                        {
                            cost: 50000000,
                            quote_cost: 3000000,
                        },
                        {
                            cost: 100000000,
                            quote_cost: 5000000,
                        },
                        {
                            cost: 200000000,
                            quote_cost: 10000000,
                        },
                        {
                            cost: 300000000,
                            quote_cost: 20000000,
                        },
                        {
                            cost: 500000000,
                            quote_cost: 30000000,
                        },
                        {
                            cost: 1000000000,
                            quote_cost: 50000000,
                        },
                        {
                            cost: 2000000000,
                            quote_cost: 100000000,
                        }]
                }
            } else {
                q = {
                    sale_type: 2,
                    sale_no: $scope.saleNo,
                    quotes: [
                        {
                            cost: 0,
                            quote_cost: 50000,
                        },
                        {
                            cost: 1000000,
                            quote_cost: 100000,
                        },
                        {
                            cost: 3000000,
                            quote_cost: 200000,
                        },
                        {
                            cost: 5000000,
                            quote_cost: 300000,
                        },
                        {
                            cost: 10000000,
                            quote_cost: 500000,
                        },
                        {
                            cost: 30000000,
                            quote_cost: 1000000,
                        },
                        {
                            cost: 50000000,
                            quote_cost: 2000000,
                        },
                        {
                            cost: 100000000,
                            quote_cost: 3000000,
                        },
                        {
                            cost: 200000000,
                            quote_cost: 5000000,
                        }]
                }
            }
            console.log(q);
            fetch(url + "/quote/set", {
                method: "POST", body: JSON.stringify(q)});

            alert("경매등록이 완료되었습니다.");
        }

        // 호출 부
        $scope.load = function () {
            <%--if (${member.userNo} === 0) {--%>
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
            }
            run();
        }
    });

</script>
</body>
</html>