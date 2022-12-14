<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../../include/en/header.jsp" flush="false"/>
<spring:eval expression="@environment.getProperty('social.service.domain')" var="socialServiceDomain" />
<sec:authentication property="details.socialYn" var="socialYn"/>
<sec:authentication property="Details.userKind" var="userKind"/>

<c:if test="${socialYn == 'Y' || userKind == 'company'}">
    <script>
        alert("not authentication or Unauthorized Access.");
        window.location.href="/mypage/main";
    </script>
</c:if>

<script>
	var socialServiceDomain = '${socialServiceDomain}'
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
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
                                                        <span class="tt2">SNS Setting</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="tit-textbox">
                                                    <p class="tb1">
                                                        This is a service that allows you to easily log in to Seoul Auction by linking your ID with your SNS account.
                                                    </p>
                                                </article>
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span> When setting the linkage, authentication of the corresponding SNS service is required.</span></li>
                                                        </ul>
                                                    </div>
                                                </article>
                                                <article class="sns-mem-wrap">
                                                    <ul>
                                                        <li id="NVLi">
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_naver_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">NAVER</div>
                                                                    <div class="disc tb2" id="NVRegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="NVButton" type="button" onclick="naverButtonClick()"><span>Connect</span></button>
                                                            </div>
                                                        </li>
                                                        <li id="KALi">
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_kakao_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">KAKAO</div>
                                                                    <div class="disc tb2" id="KARegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="KAButton" type="button" onclick="loginWithKakao()"><span>Connect</span></button>
                                                            </div>
                                                        </li>
<!--                                                         <li> -->
<!--                                                             <div class="sns-wrap"> -->
<!--                                                                 <div class="sns-logo"><i class="icon-sns_google_type1"></i></div> -->
<!--                                                                 <div class="sns-txt"> -->
<!--                                                                     <div class="tit tt4">GOOGLE</div> -->
<!--                                                                     <div class="disc tb2" id="GLRegDt"></div> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="btn-wrap"> -->
<!--                                                                 <button class="btn btn_point btn_sm" id="GLButton" type="button" onclick="loginWithGoogle()"><span>Connect</span></button> -->
<!--                                                                 <div id="googleIdLogin" style="display:none"></div> -->
<!--                                                             </div> -->
<!--                                                         </li> -->
                                                        <li id="APLi">
                                                            <div class="sns-wrap">
                                                                <div class="sns-logo"><i class="icon-sns_apple_type1"></i></div>
                                                                <div class="sns-txt">
                                                                    <div class="tit tt4">APPLE</div>
                                                                    <div class="disc tb2" id="APRegDt"></div>
                                                                </div>
                                                            </div>
                                                            <div class="btn-wrap">
                                                                <button class="btn btn_point btn_sm" id="APButton" type="button" onclick="loginWithApple()"><span>Connect</span></button>
<!--                                                                 <div id="appleid-signin" style="display:none" data-type="sign in"></div> -->
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
<!-- SNS연동 -->
<script type="text/javascript" src="/js/mypage/snsLink.js"></script>
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
        var asideUsernameLimit = 8;
        if (asideUsernameTxt.length > asideUsernameLimit) {
            $(this).text(asideUsernameTxt.substr(0, asideUsernameLimit) + "...")
        }
    })
</script>
<!-- //[0809]마이페이지 사이드 유저네임 글자수제한 --> 
</html>