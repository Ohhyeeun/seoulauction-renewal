<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Seoul Auction</title>
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
</head>
<body>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<section class="main-contents footer-bottom footer-bottom40">
    <section class="visual visual-contents">
        <div class="swiper-container visual-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                        <figurecaption class="visual_caption">
                            <h1 class="slide-tit">The 165th Art Auction</h1>
                            <p>
                                22 February 15:00 Seoul Auction Gangnam
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">View More</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
                            </div>
                        </figurecaption>
                    </figure>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide02.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide02.jpg" alt="slide" class="m-ver">
                        <figurecaption class="visual_caption black">
                            <h1 class="slide-tit">The 165th Art Auction</h1>
                            <p>
                                22 February 15:00 Seoul Auction Gangnam
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-g">View More</a><a href="#" class="commonbtn visual-commonbtn btn-border-w">e-book</a>
                            </div>
                        </figurecaption>
                    </figure>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide03.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide03.jpg" alt="slide" class="m-ver">
                        <figurecaption class="visual_caption">
                            <h1 class="slide-tit">The 165th Art Auction</h1>
                            <p>
                                22 February 15:00 Seoul Auction Gangnam
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-border-b">View More</a><a href="#" class="commonbtn visual-commonbtn btn-border-b">e-book</a>
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
                        <div class="auctionTab">
                            <span  class="auctionTab-btn on">Episode 165 Artwork</span>
                            <span  class="auctionTab-btn">e BID Premium</span>
                            <span  class="auctionTab-btn">ZEROBASE</span>
                        </div>
                    </div>
                </div>

                <div class="flex_wrap auctionTab-contents on">
                </div>

                <div class="flex_wrap auctionTab-contents"> <!--12*2 = 24 -->
                </div>

                <div class="flex_wrap auctionTab-contents"> <!--12*2 = 24 -->
                </div>

                <div class="commonbtn-box">
                    <button type="button" id="MoreAuction" class="commonbtn">More</button>
                    <a href="#" id="AllAuction"  STYLE="display: none;" class="commonbtn">View All</a>
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
                                <h4>February Live Auction</h4>
                                <div class="upcoming-datebox">
                                    <p class="upcoming-preview">
                                        <span>OPEN</span><span>10 February</span>
                                    </p>
                                    <p class="upcoming-preview">
                                        <span>PREVIEW</span><span>10 February ~ 15 February</span>
                                    </p>
                                    <p class="upcoming-date">
                                        <span>AUCTION</span><span>10 February 15:00</span>
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
                                <span class="auctionKind-box on">LIVE</span><span class="d-day on">D-1</span>
                                <h4>e BID Premium Online Auction in March</h4>
                                <div class="upcoming-datebox">
                                    <p class="upcoming-preview">
                                        <span>OPEN</span><span>10 February</span>
                                    </p>
                                    <p class="upcoming-preview">
                                        <span>PREVIEW</span><span>10 February ~ 15 February</span>
                                    </p>
                                    <p class="upcoming-date">
                                        <span>AUCTION</span><span>10 February 15:00</span>
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
                                <span class="auctionKind-box on">LIVE</span><span class="d-day"></span>
                                <h4>ZEROBASE X Art Gyeonggi</h4>
                                <div class="upcoming-datebox">
                                    <p class="upcoming-preview">
                                        <span>OPEN</span><span>10 February</span>
                                    </p>
                                    <p class="upcoming-preview">
                                        <span>PREVIEW</span><span>10 February ~ 15 February</span>
                                    </p>
                                    <p class="upcoming-date">
                                        <span>AUCTION</span><span>10 February 15:00</span>
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
            <a href="#" class="commonbtn">View all</a>
        </div>
    </section>

    <jsp:include page="../include/beltBanner.jsp" />

    <article class="video">
        <h1 class="main-sectiontit video-tit">
            Video
        </h1>

        <div class="swiper-container video-swiper">
            <div class="swiper-wrapper video-contents">
                <div class="swiper-slide video-slide">
                    <a href="#">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_01_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_01_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-you"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE x art ZEROBASE x art matc…
                        </p>
                    </a>
                </div>
                <div class="swiper-slide video-slide">
                    <a href="#">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_02_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_02_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-in"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE x art ZEROBASE x art ZEROBASE x art ZEROBASE x art
                        </p>
                    </a>
                </div>
                <div class="swiper-slide video-slide">
                    <a href="#">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_03_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_03_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-you"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE x art ZEROBASE x art matc…
                        </p>
                    </a>
                </div>
                <div class="swiper-slide video-slide">
                    <a href="#">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_04_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_04_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-in"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE x art ZEROBASE x art matc…
                        </p>
                    </a>
                </div>
                <div class="swiper-slide video-slide">
                    <a href="#">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_05_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_05_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-you"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE x art ZEROBASE x art matc…
                        </p>
                    </a>
                </div>
                <div class="swiper-slide video-slide">
                    <a href="#">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_06_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_06_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-in"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE x art ZEROBASE x art matc…
                        </p>
                    </a>
                </div>
            </div>
            <div class="swiper-button-prev videoBtn-left">
                <span></span>
            </div>
            <div class="swiper-button-next videoBtn-right">
                <span></span>
            </div>
        </div>
    </article>

    <div class="wrap">
        <section class="container">
            <section class="flex_wrap sale-contents">
                <figure class="sale-box">
                    <img src="/images/pc/banner/buy.jpg" alt="buy img" class="pc-ver">
                    <img src="/images/mobile/banner/buy.jpg" alt="buy img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Buy</h2>
                        <p>From membership registration to bidding,
                            anyone can easily participate in the auction.</p>
                        <a href="#">Auction Guide</a>
                    </figcaption>
                </figure>
                <figure class="sale-box">
                    <img src="/images/pc/banner/sell.jpg" alt="sell img" class="pc-ver">
                    <img src="/images/mobile/banner/sell.jpg" alt="sell img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Sell</h2>
                        <p>We look forward to your valuable work. Contact Seoul Auction.</p>
                        <a href="#">Consignment information</a>
                    </figcaption>
                </figure>
            </section>

            <article class="flex_wrap article-contents">
                <div class="familysite-box">
                    <h3 class="main-sectiontit familySite-tit">Family Site</h3>
                    <div class="flex_wrap familysiteContents">
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">Seoul Auction Blue</p>
                                <p class="family-infotxt tit-size16">Overseas auction agency "Buy art directly"</p>
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
                                <p class="family-infotxt tit-size16">Platform for joint purchase of artworks</p>
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
                                <p class="family-infotit">Print bakery</p>
                                <p class="family-infotxt tit-size16">"Taste everyday art"</p>
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
                            <input type="email" placeholder="Email address">
                            <input type="email" placeholder="NAME">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span class="terms-checktxt">I agree to the collection and use of personal information.</span>
                            </label>
                        </fieldset>
                    </form>
                    <div class="flex_wrap newsletter-btnbox">
                        <button type="button" disabled="disabled" class="commonbtn btn-bg-b subscriptBtn">Subscribe</button>
                        <a href="#" class="commonbtn btn-border-3">
                            <span>View past<br> Newsletters</span>
                        </a>
                    </div>
                </div>
            </article>
        </section>
    </div>
    <jsp:include page="../../include/en/footer.jsp" flush="false"/>
    <!-- //wrap -->
