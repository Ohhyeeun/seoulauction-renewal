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
    <link rel="stylesheet" href="/css/pages_common_en.css" type="text/css" />
</c:if>

<%--angular 관련은 미리 로딩--%>
<jsp:include page="../../common/angular.jsp" flush="false"/>

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

<html lang="en" ng-app="myApp">
<header class="header main-header header-border"> <!-- class="main-header fixed" -->

    <div class="header_beltbox on"> <!--class="on" block-->
        <div class="wrap belttxtbox wrap_padding"> <!-- ul -->

        </div>
        <span class="beltclose-btn closebtn closebtn-w"></span>
    </div>


    <div>
        <ul class="header_utilitymenu wrap_padding pc-ver">
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">ENG</a>
                <ul class="bubble-box bubble-box01">
                    <li><a href="${requestScope['javax.servlet.forward.servlet_path']}?lang=ko">KOR(한국어)</a></li>
                    <li><a href="${requestScope['javax.servlet.forward.servlet_path']}?lang=en">ENG(English)</a></li>
                </ul>
            </li>
            <sec:authorize access="isAnonymous()"> <!-- !login -->
                <li class="utility-join"><a href="/join">JOIN</a></li>
                <li class="utility-login"><a href="/login">LOGIN</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()"> <!-- login -->
                <li class="utility-tab utility-account"><a href="javascript:void(0);">ACCOUNT</a>
                    <ul class="bubble-box bubble-box02">
                        <li><a href="/mypage/liveBidReqList">Live Auction Management</a></li>
                        <li id="MyMenuOnlineBadge"><a href="/mypage/onlineBidList">Online Auction Management</a></li>
                        <li><a href="/mypage/inteLotList">Wish List</a></li>
                        <li><a href="/mypage/custModify">Edit member information</a></li>
                    </ul>
                </li>
                <li class="utility-login"><a onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')">LOGOUT</a></li> <!-- !login -->
            </sec:authorize>
        </ul>
    </div>

    <nav class="header_navbox">
        <div class="header_nav wrap_padding">
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
                <form action="" class="scroll_none">
                    <fieldset class="topsearch topsearch-en">
                        <span class="submenuBg-closeBtn closebtn-b top-search-closeBtn m-ver"></span>
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
                                    <li id="menu_auction"><a href="/auction/progress">Current</a></li>
                                    <li id="menu_upcoming"><a href="/auction/scheduled">Upcoming</a></li>
                                    <li><a href="#">Result</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                                <ul class="submenu submenu-part02">
                                    <li id="menu_exhibition"><a href="/privatesale/exhibit">Exhibition</a></li>
                                    <li><a href="/privatesale/psList">Private Sale</a></li>
                                    <li><a href="/privatesale/psGuide">Private Sale Guide</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SELL<span></span></span>
                                <ul class="submenu submenu-part03">
                                    <li><a href="/sell/consignment">Consignment information</a></li>
                                    <li><a href="/mypage/inquiryForm">Consignment application</a></li>
                                </ul>
                            </li>
                            <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SERVICE<span></span></span>
                                <ul class="submenu submenu-part04">
                                    <li><a href="/service/loan">Art Collateral Loans</a></li>
                                    <li><a href="/service/storage">Art Storage</a></li>
                                    <li><a href="/service/showroom">Rental of Space</a></li>
                                    <li><a href="/service/marketing">Art Consulting & <br>Corporate Marketing</a></li>
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
                        <li id="mb_common_lang">
<%--                            <c:if test="${empty cookie.lang.value || cookie.lang.value eq 'ko'}">--%>
<%--                                <a href="${pageContext.request.contextPath}/?lang=en">ENG</a>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${cookie.lang.value eq 'en'}">--%>
<%--                                <a href="${pageContext.request.contextPath}/?lang=ko">KO</a>--%>
<%--                            </c:if>--%>
                        </li>
                        <li>
                            <sec:authorize access="isAnonymous()"> <!-- !login -->
                                <a href="/join" class="gnb_join">JOIN</a>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <a href="/mypage/liveBidReqList" class="gnb_member">ACCOUNT</a>
                            </sec:authorize>
                        </li>
                        <li>
                            <sec:authorize access="isAnonymous()">
                                <a href="/login" class="gnb_login">LOGIN</a>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <a class="gnb_logout"
                                   onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')"
                                >LOGOUT</a>
                            </sec:authorize>
                        </li>
                    </ul>
                </div>
            </section>
        </section>
    </nav>
</header>