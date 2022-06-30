<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <script type="text/javascript" src="/js/service/academy.js"></script>
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="academyNowListCtl" data-ng-init="loadAcademyNowList(1)" ng-cloak>
            <div id="contents" class="contents">

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Academy</span></h2>
                            <div class="page_desc"><span class="tb1">아카데미</span></div>
                        </div>
                    </div>
                </section>


                <!-- 진행 중인 아카데미 -->
                    <section class="basis-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-ing_academy">
                                <div class="panel-header">
                                    <div class="title"><span class="tt2">진행 중인 아카데미</span></div>
                                </div>
                                <div class="panel-body">
                                    <article class="service-article option-more js-service_more">
                                        <div class="article-body">
                                            <ul class="service-list">
                                                <li name="academyList" class="mb_show" ng-repeat="academyList in academyList" ng-if = "academyList.TO_DT.substring(0,10) > db_now">
                                                    <div class="li-inner">
                                                        <a href="/service/academyDetail?academyNo={{academyList.ACADEMY_NO}}&academyCd={{academyList.ACADEMY_CD}}">
                                                            <div class="item-area">
                                                                <div class="image-box">
                                                                    <figure class="img-ratio">
                                                                        <div class="img-align">
                                                                            <img ng-src="/images/pc/service/{{getAcademyImg(academyList.ACADEMY_CD)}}" alt="" />
                                                                        </div>
                                                                        <figcaption class="typo-align">
                                                                            <div class="category_name">
                                                                                <span>{{getAcademyNm(academyList.ACADEMY_CD)}}</span>
                                                                            </div>
                                                                        </figcaption>
                                                                    </figure>
                                                                </div>
                                                                <div class="typo-box">
                                                                    <div class="state">
                                                                        <span ng-if = "academyList.CLOSE_YN == 'N' || academyList.CLOSE_YN == null" class="allowed">신청가능</span>
                                                                        <span ng-if = "academyList.CLOSE_YN == 'Y'"class="deadline">신청마감</span>
                                                                        <span ng-if = "academyList.FROM_DT.substring(0,10) < db_now || academyList.FROM_DT.substring(0,10) == db_now" class="progress">강의진행중</span>
                                                                    </div>
                                                                    	<div class="title"><span class="ft_sb">{{getAcademyTitle(academyList.TITLE_JSON)}}</span></div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </li>
											</ul>

                                        </div>
                                        <div class="article-footer ">
                                            <div class="btn_set-float tac">
                                                <a id="moreButton" ng-click="moreView()" class="btn btn_gray_line" href="#" role="button"><span>더보기</span></a>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="service-article_sns">
                                        <div class="banner">
                                            <div class="img-area">
                                                <img src="/images/pc/service/academy-help.jpg" alt="서울옥션 아카데미와 함게 하십시요." />
                                            </div>
                                            <div class="typo-area">
                                                <div class="area-header"><em>서울옥션</em> <span>아카데미와 함께 하십시요.</span></div>
                                                <div class="area-body">
                                                    <span>서울옥션 아카데미는 미술 뿐 만 아니라 문화, 인문학, 예술, 음악, 라이프, 생활까지
                                                        다양한 분야의 최고의 강사진들을 모시고 진행하고 있습니다. 신선하고 심도 있는
                                                        프로그램을 제공함으로써 여러분들의 상상력과 열정을 불러 일으킬 것입니다.</span>
                                                </div>
                                                <div class="area-footer">
                                                    <i class="icon-sns_link_instagram"></i><a href="https://www.instagram.com/seoulauction_academy/" class="target_link" target="_blank">서울옥션 아카데미 인스타그램</a>
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

                            <div class="content-panel type_panel-ing_academy">
                                <div class="panel-header">
                                    <div class="title"><span class="tt2">아카데미 리스트</span></div>
                                </div>
                                <div class="panel-body">
                                    <article class="academy-article ">
                                        <ul class="academy-list">

                                            <li>
                                                <div class="li-inner">
                                                    <a href="/service/academyList?academyCd=artculture" title="아트 마켓">
                                                        <div class="item-area">
                                                            <div class="item-header">
                                                                <div class="icon-box">
                                                                    <i class="icon-academy_market"></i>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <div class="title"><span class="">아트 마켓</span></div>
                                                                <!-- <div class="desc"><span>ART MARKET</span></div> -->
                                                            </div>
                                                            <div class="item-footer">
                                                                <i class="icon-academy_linkarrow"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>

                                            <li>
                                                <div class="li-inner">
                                                    <a href="/service/academyList?academyCd=artisttalk" title="작가론">
                                                        <div class="item-area">
                                                            <div class="item-header">
                                                                <div class="icon-box">
                                                                    <i class="icon-academy_authorism"></i>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <div class="title"><span class="">작가론</span></div>
                                                                <!-- <div class="desc"><span>AUTHORISM</span></div> -->
                                                            </div>
                                                            <div class="item-footer">
                                                                <i class="icon-academy_linkarrow"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>

                                            <li>
                                                <div class="li-inner">
                                                    <a href="/service/academyList?academyCd=artauction" title="대학생 아카데미">
                                                        <div class="item-area">
                                                            <div class="item-header">
                                                                <div class="icon-box">
                                                                    <i class="icon-academy_student"></i>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <div class="title"><span class="">대학생 아카데미</span></div>
                                                                <!-- <div class="desc"><span>STUDENT ACADEMY</span></div> -->
                                                            </div>
                                                            <div class="item-footer">
                                                                <i class="icon-academy_linkarrow"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>

                                            <li>
                                                <div class="li-inner">
                                                    <a href="/service/academyList?academyCd=artbrunch" title="CEO">
                                                        <div class="item-area">
                                                            <div class="item-header">
                                                                <div class="icon-box">
                                                                    <i class="icon-academy_ceo"></i>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <div class="title"><span class="">CEO</span></div>
                                                                <!-- <div class="desc"><span>CEO</span></div> -->
                                                            </div>
                                                            <div class="item-footer">
                                                                <i class="icon-academy_linkarrow"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>

                                            <li>
                                                <div class="li-inner">
                                                    <a href="/service/academyList?academyCd=culture" title="건축">
                                                        <div class="item-area">
                                                            <div class="item-header">
                                                                <div class="icon-box">
                                                                    <i class="icon-academy_architecture"></i>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <div class="title"><span class="">건축</span></div>
                                                                <!-- <div class="desc"><span>ARCHITECTURE</span></div> -->
                                                            </div>
                                                            <div class="item-footer">
                                                                <i class="icon-academy_linkarrow"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>

                                            <li>
                                                <div class="li-inner">
                                                    <a href="/service/academyList?academyCd=lecture" title="특강">
                                                        <div class="item-area">
                                                            <div class="item-header">
                                                                <div class="icon-box">
                                                                    <i class="icon-academy_lectuure"></i>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <div class="title"><span class="">특강</span></div>
                                                                <!-- <div class="desc"><span>SPECIAL LECTURE</span></div> -->
                                                            </div>
                                                            <div class="item-footer">
                                                                <i class="icon-academy_linkarrow"></i>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>

                                        </ul>
                                    </article>

                                    <!-- 스와이퍼 -->


                                    <article class="swiper-article">
                                        <div class="mb-full">

                                            <div class="gallery-wrap js-swiper_academy">
                                                <div class="gallery_container">
                                                    <div class="swiper-wrapper">


                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/academy_list-1.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/academy_list-1.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/academy_list-2.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/academy_list-2.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/academy_list-3.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/academy_list-3.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/academy_list-4.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/academy_list-4.jpg" alt="">
                                                        </div>

                                                        <div class="swiper-slide">
                                                            <img class="only-pc" src="/images/pc/service/academy_list-5.jpg" alt="">
                                                            <img class="only-mb" src="/images/mobile/service/academy_list-5.jpg" alt="">
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
                                                    <div class="manager-box"> <span>브랜드 기획팀</span> <em>음희선 선임</em> </div>
                                                    <div class="contact-box">
                                                        <ul>
                                                            <li><span>T.</span> <em>02-2075-4466</em></li>
                                                            <li><span>E.</span> <a href="mailto:ehs@seoulauctionl.com"><em> ehs@seoulauctionl.com</em></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn-area">
                                                <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 문의</span></a>
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
    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>
	<!-- Swiper 아카데미 리스트 -->
    <script class="js-append-script">
		window.onload = function(){
			if ($("body").hasClass("is_mb")) {
				if($("li[name=academyList]").length <= 4){
					$("#moreButton").hide();
				}else{
					$("li[name=academyList]:gt(3)").hide(); //4개 이상 hide
				}
			}
			
			if($("li[name=academyList]").length <= 4){
				$(".js-service_more").removeClass("more_show");
			}
		}
    
		var curShowLeng = 0;
	    $(window).on("resize", function() {
	        var width = window.innerWidth;
	        
	        if(width < 1023){ //mobile
		        if(curShowLeng  > 0){
		        	var tmp = curShowLeng - 1;
		        	$("li[name=academyList]:gt(" + tmp + ")").hide();
		        }else{
		        	$("li[name=academyList]:gt(3)").hide();
		        }
	        }else{ //pc
		        $(".js-service_more").removeClass("more_show");
		    	$("li[name=academyList]").show();
	        }
	    }).trigger("resize");
	
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
                        grabCursor: true, // 잠기커서
                        initialSlide: 0, // 초기슬라이드 인덱스
                        centeredSlides: true, // 중앙
                        slidesPerView: "auto", // 아이템 크기
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