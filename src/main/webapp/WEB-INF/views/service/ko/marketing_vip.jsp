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
                                    <div class="title"><span class="tt2">문화예술을 활용한 VIP 고객 마케팅</span></div>
                                    <div class="desc"><span class="tb1">투명한 미술시장을 선도하는 서울옥션의 브랜드는 국내외 두터운 신뢰를 받고 있습니다. 이를 바탕으로 서울옥션은 기업의 문화예술 마케팅을 다양한 방식으로 진행합니다. <br>
                                                럭셔리 브랜드부터 금융기업까지 각 기업의 니즈에 따라 VIP 고객에게 차별화된 서비스를 제공합니다.<br>
                                                서울옥션의 특화된 VIP 마케팅을 통해 귀사의 고객에게 높은 수준의 새로운 경험을 선사해 보십시오.</span></div>
                                </div>
                                <div class="panel-body">
                                    <article class="service-marketing">
                                        <div class="banner">
                                            <div class="img-area">
                                                <img src="/images/pc/service/marketing_01_main.jpg" alt="문화예술을 활용한 VIP 고객 마케팅" />
                                            </div>
                                            <div class="typo-area">
                                                <div class="area-header"><span>내용 및 기대효과</span></div>
                                                <div class="area-body">
                                                    <ul class="desc_list_type0">
                                                        <li><span class="tb1">문화예술 마케팅을 통한 기업의 장기적 <em>경쟁력 확보 및 지속 가능한 전략 개발</em></span></li>
                                                        <li><span class="tb1">각 기업에 특화된 미술 전문 콘텐츠/서비스 제공에 따른 기업의 <em>브랜딩 차별화</em></span></li>
                                                        <li><span class="tb1">문화예술을 매개로 기존 고객과의 <em>소통 확장 및 차별화된 고객 경험 제공</em></span> </li>
                                                        <li><span class="tb1">서울옥션과의 <em>파트너십을 통한 세련되고 감각적인 브랜드</em> 이미지 제공</span></li>
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
                                                            <img class="only-pc" src="/images/pc/service/marketing_01_slide-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/marketing_01_slide-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/marketing_01_slide-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/marketing_01_slide-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/marketing_01_slide-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/marketing_01_slide-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/marketing_01_slide-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/marketing_01_slide-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/marketing_01_slide-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/marketing_01_slide-1.jpg" alt="">
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
</div>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js"></script>
<script src="/js/service/marketing.js" type="text/javascript" class="js-append-script"></script>

</body>

</html>