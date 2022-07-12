<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<script>
	var socialServiceDomain = '${socialServiceDomain}'
	var loginFailCntYn = '${sessionScope.LOGIN_FAIL_CNT_YN}' == 'true' ? 'Y' : 'N';
</script>
<body>
<div class="wrapper">
	<div class="sub-wrap pageclass">
		<jsp:include page="../../include/en/nav.jsp" flush="false" />
			<div id="container" ng-controller="loginCtl" data-ng-init="init();" ng-cloak>
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
											<input id="checkedID" type="checkbox" name="checkedID">
											<i></i>
											<label for="checkedID" class="tb1">Save ID</label>
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
												If you wish to use the service, please contact the customer center. (<a href="tel:82-2-395-0330">+82-2-395-0330</a> / <br class="only-pc">
												<a href="mailto:info@seoulauction.com">info@seoulauction.com</a>>.</p>
										</c:if>
										<c:if test="${error == 'Not Certify User' || sessionScope.NOT_CERTIFY_USER == 'true'}">
											<p>This ID has not been verified by e-mail after registering as a member.<br>
											Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication.<br>
												If you do not receive a verification email, please contact the customer center (<a href="tel:82-2-395-0330">+82-2-395-0330</a> / <a href="mailto:info@seoulauction.com">info@seoulauction.com</a>).<br>
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
												<li>
													<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=5qXZytacX_Uy60o0StGT&state=NAVER_LOGIN&redirect_uri=${socialServiceDomain}/naverCallback?type=login"><i class="icon-sns_naver"></i></a>
													<div id="recentSocialTypeNV" class="sns_latest_wrap" style="display:none">
														<img class="only-mb" src="/images/mobile/login/latest_login.png">
													</div>
												</li>
												<li>
													<a href="https://kauth.kakao.com/oauth/authorize?client_id=adbdfe931311a01731a0161175701a42&redirect_uri=${socialServiceDomain}/kakaoRedirect/login&response_type=code"><i class="icon-sns_kakao"></i></a>
													<div id="recentSocialTypeKA" class="sns_latest_wrap" style="display:none">
														<img class="only-mb" src="/images/mobile/login/latest_login.png">
													</div>
												</li>
<!-- 												<li> -->
<!-- 													<a id="googleIdLogin" href="#"><i class="icon-sns_google"></i></a> -->
<!-- 													<div id="recentSocialTypeGL" class="sns_latest_wrap" style="display:none"> -->
<!-- 														<img class="only-mb" src="/images/mobile/login/latest_login.png"> -->
<!-- 													</div> -->
<!-- 												</li> -->
												<li>
													<a href="https://appleid.apple.com/auth/authorize?client_id=com.seoulauction.renewal-web&redirect_uri=${socialServiceDomain}/appleReturn/login&response_type=code%20id_token&scope=name%20email&response_mode=form_post"><i class="icon-sns_apple"></i></a>
<!-- 	 												<a ng-click="loginWithApple()" href="#"><i class="icon-sns_apple"></i></a> -->
													<div id="recentSocialTypeAP" class="sns_latest_wrap" style="display:none">
														<img class="only-mb" src="/images/mobile/login/latest_login.png">
													</div>
												</li>
<!-- 												<div id="appleid-signin" style="display:none" data-type="sign in"></div> -->
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
				<form id="joinForm" method="post">
					<input type="hidden" id="name" name="name" />
					<input type="hidden" id="email" name="email" />
					<input type="hidden" id="mobile" name="mobile" />
					<input type="hidden" id="sub" name="sub" />
				</form>
			</div>
		<jsp:include page="../../include/en/footer.jsp" flush="false"/>
	</div>
</div>
</body>

<!-- <!--  구글 --> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"> -->
<!-- <script src="https://apis.google.com/js/api:client.js"></script> -->
<!-- <!-- 애플 --> -->
<!-- <script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script> -->
<!-- 로그인 -->
<script type="text/javascript" src="/js/customer/login.js"></script>
</html>