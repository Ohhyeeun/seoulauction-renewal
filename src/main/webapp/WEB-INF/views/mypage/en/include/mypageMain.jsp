<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sec:authentication property="details.socialYn" var="socialYn"/> 
<sec:authentication property="Details.userNm" var="userName"/>
<sec:authentication property="Details.validDate" var="validDate"/> 

<!DOCTYPE html>
<html lang="en">
    <head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>mypage | Seoul Auction</title>
	</head>
<body class="" ng-controller="myPageCtl"  ng-init="loadMemberInfo()">
    <div class="wrapper">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../../include/en/header.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/mypageSide.js"></script>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_main">
                                <div class="panel-body">
                                    <div class="mypage-container">



                                        <!-- 마이페이지 싸이드 메뉴 -->
										<aside class="aside-area"  >
											<div class="aside-inner">
												<div class="mem-infobox-wrap">
													<div class="mem-name-wrap">
													
													<span class="tt2" >
													<c:choose>
													<c:when test="${empty userName}">MEMBER</c:when>
													<c:otherwise>${userName}</c:otherwise>
													</c:choose> 
													</span><span class="tt4"></span>
													</div>
													
													<div class="mem-info-wrap" ng-if="userRole=='1'">
														<div class="mem-lv-box">
															 <div class="mem-lv lv-2">Subscription Member</div>
															 <div class="mem-period">${validDate}</div>
															 
														</div>
														<div class="mem-record-box">
															<a href="#" class="record-button js-popup_memlv2_record" ng-click="showMemHisPopup(this);">Membership History</a> 
															<a href="#" class="tooltip-button js-popup_tooltip" ng-click="showTooltip();">
																<div class="txt-icon-tooltip">tooltip</div>
															</a>
														</div>
													</div>
										        	<div class="mem-info-wrap" ng-if="userRole=='0'">
														<div class="mem-lv-box">
															 <div class="mem-lv lv-1">Associate Member</div>
														</div>
														<div class="mem-record-box">
															<a href="#" class="record-button js-popup_memlv2_record" ng-click="showMemHisPopup(this);">Membership History</a> 
															<a href="#" class="tooltip-button js-popup_tooltip" ng-click="showTooltip();">
																<div class="txt-icon-tooltip">tooltip</div>
															</a>
														</div>
													</div>
													<div class="mem-button-wrap" ng-if="userRole=='0'">
													<a href="/payment/member">
														<button class="btn btn_point btn_lg" type="button" >
															<span>SeoulAuction Membership</span>
														</button>
													</a>
													</div>     
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
                                    </div>
                                </div>
                                <div class="panel-footer"></div>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
           <jsp:include page="../../../include/en/footer.jsp" flush="false" />
            <!-- //footer -->

            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>
    </div>


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>


    <script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>



	<!-- 팝업 : side popup -->
	<jsp:include page="mypageSidePopup.jsp" flush="false"/>
</body>

</html>