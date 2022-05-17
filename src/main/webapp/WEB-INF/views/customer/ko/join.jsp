<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>Seoul Auction</title>
	</head>
	<body>
	<jsp:include page="../../include/ko/header.jsp" flush="false" />
	
	<div id="container footer-bottom footer-bottom30" style="margin-top:60px" ng-controller="joinCtl">
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
		                                                <i ng-click="naverJoin()" class="icon-sns_naver">네이버</i>
		                                                <div id="naverIdLogin" style="display:none"></div>
		                                            </li>
		                                            <li>
		                                            	<i ng-click="joinWithKakao()" class="icon-sns_kakao">카카오</i>
		                                            </li>
		                                            <li>
		                                            	<i id="googleIdJoin" class="icon-sns_google">구글</i>
		                                            </li>
		                                            <li>
			                                            <i ng-click="joinWithApple()" class="icon-sns_apple">애플</i>
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
    </div>
    <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
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
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>