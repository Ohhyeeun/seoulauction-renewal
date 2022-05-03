<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Seoul Auction</title>
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/swiper.css" type="text/css">
	<script type="text/javascript" src="/js/main/main.js"></script>
</head>
<body>
<header class="header main-header header-border"> <!-- class="main-header fixed" -->
    <div class="header_beltbox on"> <!--class="on" block-->
        <div class="wrap belttxtbox wrap_padding">
                <span class="header_beltTit">
                    <a href="#">구매수수료율 인상 및 약관 개정안내<span class="beltbanner-triangle"></span></a>
                </span>
            <span class="beltclose-btn closebtn closebtn-w"></span>
        </div>
    </div>
    <div class="header-border">
        <ul class="header_utilitymenu wrap_padding pc-ver">
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">ENG</a>
                <ul class="bubble-box bubble-box01">
                    <li><a href="${pageContext.request.contextPath}/?lang=en">ENG(English)</a></li>
                    <li><a href="${pageContext.request.contextPath}/?lang=ko">KOR(한국어)</a></li>
                </ul>
            </li>
            <li class="utility-join"><a href="#">회원가입</a></li> <!-- !login -->
            <li class="utility-tab utility-account"><a href="#">마이페이지</a>
                <ul class="bubble-box bubble-box02">
                    <li><a href="#">라이브 경매 관리</a></li>
                    <li><a href="#">온라인 경매 관리</a></li>
                    <li><a href="#">관심작품</a></li>
                    <li><a href="#">아카데미 신청목록</a></li>
                    <li><a href="#">회원정보 수정</a></li>
                </ul>
            </li> <!-- login -->
            <sec:authorize access="isAnonymous()">
            <li class="utility-login"ref><a h="/customer/login">로그인</a></li> <!-- !login -->
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="utility-login"><a href="/processLogout">로그 아웃</a></li> <!-- !login -->
            </sec:authorize>
        </ul>
    </div>
    <nav class="header_navbox">
        <div class="header_nav wrap_padding">
            <a href="#" class="header_logo"><span class="blind-text">logo</span></a>
            <ul class="header_gnbmenu pc-ver">
                <li><a href="#" class="">AUCTION</a></li>
                <li><a href="#">PRIVATE SALE</a></li>
                <li><a href="#">SELL</a></li>
                <li><a href="#">SERVICE</a></li>
            </ul>
            <section class="topsearch-box">
                <button class="m-top-search m-ver"></button>
                <button class="m-gnbmenu m-ver"></button>
                <form action="" class="scroll_none">
                    <fieldset class="topsearch">
                        <span class="submenuBg-closeBtn top-search-closeBtn m-ver"></span>
                        <input onkeydown="searchFilter()" type="text" class="topsearch-text pc-ver"><button type="submit" class="topsearch-btn pc-ver"></button>
                        <section class="search-bubble-box">
                            <div class="recent-search">
                                <span class="keyword-search-tit">최근검색<span class="keyword-all-del">전체삭제</span></span><!--
                                    --><span class="recent-keyword"><a href="#">김선우</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">하이에르 카예하</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">김환기</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">이우환</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">박수근</a><span class="keyword-del"></span></span><!--
                                    -->
                            </div>
                            <div class="recommend-search-part">
                                <span class="keyword-search-tit">추천검색</span>
                                <a href="#" class="recommend-keyword">최우영</a><!--
                                    --><a href="#" class="recommend-keyword">박성옥</a><!--
                                    --><a href="#" class="recommend-keyword">청신</a><!--
                                    --><a href="#" class="recommend-keyword">박서보</a><!--
                                    --><a href="#" class="recommend-keyword">마티스</a><!--
                                    --><a href="#" class="recommend-keyword">호크니</a><!--
                                    -->
                            </div>
                        </section>
                    </fieldset>
                </form>
            </section>
        </div>
        <section class="gnb_submenuBg scroll_none">
            <section class="submenuBg scroll_none">
                <div class="wrap">
                    <span class="submenuBg-closeBtn closebtn closebtn-b m-ver"></span>
                    <div class="flex_wrap submenuBg-box">
                        <div class="Ingbanner-box">
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_01.jpg" alt="ing_auction01">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction on">LIVE</span>
                                    <!--<span class="auctionKind-box Ingkind-auction on">LIVE</span>-->
                                    <p class="text-over">2월 라이브 경매</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_02.jpg" alt="ing_auction02">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                    <p class="text-over">e BID 퍼블릭 온라인 경매</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_ready.jpg" alt="ing_auction03">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                    <p class="text-over">ZEROBASE</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_01.jpg" alt="ing_auction01">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction on">LIVE</span>
                                    <p class="text-over">2월 라이브 경매</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_02.jpg" alt="ing_auction02">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                    <p class="text-over">e BID 퍼블릭 온라인 경매</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                        </div>

                        <ul class="subGnbmenu">
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                                <ul class="submenu submenu-part01">
                                    <li><a href="#">진행경매</a><span class="currentIng">NOW</span></li>
                                    <li><a href="#">예정경매</a></li>
                                    <li><a href="#">경매결과</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                                <ul class="submenu submenu-part02">
                                    <li><a href="#">전시</a><span class="currentIng">NOW</span></li>
                                    <li><a href="#">프라이빗 세일</a></li>
                                    <li><a href="#">프라이빗 세일 가이드</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SELL<span></span></span>
                                <ul class="submenu submenu-part03">
                                    <li><a href="#">위탁안내</a></li>
                                    <li><a href="#">위탁신청</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SERVICE<span></span></span>
                                <ul class="submenu submenu-part04">
                                    <li><a href="#">아카데미</a><span class="currentIng">NOW</span></li>
                                    <li><a href="#">담보대출</a></li>
                                    <li><a href="#">미술품보관</a></li>
                                    <li><a href="#">전시장대관</a></li>
                                    <li><a href="#">아트컨설팅&#38;기업마케팅</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit m-ver">
                                    <span class="gnbmenu_arrow modebox">Light Mode
                                        <label for="dark" class="mode-toggle">
                                            <input type="checkbox" id="dark" name="dark">
                                            <span class="mode-switch"></span>
                                        </label>
                                    </span>
                            </li>
                        </ul>
                        <figure class="blacklotbox">
                            <a href="https://www.blacklot.com/" target="_blank">
                                <img src="/images/pc/thumbnail/gnb_blacklot.jpg" alt="blacklot">
                            </a>
                        </figure>
                    </div>
                    <ul class="mobile-utility m-ver">
                        <li><a href="#">ENG</a></li>
                        <li><a href="#" class="gnb_join">회원가입</a><a href="#" class="gnb_member">마이페이지</a></li>
                        <li><a href="#" class="gnb_login">로그인</a><a class="gnb_logout">로그아웃</a></li>
                    </ul>
                </div>
            </section>
        </section>
    </nav>
