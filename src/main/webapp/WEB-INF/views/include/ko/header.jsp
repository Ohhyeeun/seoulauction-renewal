<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../../common/common.jsp" flush="false"/>
<<jsp:include page="../../common/commonCss.jsp" flush="false"/>
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
                <li class="utility-login"><a href="/customer/login">로그인</a></li> <!-- !login -->
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