<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>전시 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="" ng-controller="exhibitCtl" data-ng-init="loadExhibitList(1);">
<div class="wrapper">
    <div class="sub-wrap pageclass">

        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->
        <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
        <script type="text/javascript" src="/js/angular/checklist-model.js"></script>
        <script type="text/javascript" src="/js/angular/rzslider.min.js"></script>
        <script type="text/javascript" src="/js/private_sale/firstExhibit.js" type="text/javascript"></script>

        <script type="text/javascript">
            app.value('locale', 'ko');
        </script>

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Exhibition</span></h2>
                            <div class="page_desc"><span class="tb1">전시</span></div>
                        </div>
                    </div>
                </section>


                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">

                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class=""><a href="#" onclick="goExhibit();"><span>소개</span></a></li>
                                    <li class="active"><a href="#" onclick="goExhibitFirst();"><span>전시 1</span></a></li>
                                    <!--<li class=""><a href="#"><span>전시 2</span></a></li>-->
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
                                                <div class="place"><span class="tb1">서울옥션 강남센터 전시기획</span></div>
                                                <div class="title"><span class="tt3">승효상, 최덕주 결구(結構)와 수직(手織)의 풍경</span></div>
                                                <ul class="etc-list">
                                                    <li><span class="tb1">2021.6.29(화) - 7.18(일)</span></li>
                                                    <li><span class="tb1">10am - 7pm</span></li>
                                                    <li><span class="tb1">서울옥션 강남센터 6층</span></li>
                                                </ul>
                                            </div>
                                            <!--
                                            <div class="side_btn-set">
                                                <a class="btn btn_point" href="#" role="button"><span>작품보기</span></a>
                                            </div>
                                            -->
                                        </div>
                                        <div class="article-body ">

                                            <div class="more_con">
                                                <div class="view_editor-warp">
                                                    <p>서울옥션은 오는 6월 29일(화)부터 7월 18일(일)까지 특별전시 승효상과 최덕주 2인전 <결구(結構)와 수직(手織)의 풍경> 을 선보입니다.</p>

                                                    <p>
                                                        약 45점의 가구와 조각보, 근현대 회화로 구성된 이번 전시는 다양한 예술품을 한자리에서 감상할 수 있는 기회로 보다 다양한 예술의 본질을 공유하고자 합니다.
                                                    </p>

                                                    <p>
                                                        승효상의 가구와 최덕주의 조각보는 여러모로 닮은 점이 있습니다. 결과로서 이뤄지는 형상에 대한 신념이 있어야 하며, 그 형상을 이루기 위한 면밀한 계획과 계산이 수반되어야 합니다. <br />
                                                        마지막으로 막대한 노동이 뒤따르는 것이 그 들의 공통점으로 가구와 조각보가 이 과정적 원칙에 충실하다면 그 자체의 진실성으로 다른 요소가 개입할 이유가 없습니다. 다시 말해,
                                                        결구에 충실하고 수직에 집중되었다면 그대로 감동적이라 할 수 있습니다.
                                                    </p>

                                                    <p>
                                                        이번 전시에 등장하는 모든 가구들과 조각보들은 수사와 장식을 멀리합니다. 특히 가구는 겉으로 보기에는 단순하고 평온해 보이지만, 결구를 이루는 부재들 사이의 투쟁이 있으며,
                                                        이것은 가구들이 때로는 긴장을 부르는 이유이기도 합니다. 그래서 승효상 작가는 스스로 추방된 이들이 거주하는 수도원의 가구라는 부제까지 달았습니다. 조각보는 염색부터 직조까지
                                                        문자 그대로의 수고로 이루어진 것으로 한 땀 한 땀이라는 글귀가 갖는 진지함과 색조의 얇은 천 속에는 보이지 않는 치열과 집요가 담겨있습니다.
                                                    </p>

                                                    <p>
                                                        가구와 조각보를 함께 전시하는 일은 흔하지 않습니다. 어떻게 보면 결구와 수직은 최첨단기술도 닿을 수 없는 세계의 삶이라는 같은 결을 가지며, <br />
                                                        이 둘의 모임은 하나보다 더욱 아름다운 풍경을 이룰 수도 있을 것이라 여겨집니다. 결구와 수직의 풍경이 관람객들을 위로하며 쉬게 해주는 전시가 되기를 바랍니다.
                                                    </p>
                                                </div>

                                                <div class="line-box">
                                                    <div class="info">
                                                        <i class="icon-inquiry"></i>
                                                        <span class="tb1">사회적 거리두기 4단계 지침 시행에 따라 사전예약하지 않으신 분은 전시 관람이 어려우니,</span>
                                                        <span class="tb1 colorE">전화번호로 반드시 예약 후 방문</span>
                                                        <span class="tb1">해주시기 바랍니다.</span>
                                                    </div>
                                                    <div class="contact">
                                                        <span class="tb1">관람예약 : 02-545-0330</span>
                                                        <span class="tb1">전시운영시간 : 10am - 7am</span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="article-footer">

                                            <div class="btn_set_more more_unfold-area">
                                                <button class="btn btn_default js-more_view" type="button"><span>펼쳐 보기</span> <i class="icon-more_arrow"></i></button>
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


                <section class="basis-section last-section private_sale_list-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list mode-topline">
                            <div class="panel-body">

                                <ul class="product-list">

                                </ul>

                            </div>
                            <div class="panel-footer">
                                <div class="btn_set_more">
                                    <button class="btn btn_gray_line" type="button" id="more_search" ng-click="moreSearch();"><span>더보기</span></button>
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


<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<!-- [0516]삭제
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->


<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>



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
            $($this).addClass("on").find("span").text("내용 접기");

            $($this).closest(".detale_info-article").find(".article-body").addClass("active");
        },
        function($this) {
            $($this).removeClass("on").find("span").text("펼쳐 보기");

            $($this).closest(".detale_info-article").find(".article-body").removeClass("active");
        });
</script>

</body>

</html>