</header>

<section class="main-contents footer-bottom">
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

    <div class="wrap">
        <section class="container wrap_padding">
            <section class="auction-contents">
                <div class="auction-tit">
                    <h1 class="main-sectiontit">Auction</h1>
                    <div class="auctiontab-scroll">
                        <div class="auctionTab"> <!-- 최대 5개 까지 -->
                            <span id="auctionTab" class="auctionTab-btn on">165회 미술품</span>
                            <span id="auctionTab" class="auctionTab-btn">e BID 프리미엄</span>
                            <span id="auctionTab" class="auctionTab-btn">제로베이스</span>
                            <span id="auctionTab" class="auctionTab-btn"></span>
                            <span id="auctionTab" class="auctionTab-btn"></span>
                        </div>
                    </div>
                </div>

                <div class="flex_wrap auctionTab-contents on"> <!--12*2 = 24 -->
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <p class="auction-thumb-txt">
                                <span>문형태</span>
                                <span>시작가 200,000,000</span>
                            </p>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-3.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_05_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-5.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_07_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_04_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-5.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_05_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-7.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_07_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                </div>

                <div class="flex_wrap auctionTab-contents"> <!--12*2 = 24 -->
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_04_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <p class="auction-thumb-txt">
                                <span>문형태</span>
                                <span>시작가 200,000,000</span>
                            </p>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_07_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-7.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_09_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_04_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-3.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_09_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-3.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_07_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-7.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-3.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-3.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                </div>

                <div class="flex_wrap auctionTab-contents"> <!--12*2 = 24 -->
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <p class="auction-thumb-txt">
                                <span>문형태</span>
                                <span>시작가 200,000,000</span>
                            </p>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_04_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-5.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_05_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-7.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_07_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_02_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-2.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_03_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_04_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-5.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_05_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-7.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_06_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-6.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_07_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-8.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>문형태</span>
                                    <span>시작가 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                </div>

                <div class="commonbtn-box">
                    <button type="button" id="MoreAuction" class="commonbtn">더보기</button>
                    <a href="#" id="AllAuction" class="commonbtn">전체보기</a>
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
                                <span class="auctionKind-box">OFFLINE</span><span class="d-day"></span>
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
                                <!--<img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet"> -->
                            </figure>
                        </a>
                    </div>
                </div>
            </div>

            <!--<ul class="upcoming-slidebox">
                <li class="upcomingSlide upcomingSlide01">
                    <a href="#">
                        <div class="upcoming-caption">
                            <span class="auctionKind-box on">LIVE</span><span class="d-day">D-1</span>
                            <h4>2월 라이브 경매</h4>
                            <div class="upcoming-datebox">
                                <p class="upcoming-datetit">
                                    <span>프리뷰</span>
                                    <span>경매일</span>
                                </p>
                                <p class="upcoming-line">
                                    <span class="upcomingLine"></span>
                                    <span class="upcomingLine"></span>
                                </p>
                                <p class="upcoming-date">
                                    <span>2/14(금) ~ 2/25(화)</span>
                                    <span>2/15(화) 15:00</span>
                                </p>
                            </div>
                        </div>
                        <figure class="upcoming-img">
                            <span class="upcomingImg"></span>
                            <img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">
                        </figure>
                    </a>
                </li>
                <li class="upcomingSlide upcomingSlide02">
                    <a href="#">
                        <div class="upcoming-caption">
                            <span class="auctionKind-box on">LIVE</span><span class="d-day">D-1</span>
                            <h4>2월 라이브 경매</h4>
                            <div class="upcoming-datebox">
                                <p class="upcoming-datetit">
                                    <span>프리뷰</span>
                                    <span>경매일</span>
                                </p>
                                <p class="upcoming-line">
                                    <span class="upcomingLine"></span>
                                    <span class="upcomingLine"></span>
                                </p>
                                <p class="upcoming-date">
                                    <span>2/14(금) ~ 2/25(화)</span>
                                    <span>2/15(화) 15:00</span>
                                </p>
                            </div>
                        </div>
                        <figure class="upcoming-img"></figure>
                    </a>
                </li>
                <li class="upcomingSlide upcomingSlide03">
                    <a href="#">
                        <div class="upcoming-caption">
                            <span class="auctionKind-box on">LIVE</span><span class="d-day">D-1</span>
                            <h4>2월 라이브 경매</h4>
                            <div class="upcoming-datebox">
                                <p class="upcoming-datetit">
                                    <span>프리뷰</span>
                                    <span>경매일</span>
                                </p>
                                <p class="upcoming-line">
                                    <span class="upcomingLine"></span>
                                    <span class="upcomingLine"></span>
                                </p>
                                <p class="upcoming-date">
                                    <span>2/14(금) ~ 2/25(화)</span>
                                    <span>2/15(화) 15:00</span>
                                </p>
                            </div>
                        </div>
                        <figure class="upcoming-img"></figure>
                    </a>
                </li>
            </ul> -->
        </div>
        <div class="commonbtn-box upcomingBtn">
            <a href="#" class="commonbtn">전체보기</a>
        </div>
    </section>

    <section class="platform">
        <div class="swiper-container platform-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide platform-bg">
                    <a href="#" class="platform-img"></a>
                </div>
                <div class="swiper-slide platform-bg">
                    <a href="#" class="platform-img"></a>
                </div>
                <div class="swiper-slide platform-bg">
                    <a href="#" class="platform-img"></a>
                </div>
            </div>
            <!-- Add Arrows -->
            <div class="swiper-button-next platformBtn-right pc-ver"></div>
            <div class="swiper-button-prev platformBtn-left pc-ver"></div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination platform-pagination m-ver"></div>
    </section>

    <article class="video">
        <h1 class="main-sectiontit video-tit">
            Video
        </h1>

        <div class="swiper-container video-swiper">
            <div class="swiper-wrapper video-contents">
                <div class="swiper-slide video-slide">
                    <a data-video="B_iGOoOR1SY">
                        <figure class="video-thumb">
                            <span class="video-thumbHover"></span>
                            <img src="/images/pc/thumbnail/VideoBanner_01_280x280.png" alt="video" class="pc-ver">
                            <img src="/images/mobile/thumbnail/VideoBanner_01_300x300.png" alt="video" class="m-ver">
                            <span class="video-icon video-icon-you"></span>
                        </figure>
                        <p class="video-thmbtit">
                            ZEROBASE X 아트경기 2021: 경기문화재단
                        </p>
                        <div class="video-popup">
                            <div class="video-popup-closer"></div>
                        </div>
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
                            ZEROBASE X 아트경기 2021: 경기문화재단
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
                            ZEROBASE X 아트경기 2021: 경기문화재단
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
                            ZEROBASE X 아트경기 2021: 경기문화재단
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
                            ZEROBASE X 아트경기 2021: 경기문화재단
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
                            ZEROBASE X 아트경기 2021: 경기문화재단
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
                            <input type="email" placeholder="이메일 주소">
                            <input type="email" placeholder="이름">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span class="terms-checktxt">개인정보 수집 및 이용에 동의 합니다.</span>
                            </label>
                        </fieldset>
                    </form>
                    <div class="flex_wrap newsletter-btnbox">
                        <button type="button" disabled="disabled" class="commonbtn btn-bg-b subscriptBtn">구독하기</button>
                        <a href="#" class="commonbtn btn-border-3">
                            <span>지난 뉴스레터 보기</span>
                        </a>
                    </div>
                </div>
            </article>
        </section>
    </div>

    <footer class="footer">
        <div class="innerfooter">
            <section class="flex_wrap footer_menubox">
                <ul class="footer-gnbmenu">
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">언론보도</a></li>
                    <li><a href="#">채용공고</a></li>
                    <li><a href="#">위치안내</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>

                <ul class="snsbox_icon">
                    <li><a href="#" class="sns-icon sns-icon01"></a></li>
                    <li><a href="#" class="sns-icon sns-icon02"></a></li>
                    <li><a href="#" class="sns-icon sns-icon03"></a></li>
                    <li><a href="#" class="sns-icon sns-icon04"></a></li>
                    <li><a href="#" class="sns-icon sns-icon05"></a></li>
                </ul>
            </section>
            <section class="flex_wrap footer_infobox">
                <div class="footer-infomenubox">
                    <ul class="flex_wrap footer-infomenu">
                        <li><a href="#">경매약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">내부관리규정</a></li>
                    </ul>

                    <div class="Familysite-selectbox">
                        <a href="#none" class="Familysite">Family Site</a>
                        <ul class="familyselect">
                            <li><a href="https://www.auctionblue.com/index" target="_blank">Print Bakery</a></li>
                            <li><a href="https://printbakery.com/" target="_blank">Auction Blue</a></li>
                            <li><a href="https://sotwo.com/" target="_blank">SOTOW</a></li>
                        </ul>
                    </div>
                </div>

                <p class="bottom-p-spacing20">
                    ㈜서울옥션 · 대표이사 : 이옥경   사업자등록번호 : 101-81-46818   통신판매업신고 : 종로 제01-2173호<br>
                    주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10)  고객센터 : 02-395-0330<br>
                    ⓒ Seoul Auction Corp.
                </p>
                <p>
                    (주)서울옥션이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)서울옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                    따라서 (주)서울옥션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
                </p>
            </section>
        </div>
    </footer>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script src="/js/plugin/prefixfree.min.js"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="/js/main.js" type="text/javascript"></script>
<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>
</body>
</html>