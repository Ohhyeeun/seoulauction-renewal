<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<jsp:include page="../../common/commonCss.jsp" flush="false"/>

<%--메인일경우 main.css 추가. common.css 아래 위치에 존재해야함. --%>
<c:if test="${not empty param.main}">
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
</c:if>

<%--메인이 아닐 경우에만 해당 css 추가.--%>
<c:if test="${empty param.main}">
    <link rel="stylesheet" href="/css/pages_common_ko.css" type="text/css" />
</c:if>

<%--angular 관련은 미리 로딩--%>
<jsp:include page="../../common/angular.jsp" flush="false"/>
<%-- 로그인 --%>
<script>
<sec:authorize access="isAuthenticated()">
    sessionStorage.setItem("is_login", "true" );
</sec:authorize>
<sec:authorize access="isAnonymous()">
   sessionStorage.setItem("is_login", "false" );
</sec:authorize>
function logout(loginId){
	console.log(loginId)
	//TODO 소셜타입에 따른 SNS로그아웃처리
	sessionLogout();
}
// 세션로그아웃
function sessionLogout() {
	location.href = "/processLogout";
}
</script>
<html lang="ko" ng-app="myApp">
<header class="header main-header header-border"> <!-- class="main-header fixed" -->


    <div class="header_beltbox on"> <!--class="on" block-->
        <div class="swiper-container belt-swiper wrap_padding belttxtbox">
            <div class="swiper-wrapper">
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <span class="header_beltTit">
                        <a href="/html/footer/board_notice_list_ko.html">
                            <span class="text-over belt_tit">
                                구매수수료율 인상 및 약관 개정안내 구매수수료율 0
                            </span>
                        </a>
                    </span>
                </div>
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <span class="header_beltTit">
                        <a href="/html/footer/board_notice_list_ko.html">
                            <span class="text-over belt_tit">
                                국문 텍스트 입니다. 국문 텍스트 입니다. 국문 텍스트 입니다. 국문 텍스트 입니다.
                            </span>
                        </a>
                    </span>
                </div>
                <div class="swiper-slide"> <!-- slide 구간 -->
                    <span class="header_beltTit">
                        <a href="/html/footer/board_notice_list_ko.html">
                            <span class="text-over belt_tit">
                                국문 공지사항 입니다.
                            </span>
                        </a>
                    </span>
                </div>
            </div>
            <span class="beltclose-btn closebtn closebtn-w"></span>
        </div>
    </div>

    <div>
        <ul class="header_utilitymenu wrap_padding pc-ver">
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">ENG</a>
                <ul class="bubble-box bubble-box01">
                    <li><a href="${pageContext.request.contextPath}/?lang=en">ENG(English)</a></li>
                    <li><a href="${pageContext.request.contextPath}/?lang=ko">KOR(한국어)</a></li>
                </ul>
            </li>
            <sec:authorize access="isAnonymous()"> <!-- !login -->
                <li class="utility-join"><a href="/join">회원가입</a></li>
                <li class="utility-login"><a href="/login">로그인</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()"> <!-- login -->
                <li class="utility-tab utility-account"><a href="#">마이페이지</a>
                    <ul class="bubble-box bubble-box02">
                        <li><a href="/mypage/liveBidReqList">라이브 경매 관리</a></li>
                        <li id="MyMenuOnlineBadge"><a href="/mypage/onlineBidList">온라인 경매 관리</a></li>
                        <li><a href="/mypage/inteLotList">관심작품</a></li>
                        <li><a href="/mypage/academyList">아카데미 신청목록</a></li>
                        <li><a href="/mypage/custModify">회원정보 수정</a></li>
                    </ul>
                </li>
                <li class="utility-login"><a onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')">로그아웃</a></li>
            </sec:authorize>
        </ul>
    </div>
    <nav class="header_navbox">
        <div class="header_nav wrap_padding" ng-controller="headCtl">
            <a href="/" class="header_logo"><span class="blind-text">logo</span></a>
            <ul class="header_gnbmenu pc-ver">
                <li><a href="#" class="">AUCTION</a></li>
                <li><a href="#">PRIVATE SALE</a></li>
                <li><a href="#">SELL</a></li>
                <li><a href="#">SERVICE</a></li>
            </ul>
            <section class="topsearch-box">
                <button class="m-top-search m-ver"></button>
                <button class="m-gnbmenu m-ver"></button>
                <form action="" class="scroll_none" onsubmit="return false; ">
                    <fieldset class="topsearch">
                        <span class="submenuBg-closeBtn top-search-closeBtn m-ver"></span>
                        <input onkeydown="searchFilter()" type="text" class="topsearch-text pc-ver" ng-click="recommandSearch();" id="topsearchText" ng-keypress="$event.keyCode === 13 && goSearch('topsearchText', true);" autocomplete="off"><button type="button" class="topsearch-btn pc-ver" ng-click="goSearch('topsearchText', true);"></button>
                        <section class="search-bubble-box">
                            <div class="recent-search">
                            </div>
                            <div class="recommend-search-part">
                            </div>
                        </section>
                    </fieldset>
                </form>
            </section>
        </div>
        <section class="gnb_submenuBg scroll_none"></section>
        <section class="submenuBg">
            <div class="wrap">
                <span class="submenuBg-closeBtn closebtn closebtn-b m-ver"></span>
                <div class="flex_wrap submenuBg-box">
                    <div class="Ingbanner-box">
                        <%--경매 준비중 추가--%>
                        <a href="javascript:void(0);" class="Ingbanner" target="_blank">
                            <figure class="border-txt-darkg Ingbanner-img">
                                <img src="/images/pc/thumbnail/gnb_thubnatil_ready.jpg" alt="ing_auction03">
                            </figure>
                            <div class="Ingbanner-txt text-over">
                                <span class="auctionKind-box Ingkind-auction">ONLINE</span>
                                <p class="text-over">경매 준비중</p>
                                <span class="Ingbanner-arrow"></span>
                            </div>
                        </a>
                    </div>

                    <ul class="subGnbmenu">
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                            <ul class="submenu submenu-part01">
                                <li id="menu_auction"><a href="/auction/progress">진행경매</a></li>
                                <li id="menu_upcoming"><a href="/auction/scheduled">예정경매</a></li>
                                <li><a href="#">경매결과</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                            <ul class="submenu submenu-part02">
                                <li id="menu_exhibit"><a href="/privatesale/exhibit">전시</a></li>
                                <li><a href="/privatesale/psList">프라이빗 세일</a></li>
                                <li><a href="/privatesale/psGuide">프라이빗 세일 가이드</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SELL<span></span></span>
                            <ul class="submenu submenu-part03">
                                <li><a href="/sell/consignment">위탁안내</a></li>
                                <li><a href="#">위탁신청</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SERVICE<span></span></span>
                            <ul class="submenu submenu-part04">
                                <li id="menu_academy"><a href="/service/academy">아카데미</a></li>
                                <li><a href="/service/loan">담보대출</a></li>
                                <li><a href="/service/storage">미술품보관</a></li>
                                <li><a href="/service/showroom">전시장대관</a></li>
                                <li><a href="/service/marketing">아트컨설팅&#38;기업마케팅</a></li>
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
    </nav>
</header>