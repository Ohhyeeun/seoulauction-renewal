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
<jsp:include page="../../include/en/header.jsp" flush="false">
    <jsp:param name="main" value="true"/>
</jsp:include>
<section class="main-contents footer-bottom footer-bottom40">
    <section class="visual visual-contents">
        <div class="swiper-container visual-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                    </figure>
                    <figurecaption class="visual_caption">
                        <div>
                            <h1 class="slide-tit">1st ART SHOPPING _ Modern and Contemporary Art Auction</h1>
                            <p>
                                22 February 15:00 F9, SHINSEGAE CENTUM CITY, Busan
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">View work</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
                            </div>
                        </div>
                    </figurecaption>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                    </figure>
                    <figurecaption class="visual_caption">
                        <div>
                            <h1 class="slide-tit">Online Charity Auction for victims of wildfire</h1>
                            <p>
                                22 February 15:00 Gangnam Center B1
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-g">View work</a><a href="#" class="commonbtn visual-commonbtn btn-border-w">e-book</a>
                            </div>
                        </div>
                    </figurecaption>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide03.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide03.jpg" alt="slide" class="m-ver">
                    </figure>
                    <figurecaption class="visual_caption black"> <!-- figure img 배경 흰색일때 font black -->
                        <div>
                            <h1 class="slide-tit">The 165th Art Auction</h1>
                            <p>
                                22 February 15:00 Seoul Auction Gangnam
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-border-3">View work</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a> <!-- figure img 배경 흰색일때 button black -->
                            </div>
                        </div>
                    </figurecaption>
                </div>
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                    </figure>
                    <figurecaption class="visual_caption">
                        <div>
                            <h1 class="slide-tit">ZERO BASE</h1>
                            <p>
                                22 February 15:00 Seoul Auction Homepage
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-g">View work</a><a href="#" class="commonbtn visual-commonbtn btn-border-w">e-book</a>
                            </div>
                        </div>
                    </figurecaption>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide01.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide01.jpg" alt="slide" class="m-ver">
                    </figure>
                    <figurecaption class="visual_caption">
                        <div>
                            <h1 class="slide-tit">e BID Premium</h1>
                            <p>
                                22 February 15:00 Seoul Auction Homepage
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">View work</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
                            </div>
                        </div>
                    </figurecaption>
                </div>
            </div>
            <span class="visualController">
                <button type="button" class="playBtn pc-ver"></button>
                <button type="button" class="stopBtn pc-ver"></button>
                <span class="swiper-progressbar">
                    <span class="visual-progressbar"></span>
                </span>
                <span class="swiper-pagination visual-pagaination"></span>
            </span>
            <div class="swiper-btn-wrap">
                <div class="swiper-button-next slide-btnleft pc-ver"></div>
                <div class="swiper-button-prev slide-btnright pc-ver"></div>
            </div>
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
                            <span id="auctionTab" class="auctionTab-btn on"><span class="text-over">1st ART SHOPPING _ Modern and Contemporary Art Auction</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">Online Charity Auction for victims of wildfire</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">The 165th Art Auction</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">ZERO BASE</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">e BID Premium</span></span>
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

    <jsp:include page="../include/upcoming.jsp" />

    <jsp:include page="../include/beltBanner.jsp" />

    <jsp:include page="../include/video.jsp" />

    <div class="wrap article-contents">
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
                            <input id ="newsEmail" type="email" placeholder="Email address">
                            <input id ="newsName" type="text"  placeholder="NAME">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span class="terms-checktxt">I agree to the collection and use of personal information.</span>
                            </label>
                        </fieldset>
                    </form>
                    <div class="flex_wrap newsletter-btnbox">
                        <button type="button" class="commonbtn btn-bg-b subscriptBtn">Subscribe</button>
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
<jsp:include page="popup/newsletter.jsp" flush="false"/>

<!-- video 팝업 -->
<div class="blackBg video-blackBg">
    <div class="video-playbox">
        <div class="video-play">

        </div>
    </div>
</div>
</body>

<script>
var resetPassword = '${sessionScope.PASSWD_RESET_YN}';
var modPassword = '${sessionScope.PASSWD_MOD_NECESSARY_YN}';
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/js/main/main.js" type="text/javascript"></script>
<script src="/js/main/auction.js" type="text/javascript"></script>
<script src="/js/main/newsletter.js" type="text/javascript"></script>

</html>