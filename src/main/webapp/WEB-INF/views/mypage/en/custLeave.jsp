<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../../include/en/header.jsp" flush="false"/>

<sec:authentication property="details.socialYn" var="socialYn"></sec:authentication>
<sec:authentication property="details.socialType" var="socialType"></sec:authentication>
<script>
	var socialYn = '${socialYn}';
	var socialType = '${socialType}';
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
                                                        <span class="tt2">Delete Account</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="mem-infobox-wrap">
                                                    <div class="mem-infobox">
                                                        <div class="tit"><span class="tt4">Information on membership cancellation</span></div>
                                                        <div class="txt-body">
                                                            <ul class="mark_dot-list tb1">
                                                                <li>
                                                                    <span>When you re-register as a member after withdrawal from membership, you are registered as a new member, and member information, bid details, and works of interest before the withdrawal are not restored. </span>
                                                                </li>
                                                                <li>
                                                                    <span>If the auction you bid for is in progress, you cannot withdraw from the auction until the auction closes.</span>
                                                                </li>
                                                                <li>
                                                                    <span>If there is a successful bid at the auction, you cannot withdraw until the successful bid price is paid.</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="agr-checkbox">
                                                        <span class="trp checkbox-box">
                                                            <input id="agreeCheck" type="checkbox" name="" onclick="agreeCheck()">
                                                            <i></i>
                                                            <label for="checkbox1">I have checked all the cautions regarding membership cancellation.<br> I agree to the withdrawal of membership from Seoul Auction.</label>
                                                        </span>
                                                    </div>
                                                </article>
                                                <article class="button-area">
                                                    <div class="btn_set-float tac">
                                                        <button class="btn btn_default btn_lg"><span>Cancel</span></button>
                                                        <button id="leaveButton" onclick="custLeave()" class="btn btn_gray btn_lg" disabled><span>Delete Account</span></button>
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
    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
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
<script type="text/javascript" src="/js/mypage/custLeave.js"></script>
<script>
    $(".js-history_back").click(function() {
    	let f = document.createElement('form');
   	    f.setAttribute('method', 'post');
   	    f.setAttribute('action', '/mypage/custModify');
   	    document.body.appendChild(f);
   	    f.submit();
    })
</script>
</html>