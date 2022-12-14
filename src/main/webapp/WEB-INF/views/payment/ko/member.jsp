<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<c:set var="isRegular" value="false" />
<sec:authorize access="hasAuthority('ROLE_REGULAR_USER')">
    <c:set var="isRegular" value="true" />
</sec:authorize>
<body class="">

    <div class="wrapper footer-bottom">
        <div class="sub-wrap pageclass">
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="basis-section payment-page last-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-payment">
                                <div class="panel-header">
                                    <div class="title">
                                        <span class="tt1">정회원 결제</span>
                                    </div>
                                    <div class="guide_box">
                                        <span class="tb2">통화 : KRW</span>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <ul class="form_table_pay">
                                        <li>
                                            <div class="table_box">
                                                <div class="guide">
                                                    <p class="list_tit tt4">정회원 안내</p>
                                                    <ul class="dot_list tb1">
                                                        <li>서울옥션 오프라인 경매 응찰에 참여하실 수 있습니다.</li>
                                                        <li>서울옥션이 발행하는 간행물(각종 도록, 전시 안내 등)을 받으실 수 있습니다.</li>
                                                    </ul>
                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit tt5">정회원 비용</span>
                                                        <span class="won tt3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /><i class="tb1">원</i></span>
                                                    </p>
                                                    <p class="fees">
                                                        <span class="tit tb1">수수료</span>
                                                        <span class="won tb1">0<i class="tb2">원</i></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">구매자 정보</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">이름</span>
                                                    <span class="td">${cust_name}</span>
                                                </li>
                                                <li>
                                                    <span class="th">연락처</span>
                                                    <span class="td">${hp}</span>
                                                </li>
                                                <li>
                                                    <span class="th">배송주소</span>
                                                    <span class="td">${address}</span>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">결제 방법</p>
                                            <div id="payMethod" class="btn_wrap">
                                                <a class="btn btn_black" role="button" data="CARD" onclick="changePayMethod(this);"><span>신용/체크카드</span></a>
                                                <a class="btn btn_default" role="button" data="VBANK" onclick="changePayMethod(this);"><span>가상 계좌</span></a>
                                            </div>
                                            <!-- [0614]전체수정 -->
                                            <div class="receipts" style="display: none;">
                                                <dl class="receipts-inner">
                                                    <dt class="tit tt5"><span>현금영수증</span></dt>
                                                    <dd class="con">
                                                        <div class="btn-area js-selt_division">
                                                            <span class="trp radio-box">
                                                                <input id="radio1-1" type="radio" name="rcpt_type" value="1" checked>
                                                                <i></i>
                                                                <label for="radio1-1">개인 소득 공제</label>
                                                            </span>
                                                            <span class="trp radio-box">
                                                                <input id="radio1-2" type="radio" name="rcpt_type" value="2">
                                                                <i></i>
                                                                <label for="radio1-2">사업자 지출 증빙</label>
                                                            </span>
                                                        </div>
                                                        <div class="form-area personal">
                                                            <div class="con">
                                                                <div class="form-wrap">
                                                                    <input type="text" placeholder="휴대폰 번호를 입력해주세요" id="rcpt_type_no1" class="h42" maxlength="13" onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);" onblur="phoneNumberBlur(this);">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-area business">
                                                            <div class="con">
                                                                <div class="form-wrap">
                                                                    <input type="text" placeholder="사업자번호를 입력해 주세요" id="rcpt_type_no2" class="h42" maxlength="12" onchange="businessNumberHyphen(this);" onkeydown="businessNumberHyphen(this);">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                            <!-- //[0614]전체수정 -->
                                            <!-- [0614]텍스트삽입 -->
                                            <div class="text_wrap" style="display: none;">
                                                <dl>
                                                    <dt class="tit tt6">법인 및 개인사업자 증빙발행 안내</dt>
                                                    <dd class="con tb2">신용카드 매출전표 및 사업자증빙용 현금영수증은 세금계산서와 동일한 적격증빙입니다.</dd>
                                                </dl>
                                            </div>
                                            <!-- //[0614]텍스트삽입 -->
                                        </li>
                                        <li class="no-line">
                                            <p class="list_tit tt4">총 결제금액</p>
                                            <div class="total_pay_box tt3">
                                                정회원 비용 <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /> <i class="tb1">원</i><i class="br-mo"></i>
                                                + 수수료 0 <i class="tb1">원</i> <i class="br-mo"></i>
                                                = <span>총 결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /> <i class="tb1">원</i></span>
                                            </div>
                                        </li>

                                        <li class="no-line">
                                            <p class="check check-header">
                                                <span class="trp checkbox-box">
                                                    <input id="checkboxall" type="checkbox" name="">
                                                    <i></i>
                                                    <label for="checkboxall" class="tb1">전체 동의 <span class="colorP">(필수)</span>
                                                    </label>
                                                </span>
                                            </p>
                                            <ul class="check-body">
                                                <li>
                                                    <p class="check check-list">
                                                        <span class="trp checkbox-box">
                                                            <input type="checkbox" name="agree_checkbox">
                                                            <i></i>
                                                            <label class="tb1">본인은 서울옥션 경매 약관을 모두 알고 이해하였으며, 그 적용에 동의합니다.
                                                            </label>
                                                        </span>
                                                        <a href="/footer/privacy" class="terms_link tb1">약관 바로보기</a>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p class="check check-list">
                                                        <span class="trp checkbox-box">
                                                            <input  type="checkbox" name="agree_checkbox">
                                                            <i></i>
                                                            <label class="tb1">응찰은 작품 실물 및 컨디션을 확인하셨음을 전제로 합니다.
                                                            </label>
                                                        </span>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p class="check check-list">
                                                        <span class="trp checkbox-box">
                                                            <input type="checkbox" name="agree_checkbox">
                                                            <i></i>
                                                            <label class="tb1">낙찰자는 낙찰 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다.구매수수료는 낙찰금액의 18%(부가세 별도)입니다.
                                                            </label>
                                                        </span>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p class="check check-list">
                                                        <span class="trp checkbox-box">
                                                            <input type="checkbox" name="agree_checkbox">
                                                            <i></i>
                                                            <label class="tb1">낙찰철회시 낙찰가의 30%에 해당하는 낙찰철회비가 부과됩니다.</label>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set-float tac">
                                            <%@ include file="../include/payForm.jsp" %>
                                            <a id="paymentStartBtn" class="btn btn_point btn_lg" role="button"><span>결제하기</span></a>
                                        </div>
                                    </article>
                                </div>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" />
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
    <script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
    <script src="/js/payment/paymentMember.js" type="text/javascript"></script>
    <script src="/js/payment/payment.js" type="text/javascript"></script>
    <script src="/js/payment/payment_common.js" type="text/javascript"></script>
    <%--<script src="/js/pages_common_ko.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
</body>

<script>
    let isRegular = ${isRegular};
    if(isRegular){
        alert('이미 정회원 입니다.');
        history.back();
    }
</script>


</html>