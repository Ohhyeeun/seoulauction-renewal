<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../../../common/commonJs.jsp" flush="false"/>
<script>
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('myPageCtl', function($scope, consts, common, ngDialog) {
	$scope.showMemHisPopup = function() {
        axios.get('/api/mypage/memberHistories' , null)
        .then(function(response) {
            const result = response.data;

            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
            	console.log(result.data);
            	$scope.custPayList = result.data;
            	$scope.$apply();
            	document.getElementById('popup_memlv2_record-wrap').style.display = "block";
            } 
        })
        .catch(function(error){
            console.log(error);
        });
        
	}
	
	$scope.showTooltip = function() {
		document.getElementById('popup_tooltip-wrap').style.display = "block";
	}
	
	$scope.showRegularPayPopup = function(){
	//모바일에서 결제막음 - blueerr
	if(getCookie("mobileFlag") == 'mobile'){
		alert('앱모바일 결제는 준비중입니다. PC 또는 모바일 브라우저에서 결제를 하시기 바랍니다.');
		return;
	}
	window.open('/customer/TermCheckPop?locale='+$scope.locale,'popup','width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0,left=500,top=100');
//	window.open('/customer/payRegularRequest','popup','width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0');
	}
	
	
});


</script>


<!-- 마이페이지 싸이드 메뉴 -->
<div ng-controller="myPageCtl">
<aside class="aside-area"  >
	<div class="aside-inner">
		<div class="mem-infobox-wrap">
			<div class="mem-name-wrap">
				<span class="tt2"><sec:authentication property="Details.userNm"/></span><span class="tt4">님</span>
			</div>
			<div class="mem-info-wrap">
				<div class="mem-lv-box">
					<div class="mem-lv lv-1">
					<sec:authorize access="hasRole('ROLE_REGULAR_USER')">
						정회원
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ASSOCIATE_USER')">
						준회원
					</sec:authorize>
					</div>
				</div>
				<div class="mem-record-box">
					<a href="#" class="record-button" ng-click="showMemHisPopup(this);">정회원 이력</a> 
					<a href="#" class="tooltip-button" ng-click="showTooltip();">
						<div class="txt-icon-tooltip">툴팁</div>
					</a>
				</div>
			</div>
			<div class="mem-button-wrap">
				<button class="btn btn_point btn_lg" type="button">
					<span>정회원 신청하기</span>
				</button>
			</div>
		</div>
		<div class="mypage-lnb-wrap">
			<div class="mypage-lnb">
				<ul class="cate1">
					<li class="cate1-group"><span>라이브경매관리</span>
						<ul>
							<li class=""><a href="#">응찰신청내역</a></li>
							<li class=""><a href="#">온라인패들응찰내역</a></li>
						</ul></li>
					<li class="cate1-group"><span>온라인경매관리</span>
						<ul>
							<li class=""><a href="#">응찰내역</a></li>
							<li class=""><a href="#">결제/구매내역</a></li>
						</ul></li>
					<li class="cate1-li " ><a href="#" class="">관심작품 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-li" id="academy"><a href="/mypage/academyList" class="">아카데미신청내역 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-li" id="inquiry"><a href="/mypage/inquiryList" class="">1:1문의 <i
							class="icon-view_more"></i></a></li>
					<li class="cate1-group"><span>회원정보관리</span>
						<ul>
							<li class=""><a href="#">회원정보수정</a></li>
							<li class=""><a href="#">비밀번호수정</a></li>
							<li class=""><a href="#">SNS연동설정</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</aside>
<script>
var currentUrl = window.location.href;
var addClassName;

//div css로 id값 가져와서 넣기
var className = document.getElementById('container').classList[0];
document.getElementById(className).classList.add('on');
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
                                            </dd>
                                        </dl>
                                        <dl class="memlv2_record-list expiry" ng-if="pay.VALID == '기간만료'" >
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>2022.1.5 ~ 2022.2.5</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">기간만료</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">결제일</div>
                                                    <div class="txt">1.5(금) 13:26:15</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">무료</div>
                                                </div>
                                            </dd>
                                        </dl>
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
	
    <script>
        (function() {
            var popup_marketing1 = $(".js-popup_memlv2_record").trpLayerFixedPopup("#popup_memlv2_record-wrap");
            $(popup_marketing1.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_marketing1.open(this); // or false   
                popup_fixation("#popup_memlv2_record-wrap"); // pc 스크롤
                popup_motion_open("#popup_memlv2_record-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_memlv2_record-wrap .js-closepop, #popup_memlv2_record-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_marketing1.close();
                popup_motion_close("#popup_memlv2_record-wrap");
            });
        })();
    </script>
    
    
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
    
    <script>
        (function() {
            var popup_tooltip = $(".js-popup_tooltip").trpLayerFixedPopup("#popup_tooltip-wrap");
            $(popup_tooltip.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_tooltip.open(this); // or false   
                popup_fixation("#popup_tooltip-wrap"); // pc 스크롤
                popup_motion_open("#popup_tooltip-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_tooltip-wrap .js-closepop, #popup_tooltip-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_tooltip.close();
                popup_motion_close("#popup_tooltip-wrap");
            });
        })();
    </script>
</div>
    