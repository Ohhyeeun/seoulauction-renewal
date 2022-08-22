<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<body class="" ng-controller="academyListCtl" data-ng-init="loadAcademyList(1)" style="opacity: 0" opacity=1>
	<div class="wrapper">
		<div class="sub-wrap pageclass">
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/> 
            <!-- container -->
            <div id="container" class="academy">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_academy">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">아카데미신청내역</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>수업 시작 후에는 환불이 불가합니다.</span></li>
                                                        </ul>
                                                    </div>
                                                    <div class="help-box tel">
                                                        <i class="icon-tel_g"></i>
                                                        <ul>
                                                            <li><span>문의 : </span>
                                                                <span> <a href="tel:02-2075-4466">02-2075-4466</a></span><span>, </span>
                                                                <span> <a href="tel:02-545-0330">02-545-0330</a></span>
                                                                <span> (강남센터)</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </article>
<%--                                                <article class="academy-list-wrap"  ng-if="academyCnt != 0">--%>
                                                <article class="academy-list-wrap">
                                                     <div class="table-wrap only-pc">
                                                         <table class="table_base data-table academy-list">
                                                            <thead>
                                                                <tr>
                                                                    <th>강의명</th>
                                                                    <th>총 결제액</th>
                                                                    <th>결제현황</th>
                                                                    <th>결제일시</th>
                                                                </tr>
                                                            </thead>
<%--                                                            <tbody ng-repeat="art in academyList">--%>
                                                            <tbody>
