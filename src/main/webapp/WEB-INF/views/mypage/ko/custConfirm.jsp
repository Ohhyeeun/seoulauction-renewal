<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script>
	console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication}')
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
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
                                                        <span class="tt2">회원정보수정</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="tit-textbox">
                                                    <p class="tb1">
                                                        회원정보수정을 위해 본인 확인이 필요합니다.<br class="m-ver"> 회원님의 비밀번호를 다시 한번 입력해주세요.
                                                    </p>
                                                </article>
                                                <article class="inquiry-write-wrap">
                                                    <ul class="form_table-list data_size-185">
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">비밀번호</label>
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
                                                        <button class="btn btn_default btn_lg" onclick="passwdCancel()"><span>취소</span></button>
                                                        <button id="modifyButton" onclick="passwdConfirm()" class="btn btn_gray btn_lg" disabled><span>회원정보수정</span></button>
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
</body>
<!-- 회원정보수정 비밀번호확인 -->
<script type="text/javascript" src="/js/mypage/custConfirm.js"></script>
</html>