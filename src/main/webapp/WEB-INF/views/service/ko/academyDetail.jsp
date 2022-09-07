<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- <link href="/css/angular/sa.common.2.0.css" rel="stylesheet"> -->
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="details.userNo" var="userNo"></sec:authentication>
</sec:authorize>
<script>
var userNo = '${userNo}';
</script>


<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <script type="text/javascript" src="/js/service/academy.js"></script>
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="academyDetailCtl" data-ng-init="loadAcademyDetail(1)" ng-cloak>
            <div id="contents" class="contents">

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Academy</span></h2>
                            <div class="page_desc"><span class="tb1">아카데미</span></div>
                        </div>
                    </div>
                </section>


                <section class="basis-section edit_view-section last-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-edit_view">
                            <div class="panel-header">

                                <article class="edit_view-header-area">
                                    <div class="area-inner">
                                        <div class="category">
                                            <span class="name">{{getAcademyNm(academyView.ACADEMY_CD)}}</span>
                                        </div>
                                        <div class="title">
                                            <span class="">{{academyView.TITLE}}</span>
                                        </div>
                                    </div>
                                </article>

                            </div>
                            <div class="panel-body">

                                <article class="edit_view-area">
                                    <div class="area-inner">


                                        <div class="view_editor-warp">

                                            <div class="row_2">
                                                <div class="col-item">
                                                    <div class="img-box img-tar">
                                                    	<img ng-src="<spring:eval expression="@environment.getProperty('image.root.path')" />{{academyView.IMG_VIEW_PATH}}/{{academyView.VIEW_FILE_NAME}}" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-item">
                                                    <p>
                                                        <strong>강의 기간</strong> <br />
                                                        <strong>{{academyView.FROM_DT}} ~ {{academyView.TO_DT}}</strong>
                                                    </p>
                                                    <hr />
                                                    <p>
                                                        <strong>강의 시간</strong> <br />
                                                        <strong>{{academyView.ACADEMY_TIME}}</strong>
                                                    </p>
                                                    <hr />
                                                    <p ng-bind-html="academyView.CONTENTS" class="txt-pre-line">
                                                    </p>


                                                    <div class="btn_set">
														<div class="btn_item" ng-if="academyView.ACADEMY_COMPLETE == 0 && is_login=='true' && academyView.CLOSE_YN != 'Y' && (academyView.ACADEMY_PAY !=null && academyView.ACADEMY_PAY != 0) && academyView.TO_DT.substring(0,10) > db_now">
                                                            <a ng-href="/payment/academy/{{academyView.ACADEMY_NO}}" class="btn btn_point btn_lg" type="button"><span>수강료 결제하기</span></a>
                                                        </div>
                                                        <div class="btn_item" ng-if="is_login == 'false' && academyView.CLOSE_YN != 'Y'"  onClick="checkLogin()">
                                                            <a href="#" class="btn btn_point btn_lg" type="button"><span>수강료 결제하기</span></a>
                                                        </div>
                                                        <div class="btn_item" ng-if="academyView.CLOSE_YN == 'Y' && academyView.CANCEL_YN != 'Y'">
                                                            <a href="#" class="btn btn_point btn_lg" type="button"><span>수강 모집 완료</span></a>
                                                        </div>
                                                        <div class="btn_item" ng-if="academyView.ACADEMY_COMPLETE > 0 && is_login=='true' && (academyView.ACADEMY_PAY !=null && academyView.ACADEMY_PAY != 0) && academyView.CANCEL_YN != 'Y'">
                                                            <a href="#" class="btn btn_point btn_lg" type="button"><span>결제완료</span></a>
                                                        </div>
                                                        <div class="btn_item" ng-if="academyView.CLOSE_YN != 'Y' && academyView.CANCEL_YN == 'Y'">
                                                            <a href="#" class="btn btn_point btn_lg" type="button"><span>결제취소</span></a>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>

                                        </div>


                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">
                                <article class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_default btn_lg" ng-click="goAcademyList()" role="button"><span>목록</span></a>
                                    </div>
                                </article>
                            </div>
                        </div>

                    </div>
                </section>

            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/ko/footer.jsp" />
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

</html>