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
				<span class="title_tac">회원님과 동일한 아이디로 다른 PC에서 동시 접속하여 
                 자동으로 로그아웃 되었습니다.<br>
                 본인이 아닌 경우 다시 로그인을 하시거나,<br class="only-pc">
                 고객센터에 문의해 주세요.</span>
			</div>
			<div class="btn_wrap">
				<span><button type="button" ng-click="closeThisDialog(this);">확인</button></span>
			</div>
		</div>
	</div>
	
</div>