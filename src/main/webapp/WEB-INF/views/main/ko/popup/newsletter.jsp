<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 뉴스레터 팝업 -->
<div class="blackBg newsletter-blackBg">
	<div class="newsletter-termsbox">
		<div id="terms" class="newsletter-terms">
			<div class="closebtn closebtn-b newsAgree-close"></div>
			<input type="checkbox" id="newsAgree" class="common_checkbox" value='newsAgree' name="newsAgree">
			<label for="newsAgree">
				<span class="newsAgree-checktxt">개인정보 수집 및 이용에 동의 합니다.</span>
			</label>
			<p class="newsAgree-txt">
				뉴스레터 발송을 위한 최소한의 개인정보를 수집하고 이용합니다. 수집된
				정보는 발송 외 다른 목적으로 이용되지 않으며, 서비스가 종료되거나
				구독을 해지할 경우 즉시 파기됩니다.
			</p>
			<button type="submit"  class="commonbtn btn-bg-g newsAgree-btn">확인</button>
		</div>
		<div id="termsResult" class="newsletter-terms newsletter-comfirmbox">
			<p class="newsAgree-comfirm">
				구독해주셔서 감사합니다.
			</p>
			<button type="submit"  class="commonbtn btn-bg-b newsAgree-comfirmbtn">확인</button>
		</div>
	</div>
</div>