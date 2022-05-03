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
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/swiper.css" type="text/css">
</head>
<body>
<header class="header main-header header-border"> <!-- class="main-header fixed" -->
    <div class="header_beltbox on"> <!--class="on" block-->
        <span class="header_beltTit">
                <a href="#">Notice of increase in purchase fee rate and amendment of terms and conditions<span class="beltbanner-triangle"></span></a>
            </span>
        <span class="beltclose-btn closebtn closebtn-w"></span>
    </div>
    <div class="header-border">
        <ul class="header_utilitymenu wrap_padding pc-ver">
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">KOR</a>
                <ul class="bubble-box bubble-box01">
                    <li><a href="/index.html">KOR(한국어)</a></li>
                    <li><a href="/">ENG(English)</a></li>
                </ul>
            </li>
            <li class="utility-join"><a href="#">JOIN</a></li> <!-- !login -->
            <li class="utility-tab utility-account"><a href="javascript:void(0);">ACCOUNT</a>
                <ul class="bubble-box bubble-box02">
                    <li><a href="/index_en.html">Live Auction Management</a></li>
                    <li><a href="#">Online Auction Management</a></li>
                    <li><a href="#">Wish List</a></li>
                    <li><a href="#">Academy Application List</a></li>
                    <li><a href="#">Edit member information</a></li>
                </ul>
            </li> <!-- login -->
            <li class="utility-login"><a href="#">LOGIN</a></li> <!-- !login -->
            <li class="utility-logout"><a href="#">LOGOUT</a></li> <!-- login -->
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
                    <fieldset class="topsearch topsearch-en">
                        <span class="submenuBg-closeBtn top-search-closeBtn m-ver"></span>
                        <input onkeydown="searchFilter()" type="text" class="topsearch-text pc-ver"><button type="submit" class="topsearch-btn pc-ver"></button>
                        <section class="search-bubble-box">
                            <div class="recent-search">
                                <span class="keyword-search-tit">Recent Keyword<span class="keyword-all-del">All Delete</span></span><!--
                                    --><span class="recent-keyword"><a href="#">Kim SunWoo</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">Yayoi Kusama</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">Lee UFan</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">Kim WhanKi</a><span class="keyword-del"></span></span><!--
                                    --><span class="recent-keyword"><a href="#">Park SooKeun </a><span class="keyword-del"></span></span><!--
                                    -->
                            </div>
                            <div class="recommend-search-part">
                                <span class="keyword-search-tit">Recommend Keyword</span><!--
                                    --><a href="#" class="recommend-keyword">Lee Bae</a><!--
                                    --><a href="#" class="recommend-keyword">Min JoungKi</a><!--
                                    --><a href="#" class="recommend-keyword">Chungshin</a><!--
                                    --><a href="#" class="recommend-keyword">Park SeoBo</a><!--
                                    --><a href="#" class="recommend-keyword">Lim HanSoo</a><!--
                                    --><a href="#" class="recommend-keyword">David Hockney</a><!---->
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
                                    <p class="text-over" title="February Live Auction">February Live Auction</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_02.jpg" alt="ing_auction02">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                    <p class="text-over" title="e BID Public Online Auction">e BID Public Online Auction</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_ready.jpg" alt="ing_auction03">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                    <p class="text-over" title="ZEROBASE">ZEROBASE</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_01.jpg" alt="ing_auction01">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction on">LIVE</span>
                                    <p class="text-over" title="February Live Auction">February Live Auction</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                            <a href="#" class="Ingbanner" target="_blank">
                                <figure class="border-txt-darkg Ingbanner-img">
                                    <img src="/images/pc/thumbnail/gnb_thubnatil_02.jpg" alt="ing_auction02">
                                </figure>
                                <div class="Ingbanner-txt text-over">
                                    <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                    <p class="text-over" title="e BID Public Online Auction">e BID Public Online Auction</p>
                                    <span class="Ingbanner-arrow"></span>
                                </div>
                            </a>
                        </div>

                        <ul class="subGnbmenu">
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                                <ul class="submenu submenu-part01">
                                    <li><a href="http://seoulauction.m4one.co.kr/html/auction/online_sequence_deadline_before_ko.html#tab-cont-3">Current</a><span class="currentIng">NOW</span></li>
                                    <li><a href="#">Upcoming</a></li>
                                    <li><a href="#">Result</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                                <ul class="submenu submenu-part02">
                                    <li><a href="#">Exhibition</a><span class="currentIng">NOW</span></li>
                                    <li><a href="#">Private Sale</a></li>
                                    <li><a href="#">Private Sale Guide</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SELL<span></span></span>
                                <ul class="submenu submenu-part03">
                                    <li><a href="#">Consignment information</a></li>
                                    <li><a href="#">Consignment application</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SERVICE<span></span></span>
                                <ul class="submenu submenu-part04">
                                    <li><a href="#">Academy</a><span class="currentIng">NOW</span></li>
                                    <li><a href="#">Art Collateral Loans</a></li>
                                    <li><a href="#">Art Storage</a></li>
                                    <li><a href="#">Rental of Space</a></li>
                                    <li><a href="#">Art Consulting & <br>Corporate Marketing</a></li>
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
                        <li><a href="/index.html">KOR</a></li>
                        <li><a href="#" class="gnb_join">JOIN</a><a href="#" class="gnb_member">ACCOUNT</a></li>
                        <li><a href="#" class="gnb_login">LOGIN</a><span class="gnb_logout">LOGOUT</span></li>
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

    <div class="wrap">
        <section class="container wrap_padding">
            <section class="auction-contents">
                <div class="auction-tit">
                    <h1 class="main-sectiontit">Auction</h1>
                    <div class="auctiontab-scroll">
                        <div class="auctionTab">
                            <span id="auctionTab" class="auctionTab-btn on">Episode 165 Artwork</span>
                            <span id="auctionTab" class="auctionTab-btn">e BID Premium</span>
                            <span id="auctionTab" class="auctionTab-btn">ZEROBASE</span>
                            <span id="auctionTab" class="auctionTab-btn"></span>
                            <span id="auctionTab" class="auctionTab-btn"></span>
                        </div>
                    </div>
                </div>

                <div class="flex_wrap auctionTab-contents on">
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_01_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-1.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
                                </p>
                            </a>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <p class="auction-thumb-txt">
                                <span>Moon Hyungtae</span>
                                <span>Starting  KRW 200,000,000</span>
                            </p>
                        </figcaption>
                    </figure>
                    <figure class="auction-thumbbox">
                        <img src="/images/pc/thumbnail/AuctionBanner_08_280x280.png" alt="auction 이미지" class="pc-ver">
                        <img src="/images/mobile/thumbnail/AuctionBanner_01_193x193-4.png" alt="auction 이미지" class="m-ver">
                        <figcaption class="auction-thumb">
                            <button class="wish_heart"></button>
                            <a href="#">
                                <p class="auction-thumb-txt">
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                                    <span>Moon Hyungtae</span>
                                    <span>Starting  KRW 200,000,000</span>
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
                    <button type="button" id="MoreAuction" class="commonbtn">More</button>
                    <a href="#" id="AllAuction" class="commonbtn">View All</a>
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
                                <img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">
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
            <a href="#" class="commonbtn">View all</a>
        </div>
    </section>

    <section class="platform">
        <div class="swiper-container platform-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide platform-bg">
                    <a href="#" class="platform-img">
                        <!--<figure><img src="/images/mobile/banner/MidBanner_720x220.png" alt="" clas="pc-ver"></figure>-->
                    </a>
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

    <footer class="footer">
        <div class="innerfooter">
            <section class="flex_wrap footer_menubox">
                <ul class="footer-gnbmenu">
                    <li><a href="#">ABOUT US</a></li>
                    <li><a href="#">PRESS</a></li>
                    <li><a href="#">CAREERS</a></li>
                    <li><a href="#">LOCATION</a></li>
                    <li><a href="#">CUSTOMER CENTER</a></li>
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
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Information Mgmt. Rules</a></li>
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
                    CEO : Lee Ok-Kyung   Tax Registration No : 101-81-46818   E-commerce Registration : Jong-Ro No. 01-2173<br>
                    11, Pyeongchang 31-gil, Jongno-gu, Seoul, Korea   T. +82-02-395-0330<br>
                    ⓒ Seoul Auction Corp.
                </p>
                <p>
                    Any unauthorized reproduction, transmission, distribution, and/or crawling/scraping of images, videos, text, and other material or information <br>
                    (including the website screen) is strictly forbidden by the Copyright Act, the Unfair Competition Prevention and Trade Secret Protection Act, and other relevant law.
                </p>
            </section>
        </div>
    </footer>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script src="/js/plugin/prefixfree.min.js"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="/js/main.js" type="text/javascript"></script>
<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>
</body>
</html>