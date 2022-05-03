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
    <script type="text/javascript" src="/js/main/main.js"></script>
</head>
<body>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
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
</html>