</section>

<!-- 다크모드 darkmode -->
<span class="darkmodeBg">
        <button class="darkmode" type="button"></button><span class="darktxt darktxt-en">Dark Mode</span> 
    </span>
<!--scroll top-->
<a href="#" class="scroll-top">
    <span class="topBtn up"></span>
</a>

<!-- 뉴스레터 팝업 -->
<div class="blackBg newsletter-blackBg">
    <div class="newsletter-termsbox">
        <div class="newsletter-terms">
            <div class="closebtn closebtn-b newsAgree-close"></div>
            <input type="checkbox" id="newsAgree" class="common_checkbox" value='newsAgree' name="newsAgree">
            <label for="newsAgree">
                <span class="newsAgree-checktxt">개인정보 수집 및 이용에 동의 합니다.</span>
            </label>
            <p class="newsAgree-txt">
                뉴스레터 발송을 위한 최소한의 개인정보를 수집하고 이용합니다. 수집된
                정보는 발송 외 다른 목적으로 이용되지 않으며, 서비스가 종료되거나
                구독을 해지할 경우 즉시 파기됩니다.
            </p>
            <button type="submit" disabled="disabled" class="commonbtn btn-bg-g newsAgree-btn">확인</button>
        </div>
        <div class="newsletter-terms newsletter-comfirmbox">
            <p class="newsAgree-comfirm">
                구독해주셔서 감사합니다.
            </p>
            <button type="submit" disabled="disabled" class="commonbtn btn-bg-b newsAgree-comfirmbtn">확인</button>
        </div>
    </div>
</div>

<!-- video 팝업 -->
<div class="blackBg video-blackBg">
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