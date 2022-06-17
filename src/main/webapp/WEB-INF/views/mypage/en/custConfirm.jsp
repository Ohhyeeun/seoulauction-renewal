<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authentication property="details.socialYn" var="socialYn"></sec:authentication>
<sec:authentication property="details.socialType" var="socialType"></sec:authentication>
<sec:authentication property="details.socialEmail" var="socialEmail"></sec:authentication>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<script>
	var socialServiceDomain = '${socialServiceDomain}'
	console.log(socialServiceDomain);
	var socialYn = '${socialYn}';
	var socialType = '${socialType}';
	var socialEmail = '${socialEmail}';
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/header.jsp" flush="false" />
            <!-- container -->
            <div id="container" class="custModify">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_myinfo">
                                <div class="panel-body">
                                    <div class="mypage-container">
                                        
                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">Change Information</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <!-- 개인회원 -->
	                                            <c:if test="${socialYn == 'N' }">
	                                                <article class="tit-textbox">
	                                                    <p class="tb1">
	                                                        Identity verification is required to modify member information. <br>
                                                        	Please re-enter your password.
	                                                    </p>
	                                                </article>
	                                                <article class="inquiry-write-wrap">
	                                                    <ul class="form_table-list data_size-185">
	                                                        <li>
	                                                            <div class="th">
	                                                                <label for="" class="">Password</label>
	                                                            </div>
	                                                            <div class="td">
	                                                                <input type="password" id="passwd" onkeyup="passwdKeyUp()" class="form-control" value="" placeholder="">
	                                                                <p class="error_text tb2" id="passwdMsg"></p>
	                                                            </div>
	                                                        </li>
	                                                    </ul>
	                                                </article>
	                                        	</c:if>
	                                            <!-- 소셜회원 -->
	                                            <c:if test="${socialYn == 'Y' }">
		                                            <article class="tit-textbox">
		                                                <p class="tb1">
		                                                    Identity verification is required to modify member information. <br class="m-ver"> Please verify through the linked SNS.

		                                                </p>
		                                            </article>
		                                            <article class="inquiry-write-wrap">
		                                            	<div id="naverIdLogin" style="display:none"></div>
		                                            	<div id="googleIdLogin" style="display:none"></div>
		                                            	<div id="appleid-signin" style="display:none" data-type="sign in"></div>
		                                            </article>
	                                            </c:if>
                                                <article class="button-area">
                                                    <div class="btn_set-float tac">
                                                        <button class="btn btn_default btn_lg" onclick="passwdCancel()"><span>Cancel</span></button>
                                                        <button id="modifyButton" onclick="passwdConfirm()" class="btn btn_gray btn_lg" disabled><span>Submit</span></button>
                                                    </div>
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
            <jsp:include page="../../include/en/footer.jsp" flush="false" />
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
<!-- 회원정보수정 비밀번호확인 -->
<script type="text/javascript" src="/js/mypage/custConfirm.js"></script>
</html>