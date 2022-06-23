<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>About Seoul Auction | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass ">

            <!-- header -->
            <jsp:include page="../../include/en/header.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title -->
                    <section class="page_title-section type-img introduce">
                        <div class="section-inner full_size ">
                            <div class="center-box">
                                <h2 class="page_title"><span class="">About Us</span></h2>
                                <div class="page_desc"><span class="">We strive to make art auction available to more people.</span></div>
                                <div class="page_btn">
                                    <a class="btn btn_default " href="https://www.youtube.com/watch?v=avz0IXRHA_g&t=26s" role="button" target="_blank"><span>View video</span></a>
                                </div>
                            </div>
                        </div>
                    </section>


                    <section class="basis-section type_tab-introduce">
                        <div class="section-inner">

                            <div class="tab-wrap">
                                <div class="tab-area type-left_lg2">
                                    <ul class="tab-list js-maintab_list">
                                        <li class="active"><a href="#tab-cont-1"><span>About Seoul Auction</span></a></li>
                                        <li class=""><a href="#tab-cont-2"><span>History</span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </section>

                    <section class="basis-section last-section introduce-section ">
                        <div class="section-inner">

                            <div class="content-panel type_panel-introduce">
                                <div class="panel-body">
                                    <div class="tab-cont active" id="tab-cont-1">
                                        <div class="introduce_item-area">
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_heritage.png" alt="Heritage" /></div>
                                                <div class="desc">
                                                    <h4>Our Heritage</h4>
                                                    <p class="tb1">Established in 1998, Seoul Auction is the first art auction house in South Korea. Seoul Auction has been making a new history on behalf of the Korean art auction market, having noticeable market penetration and auction sales records since its foundation.</p>
                                                </div>
                                            </div>
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_story.png" alt="Story" /></div>
                                                <div class="desc">
                                                    <h4>Our Story</h4>
                                                    <p class="tb1">To encompass group of generations, Seoul Auction hosts online and offline auctions that reflect a variety of tastes and a cross-category selection, which include from Korean, modern, and contemporary art to exclusive collectible art, jewelry, wine, and architecture as well as private sales.</p>
                                                </div>
                                            </div>
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_business.png" alt="Business" /></div>
                                                <div class="desc">
                                                    <h4>Our Business</h4>
                                                    <p class="tb1">Based on the trust backed by customers spanning the globe, Seoul Auction expanded our business by opening branch offices not only headquarter in Pyeongchang-dong but also in Gangnam, Busan, and Hong Kong.</p>
                                                </div>
                                            </div>
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_goal.png" alt="Goal" /></div>
                                                <div class="desc">
                                                    <h4>Our Goal</h4>
                                                    <p class="tb1">As South Korea's leading art auction house, Seoul Auction will provide a differentiated sustainable art platform and take responsibility for its efforts to develop the South Korea’s art market into a world-class landmark.</p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
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


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>

    <!-- tab menu -->
    <script>
        $('.js-maintab_list a').on('click', function(e) {
            e.preventDefault();
            var tar = $(this).position().left;
            var scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;

            if ($(this).parents('li').hasClass('active')) return false;
            var id = $(this).attr('href');
            if ($(id).length > 0) {
                $('.tab-cont').removeClass('active');
                $(id).addClass('active');
                $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');

                $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
            }

            return false;
        });

        $('#history-change').on('change', function() {

            var id = '#' + $(this).val();
            $('.history-body').removeClass('active');
            $(id).addClass('active');
            console.log(id);
        }).trigger('change');
    </script>


</body>

</html>