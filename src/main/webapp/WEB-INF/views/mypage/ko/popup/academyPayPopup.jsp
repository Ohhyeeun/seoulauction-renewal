<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div id="popup_myacademy_pay-wrap" class="trp popupfixed-wrap myacademy_pay-popup">
        <div class="popup-dim"></div>
        <div class="popup-align mode-md mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">결제 정보</span>
                            </div>
                        </div>
                        <div class="pop-body">
                            <section class="section scroll-type">
                                <article class="article-area">
                                    <div class="academy-pay-wrap tb1">
                                        <div class="detail-wrap">
                                            <dl>
                                                <dt><span>수강료</span></dt>
                                                <dd><span>KRW {{academyPay}}</span></dd>
                                            </dl>
                                            <dl>
                                                <dt><span>할인금액</span></dt>
                                                <dd><span>KRW {{academyPayDiscount}}</span></dd>
                                            </dl>
                                        </div>
                                        <div class="total-wrap">
                                            <dl>
                                                <dt><span>총 결제금액</span></dt>
                                                <dd>
                                                    <span class="pay-amount">KRW {{academyPayTotal}}</span>
                                                    <span class="pay-method">{{academyPayMethodCd}}</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                </article>
                                <div class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_point js-closepop" href="#" id="confirm" role="button"><span>확인</span></a>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>