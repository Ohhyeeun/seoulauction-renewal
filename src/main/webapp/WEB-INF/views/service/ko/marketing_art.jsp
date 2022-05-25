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
                                <div class="title"><span class="tt2">기업 홍보∙아트마케팅</span></div>
                                <div class="desc"><span class="tb1">서울옥션의 다양한 홍보채널을 통해 기업의 광고를 진행합니다. 또한 서울옥션은 문화예술을 활용하여 다양한 브랜드, 기관과 아트콜라보레이션, <br>
                                            문화예술 강연, 브랜드 전시, 이벤트 경매/전시 등 효과적이고 신선한 협업을 진행해왔습니다. <br>
                                            심도 있는 컨설팅을 통해 기업 특성에 맞는 문화예술 홍보∙마케팅 전략을 기획하여 브랜드 가치를 높여드립니다.</span></div>
                            </div>
                            <div class="panel-body">
                                <article class="service-marketing">
                                    <div class="banner">
                                        <div class="img-area">
                                            <img src="/images/pc/service/marketing_02_main.jpg" alt="기업 홍보∙아트마케팅" />
                                        </div>
                                        <div class="typo-area">
                                            <div class="area-header"><span>내용 및 기대효과</span></div>
                                            <div class="area-body">
                                                <ul class="desc_list_type0">
                                                    <li><span class="tb1">서울옥션 홍보/광고 채널을 이용한 <em>기업 광고 (SNS, 배너, 뉴스레터, 지면 광고 등) </em></span></li>
                                                    <li><span class="tb1">1:1 비즈니스 컨설팅을 통한 기업 특성에 최적화된 <em>맞춤형 문화예술 홍보·마케팅 전략 설정</em></span></li>
                                                    <li><span class="tb1">서울옥션과 전략적 마케팅 제휴 협약을 통한 <em>프로모션 진행 및 지속가능 사업 개발</em></span> </li>
                                                    <li><span class="tb1">문화예술 강연을 통한 <em>임직원 역량 강화 및 창의성 증진</em></span></li>
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
                                                        <img class="only-pc" src="/images/pc/service/marketing_02_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_02_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_02_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_02_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_02_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_02_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_02_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_02_slide-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/marketing_02_slide-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/marketing_02_slide-1.jpg" alt="">
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
<script type="text/javascript" src="/js/plugin/jquerylibrary.js"></script>
<script src="/js/service/marketing.js" type="text/javascript" class="js-append-script"></script>

</body>

</html>