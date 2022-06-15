<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<script>
	var socialServiceDomain = '${socialServiceDomain}'
	console.log(socialServiceDomain);
	console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication}')
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
            <!-- container -->
            <div id="container" class="snsLink">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_sns">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">SNS 연동 설정</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="tit-textbox">
                                                    <p class="tb1">
                                                        회원님의 아이디를 SNS 계정과 연결하여 간편하게 서울옥션에 로그인할 수 있는 서비스 입니다.
                                                    </p>
                                                </article>
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>연동 설정 시, 해당 SNS 서비스의 인증이 필요합니다.</span></li>
                                                        </ul>
                                                    </div>
                                                </article>
                                                <article class="sns-mem-wrap">
                                                    <ul>
                                                        <li class="on">
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_naver_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">네이버</div>
                                                                    <div class="disc tb2" id="NVRegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="NVButton" type="button" onclick="naverButtonClick()"><span>연동하기</span></button>
                                                                <div id="naverIdLogin" style="display:none"></div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_kakao_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">카카오톡</div>
                                                                    <div class="disc tb2" id="KARegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="KAButton" type="button" onclick="loginWithKakao()"><span>연동하기</span></button>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_google_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">구글</div>
                                                                    <div class="disc tb2" id="GLRegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="GLButton" type="button" onclick="loginWithGoogle()"><span>연동하기</span></button>
                                                                <div id="googleIdLogin" style="display:none"></div>
                                                            </div>
                                                        </li>
                                                        <li class="on">
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_apple_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">애플</div>
                                                                    <div class="disc tb2" id="APRegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="APButton" type="button" onclick="loginWithApple()"><span>연동하기</span></button>
                                                                <div id="appleid-signin" style="display:none" data-type="sign in"></div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </article>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer"></div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false" />
            <!-- //footer -->

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
<!-- SNS연동 -->
<script type="text/javascript" src="/js/mypage/snsLink.js"></script>
</html>