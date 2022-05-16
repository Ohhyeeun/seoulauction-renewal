<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="custom-modal" class="modal modal02"
	style="top: 50px; display: block;" data-ng-init="init();">
	<div class="pop-header">
		<a class="btn_close icon-pop_close js-closepop" ng-click="closeThisDialog(this);" title="닫기">X</a>
		<div class="title-box_tac change_title">
			<p class="">비밀번호 변경 안내</p>
			<p class="title_sub">
				소중한 개인정보 보호를 위해<br> 비밀번호를 변경해 주세요!
			</p>
		</div>
	</div>
	<div class="pop-body">
		<div class="info_box">
			<ul class="tb1 mark_dot-list change_txt">
				<li>타사이트와 동일한 로그인 정보를 사용하시는 회원님께서는 반드시 비밀번호를 변경해 주세요.</li>
				<li>비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합으로 8자~16자로 만들어 주세요.</li>
				<li>주기적으로 비밀번호를 변경해 주세요.</li>
			</ul>
		</div>
		<article class="button-area confirm_btn change_btn">
			<div class="btn_set-float tac">
				<span><button type="button" ng-click="reAlarm();">30일뒤 재알림</button></span> 
				<span><button type="button" ng-click="modPassword();">지금 변경하기</button></span>
			</div>
		</article>
	</div>

</div>