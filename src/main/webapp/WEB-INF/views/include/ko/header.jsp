<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Seoul Auction</title>
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
    <jsp:include page="../../common/commonJs.jsp" flush="false"/>
    <%--메인이 아닐 경우에만 해당 js 추가.--%>
    <c:if test="${empty param.main}">
        <jsp:include page="../../common/commonJSNotMain.jsp" flush="false"/>
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

