<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="/js/mypage/mypageSide.js"></script>
<sec:authentication property="details.socialYn" var="socialYn"/> 
<sec:authentication property="Details.userNm" var="userName"/>
<sec:authentication property="Details.validDate" var="validDate"/>
<sec:authentication property="Details.userKind" var="userKind"/>

<!-- 마이페이지 싸이드 메뉴 -->
<aside class="aside-area" ng-controller="myPageCtl" ng-init="loadMemberInfo()"  ng-cloak>
	<div class="aside-inner">
		<div class="mem-infobox-wrap">
			<div class="mem-name-wrap"> 
			
			<span class="tt2" ><%--
			--%><c:choose><%--
			--%><c:when test="${empty userName}">회원</c:when><%--
			--%><c:otherwise>${userName}</c:otherwise><%--
			--%></c:choose><%--
			--%></span><span class="tt4">님</span><%--
			--%></div>


			
			<div class="mem-info-wrap" ng-if="userRole=='1'">
				<div class="mem-lv-box">
					 <div class="mem-lv lv-2">정회원</div>
					 <div class="mem-period">{{validDate}}</div>
				</div>
				<div class="mem-record-box">
					<a href="#" class="record-button js-popup_memlv2_record" ng-click="showMemHisPopup();">정회원 이력</a> 
					<a href="#" class="tooltip-button js-popup_tooltip" ng-click="showTooltip();">
						<div class="txt-icon-tooltip">툴팁</div>
					</a>
				</div>
			</div>

        	<div class="mem-info-wrap" ng-if="userRole=='0'">
				<div class="mem-lv-box">
					 <div class="mem-lv lv-1">준회원</div>
				</div>
				<div class="mem-record-box">
					<a href="#" class="record-button js-popup_memlv2_record" ng-click="showMemHisPopup();">정회원 이력</a> 
					<a href="#" class="tooltip-button js-popup_tooltip" ng-click="showTooltip();">
						<div class="txt-icon-tooltip">툴팁</div>
					</a>
				</div>
			</div>
			<div class="mem-button-wrap" ng-if="userRole=='0'">
			<a href="/payment/member">
				<button class="btn btn_point btn_lg" type="button" >
					<span>정회원 신청하기</span>
				</button>
			</a>
			</div>     
		</div>
    
		<div class="mypage-lnb-wrap">
			<div class="mypage-lnb">
				<ul class="cate1">
					<li class="cate1-group"><span>라이브경매관리</span>
						<ul>
							<li class="" id="liveBidReq"><a href="/mypage/liveBidReqList">응찰신청내역</a></li>
							<li class="" id="liveBid"><a href="/mypage/liveBidList">온라인패들응찰내역</a></li>
						</ul></li>
					<li class="cate1-group"><span>온라인경매관리</span>
						<ul>
							<li class="" id="onlineBid"><a href="/mypage/onlineBidList">응찰내역</a></li>
							<li class="" id="onlinePay"><a href="/mypage/onlinePayList">결제/구매내역</a></li>
						</ul></li>
					<li class="cate1-li" id="intelot"><a href="/mypage/inteLotList" class="">관심작품 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-li" id="academy"><a href="/mypage/academyList" class="">아카데미신청내역 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-li" id="inquiry"><a href="/mypage/inquiryList?page=1" class="">1:1문의 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-group"><span>회원정보관리</span>
						<ul>
							<li class="" id="custModify"><a href="/mypage/custModify">회원정보수정</a></li>
							<c:if test="${socialYn == 'N' }">
							<li class="" id="passwordModify"><a href="/mypage/passwordModify">비밀번호수정</a></li>
							<c:if test="${userKind != 'company' }">
							<li class="" id="snsLink"><a href="/mypage/snsLink">SNS연동설정</a></li>
							</c:if>
							</c:if>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</aside>