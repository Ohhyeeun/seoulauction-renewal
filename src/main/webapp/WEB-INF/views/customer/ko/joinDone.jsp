<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<div class="wrapper">
	<div class="sub-wrap pageclass">
		<jsp:include page="../../include/ko/nav.jsp" flush="false"/>

		<div id="container">
			<div id="contents" class="contents">
				<section class="basis-section last-section back_gray">
					<div class="section-inner">
						<div class="content-panel type_panel-member">
							<div class="panel-header">
								<div class="title">
									<span class="tt2">회원가입 완료되었습니다.</span>
								</div>
							</div>
							<div class="panel-body">

								<div class="complete-wrap">
									<div class="join_txt-wrap">
										<p class="join_txt ">
											<b><sec:authentication property="Details.userNm"/></b> 님은 <span class="level">
												<sec:authorize access="hasRole('ROLE_REGULAR_USER')">
													정회원
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_ASSOCIATE_USER')">
													준회원
												</sec:authorize>
											</span>입니다.
										</p>
									</div>
									<div class="join_guide">
										<p class="tt4">준회원 및 정회원 안내</p>
										<dl>
											<dt class="mem_txt">준회원</dt>
											<dd>
												<!-- [0502] -->
												<ul class="dot_list tb1">
													<li>온라인 경매 응찰 자격 부여 낙찰 시, 수수료 <br class="only-pc">별도 부가</li>
												</ul>
												<!-- //[0502] -->
											</dd>
										</dl>
										<dl>
											<dt class="mem_txt">정회원</dt>
											<!-- [0502] -->
											<dd>
												<ul class="dot_list tb1">
													<li>연회비</li>
												</ul>
												<p class="tb1">국내 거주 20만원, 해외거주 500USD</p>
												<ul class="dot_list tb1">
													<li>혜택</li>
												</ul>
												<p class="tb1">라이브 경매(메이저, 기획) 참여 자격 부여</p>
												<p class="tb1">라이브 경매 도록 발송</p>
												<p class="tb1">서울옥션 달력 발송</p>

												<div class="btn_line">
													<a href="/payment/member" class="btn btn_gray_line pr0"><span>정회원 신청 바로가기</span><i class="icon-page_next"></i></a>
												</div>
											</dd>
											<!-- //[0502] -->
										</dl>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<article class="button-area">
									<div class="btn_set-float tac">
										<a class="btn btn_point btn_lg" href="#" role="button"><span>메인으로 이동</span></a>
									</div>
								</article>
							</div>

						</div>

					</div>
				</section>
			</div>
		</div>
		<jsp:include page="../../include/ko/footer.jsp" flush="false"/>
	</div>
</div>
</body>
</html>