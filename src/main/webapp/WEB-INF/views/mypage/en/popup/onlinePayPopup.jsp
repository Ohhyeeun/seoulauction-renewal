<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="custom-modal" class="modal modal02"
	style="top: 200px; display: block;">
	<div>
		<button type="button" ng-click="close()"
			class="sp_btn btn_pop_close">
			<span class="hidden">닫기</span>
		</button>
		<div class="title">
			<h2>결제정보</h2>
		</div>
		<div class="cont">
			<div class="cont_title">
				<p class="txt_dot">결제 이력을 확인합니다.</p>
			</div>
			<div>
				<table>
						<tr>
							<th >수강료</th>
							<th >KRW</th>
							<th >{{academyPay}}</th>
						</tr>
						<tr>
							<td >할인금액</td>
							<td >KRW</td>
							<td >{{academyPayDiscount}}</td>
						</tr>
						<tr>
							<td >총 결제금액</td>
							<td >KRW</td>
							<th >{{academyPayTotal}}</th>
						</tr>
				</table>
			</div>
			<div class="btn_wrap">
				<span class="btn_style01 gray mid"><button type="button" ng-click="closeThisDialog(this);">확인</button></span>
			</div>
		</div>
	</div>
</div>