<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="/js/mypage/mypageSide.js"></script>
<sec:authentication property="details.socialYn" var="socialYn"/> 
<sec:authentication property="Details.userNm" var="userName"/>
<sec:authentication property="Details.validDate" var="validDate"/> 

<!-- 마이페이지 싸이드 메뉴 -->
<div ng-controller="myPageCtl">
<aside class="aside-area"  >
	<div class="aside-inner">
		<div class="mem-infobox-wrap">
			<div class="mem-name-wrap">
			
			<span class="tt2" >
			<c:choose>
			<c:when test="${empty userName}">회원</c:when>
			<c:otherwise>${userName}</c:otherwise>
			</c:choose> 
			</span><span class="tt4">님</span>
			</div>
			
			<sec:authorize access="hasRole('ROLE_REGULAR_USER')">
			<div class="mem-info-wrap">
				<div class="mem-lv-box">
					 <div class="mem-lv lv-2">정회원</div>
					 
				</div>
				<div class="mem-record-box">
					<a href="#" class="record-button" ng-click="showMemHisPopup(this);">정회원 이력</a> 
					<a href="#" class="tooltip-button" ng-click="showTooltip();">
						<div class="txt-icon-tooltip">툴팁</div>
					</a>
				</div>
			</div>
			<div class="mem-button-wrap">
				<button class="btn btn_point btn_lg" type="button" >
					<span>${validDate}</span>
				</button>
			</div>  
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ASSOCIATE_USER')"> 
        	<div class="mem-info-wrap">
				<div class="mem-lv-box">
					 <div class="mem-lv lv-1">준회원</div>
				</div>
			</div>
			<div class="mem-button-wrap">
			<a href="/payment/member">
				<button class="btn btn_point btn_lg" type="button" >
					<span>정회원 신청하기</span>
				</button>
			</a>
			</div>     
        </sec:authorize>  
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
					<li class="cate1-li" id="inquiry"><a href="/mypage/inquiryList" class="">1:1문의 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-group"><span>회원정보관리</span>
						<ul>
							<li class="" id="custModify"><a href="/mypage/custModify">회원정보수정</a></li>
							<c:if test="${socialYn == 'N' }">
							<li class="" id="passwordModify"><a href="/mypage/passwordModify">비밀번호수정</a></li>
							<li class="" id="snsLink"><a href="/mypage/snsLink">SNS연동설정</a></li>
							</c:if>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</aside>
<script>

</script>

<!-- 팝업 : 정회원 결제 이력 -->
    <div id="popup_memlv2_record-wrap" class="trp popupfixed-wrap memlv2_record-popup" >
        <div class="popup-dim"></div>
        <div class="popup-align mode-md mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">결제 이력</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <article class="article-area">
                                    <div class="memlv2_record_list-wrap" ng-repeat="pay in custPayList">
                                        <dl class="memlv2_record-list memlv2"  ng-if="pay.VALID == '정회원'" >
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>{{pay.VALID_FROM_DT}} ~ {{pay.VALID_TO_DT}}</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">{{pay.VALID}}</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">결제일</div>
                                                    <div class="txt">{{pay.payDate}}({{pay.weekDate}}) {{pay.payTime}}</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">{{pay.PAY_METHOD_NM}}</div>
                                                </div>
                                                 <div class="info-li btn-area">
                                                    <button class="btn btn_gray_line btn_sm" type="button" ng-if="pay.PAY_METHOD_ID == 'card' && pay.receipt == 'Y'" ng-click="receiptPopup({'pay':pay,'type':0})"><span>카드영수증</span></button>
                                                    <button class="btn btn_gray_line btn_sm" type="button" ng-if="pay.PAY_METHOD_ID == 'vbank' && pay.receipt == 'Y'" ng-click="receiptPopup({'pay':pay,'type':1})"><span>현금영수증</span></button>
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="memlv2_record-list expiry" ng-if="pay.VALID == '기간만료'" >
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>{{pay.VALID_FROM_DT}} ~ {{pay.VALID_TO_DT}}</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">{{pay.VALID}}</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">결제일</div>
                                                    <div class="txt">{{pay.payDate}}({{pay.weekDate}}) {{pay.payTime}}</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">{{pay.PAY_METHOD_NM}}</div>
                                                </div>
                                                 <div class="info-li btn-area">
                                                    <button class="btn btn_gray_line btn_sm" type="button" ng-if="pay.PAY_METHOD_ID == 'card' && pay.receipt == 'Y'" ng-click="receiptPopup({'pay':pay,'type':0})"><span>카드영수증</span></button>
                                                    <button class="btn btn_gray_line btn_sm" type="button" ng-if="pay.PAY_METHOD_ID == 'vbank' && pay.receipt == 'Y'" ng-click="receiptPopup({'pay':pay,'type':1})"><span>현금영수증</span></button>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="data-empty" ng-if="custPayCnt == 0">
                                            <p class="txt_empty">결제내역이 존재하지 않습니다.</p>
                                    </div>
                                </article>
                                <div class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_gray_line js-closepop" href="#" role="button"><span>닫기</span></a>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
        <!-- 팝업 : 정회원 결제 이력 -->
    <div id="popup_tooltip-wrap" class="trp popupfixed-wrap tooltip-popup">
        <div class="popup-dim"></div>
        <div class="popup-align mode-md mode-mb_fixed">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">정회원 이력</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <div class="con-wrap-line">
                                    <article class="group-box">
                                        <span class="box-title tt5">연회비</span>
                                        <ul class="mark_dot-list">
                                            <li><span class="tb1">국내 거주 20만원, 해외거주 500USD</span></li>
                                        </ul>
                                    </article>
                                    <article class="group-box">
                                        <span class="box-title tt5">혜택</span>
                                        <ul class="mark_dot-list">
                                            <li><span class="tb1">라이브 경매(메이저, 기획) 참여 자격 부여</span></li>
                                            <li><span class="tb1">라이브 경매 도록 발송</span></li>
                                            <li><span class="tb1">서울옥션 달력 발송</span></li>
                                        </ul>
                                    </article>
                                    <article class="group-box">
                                        <span class="box-title tt5">환불안내</span>
                                        <ul class="mark_dot-list">
                                            <li><span class="tb1">가입 직후 – 1개월 미만: 전액 환불</span></li>
                                            <li><span class="tb1">1개월 이상 – 3개월 미만: 80% 환불</span></li>
                                            <li><span class="tb1">3개월 이상 – 6개월 미만: 60% 환불</span></li>
                                            <li><span class="tb1">가입 후 6개월 이상: 환불 미 진행</span></li>
                                        </ul>
                                    </article>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
    