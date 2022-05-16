<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<jsp:include page="../../common/commonCss.jsp" flush="false"/>
<%--메인이 아닐 경우에만 해당 css 추가.--%>
<c:if test="${empty param.main}">
<jsp:include page="../../common/commonCssNotMain.jsp" flush="false"/>
</c:if>

<%--angular 관련은 미리 로딩--%>
<jsp:include page="../../common/angular.jsp" flush="false"/>

<html lang="en" ng-app="myApp">
<header class="header main-header header-border"> <!-- class="main-header fixed" -->

    <div class="swiper-container beltbox-swiper">
        <div class="swiper-wrapper"></div>
    </div>

    <div class="header-border">
        <ul class="header_utilitymenu wrap_padding pc-ver">
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">KOR</a>
                <ul class="bubble-box bubble-box01">
                    <li><a href="${pageContext.request.contextPath}/?lang=ko">KOR(한국어)</a></li>
                    <li><a href="${pageContext.request.contextPath}/?lang=en">ENG(English)</a></li>
                </ul>
            </li>
            <li class="utility-join"><a href="#">JOIN</a></li> <!-- !login -->
            <li class="utility-tab utility-account"><a href="javascript:void(0);">ACCOUNT</a>
                <ul class="bubble-box bubble-box02">
                    <li><a href="#">Live Auction Management</a></li>
                    <li><a href="#">Online Auction Management</a></li>
                    <li><a href="#">Wish List</a></li>
                    <li><a href="#">Academy Application List</a></li>
                    <li><a href="#">Edit member information</a></li>
                </ul>
            </li> <!-- login -->
            <sec:authorize access="isAnonymous()">
                <li class="utility-login"><a href="/customer/login">LOGIN</a></li> <!-- !login -->
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            	<li class="utility-login"><a onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')">LOGOUT</a></li> <!-- !login -->
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

                        </div>

                        <ul class="subGnbmenu">
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                                <ul class="submenu submenu-part01">
                                    <li id="menu_auction"><a href="#">Current</a></li>
                                    <li id="menu_upcoming"><a href="#">Upcoming</a></li>
                                    <li><a href="#">Result</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                                <ul class="submenu submenu-part02">
                                    <li id="menu_exhibition"><a href="#">Exhibition</a></li>
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
                                    <li id="menu_academy"><a href="#">Academy</a></li>
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
                        <li><a href="#">KOR</a></li>
                        <li><a href="#" class="gnb_join">JOIN</a><a href="#" class="gnb_member">ACCOUNT</a></li>
                        <li><a href="#" class="gnb_login">LOGIN</a><span class="gnb_logout">LOGOUT</span></li>
                    </ul>
                </div>
            </section>
        </section>
    </nav>
</header>