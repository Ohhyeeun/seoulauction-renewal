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
                                            <a class="btn btn_point btn_lg" href="#" role="button"><span>결제하기</span></a>
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

</html>