<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
    <link rel="shortcut icon" href="#">
    
	<jsp:include page="../../include/ko/header.jsp" flush="false"/>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	<script src="https://apis.google.com/js/api:client.js"></script>
	<script type="text/javascript" src="/js/customer/login.js"></script>
	
	<body>
	<section class="main-contents">
	    <div id="container" ng-controller="loginCtl">
				<form name="loginForm" id="loginForm" action="/processLogin" method="post">
					<fieldset>
						<div class="bg_img bg01">
							<div>
								<h2>
									로그인
								</h2>
							</div>
							<div>
								<div>
									<input type="text" name="loginId" id="loginId" ng-model="form_data.loginId" placeholder="아이디 입력하기" title="Id" ng-pattern="/^[0-9a-zA-Z!@#$%^&*.;\-][0-9a-zA-Z!@#$%^&*.;\-]*$/" autofocus="autofocus" ng-keyup="enterKeylogin()"/> 
									<input type="password" name="password" id="password" ng-model="form_data.password" placeholder="비밀번호 입력하기" title="password" ng-keyup="enterKeylogin()"/>
									<input type="checkbox" id="remember-me" name="remember-me" />
									<p id="token-result"></p>
								</div>
				
								<div>
									<div id="loginFailMessage" ng-model="loginFailMessage">
											<c:if test="${error == 'Bad credentials'}"> 
												아이디 또는 비밀번호가 일치하지 않습니다.
											</c:if>
											<c:if test="${error == 'Stop User'}"> 
												이용제한 아이디 입니다. <br />
												서비스 이용을 원하시면 고객센터(02-395-0330 / sos@seoulauction.com)로 연락바랍니다.
											</c:if>
										</div>
									<div ng-click="login()">
										로그인
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
	</section>
	</body>
</html>