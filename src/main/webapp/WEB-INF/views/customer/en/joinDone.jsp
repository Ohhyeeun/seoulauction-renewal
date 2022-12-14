<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<body>
<div class="wrapper">
	<div class="sub-wrap pageclass">
		<jsp:include page="../../include/en/nav.jsp" flush="false" />

		<div id="container" ng-controller="joinDoneCtl" data-ng-init="init();" ng-cloak>
			<div id="contents" class="contents">
				<section class="basis-section last-section back_gray">
					<div class="section-inner">
						<div class="content-panel type_panel-member">
							<div class="panel-header complete_title">
								<div class="title">
									<span class="tt2">Registration complete</span>
								</div>
							</div>
							<div class="panel-body">
								<div class="complete-wrap">
									<div class="complete_area">
										<p class="tb1">An email has been sent for email verification.</p>
										<p class="tb1">Please verify your email address to complete membership registration.</p>
										<div class="complete_msg">
											<p class="tt5"><strong>Registration email address</strong></p>
											<p class="tt5 mt5"><em>{{email}}</em></p>
										</div>
										<p class="tb1">If you do not receive the registration confirmation email, please check your spam folder or contact Seoul Auction Customer Center ( <a href="mailto:info@seoulauction.com">info@seoulauction.com</a> ).</p>
									</div>

									<div class="join_guide">
										<p class="tt4">Guide for Members</p>
										<dl>
											<dt class="mem_txt">Associate Member</dt>
											<dd>
												<ul class="dot_list tb1">
													<li>Limited service on the Seoul Auction website</li>
												</ul>
											</dd>
										</dl>
										<dl>
											<dt class="mem_txt">Regular member</dt>
											<dd>
												<ul class="dot_list tb1">
													<li>Must pay annual fee of USD 500</li>
													<li>Allowed to bid in auctions</li>
													<li>Receives auction invitations</li>
													<li>Receives auction catalog (for each year of membership)</li>
													<li>Permitted to participate in exhibitions and various events</li>
													<li>Has free access to information on Seoul Auction website</li>
												</ul>
												<!-- ????????????
					  <div class="btn_line">
						<a href="#none" class="btn btn_gray_line pr0"><span>????????? ?????? ????????????</span><i class="icon-page_next"></i></a>
					  </div>
					   -->
											</dd>
										</dl>
									</div>
								</div>
							</div>
							<%-- ???????????? --%>
							<div class="panel-footer">
								<article class="button-area">
									<div class="btn_set-float tac">
										<a class="btn btn_point btn_lg" href="/" role="button"><span>Go to Main</span></a>
									</div>
								</article>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../include/en/footer.jsp" flush="false"/>
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
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>