<%--                                                                <tr>--%>
<%--                                                                    <td ng-if="art.CANCEL_YN != 'Y'" class="bbs-subject" ><a href="#" ng-click="academyPayHis({'parent':this, 'academy':art});">{{art.TITLE_KO}}</a></td>--%>
<%--                                                                    <td ng-if="art.CANCEL_YN == 'Y'" class="bbs-subject" >{{art.TITLE_KO}}</td>--%>
<%--                                                                    <td ng-bind="art.pay_price | number : 0"></td>--%>
<%--                                                                    <td ng-if="art.CANCEL_YN != 'Y'">--%>
<%--                                                                    	<a class="pay complete" href="#" ng-click="academyPayHis({'parent':this, 'academy':art});" class="ng-scope" >결제완료</a>--%>
<%--                                                                        <button class="btn btn_gray_line btn_sm"  type="button" data-id="{{art.PG_TRANS_ID}}" data-type="0" ng-if="art.receipt_card == 'Y'" onclick="receiptPopup(this)"><span>카드영수증</span></button>--%>
<%--                                                                        <button class="btn btn_gray_line btn_sm"  type="button" data-id="{{art.PG_TRANS_ID}}" data-type="1" ng-if="art.receipt_vbank == 'Y'" onclick="receiptPopup(this)"><span>현금영수증</span></button>--%>
<%--                                                                    </td>--%>
<%--                                                                     <td ng-if="art.CANCEL_YN == 'Y'"><span class="pay cancel">결제취소</span></td>--%>
<%--                                                                    <td>{{art.REG_DT}}</td>--%>
<%--                                                                </tr>--%>

                                                                    <!-- [0617]제목 a태그 -->
                                                                    <tr>
                                                                        <td class="bbs-subject"><a href="#">[아트마켓] 4</a></td>
                                                                        <td>600,000</td>
                                                                        <td><a class="pay complete" href="#">결제완료</a></td>
                                                                        <td>2022.04.28</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="bbs-subject"><a href="#">[아트마켓] 3</a></td>
                                                                        <td>900,000</td>
                                                                        <td><span class="pay cancel">결제취소</span></td>
                                                                        <td>2022.03.28</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="bbs-subject"><a href="#">[아트마켓] 2</a></td>
                                                                        <td>600,000</td>
                                                                        <td>
                                                                            <a class="pay complete" href="#">결제완료</a>
                                                                            <button class="btn btn_gray_line btn_sm" type="button"><span>현금영수증</span></button>
                                                                        </td>
                                                                        <td>2022.02.20</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="bbs-subject"><a href="#">[아트마켓] </a></td>
                                                                        <td>600,000</td>
                                                                        <td><a class="pay complete" href="#">결제완료</a></td>
                                                                        <td>2022.01.15</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="bbs-subject">
                                                                            <a href="#">[대학생아카데미</a>
                                                                        </td>
                                                                        <td>300,000</td>
                                                                        <td>
                                                                            <a class="pay complete" href="#">결제완료</a>
                                                                            <button class="btn btn_gray_line btn_sm" type="button"><span>카드영수증</span></button>
                                                                        </td>
                                                                        <td>2022.01.01</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="bbs-subject"><a href="#">[작가론] </a></td>
                                                                        <td>600,000</td>
                                                                        <td><span class="pay cancel">결제취소</span></td>
                                                                        <td>2021.12.13</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="bbs-subject"><a href="#">[작가론] </a></td>
                                                                        <td>900,000</td>
                                                                        <td><span class="pay cancel">결제취소</span></td>
                                                                        <td>2021.11.09</td>
                                                                    </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                     <div class="list-wrap only-mb">
                                                        <ul class="academy-list" ng-repeat="art in academyList">
                                                            <li class="academy-list-ea">
                                                                <div class="title-wrap">
                                                                    <div class="bbs-subject"><a href="#">{{art.TITLE_KO}}</a></div>
                                                                </div>
                                                                <div class="cont-wrap">
                                                                    <dl>
                                                                        <dt>총 결제액</dt>
                                                                        <dd ng-bind="art.pay_price | number : 0" ></dd>
                                                                    </dl>
                                                                    <dl>
                                                                        <dt>결제현황</dt>
                                                                        <dd ng-if="art.CANCEL_YN != 'Y'">
                                                                            <span class="pay complete" ng-click="academyPayHis({'parent':this, 'academy':art});">결제완료</span>
                                                                            <button class="btn btn_gray_line btn_sm" type="button" data-id="{{art.PG_TRANS_ID}}" data-type="0" ng-if="art.receipt_card == 'Y'" onclick="receiptPopup(this)"><span>카드영수증</span></button>
                                                                            <button class="btn btn_gray_line btn_sm" type="button" data-id="{{art.PG_TRANS_ID}}" data-type="1" ng-if="art.receipt_vbank == 'Y'" onclick="receiptPopup(this)"><span>현금영수증</span></button>
                                                                        </dd>
                                                                        <dd ng-if="art.CANCEL_YN == 'Y'"><span class="pay cancel">결제취소</span></dd>
                                                                    </dl>
                                                                    <dl>
                                                                        <dt>결제일시</dt>
                                                                        <dd>{{art.REG_DT | date:'yyyy-MM-dd'}}</dd>
                                                                    </dl>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="paging-area">
                                                        <div class="paging" ng-if="academyCnt != 0">
                                                            <paging page="currentPage"
                                                                page-size=10
                                                                total="academyCnt"
                                                                paging-action="loadAcademyList(page)"
                                                                scroll-top="true"
                                                                hide-if-empty="true"
                                                                show-prev-next="true"
                                                                show-first-last="true"
                                                                ul-class="page_ul"
                                                                active-class="page_active"
                                                                disabled-class="page_disable"
                                                                text-next-class="icon-page_next next page_btn sp_btn btn_next02"
                                                                text-prev-class="icon-page_prev prev page_btn sp_btn btn_prev02"
                                                                text-first-class="icon-page_prevprev prev_end page_btn sp_btn btn_prev "
                                                                text-last-class="icon-page_nextnext next_end page_btn sp_btn btn_next">
                                                            </paging>
                                                        </div> <%-- //paging --%>
                                                    </div> <%-- //paging-area --%>
                                                </article>
<%--                                                <article class="academy-list-wrap" ng-if="academyCnt == 0">--%>
<%--                                                    <div class="data-empty">--%>
<%--                                                        <p class="txt_empty">신청 내역이 존재하지 않습니다.</p>--%>
<%--                                                    </div>--%>
<%--                                                </article>--%>
                                            </div>
                                        </div>


                                    </div> <%-- // mypage-container --%>
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
        </div>
        <!-- stykey -->
        <div class="scroll_top-box">
            <div class="box-inner">
                <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
            </div>
        </div>
        <!-- // stykey -->
    </div>


<%--    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    --%>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
-->
    <script type="text/javascript" src="/js/mypage/academy.js"></script>
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

<%--    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>--%>
    <!-- 팝업 : 결제완료 -->
	<jsp:include page="popup/academyPayPopup.jsp"/>
	
	<!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
	
</body>

</html>