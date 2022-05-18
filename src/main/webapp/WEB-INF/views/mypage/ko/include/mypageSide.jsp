<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<body>  
	<!-- 마이페이지 싸이드 메뉴 -->
	<aside class="aside-area">
	    <div class="aside-inner">
	        <div class="mem-infobox-wrap">
	            <div class="mem-name-wrap">
	                <span class="tt2">홍길동</span><span class="tt4">님</span>
	            </div>
	            <div class="mem-info-wrap">
	                <div class="mem-lv-box">
	                    <div class="mem-lv lv-1">준회원</div>
	                </div>
	                <div class="mem-record-box">
	                    <a href="#" class="record-button">정회원 이력</a>
	                    <a href="#" class="tooltip-button">
	                        <div class="txt-icon-tooltip">툴팁</div>
	                    </a>
	                </div>
	            </div>
	            <div class="mem-button-wrap">
	                <button class="btn btn_point btn_lg" type="button"><span>정회원 신청하기</span></button>
	            </div>
	        </div>
	        <div class="mypage-lnb-wrap">
	            <div class="mypage-lnb">
	                <ul class="cate1">
	
	
	                    <li class="cate1-group">
	                        <span>라이브경매관리</span>
	                        <ul>
	                            <li class=""><a href="#">응찰신청내역</a></li>
	                            <li class=""><a href="#">온라인패들응찰내역</a></li>
	                        </ul>
	                    </li>
	                    <li class="cate1-group">
	                        <span>온라인경매관리</span>
	                        <ul>
	                            <li class=""><a href="#">응찰내역</a></li>
	                            <li class=""><a href="#">결제/구매내역</a></li>
	                        </ul>
	                    </li>
	                    <li class="cate1-li ">
	                        <a href="#" class="">관심작품 <i class="icon-view_more"></i></a>
	                    </li>
	                    <li class="cate1-li ">
	                        <a href="#" class="">아카데미신청내역 <i class="icon-view_more"></i></a>
	                    </li>
	                    <li class="cate1-li on">
	                        <a href="/mypage/inquiryList" class="">1:1문의 <i class="icon-view_more"></i></a>
	                    </li>
	                    <li class="cate1-group">
	                        <span>회원정보관리</span>
	                        <ul>
	                            <li class=""><a href="#">회원정보수정</a></li>
	                            <li class=""><a href="#">비밀번호수정</a></li>
	                            <li class=""><a href="#">SNS연동설정</a></li>
	                            <li class=""><a href="/mypage/deliveryList">배송지관리</a></li>
	                            <li class=""><a href="#">회원탈퇴</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</aside>
	
</body>