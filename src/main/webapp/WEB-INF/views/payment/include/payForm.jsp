<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--결제 폼--%>
<form name="payForm" method="post" action="/payment/memberProcess">
<input id="inputPayMethod" type="hidden" name="PayMethod" value=""/>
<input type="hidden" name="GoodsName" value="${goodsName}"/>
<input type="hidden" name="Amt" value="${price}"/>
<input type="hidden" name="MID" value="${mId}"/>
<input type="hidden" name="Moid" value="${moid}"/>
<input type="hidden" name="BuyerName" value="${name}"/>
<input type="hidden" name="BuyerEmail" value="${email}"/>
<input type="hidden" name="BuyerTel" value="${tel}"/>
<input type="hidden" name="ReturnURL" value="${returnURL}"/>
<!-- 옵션 -->
<input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) -->
<input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
<input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->

<!-- 변경 불가능 -->
<input type="hidden" name="EdiDate" value="${eDate}"/>			<!-- 전문 생성일시 -->
<input type="hidden" name="SignData" value="${signData}"/>	<!-- 해쉬값 -->
</form>