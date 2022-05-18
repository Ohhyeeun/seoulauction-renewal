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
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
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
                                        <span class="tt1">결제 완료</span>
                                    </div>
                                    <div class="guide_box">
                                        <span class="tb2">통화 : KRW</span>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <ul class="form_table_pay">
                                        <li>
                                            <div class="account_info">
                                                <p class="tit">낙찰 작품 안내</p>
                                                <ul class="dot_list tb1">
                                                    <li>경매 낙찰 작품은 구매자 직접 작품 수령을 원칙으로 합니다.</li>
                                                    <li>판매 담당자와의 유선 연락으로 수령 방법 확인 및 방문 예약을 할 수 있습니다.</li>
                                                </ul>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="table_box">
                                                <div class="guide">

                                                    <div class="product-box">
                                                        <p class="img"><img src="/images/temp/temp_img2.jpg" alt="" /></p>
                                                        <dl class="product_info">
                                                            <dt class="tt4">
                                                                데미안허스트 (1965)
                                                                <span class="sub_txt tb1">Air (From The Series The Elements)</span>
                                                            </dt>
                                                            <dd class="tb2">
                                                                <span>spray paint on canvas</span>
                                                                <div class="size_year">
                                                                    <span>80.9 X 73.4cm</span>
                                                                    <span>2021</span>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>

                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit tt5">낙찰가</span>
                                                        <span class="won tt3">53,000,000<i class="tb1">원</i></span>
                                                    </p>
                                                    <p class="fees">
                                                        <span class="tit tb1">낙찰 수수료</span>
                                                        <span class="won tb1">10,494,000<i class="tb2">원</i></span>
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
                                            <p class="list_tit tt4">결제 정보</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">총 결제금액</span>
                                                    <span class="td pay">낙찰가 200,000 원
                                                        <br class="only-mb" />+ 낙찰수수료 0 원
                                                        <br class="only-mb" /></i>= <i class="total">총 결제금액 200,000 원</i></span>
                                                </li>
                                                <li>
                                                    <span class="th">결제방법</span>
                                                    <span class="td">신용/체크카드</span>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>

                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set tac btn_double">
                                            <a class="btn btn_default btn_lg" href="#" role="button"><span>홈으로 이동</span></a>
                                            <a class="btn btn_black btn_lg" href="#" role="button"><span>마이페이지로 이동</span></a>
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