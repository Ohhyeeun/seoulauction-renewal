<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/en/nav.jsp" flush="false"/>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">
                <!-- page title -->
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Rental of Space</span></h2>
                            <div class="page_desc"><span class="tb1"></span></div>
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
                                            <div class="area-header"><span>Seoul Auction Gangnam Center</span></div>
                                            <div class="area-body">
                                                <!-- [0516]띄어쓰기 -->
                                                <span>
                                                        Seoul Auction Gangnam Center is going forward to be remembered as a special place with luxury brands, car launching shows, VIP events, and pop-up stores. We are equipped with the optimal space for art exhibitions. Moreover, the exhibition space can be modified upon the exhibits. We will proceed to enhance customer brand value with the solutions that we have developed. If you need to find a place for a special invitation or event, please join us at the Seoul Auction Gangnam Center.
                                                    </span>
                                                <!-- //[0516]띄어쓰기 -->
                                            </div>
                                            <div class="area-footer">
                                                <div class="btn_wrap btns">
                                                    <a class="btn btn_gray_line" href="/footer/location" role="button" target="location"><span>Seoul Auction Location</span></a>
                                                    <a class="btn btn_gray_line" href="/service/showroom/vr" role="button" target="vr"><span>Seoul Auction Gangnam Center VR</span></a>
                                                    <a class="btn btn_gray_line" href="https://www.seoulauction.com/nas_img/front/homepage/ganam_brochure.pdf" role="button" target="brochure"><span>Venue Rental PDF</span></a>
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
                                                <strong>Contact</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>Exhibition & Operations</span> <em>JISEOK Lee</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:82-2-2075-4450"><em>+82 (0)2-2075-4450</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:a7885@seoulauction.com"><em>a7885@seoulauction.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 Inquiry</span></a>
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
        <jsp:include page="../../include/en/footer.jsp" />
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

<!-- Swiper  -->
<script class="js-append-script">
    // Swiper 세팅
    var swiper_academy;
    var onceFn = $(".width_check").trpUtilityChangeOnceFn(
        function($name) {
            swiper_setting()
        }
    );

    function swiper_setting() {
        if (swiper_academy) {
            swiper_academy.destroy()
        };

        swiper_academy = new Swiper('.js-swiper_academy .gallery_container', {
            autoplay: 3000,
            loop: true,
            pagination: ".js-swiper_academy .pagination",
            paginationClickable: true,
            breakpoints: {
                1023: {
                    grabCursor: true,
                    initialSlide: 0,
                    centeredSlides: true,
                    slidesPerView: "auto",
                    spaceBetween: 10
                }
            },
            onSlideChangeEnd: function(swiper) { // 움직임이 끝나면 실행
            }
        });
        $('.js-swiper_academy .btn-prev').on('click', function(e) {
            e.preventDefault();
            swiper_academy.slidePrev();
        })
        $('.js-swiper_academy .btn-next').on('click', function(e) {
            e.preventDefault();
            swiper_academy.slideNext();
        })

    }

    $(window).on("resize", function() {
        var _device = $("body").attr("data-device")
        onceFn.setChange(_device);
    });
    swiper_setting();
</script>
</body>
</html>