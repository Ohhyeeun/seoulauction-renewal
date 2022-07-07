<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
    <meta name="naver-site-verification" content="e43736eddfc3d46038024a9d2132da077391aadf"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="미술품 경매를 통해 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.">
    <meta name="keywords" content="미술품,경매,작품,미술,근현대,고미술,와인,보석,구매,판매,위탁,경매회사,갤러리,케이옥션,K옥션,seoulauction,auction">
    <meta name="author" content="SeoulAuction">
    <meta name="Copyright" content="SeoulAuction" />
    <meta name="Classification" content="회사소개, 미술품소개, 경매, 구매, 위탁" />
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.seoulauction.com">
    <meta property="og:title" content="SeoulAuction">
    <meta property="og:description" content="미술품 경매를 통해 많은 사람들과 일상 속 예술의 경험과 기쁨을 나누고자 합니다.">
    <meta property="og:image" content="/images/pc/thumbnail/201508122329463497773394954126.jpg"/> 
    <meta property="al:web:url" content="https://www.seoulauction.com">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/images/favic/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <meta name="application-name" content="SeoulAuction" />
    <!— Windows 8.1 + IE11 and above —>
    <meta name="msapplication-config" content="/webapp/browserconfig.xml" />
    <title>Seoul Auction</title>
    <jsp:include page="../../common/commonCss.jsp" flush="false"/>
    <%--메인일경우 main.css 추가. common.css 아래 위치에 존재해야함. --%>
    <c:if test="${not empty param.main}">
        <link rel="stylesheet" href="/css/main.css" type="text/css" />
    </c:if>

    <%--메인이 아닐 경우에만 해당 css 추가.--%>
    <c:if test="${empty param.main}">
        <%@include file="../../common/commonCssNotMain.jsp"%>
        <link rel="stylesheet" href="/css/pages_common_en.css" type="text/css" />
    </c:if>
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/favic/apple-icon-57x57.png">
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/favic/apple-icon-60x60.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/favic/apple-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/favic/apple-icon-76x76.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/favic/apple-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/favic/apple-icon-120x120.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/favic/apple-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/favic/apple-icon-152x152.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/images/favic/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/images/favic/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/images/favic/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/images/favic/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/images/favic/favicon-16x16.png">
    <link rel="manifest" href="/webapp/manifest.json">
    <link rel="icon" type="image/png" href="/images/favic/favicon-32x32.png" sizes="32x32"/>
    <link rel="icon" type="image/png" href="/images/favic/android-icon-192x192.png" sizes="192x192"/>
    <link rel="icon" type="image/png" href="/images/favic/favicon-16x16.png" sizes="16x16"/>
    <link rel="apple-touch-icon" sizes="180x180" href="/iamges/favic/apple-touch-icon.png">
    <%--angular 관련은 미리 로딩--%>
    <jsp:include page="../../common/angular.jsp" flush="false"/>
    <jsp:include page="../../common/commonJs.jsp" flush="false"/>
    <%--메인이 아닐 경우에만 해당 js 추가.--%>
    <c:if test="${empty param.main}">
        <%@include file="../../common/commonJSNotMain.jsp"%>
        <script src="/js/pages_common_en.js" type="text/javascript"></script>
    </c:if>
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
</head>
