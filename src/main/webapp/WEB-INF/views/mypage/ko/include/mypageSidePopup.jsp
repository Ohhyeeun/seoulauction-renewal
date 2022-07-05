<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sec:authentication property="details.socialYn" var="socialYn"/> 
<sec:authentication property="Details.userNm" var="userName"/>
<sec:authentication property="Details.validDate" var="validDate"/> 

<!-- 마이페이지 싸이드 메뉴 -->
<div ng-controller="myPageCtlPopup" ng-init="loadMemberPayList()">
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
                                                    <div class="txt">{{pay.PAY_DT}}</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">{{pay.PAY_METHOD_NM}}</div>
                                                </div>
                                                 <div class="info-li btn-area">
                                                    <button class="btn btn_gray_line btn_sm" type="button" data-id="{{pay.PG_TRANS_ID}}" data-type="0" ng-if="pay.PAY_METHOD_ID == 'card' && pay.receipt == 'Y'" onclick="receiptPopup(this)"><span>카드영수증</span></button>
                                                    <button class="btn btn_gray_line btn_sm" type="button" data-id="{{pay.PG_TRANS_ID}}" data-type="1" ng-if="pay.PAY_METHOD_ID == 'vbank' && pay.receipt == 'Y'" onclick="receiptPopup(this)"><span>현금영수증</span></button>
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

<script type="text/javascript" src="/js/mypage/mypageSide.js"></script>
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