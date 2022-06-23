<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>아카데미 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->
        <script>
            app.value('locale', 'ko');
        </script>

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Rental of Space</span></h2>
                            <div class="page_desc"><span class="tb1">전시장대관</span></div>
                        </div>
                    </div>
                </section>

                <!-- 진행 중인 아카데미 -->
                <section class="basis-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-marketing">
                            <div class="panel-body">
                                <article class="service-marketing">
                                    <div class="banner">
                                        <div class="img-area">
                                            <img src="/images/pc/service/showroom_main.jpg" alt="서울옥션 강남센터" />
                                        </div>
                                        <div class="typo-area">
                                            <div class="area-header"><span>서울옥션 강남센터</span></div>
                                            <div class="area-body">
                                                <!-- [0516]띄어쓰기 -->
                                                <span>
                                                        서울옥션 강남센터는 명품, 자동차 런칭쇼, VIP 행사, 팝업스토어 등을 통해 <br class="only-pc" />
                                                        특별한 공간으로 기억되고자 합니다. 미술품 전시를 위한 최적의 공간으로도 <br class="only-pc" />
                                                        시스템을 갖추고 있으며, 다양한 전시공간은 전시작품에 맞추어 변형이 가능합니다. <br class="only-pc" />
                                                        앞선 솔루션을 통해 고객 브랜드 가치 향상을 위하여 나아가겠습니다. <br class="only-pc" />
                                                        특별한 초대를 위한 공간을 찾으신다면, 서울옥션 강남센터에서 함께 하십시오.
                                                    </span>
                                                <!-- //[0516]띄어쓰기 -->
                                            </div>
                                            <div class="area-footer">
                                                <div class="btn_wrap btns">
                                                    <a class="btn btn_gray_line" href="#" role="button"><span>서울옥션 위치 안내</span></a>
                                                    <a class="btn btn_gray_line" href="/service/showroom/vr" role="button" target="vr"><span>전시장 VR 보기</span></a>
                                                    <a class="btn btn_gray_line" href="https://www.seoulauction.com/nas_img/front/homepage/ganam_brochure.pdf" role="button" target="brochure"><span>대관 브로셔</span></a>
                                                </div>
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
                                                        <img class="only-pc" src="/images/pc/service/showroom_list-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/showroom_list-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/showroom_list-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/showroom_list-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/showroom_list-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/showroom_list-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/showroom_list-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/showroom_list-1.jpg" alt="">
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <img class="only-pc" src="/images/pc/service/showroom_list-1.jpg" alt="">
                                                        <img class="only-mb" src="/images/mobile/service/showroom_list-1.jpg" alt="">
                                                    </div>

                                                </div>
                                                <button class="btn-prev" title="Previous"><i class="icon-swiper_prev"></i></button>
                                                <button class="btn-next" title="Next"><i class="icon-swiper_next"></i></button>
                                            </div>
                                            <div class="pagination"></div>
                                        </div>

                                    </div>
                                </article>




                                <!-- 문의하기[0516 - 정보수정] -->


                                <article class="inquiry-article ">
                                    <div class="inquiry-box">
                                        <div class="typo-area">
                                            <div class="icon-box">
                                                <i class="icon-academy_inquiry"></i>
                                            </div>
                                            <div class="title-box">
                                                <strong>문의하기</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>서울옥션 브랜드기획팀</span> <em>이지석 팀장</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <em>02-2075-4442</em></li>
                                                        <li><span>E.</span> <a href="mailto:a7885@seoulauction.com"><em>a7885@seoulauction.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="#" role="button"><span>1:1 문의</span></a>
                                        </div>
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


<script type="text/javascript" src="/js/plugin/jquerylibrary.js"></script>
<script src="/js/service/marketing.js" type="text/javascript" class="js-append-script"></script>

</body>

</html>