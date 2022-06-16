<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>회사소개 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass ">

            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title -->
                    <section class="page_title-section type-img introduce">
                        <div class="section-inner full_size ">
                            <div class="center-box">
                                <h2 class="page_title"><span class="">회사소개</span></h2>
                                <div class="page_desc"><span class="">미술품 경매가 보다 많은 사람들에게 일상의 축제가 되도록 노력하겠습니다.</span></div>
                                <div class="page_btn">
                                    <!-- [0523] 새창으로 열기로 변경 -->
                                    <a class="btn btn_default " href="https://www.youtube.com/watch?v=avz0IXRHA_g&t=26s" role="button" target="_blank"><span>영상보기</span></a>
                                    <!-- //[0523] 새창으로 열기로 변경 -->
                                </div>
                            </div>
                        </div>
                    </section>


                    <section class="basis-section type_tab-introduce">
                        <div class="section-inner">

                            <div class="tab-wrap">
                                <div class="tab-area type-left_lg2">
                                    <ul class="tab-list js-maintab_list">
                                        <li class="active"><a href="/footer/companyIntro"><span>서울옥션 소개</span></a></li>
                                        <li class=""><a href="/footer/companyHistory"><span>연혁</span></a></li>
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
                                                    <p class="tb1">서울옥션은 1998년 설립된 국내 최초의 미술품 경매 회사입니다. 창사 이래 독보적인 시장 점유율과 경매 기록을 보유하며 한국 미술 경매 시장을 대표하여 새로운 역사를 쓰고 있습니다. </p>
                                                </div>
                                            </div>
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_story.png" alt="Story" /></div>
                                                <div class="desc">
                                                    <h4>Our Story</h4>
                                                    <p class="tb1">서울옥션은 MZ세대를 포함한 모든 세대를 아우르기 위해 한국 고미술과 근현대 미술은 물론 콜렉터블 아트, 보석, 와인, 건축에 이르기까지 다양한 취향을 반영한 온라인 · 오프라인 경매를 선보이고 있습니다.</p>
                                                </div>
                                            </div>
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_business.png" alt="Business" /></div>
                                                <div class="desc">
                                                    <h4>Our Business</h4>
                                                    <p class="tb1">서울옥션은 고객분들이 주신 신뢰를 바탕으로 평창동 본사, 강남 사옥, 부산뿐만 아니라 홍콩에도 분사를 설립하며 사업을 확장했습니다. </p>
                                                </div>
                                            </div>
                                            <div class="introduce_item-box">
                                                <div class="icon"><img src="/images/pc/footer/icon-introduce_goal.png" alt="Goal" /></div>
                                                <div class="desc">
                                                    <h4>Our Goal</h4>
                                                    <p class="tb1">서울옥션은 한국을 대표하는 미술품 경매사로서 차별성 있는 지속가능한 미술 플랫폼을 제공하고, 국내 미술시장이 세계적 수준의 랜드마크로 발돋음 하기 위한 노력에 책임을 가지고 전념하겠습니다.</p>
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
            <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
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
        // $('.js-maintab_list a').on('click', function(e) {
        //     e.preventDefault();
        //     let tar = $(this).position().left;
        //     let scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;
        //
        //     if ($(this).parents('li').hasClass('active')) return false;
        //     let id = $(this).attr('href');
        //     if ($(id).length > 0) {
        //         $('.tab-cont').removeClass('active');
        //         $(id).addClass('active');
        //         $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');
        //
        //         $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
        //     }
        //
        //     console.log(id);
        //
        //     return false;
        // });

        $('#history-change').on('change', function() {

            var id = '#' + $(this).val();
            $('.history-body').removeClass('active');
            $(id).addClass('active');
            console.log(id);
        }).trigger('change');
    </script>


</body>

</html>