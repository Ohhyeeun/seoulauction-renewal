<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>결제 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    <!-- //header -->
</head>

<body class="">
<form name="payForm" method="post" action="/payment/paymentTuitionProcess">

    <input type="text" name="LogoImage" value="">
    <input type="text" name="NpLang" value="KO">
    <input type="text" name="CurrencyCode" value="KRW">
    <table>
        <tr>
            <th><span>결제 수단</span></th>
            <td><input type="text" name="PayMethod" value="VBANK"></td>
        </tr>
        <tr>
            <th><span>결제 상품명</span></th>
            <td><input type="text" name="GoodsName" value="${goodsName}"></td>
        </tr>
        <tr>
            <th><span>결제 상품금액</span></th>
            <td><input type="text" name="Amt" value="${price}"></td>
        </tr>
        <tr>
            <th><span>상점 아이디</span></th>
            <td><input type="text" name="MID" value="${merchantID}"></td>
        </tr>
        <tr>
            <th><span>상품 주문번호</span></th>
            <td><input type="text" name="Moid" value="${moid}"></td>
        </tr>
        <tr>
            <th><span>구매자명</span></th>
            <td><input type="text" name="BuyerName" value="${buyerName}"></td>
        </tr>
        <tr>
            <th>구매자명 이메일</th>
            <td><input type="text" name="BuyerEmail" value="${buyerEmail}"></td>
        </tr>
        <tr>
            <th><span>구매자 연락처</span></th>
            <td><input type="text" name="BuyerTel" value="${buyerTel}"></td>
        </tr>
        <tr>
            <th><span>인증완료 결과처리 URL<!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 --></span></th>
            <td><input type="text" name="ReturnURL" value="${returnURL}"></td>
        </tr>
        <tr>
            <th>가상계좌입금만료일(YYYYMMDD)</th>
            <td><input type="text" name="VbankExpDate" value=""></td>
        </tr>

        <!-- 옵션 -->
        <input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
        <input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) -->
        <input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
        <input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->

        <!-- 변경 불가능 -->
        <input type="hidden" name="EdiDate" value="${ediDate}"/>			<!-- 전문 생성일시 -->
        <input type="hidden" name="SignData" value="${hashString}"/>	<!-- 해쉬값 -->
    </table>
    <a href="#" class="btn_blue" onClick="nicepayStart();">요 청</a>
</form>
    <div class="wrapper footer-bottom footer-bottom30"> 
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-payment">
                                <div class="panel-header">
                                    <div class="title">
                                        <span class="tt1">수강료 결제</span>
                                    </div>
                                    <div class="guide_box">
                                        <span class="tb2">통화 : KRW</span>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <ul class="form_table_pay">
                                        <li>
                                            <div class="table_box">
                                                <div class="guide">
                                                    <div class="product-box">
                                                        <p class="img"><img src="/images/temp/temp_img5.jpg" alt="" /></p>
                                                        <dl class="product_info">
                                                            <dt class="tt4">
                                                                NFT Art & Metaverse in BUSAN
                                                            </dt>
                                                            <dd class="tb2">
                                                                2022-03-30 ~ 2022-04-20<br />
                                                                매주 수요일, 7:00-8:30pm (워크숍 제외)
                                                            </dd>
                                                        </dl>
                                                    </div>

                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit tt5">수강료</span>
                                                        <span class="won tt3">600,000<i class="tb1">원</i></span>
                                                    </p>
                                                    <p class="fees">
                                                        <span class="tit tb1">할인금액</span>
                                                        <span class="won tb1">0<i class="tb2">원</i></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">구매자 정보</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">이름</span>
                                                    <span class="td">홍길동</span>
                                                </li>
                                                <li>
                                                    <span class="th">연락처</span>
                                                    <span class="td">010-1234-5678</span>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">결제 방법</p>
                                            <div class="btn_wrap ">
                                                <a class="btn btn_black" href="#" role="button"><span>신용/체크카드</span></a>
                                                <a class="btn btn_default" href="#" role="button"><span>가상 계좌</span></a>
                                            </div>
                                        </li>
                                        <li class="no-line">
                                            <p class="list_tit tt4">총 결제금액</p>
                                            <div class="total_pay_box tt3">
                                                수강료 200,000 <i class="tb1">원</i><i class="br-mo"></i>
                                                + 할인금액 0 <i class="tb1">원</i> <i class="br-mo"></i>
                                                = <span>총 결제금액 200,000 <i class="tb1">원</i></span>
                                            </div>
                                        </li>
                                    </ul>

                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set-float tac">
                                            <a class="btn btn_point btn_lg" onclick="nicepayStart();" role="button"><span>결제하기</span></a>
                                        </div>
                                    </article>
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
    <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

</body>
<!-- 아래 js는 PC 결제창 전용 js입니다.(모바일 결제창 사용시 필요 없음) -->
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script type="text/javascript">
    //결제창 최초 요청시 실행됩니다.
    function nicepayStart(){
        if(checkPlatform(window.navigator.userAgent) == "mobile"){//모바일 결제창 진입
            document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
            document.payForm.acceptCharset="euc-kr";
            document.payForm.submit();
        }else{//PC 결제창 진입
            goPay(document.payForm);
        }
    }

    //[PC 결제창 전용]결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
    function nicepaySubmit(){
        document.payForm.submit();
    }

    //pc, mobile 구분(가이드를 위한 샘플 함수입니다.)
    function checkPlatform(ua) {
        if(ua === undefined) {
            ua = window.navigator.userAgent;
        }

        ua = ua.toLowerCase();
        var platform = {};
        var matched = {};
        var userPlatform = "pc";
        var platform_match = /(ipad)/.exec(ua) || /(ipod)/.exec(ua)
            || /(windows phone)/.exec(ua) || /(iphone)/.exec(ua)
            || /(kindle)/.exec(ua) || /(silk)/.exec(ua) || /(android)/.exec(ua)
            || /(win)/.exec(ua) || /(mac)/.exec(ua) || /(linux)/.exec(ua)
            || /(cros)/.exec(ua) || /(playbook)/.exec(ua)
            || /(bb)/.exec(ua) || /(blackberry)/.exec(ua)
            || [];

        matched.platform = platform_match[0] || "";

        if(matched.platform) {
            platform[matched.platform] = true;
        }

        if(platform.android || platform.bb || platform.blackberry
            || platform.ipad || platform.iphone
            || platform.ipod || platform.kindle
            || platform.playbook || platform.silk
            || platform["windows phone"]) {
            userPlatform = "mobile";
        }

        if(platform.cros || platform.mac || platform.linux || platform.win) {
            userPlatform = "pc";
        }

        return userPlatform;
    }
</script>
</html>