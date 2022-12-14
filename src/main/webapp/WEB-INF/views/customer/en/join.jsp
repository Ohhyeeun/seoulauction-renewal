<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<script>
	let socialServiceDomain = '${socialServiceDomain}'
	console.log(socialServiceDomain);
</script>
<body>
<div class="wrapper">
	<div class="sub-wrap pageclass">
		<jsp:include page="../../include/en/nav.jsp" flush="false" />

		<div id="container" ng-controller="joinCtl" ng-cloak>
			<div id="contents" class="contents">
				<section class="basis-section last-section">
					<div class="section-inner">
						<div class="content-panel type_panel-member">
							<div class="panel-header complete_title">
								<div class="title">
									<span class="tt2">Register</span>
								</div>
							</div>
							<div class="panel-body">
								<div class="join_txt-wrap">
									<p class="join_txt">Welcome to Seoul Auction.</p>
								</div>
								<div class="join_guide">
									<dl>
										<dt class="tt4 sub_title">Sign up</dt>
										<dd class="signup_btn">
											<a class="btn btn_point btn_full" href="#" role="button" ng-click="goJoin('person')"><span>Sign up</span></a>
										</dd>
										<dd>
											<div class="sns_set">
												<div class="title">
													Sign up for SNS
												</div>
												<div class="sns_icon_wrap">
													<ul>
														<li>
															<a href="javascript:void(0);">
																<i onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=5qXZytacX_Uy60o0StGT&state=NAVER_LOGIN&redirect_uri=${socialServiceDomain}/naverCallback?type=login'" class="icon-sns_naver"></i>
															</a>
														</li>
														<li>
															<a href="javascript:void(0);">
																<i onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=adbdfe931311a01731a0161175701a42&redirect_uri=${socialServiceDomain}/kakaoRedirect/login&response_type=code'" class="icon-sns_kakao"></i>
															</a>
														</li>
<!-- 														<li> -->
<!-- 															<a href="javascript:void(0);"> -->
<!--	 															<i id="googleIdJoin" class="icon-sns_google"></i> -->
<!-- 															</a> -->
<!-- 														</li> -->
														<li>
															<a href="javascript:void(0);">
																<i onclick="location.href='https://appleid.apple.com/auth/authorize?client_id=com.seoulauction.renewal-web&redirect_uri=${socialServiceDomain}/appleReturn/login&response_type=code%20id_token&scope=name%20email&response_mode=form_post'" class="icon-sns_apple"></i>
<!-- 																<i ng-click="joinWithApple()" class="icon-sns_apple"></i> -->
<!-- 																<div id="appleid-signin" data-type="sign in"  style="display:none"></div> -->
															</a>
														</li>
													</ul>
												</div>
											</div>
										</dd>
									</dl>
								</div>

								<div class="join_account">
									<p class="tb2">???????????? ??????????????? ???????????? NEW Account ?????????<br class="only-pc"> ????????? ?????????.</p>
									<p class="tb2">Making a new account for Korean people is here.</p>
									<div class="btn-wrap">
										<a class="btn btn_gray_line btn_sm" href="#" role="button" onClick="location.href='/join?lang=ko'"><span>New Account</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<form id="joinForm" method="post">
					<input type="hidden" id="name" name="name" />
					<input type="hidden" id="email" name="email" />
					<input type="hidden" id="mobile" name="mobile" />
					<input type="hidden" id="sub" name="sub" />
				</form>
			</div>

			<!-- validation alert -->
			<div id="popup_idsearch3-wrap" class="trp popupfixed-wrap login-popup">
				<div class="popup-dim"></div>
				<div class="popup-align mode-ms mode-mb_center">
					<div class="popup-vertical">
						<div class="popup-layer">
							<div class="pop-panel">
								<div class="pop-header">
									<a class="btn_close icon-pop_close js-closepop" href="#" title="??????">X</a>
									<div class="ico_box">
										<img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
										<img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
									</div>
									<div class="title-box_tac title_md">
										<span class="title_tac tt4" id="alertMsg">?????? ???????????? ????????? ?????????.</span>
									</div>
								</div>
								<div class="pop-body">
									<!--[0523]-->
									<article class="confirm_btn confirm_btn_md">
										<div class="btn_set-float tac">
											<a class="btn btn_point" href="#" role="button"><span>??????</span></a>
										</div>
									</article>
									<!--//[0523]-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<jsp:include page="../../include/en/footer.jsp" flush="false"/>
		<!-- stykey -->
		<div class="scroll_top-box">
			<div class="box-inner">
				<a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
			</div>
		</div>
		<!-- // stykey -->
	</div>
</div>
</body>
	
	<!--  ?????? -->
<!-- 	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"> -->
<!-- 	<script src="https://apis.google.com/js/api:client.js"></script> -->
	<!-- ?????? -->
<!-- 	<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script> -->
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>