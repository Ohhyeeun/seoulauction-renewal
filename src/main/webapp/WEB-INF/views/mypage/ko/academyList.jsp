<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<body class="">
	<div class="wrapper" ng-app="myApp">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/academy.js"></script>
            <!-- container -->
            <div id="container" class="academy" ng-controller="academyListCtl" data-ng-init="loadAcademyList(1)">
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
                                                                    <td ng-if="art.CANCEL_YN != 'Y'"><a class="pay complete" href="#"ng-click="academyPayHis({'parent':this, 'academy':art});" class="ng-scope" >결제완료</a></td>
                                                                    <td ng-if="art.CANCEL_YN == 'Y'"><a class="pay">결제취소</a></td>
                                                                    <td>{{art.REG_DT | date:'yyyy-MM-dd'}}</td>
                                                                </tr>
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
                                                                        <dd  ng-if="art.CANCEL_YN != 'Y'"><span class="pay complete">결제완료</span></dd>
                                                                        <dd ng-if="art.CANCEL_YN == 'Y'"><span class="pay">결제취소</span></dd>
                                                                    </dl>
                                                                    <dl>
                                                                        <dt>결제일시</dt>
                                                                        <dd>{{art.REG_DT | date:'yyyy-MM-dd'}}</dd>
                                                                    </dl>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- <div class="paging-area">
                                                        <div class="paging">
                                                            <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#" class="prev icon-page_prev">PREV</a>
                                                            <strong class="on">1</strong>
                                                            <a href="#"><em>2</em></a>
                                                            <a href="#"><em>3</em></a>
                                                            <a href="#"><em>4</em></a>
                                                            <a href="#"><em>5</em></a>
                                                            <span class="pc-ver">
                                                                <a href="#"><em>6</em></a>
                                                                <a href="#"><em>7</em></a>
                                                                <a href="#"><em>8</em></a>
                                                                <a href="#"><em>9</em></a>
                                                                <a href="#"><em>100</em></a>
                                                            </span>
                                                            <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a>
                                                        </div>
                                                    </div> -->
                                                    
                                                    <div class="paging-area">
                                                    <div class="paging">
														<paging page="currentPage"
															page-size=10
															total="academyCnt"
															paging-action="loadAcademyList(page)"
															scroll-top="true"
															hide-if-empty="true"
															show-prev-next="true"
															show-first-last="true"
															ul-class="paging"
															active-class="on"
														    disabled-class="page_disable"
														    text-next-class="next icon-page_next"
														    text-prev-class="prev icon-page_prev"
														    text-first-class="prev_end icon-page_prevprev"
														    text-last-class="next_end icon-page_nextnext">
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
                 <!-- 팝업 : 결제완료 -->
    <div id="popup_myacademy_pay-wrap" class="trp popupfixed-wrap myacademy_pay-popup">
        <div class="popup-dim"></div>
        <div class="popup-align mode-md mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">결제 정보</span>
                            </div>
                        </div>
                        <div class="pop-body">
                            <section class="section scroll-type">
                                <article class="article-area">
                                    <div class="academy-pay-wrap tb1">
                                        <div class="detail-wrap">
                                            <dl>
                                                <dt><span>수강료</span></dt>
                                                <dd><span>KRW {{academyPay}}</span></dd>
                                            </dl>
                                            <dl>
                                                <dt><span>할인금액</span></dt>
                                                <dd><span>KRW {{academyPayDiscount}}</span></dd>
                                            </dl>
                                        </div>
                                        <div class="total-wrap">
                                            <dl>
                                                <dt><span>총 결제금액</span></dt>
                                                <dd>
                                                    <span class="pay-amount">KRW {{academyPayTotal}}</span>
                                                    <span class="pay-method">{{academyPayMethodCd}}</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                </article>
                                <div class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_point href=" #" role="button"><span>확인</span></a>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
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


    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>
    <script>
        (function() {
            var popup_marketing1 = $(".js-popup_myacademy_pay").trpLayerFixedPopup("#popup_myacademy_pay-wrap");
            $(popup_marketing1.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_marketing1.open(this); // or false   
                popup_fixation("#popup_myacademy_pay-wrap"); // pc 스크롤
                popup_motion_open("#popup_myacademy_pay-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_myacademy_pay-wrap .js-closepop, #popup_myacademy_pay-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_marketing1.close();
                popup_motion_close("#popup_myacademy_pay-wrap");
            });

            $(".js-history_back").click(function() {
                window.history.back();
            })
        })();
    </script>
</body>

</html>