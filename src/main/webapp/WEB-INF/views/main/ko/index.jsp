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
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
</head>
<body>
<%--<jsp:include page="../../main/include/topNotice.jsp" />--%>
<jsp:include page="../../include/ko/header.jsp" flush="false">
    <jsp:param name="main" value="true"/>
</jsp:include>

<section class="main-contents footer-bottom footer-bottom40" ng-controller="mainCtl" data-ng-init="init()">
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
                            <h1 class="slide-tit">제1회 ART SHOPPING 신세계 센텀시티 오픈 기념 경매</h1>
                            <p>
                                2/22(화) 15:00 부산 신세계백화점 센텀시티 문화홀(9층)
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
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
                            <h1 class="slide-tit">제1회 Autunm Scape _ Land, Life, Inner scape</h1>
                            <p>
                                서울시 강남구 도산대로 북 33길 6 호림아트센터 1층 서울옥션 강남점
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
                            </div>
                        </div>
                    </figurecaption>
                </div>

                <div class="swiper-slide"> <!-- slide 구간 -->
                    <figure class="visual_img">
                        <img src="/images/pc/slide/main/slide03.jpg" alt="slide" class="pc-ver">
                        <img src="/images/mobile/slide/main/slide03.jpg" alt="slide" class="m-ver">
                    </figure>
                    <figurecaption class="visual_caption black"> <%-- 흰 배경일때 버튼, 텍스트 black--%>
                        <div>
                            <h1 class="slide-tit">165회 미술품 경매</h1>
                            <p>
                                2/22(화) 15:00 서울옥션 강남
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-border-3">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a> <!-- figure img 배경 흰색일때 button black -->
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
                            <h1 class="slide-tit">제로베이스</h1>
                            <p>
                                2/22(화) 15:00 서울옥션 홈페이지
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-g">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-border-w">e-book</a>
                            </div> <%-- 버튼 색상 --%>
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
                            <h1 class="slide-tit">e BID 프리미엄</h1>
                            <p>
                                2/22(화) 15:00 서울옥션 홈페이지
                            </p>
                            <div class="visual_btn">
                                <a href="#" class="commonbtn visual-commonbtn btn-bg-w">작품보기</a><a href="#" class="commonbtn visual-commonbtn btn-bg-b">e-book</a>
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
                        <div class="auctionTab"> <!-- 최대 5개 까지 -->
                            <span id="auctionTab" class="auctionTab-btn on"><span class="text-over">제1회 ART SHOPPING 신세계 센텀시티 오픈 기념 경매</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">제1회 Autunm Scape _ Land, Life, Inner scape</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">165회 미술품 경매</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">제로베이스</span></span>
                            <span id="auctionTab" class="auctionTab-btn"><span class="text-over">e BID 프리미엄</span></span>
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

    <jsp:include page="../../main/include/upcoming.jsp" />



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

            <aticle class="flex_wrap article-contents">
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

            </aticle>
        </section>
    </div>
    <jsp:include page="../../include/ko/footer.jsp" flush="false">
        <jsp:param name="main" value="true"/>
    </jsp:include>
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
        <div class="video-closebtn closebtn closebtn-w"></div>
        <div class="video-play">

        </div>
    </div>
</div>

<%-- mian 레이어 팝업 --%>
<div class="blackBg main-popupBg on">
    <div class="main-popupwrap">
        <div class="main-popupbox">
            <a href="#">
                <div class="main-popup-img"> <!-- 이미지 레이어팝업 -->
                    <img src="/images/pc/main/pop_event.jpg" alt="레이어팝업 이미지">
                </div>

                <!-- 텍스트 레이어팝업 -->
                <div class="main-popup-txt on"> 
                    <div class="main-popup-caption">
                        <h2>국내 오프라인 경매 구매수수료율 인상 및 약관 개정 안내</h2>
                        <p>항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                        항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                        항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                        항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                        항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br> </p>
                        <p class="main-popup-green">변경 전 -15%(부가세 별도)</p>
                    </div>
                </div>
            </a>
            <div class="main-popup-close">
                <span>오늘 그만보기</span><span class="main-popup-closebtn closebtn closebtn-w"></span>
            </div>
        </div>
    </div>
</div>

</body>

<script>
var resetPassword = '${sessionScope.PASSWD_RESET_YN}';
var modPassword = '${sessionScope.PASSWD_MOD_NECESSARY_YN}';
</script>

<script src="/js/main/main.js" type="text/javascript"></script>
<script src="/js/main/auction.js" type="text/javascript"></script>
<script src="/js/main/newsletter.js" type="text/javascript"></script>

</html>