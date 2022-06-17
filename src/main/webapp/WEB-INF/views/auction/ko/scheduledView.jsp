<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>예정경매 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="auctionCtl" data-ng-init="loadAuction()">
            <div id="contents" class="contents">
                <section class="basis-section key_visual-section">
                    <div class="section-inner">
                        <div class="bgimg type-dcount ">
                        </div>
                    </div>
                </section>

                <section class="basis-section last-section ">
                    <div class="section-inner">

                        <div class="content-panel type_panel-counter">
                            <div class="panel-header">
                                <div class="title">오픈까지</div>

                                <article class="countdown-article">
                                    <div class="trp_counter-area type-day ">
                                        <ul class="flip dayPlay">
                                            <c:forEach var="i" begin="0" end="99">
                                            <li>
                                                <div class="li-box">
                                                    <div class="up">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span>D -</span> <span class="m_m">${99-i}</span></div>
                                                    </div>
                                                    <div class="down">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span>D -</span> <span class="m_m">${99-i}</span></div>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                    </div>

                                    <div class="trp_counter-area type-3 ">
                                        <ul class="flip hourPlay">
                                            <c:forEach var="i" begin="0" end="23">
                                            <li>
                                                <div class="li-box">
                                                    <div class="up">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span class="m_m"><fmt:formatNumber minIntegerDigits="2" value="${23-i}" type="number"/></span></div>
                                                    </div>
                                                    <div class="down">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span class="m_m"><fmt:formatNumber minIntegerDigits="2" value="${23-i}" type="number"/></span></div>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                        <div class="dot"></div>
                                        <ul class="flip minutePlay">
                                            <c:forEach var="i" begin="0" end="59">
                                            <li>
                                                <div class="li-box">
                                                    <div class="up">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span class="m_m"><fmt:formatNumber minIntegerDigits="2" value="${59-i}" type="number"/></span></div>
                                                    </div>
                                                    <div class="down">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span class="m_m"><fmt:formatNumber minIntegerDigits="2" value="${59-i}" type="number"/></span></div>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                        <div class="dot"></div>
                                        <ul class="flip secondPlay">
                                            <c:forEach var="i" begin="0" end="59">
                                            <li>
                                                <div class="li-box">
                                                    <div class="up">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span class="m_m"><fmt:formatNumber minIntegerDigits="2" value="${59-i}" type="number"/></span></div>
                                                    </div>
                                                    <div class="down">
                                                        <div class="shadow"></div>
                                                        <div class="inn"><span class="m_m"><fmt:formatNumber minIntegerDigits="2" value="${59-i}" type="number"/></span></div>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </article>
                            </div>

                            <div class="panel-body">
                                <div class="schedule-article">
                                    <div class="schedule_name">
                                        <span>{{auction.TITLE_JSON['ko']}}</span>
                                    </div>
                                    <ul class="info-list">
                                        <li><em>오픈일</em><span>{{auction.FROM_DT | date : 'MM.dd'}}({{getWeek(auction.FROM_DT)}}) {{auction.FROM_DT | date : 'H:m'}}</span></li>
                                        <li>
                                            <em>프리뷰</em>
                                            <span ng-repeat="prev in auction.PREVIEW_JSON">
                                                {{prev.FROM_DT | date : 'MM.dd'}}({{getWeek(prev.FROM_DT)}})
                                                 - {{prev.TO_DT | date : 'MM.dd'}}({{getWeek(prev.TO_DT)}}), {{prev.PLACE_JSON['ko']}}
                                            </span>
                                        </li>
                                        <li>
                                            <em>경매일</em>
                                            <span>
                                                {{auction.TO_DT | date : 'MM.dd'}}({{getWeek(auction.TO_DT)}}) {{auction.TO_DT | date : 'H:m'}}
                                                <ng:template ng-if="['online','online_zb'].indexOf(auction.SALE_KIND_CD) > -1"> 순차마감</ng:template>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="tac">
                                    <a class="btn btn_default " href="#" role="button"><span>이전으로 이동</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/ko/footer.jsp" />
        <!-- //footer -->

        <!-- stykey -->
        <div class="scroll_top-box">
            <div class="box-inner">
                <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
            </div>
        </div>
        <!-- // stykey -->
    </div>
