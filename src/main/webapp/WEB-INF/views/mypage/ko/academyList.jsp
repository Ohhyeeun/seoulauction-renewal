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
			<script type="text/javascript" src="/js/mypage/academy.js"></script>
            <!-- container -->
            <div id="container" class="academy" >
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
                                                                <span> 02-2075-4422</span><span>, </span>
                                                                <span> 02-545-0330</span>
                                                                <span> (강남센터)</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </article>
                                                <article class="academy-list-wrap">
                                                    <div class="table-wrap pc-ver">
                                                        <table class="table_base data-table academy-list">
                                                            <thead>
                                                                <tr>
                                                                    <th>강의명</th>
                                                                    <th>총 결제액</th>
                                                                    <th>결제현황</th>
                                                                    <th>결제일시</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody ng-repeat="art in academyList">
                                                                <tr>
                                                                    <td class="bbs-subject">{{art.TITLE_KO}}</td>
                                                                    <td ng-bind="art.pay_price | number : 0"></td>
                                                                    <td ng-if="art.CANCEL_YN != 'Y'"><a class="pay complete" href="#" ng-click="academyPayHis({'parent':this, 'academy':art});" class="ng-scope" >결제완료</a>
                                                                    <button class="btn btn_gray_line btn_sm"  type="button" data-id="{{art.PG_TRANS_ID}}" data-type="0" ng-if="art.PAY_METHOD_ID == 'card' && art.receipt == 'Y'" onclick="receiptPopup(this)"><span>결제영수증</span></button>
                                                                 	<button class="btn btn_gray_line btn_sm"  type="button" data-id="{{art.PG_TRANS_ID}}" data-type="1" ng-if="art.PAY_METHOD_ID == 'vbank' && art.receipt == 'Y'" onclick="receiptPopup(this)"><span>현금영수증</span></button>
                                                                    </td>
                                                                    <td ng-if="art.CANCEL_YN == 'Y'"><a class="pay">결제취소</a></td>
                                                                    <td>{{art.REG_DT | date:'yyyy-MM-dd'}}</td>
                                                                </tr>
                                                            <tbody  ng-if="academyCnt == 0">
                                                                <tr ><td colspan="4" class="tac">내역이 존재하지 않습니다.</td></tr>
                                                            </tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="list-wrap m-ver">
                                                        <ul class="academy-list" ng-repeat="art in academyList">
                                                            <li class="academy-list-ea">
                                                                <div class="title-wrap">
                                                                    <div class="bbs-subject">{{art.TITLE_KO}}</div>
                                                                </div>
                                                                <div class="cont-wrap">
                                                                    <dl>
                                                                        <dt>총 결제액</dt>
                                                                        <dd ng-bind="art.pay_price | number : 0" ></dd>
                                                                    </dl>
                                                                    <dl>
                                                                        <dt>결제현황</dt>
                                                                        <dd  ng-if="art.CANCEL_YN != 'Y'">
                                                                        <span class="pay complete" ng-click="academyPayHis({'parent':this, 'academy':art});">결제완료</span>
                                                                         <button class="btn btn_gray_line btn_sm"  type="button" data-id="{{art.PG_TRANS_ID}}" data-type="0" ng-if="art.PAY_METHOD_ID == 'card' && art.receipt == 'Y'" onclick="receiptPopup(this)"><span>결제영수증</span></button>
                                                                 		 <button class="btn btn_gray_line btn_sm"  type="button" data-id="{{art.PG_TRANS_ID}}" data-type="1" ng-if="art.PAY_METHOD_ID == 'vbank' && art.receipt == 'Y'" onclick="receiptPopup(this)"><span>현금영수증</span></button>
                                                                        </dd>
                                                                        <dd ng-if="art.CANCEL_YN == 'Y'"><span class="pay">결제취	소</span></dd>
                                                                    </dl>
                                                                    <dl>
                                                                        <dt>결제일시</dt>
                                                                        <dd>{{art.REG_DT | date:'yyyy-MM-dd'}}</dd>
                                                                    </dl>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>                                                   
                                                    <div class="wrap_paging" ng-if="academyCnt != 0">
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


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->
	
	<script>
        $(".js-history_back").click(function() {
        	window.location.href="/mypage/main";
        })
    </script>

    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>
    <!-- 팝업 : 결제완료 -->
	<jsp:include page="popup/academyPayPopup.jsp"/>
	
	<!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
	
</body>

</html>