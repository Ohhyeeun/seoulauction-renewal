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
    <jsp:include page="../../common/commonCssNotMain.jsp" flush="false"/>
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
</script>
<html lang="ko" ng-app="myApp">
<header class="header main-header header-border"> <!-- class="main-header fixed" -->
    <div class="beltbox-swiper">
        <div class="swiper-wrapper"></div>
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
                <li class="utility-join"><a href="#">회원가입</a></li>
                <li class="utility-login"><a href="/login">로그인</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()"> <!-- login -->
                <li class="utility-tab utility-account"><a href="#">마이페이지</a>
                    <ul class="bubble-box bubble-box02">
                        <li><a href="#">라이브 경매 관리</a></li>
                        <li id="MyMenuOnlineBadge"><a href="#">온라인 경매 관리</a></li>
                        <li><a href="#">관심작품</a></li>
                        <li><a href="#">아카데미 신청목록</a></li>
                        <li><a href="#">회원정보 수정</a></li>
                    </ul>
                </li>
                <li class="utility-login"><a onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')">로그아웃</a></li>
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
                        <input onkeydown="searchFilter()" onmousedown="searchDown()" type="text" class="topsearch-text pc-ver"><button type="submit" class="topsearch-btn pc-ver"></button>
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

                        </div>

                        <ul class="subGnbmenu">
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                                <ul class="submenu submenu-part01">
                                    <li id="menu_auction"><a href="#">진행경매</a></li>
                                    <li id="menu_upcoming"><a href="#">예정경매</a></li>
                                    <li><a href="#">경매결과</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                                <ul class="submenu submenu-part02">
                                    <li id="menu_exhibit"><a href="#">전시</a></li>
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
                                    <li id="menu_academy"><a href="#">아카데미</a></li>
                                    <li><a href="#">담보대출</a></li>
                                    <li><a href="#">미술품보관</a></li>
                                    <li><a href="#">전시장대관</a></li>
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
        </section>
    </nav>
</header>