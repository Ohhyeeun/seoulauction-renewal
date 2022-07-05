<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
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
                                                        <span class="tt2">비밀번호변경</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="tit-textbox">
                                                    <p class="tb1">
                                                        새로운 비밀번호로 변경해 주세요.
                                                    </p>
                                                </article>
                                                <article class="inquiry-write-wrap">
                                                    <ul class="form_table-list data_size-185">
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">현재 비밀번호</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td">
                                                                <input type="password" onblur="oldPwCheck()" id="oldPassword" class="form-control" value="" placeholder="">
                                                                <p class="error_text tb2" id="oldPasswordMsg"></p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">새 비밀번호</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td">
                                                                <input type="password" onchange="newPwValid()" id="newPassword" class="form-control" value="" placeholder="">
                                                                <p class="guide_text tb2">영문 대소문자/숫자/특수문자 중 2가지 이상 조합, <span class="colorP">8~16자</span></p>
                                                                <p class="error_text tb2" id="newPasswordMsg"></p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">새 비밀번호 확인</label>
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
                                                        <button class="btn btn_default btn_lg" onclick="cancelPw()"><span>취소</span></button>
                                                        <button class="btn btn_point btn_lg" onclick="modifyPw()"><span>확인</span></button>
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

    <script type="text/javascript" src="/js/mypage/passwordModify.js"></script>
    <script>
        $(".js-history_back").click(function() {
            window.location.href="/mypage/main";
        })
    </script>
    <!-- 팝업 : side popup -->
    <jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
</body>
</html>