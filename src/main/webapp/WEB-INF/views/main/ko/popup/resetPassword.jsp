<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="custom-modal" class="modal modal02" style="top: 50px; display: block;" data-ng-init="init();">
	<div id="overlay">
		<div class="title">
			<h2></h2>
		</div>
		<div class="cont">
			<div class="cont_title">
				<span class="title_tac">관리자에 의해 비밀번호가 초기화 되었습니다.<br>
                 안전한 개인정보 보호를 위해 비밀번호를 변경해 주세요.</span>
			</div>
			<div class="btn_wrap">
				<span><button type="button" ng-click="closePopup();">닫기</button></span>
				<span><button type="button" ng-click="closePopup();">지금 변경하기</button></span>
			</div>
		</div>
	</div>
	
</div>