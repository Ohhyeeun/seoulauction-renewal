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
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <%--Axios--%>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
    <script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>
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
                                    <td ng-show="item.bid_kind_cd != 'online'">
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
                                                                                      ng-click="lotsync();">LOT동기화</button></span>
                                <span class="btn_style01 green02 bidlive_btn"><button type="button"
                                                                                      ng-click="lotwinner();">
										<span ng-if="lot.LIVE_CLOSE_YN == 'Y'" style="color:red; font-weight:bold;">LOT마감해제</span><span
                                        ng-if="lot.LIVE_CLOSE_YN != 'Y'"
                                        style="color:blue; font-weight:bold;">LOT마감</span></button>
									</span>
                            </div>
                        </div>
                        <!-- 테스트용 (직원용) -->
                        <div style="float:left; margin-right: 15px; padding: 10px;">
                            <!-- 시작가 & 호가 -->
                            <div class="hogatable" ng-repeat="item in qoute_list">
                                <label for="bidPriceInputGrow5">
                                    <font style="padding-left:15px; padding-right:5px; display:table-cell; vertical-align:middle;">호가</font>
                                </label>
                                <input type="text" ng-model="item.step | currency" id="bidPriceInputGrow5"
                                       name="bidPriceInputGrow5" onkeyup="getNumber(this)"/>
                                <span class="btn_style01 gray02 bidlive_btn">
                                    <button type="button"
                                            ng-click="biddown(item.step);">-</button></span>
                                <span class="btn_style01 yellow bidlive_btn">
                                    <button type="button"
                                            ng-click="bidup(item.step);">+</button></span>
                            </div>
                            <!-- 현재가 -->
                            <div class="hogatable">
                                <label for="bidPriceInputStart">
                                    <font style="padding-left:15px; padding-right:5px; display:table-cell; vertical-align:middle;">현재가</font>
                                </label>
                                <!-- 신규비딩금액을 bid_change_cost로 명명한다.-->
                                <input type="text" ng-model="bid_change_cost" id="bidPriceInputStart"
                                       name="bidPriceInputStart" onkeyup="getNumber(this)" style="width:170px;"/>
                            </div>
                        </div><!-- //시작가 & 호가 -->
                        <!-- 응찰 버튼 (직원용) -->
                        <div style="padding: 10px; float: left; height: 300px;">
								<span class="btn_style01 green02 bid_live_Edit_btn">
									<button type="button" ng-click="bidchange();">현재가 조정</button>
								</span>
                            <span class="btn_style01 green02 bid_live_Edit_btn">
									<button type="button" ng-click="bid();"
                                            style="height: 220px; line-height: 220px;">현장 응찰</button>
								</span>
                        </div>
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

    // 현재가 처리
    app.filter('currency', function(){
        return function(val) {
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
            url = 'http://localhost:8002';
        } else {
            url = 'https://localhost:8002';
        }



        //랏 이동
        $scope.reg = function (step) {
            let lot_orders = [];
            for (let i = 0; i < $scope.saleInfoAll.length; i++) {
                lot_orders.push(
                    {
                        customer : {
                            sale_no:$scope.saleNo,
                            lot_no:$scope.saleInfoAll[i].LOT_NO,
                            paddle: 0,
                            user_id: "sysadmin",
                            token: new Date().format("yyyymmddHHmmss") + "SYSADM",
                            sale_type: 1,
                            bid_type : 11
                        },
                        bid_cost: 0,
                        open_bid_cost: $scope.saleInfoAll[i].OPEN_BID_COST,
                        bid_qoute:0,
                        is_auto_bid: false,
                        end_bid_time: new Date($scope.saleInfoAll[i].TO_DT_ORG).getTime(),
                        open_bid_time: new Date($scope.saleInfoAll[i].FROM_DT_ORG).getTime(),
                        state : 1,
                        secret : "KENNYPARK"
                    }
                )
            }
            console.log(lot_orders);
            /*fetch(url + "/sale/reg", {
                method: "POST", body: JSON.stringify({
                    sale_type: 1,
                    sale_no: $scope.saleNo,
                    lot_orders: lot_orders,
                }),
            });*/
        }

        // 호출 부
        $scope.load = function () {
            if (${member.userNo} === 0){
               location.href = "/login";
               return;
            }
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
                w = new WebSocket("ws://localhost:8002/ws");
            } else {
                w = new WebSocket("wss://localhost:8002/ws");
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
            }
            let d = JSON.parse(evt.data);
            if (d.msg_type === packet_enum.init) {
                // 현재 토큰정보
                $scope.token = d.message.token;
                let init_func_manual = async function (req) {
                    let url = '';
                    if (window.location.protocol !== "https:") {
                        url = 'http://localhost:8002/init';
                    } else {
                        url = 'https://localhost:8002/init';
                    }
                    let response = await fetch(url, {
                        method: "POST", body: JSON.stringify({
                            token: req.message.token,
                            sale_no: saleNo,
                            lot_no: 0,
                            sale_type: saleType,
                            user_id: userId,
                            cust_no: custNo,
                        }),
                    });
                    return response;
                }
                init_func_manual(d);
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
                            $scope.notice.msg = d.message.notice;
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
                    } else {
                        $scope.bidHist = [];
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
                                url = 'http://localhost:8002/init2';
                            } else {
                                url = 'https://localhost:8002/init2';
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

                        $scope.newLot = parseInt($scope.bidsInfoAll[0].cur_lot_no);
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
                        $scope.newLot = parseInt(d.message.lot_no);

                        console.log("d.message.lot_no", d.message.lot_no)

                        let currentLotInfoFunc = async function (token, saleNo, lotNo, saleType) {
                            let url = '';
                            if (window.location.protocol !== "https:") {
                                url = 'http://localhost:8002/init2';
                            } else {
                                url = 'https://localhost:8002/init2';
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
                        let currentLotInfoFunc = async function (token, saleNo, lotNo, saleType) {
                            let url = '';
                            if (window.location.protocol !== "https:") {
                                url = 'http://localhost:8002/init2';
                            } else {
                                url = 'https://localhost:8002/init2';
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
                        $scope.$apply();
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

                } else {
                    $scope.bidHist = [];
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
            }
        }
    });
</script>
</body>
</html>