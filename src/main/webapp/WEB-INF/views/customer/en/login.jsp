<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en" ng-app="myApp">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>Seoul Auction</title>
	    <link rel="stylesheet" href="/css/main.css" type="text/css" />
	</head>
	<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
	<script>
		var socialServiceDomain = '${socialServiceDomain}'
		console.log(socialServiceDomain);
		var loginFailCntYn = '${sessionScope.LOGIN_FAIL_CNT_YN}' == 'true' ? 'Y' : 'N';
	</script>
	<body>
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			    <div id="container" ng-controller="loginCtl" data-ng-init="init();">
			    	<form name="loginForm" id="loginForm" action="/processLogin" method="post">
			    	<div id="contents" class="contents">
			            <section class="basis-section">
			                <div class="section-inner">
			                    <div class="content-panel type_panel-login">
			                        <div class="panel-body">
			                            <div class="title">
			                                <span class="tt2">Login</span>
			                            </div>
			                            <div class="id_pw_wrap">
			                                <div class="id_box">
			                                    <input type="text" class="textType" style="width:100%" name="loginId" id="loginId" ng-model="form_data.loginId" placeholder="Enter your ID" title="Id" ng-pattern="/^[0-9a-zA-Z!@#$%^&*.;\-][0-9a-zA-Z!@#$%^&*.;\-]*$/" autofocus="autofocus" ng-keyup="enterKeylogin()"/>
			                                </div>
			                                <div class="pw_box">
			                                    <input type="password" class="textType" style="width:100%" name="password" id="password" ng-model="form_data.password" placeholder="Enter your password" title="password" ng-keyup="enterKeylogin()"/>
			                                </div>
			                            </div>
			                            <div class="checkbox_wrap">
			                                <span class="trp checkbox-box">
			                                    <input id="checkbox1" type="checkbox" name="">
			                                    <input type="checkbox" id="remember-me" name="remember-me" />
			                                    <i></i>
			                                    <label for="checkbox1" class="tb1">Stay logined in</label>
			                                </span>
			                            </div>
			                            <div ng-show="captchaShow">
											<img title="캡차이미지" ng-src="{{form_data.captchaImg}}" alt="캡차이미지"/> 
											<input id="reload" type="button" ng-click="getImage()" value="Refresh"/> 
		<!-- 									<div id="ccaudio" style="display:none"></div> -->
			<!-- 								<input id="soundOn" type="button" ng-click="getAudio()" value="음성듣기"/> -->
											<input ng-model="form_data.answer"id="answer" type="text" value=""> 
										</div>
										<c:if test="${!empty error}"> 
										<div ng-hide="!validCheck" class="error_wrap">
		                                    <c:if test="${error == 'Bad credentials' || sessionScope.USER_NOT_FOUND == 'true'}"> 
												<p>The username or password do not match.</p>
											</c:if>
											<c:if test="${error == 'Stop User' || sessionScope.STOP_USER == 'true'}"> 
												<p>! This is a restricted ID.<br>
			                                    If you wish to use the service, please contact the customer center. (02-395-0330 / <br class="only-pc">
			                                    info@seoulauction.com).</p>
											</c:if>
											<c:if test="${error == 'Not Certify User' || sessionScope.NOT_CERTIFY_USER == 'true'}"> 
												<p>This ID has not been verified by e-mail after registering as a member.<br>
												Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication.<br>
												If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).<br>
												</p>
											</c:if>
		                                </div>
		                                </c:if>
		                                <div ng-hide="validCheck" class="error_wrap" id="loginFailMessage">
		                                	<p>{{validMsg}}</p>
		                                </div>
		                                
			                            <article class="button-area login_btn">
			                                <div class="btn_set-float tac">
			                                    <a class="btn btn_point btn_lg" href="#" role="button" ng-click="login()"><span>Login</span></a>
			                                </div>
			                            </article>
			                            <div class="login-find">
			                                <ul>
			                                    <li>
			                                        <a href="/findId" class="tt6">Forgot your ID?</a>
			                                    </li>
			                                    <li>
			                                        <a href="/findPassword" class="tt6">Forgot your password?</a>
			                                    </li>
			                                    <li>
			                                        <a href="/join" class="tt6">Register</a>
			                                    </li>
			                                </ul>
			
			                            </div>
			                        </div>
			                        <div class="panel-bottom">
			                            <div class="sns_set">
			                                <div class="title">
			                                    SNS <span>Login</span>
			                                </div>
			                                <div class="sns_icon_wrap">
			                                    <!-- [0516]링크추가 -->
			                                    <ul>
			                                        <li><a ng-click="naverButtonClick()" href="#"><i class="icon-sns_naver"></i></a></li>
			                                        <div id="naverIdLogin" style="display:none"></div>
			                                        <li><a ng-click="loginWithKakao()" href="#"><i class="icon-sns_kakao"></i></a></li>
			                                        <li><a id="googleIdLogin" href="#"><i class="icon-sns_google"></i></a></li>
			                                        <li><a ng-click="appleButtonClick()" href="#"><i class="icon-sns_apple"></i></a></li>
			                                        <div id="appleid-signin" style="display:none" data-type="sign in"></div>
			                                    </ul>
			                                    <!-- // [0516]링크추가 -->
			
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </section>
					</div>
					<input type="hidden" name="social_type" id="social_type" ng-model="social_type"/>
					<input type="hidden" name="social_email" id="social_email" ng-model="social_email"/>
					</form>
				</div>
			<jsp:include page="../../include/ko/footer.jsp" flush="false"/>
		</div>
	</div>
	</body>
	
	<!-- 카카오 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<!-- 네이버 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2-nopolyfill.js" charset="utf-8"></script>
	<!--  구글 -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	<script src="https://apis.google.com/js/api:client.js"></script>
	<!-- 애플 -->
	<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
	<!-- 로그인 -->
	<script type="text/javascript" src="/js/customer/login.js"></script>
</html>