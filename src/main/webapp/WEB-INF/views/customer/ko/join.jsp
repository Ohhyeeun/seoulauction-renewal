<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<script>
	var socialServiceDomain = '${socialServiceDomain}'
</script>
<body>
<div class="wrapper">
	<div class="sub-wrap pageclass">
		<jsp:include page="../../include/ko/nav.jsp" flush="false"/>

		<div id="container" ng-controller="joinCtl" ng-cloak>
			<div id="contents" class="contents">
				<section class="basis-section last-section">
					<div class="section-inner">
						<div class="content-panel type_panel-member">
							<div class="panel-header">
								<div class="title">
									<span class="tt2">회원가입</span>
								</div>
							</div>
							<div class="panel-body">
								<div class="join_txt-wrap">
									<p class="join_txt">서울옥션에 오신걸 환영합니다.</p>
								</div>
								<div class="join_guide">
									<dl>
										<dt class="tt4">개인 회원가입</dt>
										<dd class="tb1">
											개인의 자격으로 국내 거주하시는 회원으로 가입합니다.
										</dd>
										<dd>
											<a class="btn btn_point btn_full" href="#" role="button" ng-click="goJoin('person')"><span>회원가입</span></a>
										</dd>
										<dd>
											<div class="sns_set">
												<div class="title">
													SNS 간편 회원가입
												</div>
												<div class="sns_icon_wrap">
													<ul>
														<li>
															<i onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=5qXZytacX_Uy60o0StGT&state=NAVER_LOGIN&redirect_uri=${socialServiceDomain}/naverCallback?type=login'" class="icon-sns_naver"></i>
														</li>
														<li>
															<i onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=adbdfe931311a01731a0161175701a42&redirect_uri=${socialServiceDomain}/kakaoRedirect/login&response_type=code'" class="icon-sns_kakao"></i>
														</li>
														<li>
															<i id="googleIdJoin" class="icon-sns_google"></i>
														</li>
														<li>
															<i ng-click="joinWithApple()" class="icon-sns_apple"></i>
															<div id="appleid-signin" data-type="sign in"  style="display:none"></div>
														</li>
													</ul>
												</div>
											</div>
										</dd>
									</dl>
								</div>

								<div class="join_guide">
									<dl>
										<dt class="tt4">사업자 회원가입</dt>
										<dd class="tb1">
											국내 개인/법인 사업자의 자격으로 회원 가입합니다.
										</dd>
										<dd>
											<a class="btn btn_point btn_full" href="#" role="button" ng-click="goJoin('company')"><span>회원가입</span></a>
										</dd>
									</dl>
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
									<a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
									<div class="ico_box">
										<img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
										<img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
									</div>
									<div class="title-box_tac title_md">
										<span class="title_tac tt4" id="alertMsg">필수 항목명을 입력해 주세요.</span>
									</div>
								</div>
								<div class="pop-body">
									<!--[0523]-->
									<article class="confirm_btn confirm_btn_md">
										<div class="btn_set-float tac">
											<a class="btn btn_point" href="#" role="button"><span>확인</span></a>
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
		<jsp:include page="../../include/ko/footer.jsp" flush="false"/>
	</div>
</div>
</body>

<!--  구글 -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<!-- 애플 -->
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<script type="text/javascript" src="/js/customer/join.js"></script>
</html>