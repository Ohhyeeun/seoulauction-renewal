<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
            <!-- container -->
            <div id="container" class="passwordModify">
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
                                                        <span class="tt2">Change Password</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="tit-textbox">
                                                    <p class="tb1">
                                                        Please change to a new password. 
														The password must be 8 to 16 characters including English letters, numbers, and special characters.
                                                    </p>
                                                </article>
                                                <article class="inquiry-write-wrap">
                                                    <ul class="form_table-list data_size-185">
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">Current Password</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td">
                                                                <input type="password" onblur="oldPwCheck()" id="oldPassword" class="form-control" value="" placeholder="">
                                                                <p class="error_text tb2" id="oldPasswordMsg"></p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">New Password</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td">
                                                                <input type="password" onchange="newPwValid()" id="newPassword" class="form-control" value="" placeholder="">
                                                                <p class="guide_text tb2">Combination of 2 or more of uppercase and lowercase letters/numbers/special characters, <span class="colorP">8 to 16 characters</span></p>
                                                                <p class="error_text tb2" id="newPasswordMsg"></p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">New Password Confirm</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td">
                                                                <input type="password" onchange="confirmPwValid()" id="confirmPassword" class="form-control" value="" placeholder="">
                                                                <p class="error_text tb2" id="confirmPasswordMsg"></p>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </article>
                                                <article class="button-area">
                                                    <div class="btn_set-float tac">
                                                        <button class="btn btn_default btn_lg" onclick="cancelPw()"><span>Cancel</span></button>
                                                        <button class="btn btn_point btn_lg" onclick="modifyPw()"><span>Confirm</span></button>
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
<script type="text/javascript" src="/js/mypage/passwordModify.js"></script>
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