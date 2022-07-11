<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="" ng-controller="exhibitCtl" data-ng-init="loadExhibitList(1);">
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
                            <h2 class="page_title"><span class="th1">Exhibition</span></h2>
                            <div class="page_desc"><span class="tb1"></span></div>
                        </div>
                    </div>
                </section>


                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">

                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class=""><a href="#" onclick="goExhibit();"><span>Introduce</span></a></li>
                                    <li class="active"><a href="#" onclick="goExhibitFirst();"><span>Exhibition 1</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- 전시 -->
                <section class="basis-section tab-cont-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-exhibition">
                            <div class="panel-body">

                                <!-- Exhibition I -->
                                <div class="tab-cont active" id="tab-cont-1">

                                    <!-- 스와이퍼 -->


                                    <article class="swiper-article">
                                        <div class="mb-full">

                                            <div class="gallery-wrap js-swiper_academy">
                                                <div class="gallery_container">
                                                    <div class="swiper-wrapper">


                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/private_sale/exhibition_list-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/private_sale/exhibition_list-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/private_sale/exhibition_list-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/private_sale/exhibition_list-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/private_sale/exhibition_list-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/private_sale/exhibition_list-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/private_sale/exhibition_list-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/private_sale/exhibition_list-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/private_sale/exhibition_list-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/private_sale/exhibition_list-1.jpg" alt="">
                                                        </div>

                                                    </div>
                                                    <button class="btn-prev" title="Previous"><i class="icon-swiper_prev"></i></button>
                                                    <button class="btn-next" title="Next"><i class="icon-swiper_next"></i></button>
                                                </div>
                                                <div class="pagination"></div>
                                            </div>

                                        </div>
                                    </article>




                                    <article class="detale_info-article">
                                        <div class="article-header">
                                            <div class="title-set">
                                                <div class="place"><span class="tb1">Seoul Auction Gangnam Center Exhibition Planning</span></div>
                                                <div class="title"><span class="tt3">Hyo-Sang Seung, Deok-Joo Choi and the vertical landscape</span></div>
                                                <ul class="etc-list">
                                                    <li><span class="tb1">30 APRIL, 2022 – 6 MAY, 2022 </span></li>
                                                    <li><span class="tb1"> 10am - 7pm </span></li>
                                                    <li><span class="tb1"> Seoul Auction Gangnam Center 6F</span></li>
                                                </ul>
                                            </div>
                                            <!--
                      <div class="side_btn-set">
                        <a class="btn btn_point" href="#" role="button"><span>작품보기</span></a>
                      </div> -->
                                        </div>
                                        <div class="article-body ">

                                            <div class="more_con">
                                                <div class="view_editor-warp">
                                                    <p>Seoul Auction will present the special exhibition <Landscape of Gyulgu and Vertical>, a special exhibition by Seung Hyo-sang and Choi Deok-ju, from June 29 (Tuesday) to July 18 (Sunday).</p>

                                                    <p>
                                                        Composed of about 45 pieces of furniture, jigsaw paper, and modern and contemporary paintings, this exhibition aims to share the essence of diverse art as an opportunity to appreciate various art pieces in one place.
                                                    </p>

                                                    <p>
                                                        There are many similarities between Seung Hyo-sang's furniture and Choi Deok-ju's sculpture. There must be a belief in the resulting image, and careful planning and calculation to achieve that image must be accompanied. Lastly, they have in common that a lot of labor follows. If furniture and jigsaw are faithful to this process principle, there is no reason for other factors to intervene with their own truthfulness. In other words, if you are faithful to the matchmaking and focus on verticality, you can say that it is impressive as it is.
                                                    </p>

                                                    <p>
                                                        All the furniture and jigsaw pieces in this exhibition stay away from rhetoric and decoration. In particular, the furniture looks simple and calm on the surface, but there is a struggle between the members that make up the connection, which is why furniture sometimes creates tension. So, writer Seung Hyo-sang even added the subtitle “Furniture of the Monastery where those who were exiled” live. Jogakbo is made with literal labor from dyeing to weaving, and the sincerity of each stitch and the thin fabric of color tones contain invisible dentition and persistence.
                                                    </p>

                                                    <p>
                                                        It is not common to display furniture and jigsaw paper together. In a way, it is believed that the combination of the two has the same texture as life in a world that even cutting-edge technology cannot reach, and it is believed that the gathering of these two can achieve a more beautiful scenery than one. We hope that the vertical landscape will be an exhibition that comforts and rests the visitors.
                                                    </p>
                                                </div>

                                                <div class="line-box">
                                                    <div class="info">
                                                        <i class="icon-inquiry"></i>
                                                        <span class="tb1">According to the implementation of the 4-step social distancing guidelines, visitors who have not made a reservation in advance will not be able to visit the exhibition.
                                                            </span>
                                                    </div>
                                                    <div class="contact">
                                                        <span class="tb1">Reservation : +82-02-545-0330</span>
                                                        <span class="tb1">Exhibition Hours : 10am - 7am</span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="article-footer">

                                            <div class="btn_set_more more_unfold-area">
                                                <button class="btn btn_default js-more_view" type="button"><span>Introduction Unfold</span> <i class="icon-more_arrow"></i></button>
                                            </div>

                                        </div>
                                    </article>
                                </div>

                                <!-- Exhibition II -->
                                <!-- [컨텐츠없음]
                <div class="tab-cont " id="tab-cont-2">
                    <p>컨텐츠없음</p>
                </div>
                  -->

                            </div>

                        </div>
                    </div>
                </section>


                <section class="basis-section last-section private_sale_list-section" id="exhibit_content">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list mode-topline">
                            <div class="panel-body">

                                <ul class="product-list">

                                </ul>

                            </div>
                            <div class="panel-footer">
                                <div class="btn_set_more">
                                    <button class="btn btn_gray_line" type="button" id="more_search"><span>More</span></button>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>

            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/en/footer.jsp" flush="false"/>
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

<script type="text/javascript" src="/js/angular/checklist-model.js"></script>
<script type="text/javascript" src="/js/angular/rzslider.min.js"></script>
<script type="text/javascript" src="/js/private_sale/firstExhibit.js" type="text/javascript"></script>

<script type="text/javascript">
    app.value('locale', 'en');
</script>

<!-- tab menu -->
<script>
    $('.js-maintab_list a').on('click', function(e) {
        e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;


        if ($(this).parents('li').hasClass('active')) return false;
        var id = $(this).attr('href');
        if ($(id).length > 0) {
            ///$('.tab-cont').removeClass('active');
            ///$(id).addClass('active');
            $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');

            $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
        }

        return false;
    });
</script>


<!-- Swiper 아카데미 리스트 -->
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

<!-- 펼처보기 -->
<script>
    var more_view = $(".js-more_view").trpToggleBtn(
        function($this) {
            $($this).addClass("on").find("span").text("Introduction fold");

            $($this).closest(".detale_info-article").find(".article-body").addClass("active");
        },
        function($this) {
            $($this).removeClass("on").find("span").text("Introduction  Unfold");

            $($this).closest(".detale_info-article").find(".article-body").removeClass("active");
        });
</script>
</body>

</html>