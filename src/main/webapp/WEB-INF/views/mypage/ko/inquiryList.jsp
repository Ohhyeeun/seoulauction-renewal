<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<body>  
<jsp:include page="../../include/ko/header.jsp" flush="false"/>   
<div id="wrap" ng-app="myApp">
    <script type="text/javascript" src="/js/mypage/inquiry.js"></script>
	<section class="main-contents footer-bottom">
	<div class="container_wrap" ng-controller="inquiryListCtl" data-ng-init="loadInquiryList(1);">
		<div id="container">
			<div class="contents_wrap">
				<div class="contents">
					<div class="tit_h2">
						<h2><spring:message code="label.membership.inquery" /></h2>
						<p><spring:message code="message.membership.inquery" /></p>
					</div>
					<div class="sort_area">
						<ul>
							<li ng-class="{sele:!emp_read_yn && !complet_yn}"><a href="#" ng-click="loadInquiryList(1);"><spring:message code="label.membership.inqueryall" /></a></li>
						</ul>
					</div>
					<div class="tbl_top">
						<div class="left">
							<div class="txt"><spring:message code="label.membership.inquery01" /> <span class="txt_green">{{inquiryCnt}}</span> <spring:message code="label.membership.inquery21" /></div>
						</div>
						<div class="right web_only">
						</div>
					</div>
					<div class="tbl_style02 m_tbl_z059">
						<table style="table-layout:fixed !important;">
							<caption><spring:message code="label.membership.inquery" /></caption>
							<colgroup>
								<col style="width:12%" />
								<col />
								<col style="width:9%" />
								<col style="width:14%" />
								<col style="width:9%" />
								<col style="width:9%" />
								<col style="width:13%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><spring:message code="label.membership.inquerydate" /></th>
									<th scope="col"><spring:message code="label.membership.inquerytitle" /></th>
									<th colspan="2" scope="col"><spring:message code="label.membership.inquerytype" /></th>
									<th scope="col"><spring:message code="label.membership.inquerynow" /></th>
									<th scope="col"><spring:message code="label.membership.inqueryst" /></th>
									<th scope="col"><spring:message code="label.membership.inqueryendt" /></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="inquiry in inquiryList">
									<td>{{inquiry.REG_DT | date:'yyyy-MM-dd'}}</td>
									<td class="tal ellipsis"><a href="/mypage/inquiryDetail?writeNo={{inquiry.WRITE_NO}}">{{inquiry.TITLE}}</a></td>
									<td>{{inquiry.P_CATE_NM}}</td>
									<td>{{inquiry.CATE_NM}}</td>
									<!--  <td>{{inquiry.EMP_READ_YN == 'Y' ? '<spring:message code="label.membership.inqueryread" />' : '<spring:message code="label.membership.inquerynotread" />'}}</td> -->
									<td>{{inquiry.REPLY_YN == 'Y' ? '<spring:message code="label.membership.inqueryread" />' : '<spring:message code="label.membership.inquerynotread" />'}}</td>
									<td>{{inquiry.EMP_NAME}}</td>
									<td>{{inquiry.LAST_REPLY_DT | date:'yyyy-MM-dd'}}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="wrap_paging">
						<paging page="currentPage"
							page-size="pageRows"
							total="inquiryCnt"
							paging-action="loadInquiryList(page)"
							scroll-top="true"
							hide-if-empty="true"
							show-prev-next="true"
							show-first-last="true"
							ul-class="page_ul"
							active-class="page_active"
						    disabled-class="page_disable"
						    text-next-class="page_btn sp_btn btn_next02"
						    text-prev-class="page_btn sp_btn btn_prev02"
						    text-first-class="page_btn sp_btn btn_prev"
						    text-last-class="page_btn sp_btn btn_next">
						</paging>
						<div class="right m_right">
							<span class="btn btn_style01 dark"><a href="/mypage/inquiryForm"></a></span>
						</div>
					</div> 
				</div>
			</div>

		</div>
	</div>
	</section>
</div>
    <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
    
</body>