<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../../include/en/header.jsp" flush="false"/>

<sec:authentication property="details.socialYn" var="socialYn"></sec:authentication>
<sec:authentication property="details.socialType" var="socialType"></sec:authentication>
<sec:authentication property="details.socialEmail" var="socialEmail"></sec:authentication>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<script>
	var socialServiceDomain = '${socialServiceDomain}'
	var socialYn = '${socialYn}';
	var socialType = '${socialType}';
	var socialEmail = '${socialEmail}';
	var localKindCd = '${localKindCd}';
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
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
	                                                <article class="button-area">
	                                                    <div class="btn_set-float tac">
	                                                        <button class="btn btn_default btn_lg" onclick="passwdCancel()"><span>Cancel</span></button>
	                                                        <button id="modifyButton" onclick="passwdConfirm()" class="btn btn_gray btn_lg" disabled><span>Submit</span></button>
	                                                    </div>
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
<!-- 		                                            	<div id="googleIdLogin" style="display:none"></div> -->
<!-- 		                                            	<div id="appleid-signin" style="display:none" data-type="sign in"></div> -->
		                                            </article>
	                                                <article class="button-area">
	                                                    <div class="btn_set-float tac">
	                                                        <button class="btn btn_default btn_lg" onclick="passwdCancel()"><span>Cancel</span></button>
	                                                        <button id="modifyButtonSns" onclick="passwdConfirm()" class="btn btn_point btn_lg"><span>Submit</span></button>
	                                                    </div>
	                                                </article>
	                                            </c:if>
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
    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
</body>
<!--  구글 -->
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"> -->
<!-- <script src="https://apis.google.com/js/api:client.js"></script> -->
<!-- 애플 -->
<!-- <script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script> -->
<!-- 회원정보수정 비밀번호확인 -->
<script type="text/javascript" src="/js/mypage/custConfirm.js"></script>
<script>
    $(".js-history_back").click(function() {
    	window.location.href="/mypage/main";
    })
</script>
<!-- [0809]마이페이지 사이드 유저네임 글자수제한 -->
<script>
	var asideUsername = $("aside .mem-name-wrap .tt2");
	asideUsername.each(function() {
		var asideUsernameTxt = $(this).text();
		var asideUsernameLimit = 9;
		if (asideUsernameTxt.length > asideUsernameLimit) {
			$(this).text(asideUsernameTxt.substr(0, asideUsernameLimit) + "...")
		}
	})
</script>
<!-- //[0809]마이페이지 사이드 유저네임 글자수제한 -->
</html>