<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>아카데미 | Seoul Auction</title>
    <!-- //header -->
</head>
<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->
                <section class="page_title-section">
                    <div class="section-inner full_size">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">아트컨설팅&amp;기업마케팅</span></h2>
                        </div>
                    </div>
                </section>



                <!-- 진행 중인 아카데미 -->
                <section class="basis-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-marketing">
                            <div class="panel-header">
                                <div class="title"><span class="tt2">기획경매</span></div>
                                <div class="desc"><span class="tb1">서울옥션은 그간의 노하우를 바탕으로 다양한 브랜드와 스페셜한 경매를 기획해왔습니다. <br>
                                            기획경매를 통해 자동차, 와인, 보석, 디자인 가구 등을 선보이며 각 브랜드의 제품을 경매라는 특별한 플랫폼을 통해 홍보해 드립니다. <br>
                                            좋은 안목으로 고가의 예술품을 구매하는 서울옥션의 고객분들께 귀사의 제품을 소개함으로서 긍정적인 시너지 효과를 기대해 보십시오.</span></div>
                            </div>
                            <div class="panel-body">
                                <article class="service-marketing">
                                    <div class="banner">
                                        <div class="img-area">
                                            <img src="/images/pc/service/marketing_03_main.jpg" alt="기획경매" />
                                        </div>
                                        <div class="typo-area">
                                            <div class="area-header"><span>내용 및 기대효과</span></div>
                                            <div class="area-body">
                                                <ul class="desc_list_type0">
                                                    <li><span class="tb1">경매 및 전시, 부대행사 프로그램 진행에 따른 <em>제반 사항 제공 (인력, 시설 등)</em></span></li>
                                                    <li><span class="tb1">서울옥션 전문가와의 컨설팅을 통한 <em>최적의 경매 성과 및 홍보효과 도출</em></span></li>
                                                    <li><span class="tb1">서울옥션 공간에서의 전시를 통한 제품 <em>노출 및 문화예술계 내 주목도 향상</em></span></li>
                                                    <li><span class="tb1">서울옥션 경매 도록 내 광고 지면 삽입 및 <em>제품 소개를 통한 홍보·마케팅</em></span></li>
                                                    <li><span class="tb1">서울옥션의 주요 <em>컬렉터, 미술품 애호가들과의 네트워킹</em></span></li>
                                                    <li><span class="tb1">서울옥션 홍보채널을 통한 <em>파트너사 브랜드 및 경매 홍보</em></span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- 아카데미 리스트 -->
                <section class="basis-section last-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-marketing">
                            <div class="panel-body">

                                <!-- 스와이퍼 -->


                                <article class="swiper-article">
                                    <div class="mb-full">

                                        <div class="gallery-wrap js-swiper_academy">
                                            <div class="gallery_container">
                                                <div class="swiper-wrapper">


                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_03_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_03_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_03_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_03_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_03_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_03_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_03_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_03_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_03_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_03_slide-1.jpg" alt="">
                                                    </div>

                                                </div>
                                                <button class="btn-prev" title="Previous"><i class="icon-swiper_prev"></i></button>
                                                <button class="btn-next" title="Next"><i class="icon-swiper_next"></i></button>
                                            </div>
                                            <div class="pagination"></div>
                                        </div>

                                    </div>
                                </article>

                                <!-- 문의하기 -->
                                <jsp:include page="include/marketing_inquiry.jsp" />
                                <!-- //문의하기 -->
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
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script src="/js/service/marketing.js" type="text/javascript" class="js-append-script"></script>

</body>

</html>