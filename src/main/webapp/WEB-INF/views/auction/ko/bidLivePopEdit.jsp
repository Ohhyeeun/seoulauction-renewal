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
										<a ng-href="{{'http://re-dev.seoulauction.com/auction/live/view/' +
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


        //랏 이동
        $scope.lotmove = function (step) {
        }

        // 랏 동기화
        $scope.lotsync = function () {
        }

        // 낙찰
        $scope.lotwinner = function (lotNo) {
        }
        // 비딩 삭제
        $scope.deletebid = function (bidToken) {
        }
        // cost 변경
        $scope.biddown = function (cost) {
        }
        $scope.bidup = function (cost) {
        }
        // 현재가 조정
        $scope.bidchange = function () {
        }
        // 응찰
        $scope.bid = function () {
        }

        // 호출 부
        $scope.load = function () {
            <%--if (${member.userNo} === 0){--%>
            <%--   location.href = "/login";--%>
            <%--   return;--%>
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