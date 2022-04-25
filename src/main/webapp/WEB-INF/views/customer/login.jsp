<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<body>
	<div id="container" ng-controller="loginCtl">
		<form id="loginForm" action="/processLogin" method="post">
			<fieldset>
				<div class="bg_img bg01">
					<div>
						<h2>
							<spring:message code="label.login" />
						</h2>
						<p>
							<spring:message code="label.loginmess" />
						</p>
					</div>
					<div>
						<div>
							<input type="text" name="loginId" id="loginId" ng-model="form_data.loginId" placeholder="<spring:message code="label.loginId" />" title="Id" autofocus="autofocus" /> 
							<input type="password" name="password" id="password" ng-model="form_data.password" placeholder="<spring:message code="label.putpassword" />" title="password" />
							<input type="checkbox" id="remember-me" name="remember-me" />
							<p id="token-result"></p>
						</div>
		
						<div>
							<button type="submit">
								<spring:message code="label.login" />
							</button>
						</div>
					</div>
				</div>
			</fieldset>
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
		</form>
	</div>
</body>
</html>