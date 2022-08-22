<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<sec:authentication property="details.socialYn" var="socialYn"></sec:authentication>
<sec:authentication property="details.socialType" var="socialType"></sec:authentication>
<script>
    var socialYn = '${socialYn}';
    var socialType = '${socialType}';
</script>

<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
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
                                                        <span class="tt2">회원탈퇴</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="mem-infobox-wrap">
                                                    <div class="mem-infobox">
                                                        <div class="tit"><span class="tt4">회원 탈퇴에 대한 안내</span></div>
                                                        <div class="txt-body">
                                                            <ul class="mark_dot-list tb1">
                                                                <li>
                                                                    <span>회원탈퇴 후 재가입 시 신규회원으로 가입되며, 탈퇴 전의 회원정보, 응찰내역, 관심작품은 복원되지 않습니다.</span>
                                                                </li>
                                                                <li>
                                                                    <span>응찰한 경매가 진행 중인 경우, 해당 경매가 마감되기 전까지 탈퇴가 불가능합니다.</span>
                                                                </li>
                                                                <li>
                                                                    <span>경매 낙찰작이 있는 경우, 낙찰대금을 지불하기 전까지 탈퇴가 불가능합니다.</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="agr-checkbox">
                                                        <span class="trp checkbox-box">
                                                            <input id="agreeCheck" type="checkbox" name="" onclick="agreeCheck()">
                                                            <i></i>
                                                            <label for="checkbox1">회원탈퇴에 대한 유의사항을 모두 확인했습니다.<br class="m-ver"> 서울옥션 회원탈퇴에 동의합니다.</label>
                                                        </span>
                                                    </div>
                                                </article>
                                                <article class="button-area">
                                                    <div class="btn_set-float tac">
                                                        <button id="histBack" class="btn btn_default btn_lg"><span>취소</span></button>
                                                        <button id="leaveButton" onclick="custLeave()" class="btn btn_gray btn_lg" disabled><span>회원탈퇴</span></button>
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
    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
</body>
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

    $("#histBack").click(function() {
        window.location.href="/mypage/custModify";
    })
</script>

</html>