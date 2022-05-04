<%--
  Created by IntelliJ IDEA.
  User: sjk
  Date: 2022/05/03
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="wrapper footer-bottom footer-bottom30">
    <div class="sub-wrap pageclass type-pagemain">

        <!-- header -->
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
                            <li><a href="/index_en.html">ENG(English)</a></li>
                            <li><a href="/">KOR(한국어)</a></li>
                        </ul>
                    </li>
                    <li class="utility-join"><a href="#">회원가입</a></li> <!-- !login -->
                    <li class="utility-tab utility-account"><a href="#">마이페이지</a>
                        <ul class="bubble-box bubble-box02">
                            <li><a href="/index_en.html">라이브 경매 관리</a></li>
                            <li><a href="#">온라인 경매 관리</a></li>
                            <li><a href="#">관심작품</a></li>
                            <li><a href="#">아카데미 신청목록</a></li>
                            <li><a href="#">회원정보 수정</a></li>
                        </ul>
                    </li> <!-- login -->
                    <li class="utility-login"><a href="#">로그인</a></li> <!-- !login -->
                    <li class="utility-logout"><a href="#">로그아웃</a></li> <!-- login -->
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
                                            <li><a href="#">예정경매</a><span class="currentIng">NOW</span></li>
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
                                <li><a href="/index_en.html">ENG</a></li>
                                <li><a href="#" class="gnb_join">회원가입</a><a href="#" class="gnb_member">마이페이지</a></li>
                                <li><a href="#" class="gnb_login">로그인</a><a class="gnb_logout">로그아웃</a></li>
                            </ul>
                        </div>
                    </section>
                </section>
            </nav>
        </header>
        <!-- //header -->

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->
                <section class="page_title-section">
                    <div class="section-inner full_size">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">뉴스레터</span></h2>
                        </div>
                    </div>
                </section>



                <section class="basis-section last-section news_letter-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-news_list">

                            <div class="panel-body">
                                <ul class="news-list">
                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_55.jpg" alt="newsletter. Jan. Vol.55">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2022년 3월호(Vol. 55)</span><i class="new">N</i></div>
                                                <div class="desc"><span>Contemporary Art Sale</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_54.jpg" alt="newsletter. Jan. Vol.54">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2022년 2월호(Vol. 54)</span><i class="new">N</i></div>
                                                <div class="desc"><span>165회 미술품 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_53.jpg" alt="newsletter. Jan. Vol.53">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>022년 1월호(Vol. 53)</span><i class="new">N</i></div>
                                                <div class="desc"><span>2022 1월 라이브 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_52.jpg" alt="newsletter. Jan. Vol.52">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 12월호(Vol. 52)</span><i class="new">N</i></div>
                                                <div class="desc"><span>164회 미술품 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_51.jpg" alt="newsletter. Jan. Vol.51">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 11월호(Vol. 51)</span><i class="new">N</i></div>
                                                <div class="desc"><span>Winter Sale</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_49.jpg" alt="newsletter. Jan. Vol.49">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 9월호(Vol. 49)</span><i class="new">N</i></div>
                                                <div class="desc"><span>Autumn Sale</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_48.jpg" alt="newsletter. Jan. Vol.48">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 8월호(Vol. 48)</span><i class="new">N</i></div>
                                                <div class="desc"><span>162회 미술품 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile//main/newsletter_47.jpg" alt="newsletter. Jan. Vol.47">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 7월호(Vol. 47)</span><i class="new">N</i></div>
                                                <div class="desc"><span>서울옥션 대구경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="panel-footer">
                                <div class="page-set">
                                    <button class="btn btn_gray_line" type="button"><span>더보기</span></button>
                                </div>
                            </div>
                        </div>


                    </div>
                </section>

            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
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
                        <form action="">
                            <legend class="Familysite-legned">
                                <fieldset class="Familysite-selectbox">
                                    <select name="Familysite">
                                        <option value="Familysite">Family Site</option>
                                        <option value="Print Bakery">Print Bakery</option>
                                        <option value="Auction Blue">Auction Blue</option>
                                    </select>
                                </fieldset>
                            </legend>
                        </form>
                    </div>

                    <p class="bottom-p-spacing20">
                        ㈜서울옥션 · 대표이사 : 이옥경 사업자등록번호 : 101-81-46818 통신판매업신고 : 종로 제01-2173호<br>
                        주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10) 고객센터 : 02-395-0330<br>
                        ⓒ Seoul Auction Corp.
                    </p>
                    <p>
                        (주)서울옥션이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)서울옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                        따라서 (주)서울옥션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
                    </p>
                </section>
            </div>
        </footer>
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
<script>
    //const data = { username: 'example' };
    fetch('/api/main/newsletters', {
        method: 'GET', // 또는 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
        //body: JSON.stringify(data),
    })
    .then((response) => response.json())
    .then((data) => {
        alert('성공:'+ data);
    })
    .catch((error) => {
        alert('실패:'+ error);
    });
</script>
</body>
</html>
