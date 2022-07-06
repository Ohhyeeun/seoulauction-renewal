<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<body class="">
	<div class="wrapper" ng-app="myApp">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/inquiry.js"></script>
			<!-- container -->
			<div id="container" class="inquiry" ng-controller="inquiryListCtl"
				data-ng-init="loadInquiryList(1);" style="opacity: 0" opacity=1>
				<div id="contents" class="contents">

					<section class="basis-section last-section mypage-section">
						<div class="section-inner">

							<div class="content-panel type_panel-mypage_inquiry">
								<div class="panel-body">
									<div class="mypage-container">

										<!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

										<div class="content-area">
											<div class="subtitle-wrap">
												<div class="subtitle-inner">
													<div class="title">
														<span class="tt2">1:1 Inquiry</span>
													</div>
													<div class="btn-wrap js-history_back m-ver">
														<i class="icon-page_back"></i>
													</div>
												</div>
											</div>
											<div class="contents-wrap">
												<article class="tit-btnbox">
													<a href="/mypage/inquiryForm"><button
															class="btn btn_point" type="button">
															<span>Write Inquiry</span>
														</button></a>
												</article>
												<article class="inquiry-list-wrap">
													<ul class="inquiry-list" ng-repeat="inquiry in inquiryList">
														<li class="inquiry-list-ea">
															<div class="bbs-division">
																{{inquiry.P_CATE_NM_EN}}{{inquiry.CATE_NM_EN != '' ? ' / '+inquiry.CATE_NM_EN : ''}}
															</div>
															<a href="/mypage/inquiryDetail?writeNo={{inquiry.WRITE_NO}}">
															<div class="bbs-subject tt4">
																<span>{{inquiry.TITLE}}</span>
															</div>
															</a>
															<div class="bbs-subbox">
																<div class="statebox" >
																	<div class="state-icon complete" ng-if="inquiry.REPLY_YN == 'Y'">Complete</div>
																	<div class="state-icon pending" ng-if="inquiry.REPLY_YN != 'Y'">Waiting</div>
																</div>
																<div class="date tb1">{{inquiry.REG_DT_EN}}</div>
															</div>
														</li>
													</ul>
													 <div class="wrap_paging"  ng-if="inquiryCnt != 0">
														<paging page="currentPage"
															page-size=10
															total="inquiryCnt"
															paging-action="loadInquiryList(page)"
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
												<article class="inquiry-list-wrap" ng-if="inquiryCnt == 0">
                                                    <div class="data-empty">
                                                        <p class="txt_empty">1:1 inquiry history does not exist.</p>
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
					<a href="#" class="btn-scroll_top js-scroll_top"><i
						class="icon-scroll_top"></i></a>
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

    <script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>
   
    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>

</body>

</html>