</div>
<!-- angular js -->
<script>
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('auctionCtl', function($scope, consts, common, locale) {
    $scope.loadAuction = function() {
        axios.get('/api/auction/sales/${saleNo}').then(function(response) {
            const success = response.data.success;
            if (success) {
                $scope.auction = response.data.data;
                $scope.auction.PREVIEW_JSON = JSON.parse($scope.auction.PREVIEW_JSON);
                $scope.auction.TITLE_JSON = JSON.parse($scope.auction.TITLE_JSON);
                $scope.$apply();

                CountDownTimer($scope.auction.FROM_DT);
                bidstart(${saleNo}, '', 0, $scope.auction.FROM_DT)
            }
        }).
        catch(function(error){
            console.log(error);
        });
    }
});
</script>
<script>
    let w;
    let con_try_cnt = 0;
    let websocketTimeout;
    let token='';
    let end;

    // bidstart
    function bidstart(saleNo, user_id, custNo, toDt) {
        end = toDt;
        retry(saleNo, 0, 2, user_id, custNo);
    }

    // websocket connection retry
    function retry(saleNo, lotNo, saleType, userId, custNo) {
        window.clearTimeout(websocketTimeout);
        if (w != null) {
            w = null;
        }
        if (con_try_cnt > 5) {
            con_try_cnt = 0
            return
        }
        if (window.location.protocol !== "https:") {
            w = new WebSocket("ws://dev-bid.seoulauction.xyz/ws");
        } else {
            w = new WebSocket("wss://dev-bid.seoulauction.xyz/ws");
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
                    con_try_cnt++;
                    websocketTimeout = window.setTimeout(function () {
                        retry(saleNo, lotNo, saleType, userId, custNo);
                    }, 1000);
                }
            }
        }
        w.onmessage = function (evt) {
            proc(evt, saleNo, lotNo, saleType, userId, custNo);
        }
        con_try_cnt = 0;
    }
    // bid protocols
    function proc(evt, saleNo, lotNo, saleType, userId, custNo) {
        const packet_enum = {
            init: 1, time_sync: 3,
        }
        let d = JSON.parse(evt.data);
        if (d.msg_type === packet_enum.init) {
            // 현재 토큰정보
            token = d.message.token;
            let init_func_manual = async function (req) {
                let url = '';
                if (window.location.protocol !== "https:") {
                    url = 'http://dev-bid.seoulauction.xyz/init';
                } else {
                    url = 'https://dev-bid.seoulauction.xyz/init';
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
        }  else if (d.msg_type === packet_enum.time_sync) {
            numnumPlay("ul.secondPlay", d.msg_type.tick_value);
            //CountDownTimer(d.message.tick_value);
        }
    }
    /* 카운트셋 */
    function numnumSet($target, $num) {
        var max = 59;
        var count = max - $num;
        var num_num = $("li.active", $target);
        if ($target == "ul.hourPlay") {
            max = 24;
        }

        $(".countdown-article").removeClass("play");
        if (num_num.html() == undefined) {
            num_num = $("li", $target).eq(count);
            $("li", ul.secondPlay).removeClass("active")
            num_num.addClass("on")
        } else {
            /* 실행후 또실행 마지막 */
            num_num.addClass("on");
        }
    }

    function dayCountGo($target, $num) {
        var max = 99;
        var count = max - $num;
        var num_num = $("li.active", $target);
        $(".countdown-article").removeClass("play");
        $(".trp_counter-area ul li").removeClass("on");
        if (num_num.html() == undefined) {
            num_num = $("li", $target).eq(count);
            $("li", $target).removeClass("active");
            $("li", $target).removeClass("before");
            if ($num == 59) {
                num_num.addClass("active")
                    .closest(".countdown-article")
                    .addClass("play");
                $("li", $target).eq(59).addClass("before");
            } else {
                num_num.addClass("active")
                    .prev("li")
                    .addClass("before")
                    .closest(".countdown-article")
                    .addClass("play");
            }
        }
        $($target).attr("data-time", $("li.active", $target).find(".up .inn>.m_m").text())
    }

    function hourCountGo($target, $num) {
        var max = 23;
        var count = max - $num;
        var num_num = $("li.active", $target);
        $(".countdown-article").removeClass("play");
        $(".trp_counter-area ul li").removeClass("on");
        if (num_num.html() == undefined) {
            num_num = $("li", $target).eq(count);
            $("li", $target).removeClass("active");
            $("li", $target).removeClass("before");
            if ($num == 59) {
                num_num.addClass("active")
                    .closest(".countdown-article")
                    .addClass("play");
                $("li", $target).eq(59).addClass("before");
            } else {
                num_num.addClass("active")
                    .prev("li")
                    .addClass("before")
                    .closest(".countdown-article")
                    .addClass("play");
            }
        }
        $($target).attr("data-time", $("li.active", $target).find(".up .inn>.m_m").text())
    }

    function numnumCountGo($target, $num) {
        var max = 59;
        var count = max - $num;
        var num_num = $("li.active", $target);
        $(".countdown-article").removeClass("play");
        $(".trp_counter-area ul li").removeClass("on");
        if (num_num.html() == undefined) {
            num_num = $("li", $target).eq(count);
            $("li", $target).removeClass("active");
            $("li", $target).removeClass("before");
            if ($num == 59) {
                num_num.addClass("active")
                    .closest(".countdown-article")
                    .addClass("play");
                $("li", $target).eq(59).addClass("before");
            } else {
                num_num.addClass("active")
                    .prev("li")
                    .addClass("before")
                    .closest(".countdown-article")
                    .addClass("play");
            }
        }
        $($target).attr("data-time", $("li.active", $target).find(".up .inn>.m_m").text())
    }

    function numnumPlay($target) {
        $(".countdown-article").removeClass("play");
        $(".trp_counter-area ul li").removeClass("on");

        var num_num = $("li.active", $target);
        /* 처음 */
        if (num_num.html() == undefined) {
            //clearInterval(call_ss);
            num_num = $("li", $target).eq(0);
            num_num.addClass("before")
                .removeClass("active")
                .next("li")
                .addClass("active")
                .closest(".countdown-article")
                .addClass("play");
        }
        /* 마지막 */
        else if (num_num.is(":last-child")) {
            console.log("=======last====");
            /* 초 */
            if ($target == "ul.secondPlay") {
                var _d = $("ul.dayPlay").attr("data-time");
                var _h = $("ul.hourPlay").attr("data-time");
                var _m = $("ul.minutePlay").attr("data-time");
                /* ==end== */
                //if( _d == "00" && _h == "00" && _m=="00" ){
                if (_d == "00") {
                    //clearInterval(call_ss);
                    openDdayFn();
                    return false;
                }
                /* 분 카운트 */
                numnumPlay("ul.minutePlay");
                /* 시간 카운트 */
            }

            /* 분 */
            if ($target == "ul.minutePlay") {
                numnumPlay("ul.hourPlay");
            }

            /* 시 */
            if ($target == "ul.hourPlay") {
                numnumPlay("ul.dayPlay");
            }

            $("li", $target).removeClass("before");
            num_num.addClass("before").removeClass("active");
            num_num = $("li", $target).eq(0);
            num_num.addClass("active")
                .closest(".countdown-article")
                .addClass("play");
        }
        /* next */
        else {
            $("li", $target).removeClass("before");
            num_num.addClass("before")
                .removeClass("active")
                .next("li")
                .addClass("active")
                .closest(".countdown-article")
                .addClass("play");
        }
        //$($target).attr("data-time", $tick);
        $($target).attr("data-time", $("li.active", $target).find(".up .inn>.m_m").text());
    }

    /* === 오픈시== */
    function openDdayFn() {
        numnumSet("ul.dayPlay", 0);
        numnumSet("ul.hourPlay", 0);
        numnumSet("ul.minutePlay", 0);
        numnumSet("ul.secondPlay", 0);
        location.href = "/auction/list/${saleNo}";
        return;
    }
</script>

<!-- [0523]날짜계산수정 -->
<script>
    function CountDownTimer($time) {
        var end = new Date($time);
        var _second = 1000;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;
        var timer;

        var now = new Date();
        var distance = end - now;
        if (distance < 0) {
            location.href = "/auction/list/${saleNo}";
            return;
        }
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);

        console.log("DD-DAY까지 " + days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초 남았습니다.");

        dayCountGo("ul.dayPlay", days); // 99 day
        hourCountGo("ul.hourPlay", hours); // 23 시
        numnumCountGo("ul.minutePlay", minutes); // 59 분
        numnumCountGo("ul.secondPlay", seconds); // 59 초
    }
</script>
<!-- //[0523]날짜계산수정 -->

</body>

</html>