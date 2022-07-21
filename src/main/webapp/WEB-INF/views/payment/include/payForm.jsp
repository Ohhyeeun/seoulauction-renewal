<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--결제 폼--%>
<form name="payForm" method="post" action="${formProcessUrl}">
    <!-- 기본정보 -->
    <input type="hidden" id="inputPayMethod" name="PayMethod" value="CARD" />   <!-- 결제 수단 -->
    <input type="hidden" name="GoodsName" value="${goodsName}" />               <!-- 결제 상품금액 -->
    <input type="hidden" name="Amt" value="${price}" />                         <!-- 상점 아이디 -->
    <input type="hidden" name="MID" value="${mId}" />                           <!-- 결제 수단 -->
    <input type="hidden" name="Moid" value="${moid}" />                         <!-- 상품 주문번호 -->
    <input type="hidden" name="BuyerName" value="${cust_name}" />               <!-- 구매자명 -->
    <input type="hidden" name="BuyerEmail" value="${email}" />                  <!-- 구매자 이메일 -->
    <input type="hidden" name="BuyerTel" value="${hp}" />                       <!-- 구매자 연락처 -->
    <input type="hidden" name="ReturnURL" value="${returnURL}" />               <!-- 인증완료 결과처리 URL, (모바일 결제창 전용)PC 결제창 사용시 필요 없음 -->

    <!-- 옵션 -->
    <input type="hidden" name="GoodsCl" value="1"/>						        <!-- 상품구분(실물(1),컨텐츠(0)) -->
    <input type="hidden" name="TransType" value="0"/>					        <!-- 일반(0)/에스크로(1) -->
    <input type="hidden" name="CharSet" value="utf-8"/>					        <!-- 응답 파라미터 인코딩 방식 -->
    <input type="hidden" name="VbankExpDate" value="" />                        <!-- 가상계좌입금만료일(YYYYMMDD) -->
    <input type="hidden" name="ReqReserved" value="uuid=${uuid},pay_kind=${pay_kind}" />

    <!-- 변경 불가능 -->
    <input type="hidden" name="EdiDate" value="${ediDate}"/>			        <!-- 전문 생성일시 -->
    <input type="hidden" name="SignData" value="${signData}"/>	                <!-- 해쉬값 -->

    <input type="hidden" name="LogoImage" value="">
    <input type="hidden" name="NpLang" value="KO">
    <input type="hidden" name="CurrencyCode" value="KRW">

    <%--아카데미 정보--%>
    <input type="hidden" name="academy_no" value="${academy_no}">

    <%-- 작품 정보 --%>
    <input type="hidden" name="sale_no" value="${lotInfo.SALE_NO}">
    <input type="hidden" name="lot_no" value="${lotInfo.LOT_NO}">
</form>