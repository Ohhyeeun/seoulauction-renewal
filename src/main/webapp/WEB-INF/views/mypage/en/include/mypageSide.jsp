<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../../common/commonJs.jsp" flush="false"/>
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
					 <div class="mem-lv lv-2">Subscription Member</div>
					 
				</div>
				<div class="mem-record-box">
					<a href="#" class="record-button" ng-click="showMemHisPopup(this);">Membership History</a> 
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
					 <div class="mem-lv lv-1">Associate Member</div>
				</div>
			</div>
			<div class="mem-button-wrap">
			<a href="/payment/member">
				<button class="btn btn_point btn_lg" type="button" >
					<span>SeoulAuction Membership</span>
				</button>
			</a>
			</div>     
        </sec:authorize>  
		</div>
        
                       
                         
		<div class="mypage-lnb-wrap">
			<div class="mypage-lnb">
				<ul class="cate1">
					<li class="cate1-group"><span>Live Action Management</span>
						<ul>
							<li class="" id="liveBidReq"><a href="/mypage/liveBidReqList">Bids History</a></li>
							<li class="" id="liveBid"><a href="/mypage/liveBidList">Online Paddle Bid History</a></li>
						</ul></li>
					<li class="cate1-group"><span>Online Auction Management</span>
						<ul>
							<li class="" id="onlineBid"><a href="/mypage/onlineBidList">Bids History</a></li>
							<li class="" id="onlinePay"><a href="/mypage/onlinePayList">Payment & Purchase History</a></li>
						</ul></li>
					<li class="cate1-li" id="intelot"><a href="/mypage/inteLotList" class="">Favorites <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-li" id="inquiry"><a href="/mypage/inquiryList" class="">1:1 Inquiry <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-group"><span>Account Info</span>
						<ul>
							<li class="" id="custModify"><a href="/mypage/custModify">Change Information</a></li>
							<c:if test="${socialYn == 'N' }">
							<li class="" id="passwordModify"><a href="/mypage/passwordModify">Change Password</a></li>
							<li class="" id="snsLink"><a href="/mypage/snsLink">SNS Setting</a></li>
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
                                <span class="txt_title type-big"> Membership History</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <article class="article-area">
                                    <div class="memlv2_record_list-wrap" ng-repeat="pay in custPayList">
                                        <dl class="memlv2_record-list memlv2"  ng-if="pay.VALID == '정회원'" >
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>{{pay.VALID_FROM_DT_EN}} ~ {{pay.VALID_TO_DT_EN}}</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">Subscription Member</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">Payment Date</div>
                                                    <div class="txt">{{pay.PAY_DT_EN}}</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">Payment Method</div>
                                                    <div class="txt">{{pay.PAY_METHOD_NM_EN}}</div>
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
                                                    <div class="state-icon">Expiration</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">Payment Date</div>
                                                    <div class="txt">{{pay.payDate}}({{pay.weekDateEn}}) {{pay.payTime}}</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">Payment Method</div>
                                                    <div class="txt">{{pay.PAY_METHOD_CD}}</div>
                                                </div>
                                                 <div class="info-li btn-area">
                                                    <button class="btn btn_gray_line btn_sm" type="button" ng-if="pay.PAY_METHOD_ID == 'card' && pay.receipt == 'Y'" ng-click="receiptPopup({'pay':pay,'type':0})"><span>Card Receipt</span></button>
                                                    <button class="btn btn_gray_line btn_sm" type="button" ng-if="pay.PAY_METHOD_ID == 'vbank' && pay.receipt == 'Y'" ng-click="receiptPopup({'pay':pay,'type':1})"><span>Cash Receipt</span></button>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="data-empty" ng-if="custPayCnt == 0">
                                            <p class="txt_empty">No Membership History.</p>
                                    </div>
                                </article>
                                <div class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_gray_line js-closepop" href="#" role="button"><span>Closed</span></a>
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
                                <span class="txt_title type-big">Subscription member information</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <div class="con-wrap-line">
                                    <article class="group-box">
                                        <span class="box-title tt5">Annual fee</span>
                                        <ul class="mark_dot-list">
                                            <!-- [0613]텍스트수정 -->
                                            <li class="tb1">200,000 won for domestic residence, 500 USD for overseas residence (A year)</li>
                                            <!-- //[0613]텍스트수정 -->
                                        </ul>
                                    </article>
                                    <article class="group-box">
                                        <span class="box-title tt5">Benefits</span>
                                        <ul class="mark_dot-list">
                                            <li><span class="tb1">Qualification to participate in live auction (major, planned)</span></li>
                                            <li><span class="tb1">Send live auction catalog</span></li>
                                            <li><span class="tb1">Seoul Auction calendar sent</span></li>
                                        </ul>
                                    </article>
                                    <article class="group-box">
                                        <span class="box-title tt5">Refund Information</span>
                                        <ul class="mark_dot-list">
                                            <li><span class="tb1">Immediately after registration – less than 1 month : Full refund</span></li>
                                            <li><span class="tb1">More than 1 month – less than 3 month : 80% refund</span></li>
                                            <li><span class="tb1">More than 3 months – less than 6 months : 60% refund</span></li>
                                            <li><span class="tb1">More than 6 months after joining : No refund</span></li>
                                        </ul>
                                    </article>
                                    <!-- [0613]텍스트(문단)추가 -->
                                    <article class="group-box">
                                        <span class="box-title tt5">Question regarding to Subscription Membership</span>
                                        <ul class="mark_dot-list">
                                            <li><span class="tb1">(Phone) +82-2-2075-4422</span></li>
                                            <li><span class="tb1">(Email) info@seoulauction.com</span></li>
                                        </ul>
                                    </article>
                                    <!-- //[0613]텍스트(문단)추가 -->
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
    