<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Seoul Auction</title>
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
</head>
<body>
<%--<jsp:include page="../../main/include/topNotice.jsp" />--%>
<jsp:include page="../../include/ko/header.jsp" flush="false">
    <jsp:param name="main" value="true"/>
</jsp:include>

<section class="main-contents footer-bottom footer-bottom30" ng-controller="mainCtl" data-ng-init="init()">
    <section class="visual visual-contents">
        <div class="swiper-container visual-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                        <figurecaption class="visual_caption">
                            <h1 class="slide-tit">165회 미술품경매</h1>
                            <p>
                                2/22(화) 15:00 서울옥션 강남
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
                                <a class="commonbtn visual-commonbtn btn-bg-w" ng-click="showMemHisPopup(this);">하이하이</a>
                            </div>
                        </figurecaption>
                    </figure>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                        <figurecaption class="visual_caption black">
                            <h1 class="slide-tit">165회 미술품경매</h1>
                            <p>
                                2/22(화) 15:00 서울옥션 강남
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-g">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-border-w">e-book</a>
                            </div>
                        </figurecaption>
                    </figure>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                        <figurecaption class="visual_caption">
                            <h1 class="slide-tit">165회 미술품경매</h1>
                            <p>
                                2/22(화) 15:00 서울옥션 강남
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-border-b">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-border-b">e-book</a>
                            </div>
                        </figurecaption>
                    </figure>
                </div>
            </div>
            <!-- 이미지 배경 화이트 일때 버튼 블랙 클래스 추가 .swiper-button-next.slide-btnleft.black -->
            <div class="swiper-button-next slide-btnleft pc-ver"></div>
            <div class="swiper-button-prev slide-btnright pc-ver"></div>


            <span class="visualController">
                    <button type="button" class="playBtn pc-ver"></button>
                    <button type="button" class="stopBtn pc-ver"></button>
                    <span class="swiper-progressbar">
                        <span class="visual-progressbar"></span>
                    </span>
                    <span class="swiper-pagination visual-pagaination"></span>
                </span>
        </div>
    </section>

    <%--auction--%>
    <div class="wrap">
        <section class="container wrap_padding">
            <section class="auction-contents">
                <div class="auction-tit">
                    <h1 class="main-sectiontit">Auction</h1>
                    <div class="auctiontab-scroll">
                        <div class="auctionTab"> <!-- 최대 5개 까지 -->
                            <span class="auctionTab-btn on">165회 미술품</span>
                            <span class="auctionTab-btn">e BID 프리미엄</span>
                            <span class="auctionTab-btn">제로베이스</span>
                        </div>
                    </div>
                </div>

                <div class="flex_wrap auctionTab-contents on"> <!--12*2 = 24 -->
                </div>

                <div class="flex_wrap auctionTab-contents"> <!--12*2 = 24 -->
                </div>

                <div class="flex_wrap auctionTab-contents">
                </div>

                <div class="commonbtn-box">
                    <button type="button" id="MoreAuction" class="commonbtn">더보기</button>
                    <a href="#" id="AllAuction" style="display: none" class="commonbtn">전체보기</a>
                </div>
            </section>
        </section>
    </div>

    <section class="upcoming">
        <h1 class="main-sectiontit upcoming-tit">
            Upcoming
        </h1>

        <div class="upcoming-wrap">
            <div class="swiper-container upcoming-swiper">
                <div class="swiper-wrapper upcoming-contents">
                    <div class="swiper-slide upcomingSlide">
                        <a href="#">
                            <div class="upcoming-caption">
                                <span class="auctionKind-box on">LIVE</span><span class="d-day on">TODAY</span>
                                <h4>2월 라이브 경매</h4>
                                <div class="upcoming-datebox">
                                    <p class="upcoming-preview">
                                        <span>오픈일</span><span>2/14(금)</span>
                                    </p>
                                    <p class="upcoming-preview">
                                        <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>
                                    </p>
                                    <p class="upcoming-date">
                                        <span>경매일</span><span>2/15(화) 15:00</span>
                                    </p>
                                </div>
                            </div>
                            <figure class="upcoming-img">
                                <!--<span class="upcomingImg"></span>-->
                                <img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">
                            </figure>
                        </a>
                    </div>
                    <div class="swiper-slide upcomingSlide">
                        <a href="#">
                            <div class="upcoming-caption">
                                <span class="auctionKind-box">ONLINE</span><span class="d-day on">D-1</span>
                                <h4>2월 e BID 퍼블릭 온라인 경매</h4>
                                <div class="upcoming-datebox">
                                    <p class="upcoming-preview">
                                        <span>오픈일</span><span>2/14(금)</span>
                                    </p>
                                    <p class="upcoming-preview">
                                        <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>
                                    </p>
                                    <p class="upcoming-date">
                                        <span>경매일</span><span>2/15(화) 15:00</span>
                                    </p>
                                </div>
                            </div>
                            <figure class="upcoming-img">
                                <!--<span class="upcomingImg"></span>-->
                                <%--<img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">--%>
                            </figure>
                        </a>
                    </div>
                    <div class="swiper-slide upcomingSlide">
                        <a href="#">
                            <div class="upcoming-caption">
                                <span class="auctionKind-box">ONLINE</span><span class="d-day"></span>
                                <h4>ZEROBASE X 아트경기</h4>
                                <div class="upcoming-datebox">
                                    <p class="upcoming-preview">
                                        <span>오픈일</span><span>2/14(금)</span>
                                    </p>
                                    <p class="upcoming-preview">
                                        <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>
                                    </p>
                                    <p class="upcoming-date">
                                        <span>경매일</span><span>2/15(화) 15:00</span>
                                    </p>
                                </div>
                            </div>
                            <figure class="upcoming-img">
                                <!--<span class="upcomingImg"></span>-->
                                <!--<img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet"> -->
                            </figure>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="commonbtn-box upcomingBtn">
            <a href="#" class="commonbtn">전체보기</a>
        </div>
    </section>

    <jsp:include page="../include/beltBanner.jsp" />

    <jsp:include page="../include/video.jsp" />


    <div class="wrap">
        <section class="container">
            <section class="flex_wrap sale-contents">
                <figure class="sale-box">
                    <img src="/images/pc/banner/buy.jpg" alt="buy img" class="pc-ver">
                    <img src="/images/mobile/banner/buy.jpg" alt="buy img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Buy</h2>
                        <p>회원가입부터 응찰까지<br>
                            누구나 쉽게 경매에 참여 할 수 있습니다.</p>
                        <a href="#">경매안내</a>
                    </figcaption>
                </figure>
                <figure class="sale-box">
                    <img src="/images/pc/banner/sell.jpg" alt="sell img" class="pc-ver">
                    <img src="/images/mobile/banner/sell.jpg" alt="sell img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Sell</h2>
                        <p>고객님의 소중한 작품을 기다립니다.<br>
                            서울옥션에 문의하세요</p>
                        <a href="#">위탁안내</a>
                    </figcaption>
                </figure>
            </section>

            <article class="flex_wrap article-contents">
                <div class="familysite-box">
                    <h3 class="main-sectiontit familySite-tit">Family Site</h3>
                    <div class="flex_wrap familysiteContents">
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">서울옥션 블루</p>
                                <p class="family-infotxt tit-size16">해외경매대행 "미술을 직구하다"</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="#">
                                    <img src="/images/pc/banner/FamilyBanner_01_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_01_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">SOTWO</p>
                                <p class="family-infotxt tit-size16">미술품 공동구매 플랫폼</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="#">
                                    <img src="/images/pc/banner/FamilyBanner_02_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_02_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">프린트 베이커리</p>
                                <p class="family-infotxt tit-size16">일상의 예술을 맛보다.</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="#">
                                    <img src="/images/pc/banner/FamilyBanner_03_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_03_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                    </div>
                </div>

                <div class="newsletter-box">
                    <h3 class="main-sectiontit newsLetter-tit">Newsletter</h3>
                    <form action="" class="newsletter-formbox">
                        <fieldset class="newsletter-form">
                            <input id ="newsEmail" type="email" placeholder="이메일 주소">
                            <input id ="newsName" type="text" placeholder="이름">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span class="terms-checktxt">개인정보 수집 및 이용에 동의 합니다.</span>
                            </label>
                        </fieldset>
                    </form>
                    <div class="flex_wrap newsletter-btnbox">
                        <button type="button" class="commonbtn btn-bg-b subscriptBtn">구독하기</button>
                        <a href="#" class="commonbtn btn-border-3">
                            <span>지난 뉴스레터 보기</span>
                        </a>
                    </div>
                </div>

            </article>
        </section>
    </div>
    <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
    <!-- //wrap -->
</section>
<!-- 다크모드 darkmode -->
<span class="darkmodeBg pc-ver">
        <button class="darkmode" type="button"></button><span class="darktxt">다크모드로 보기</span>
    </span>
<!--scroll top-->
<a href="#" class="scroll-top">
    <span class="topBtn up"></span>
</a>

<!-- 뉴스레터 팝업 -->
<jsp:include page="popup/newsletter.jsp" flush="false"/>

<!-- video 팝업 -->
<div class="blackBg video-blackBg" id="videoLayerPopup">
    <div class="video-playbox">
        <div class="video-play">

        </div>
    </div>
</div>
</body>


<script src="/js/main/main.js" type="text/javascript"></script>
<script src="/js/main/auction.js" type="text/javascript"></script>
<script src="/js/main/newsletter.js" type="text/javascript"></script>

</html>