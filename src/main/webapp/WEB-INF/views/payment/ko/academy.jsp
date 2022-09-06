<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/taglibs.tld"%>

<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
    <div class="wrapper footer-bottom">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-payment">
                                <div class="panel-header">
                                    <div class="title">
                                        <span class="tt1">수강료 결제</span>
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
                                                    <div class="product-box">
                                                        <%--0823 이미지, 텍스트 분리 --%>
                                                        <figure class="img paythumb">
                                                            <img id="academy-img" data="${resultMap.ACADEMY_CD}" alt="아카데미 결제 썸네일 이미지">
                                                            <figcaption id="academy-name" class="paythumb-text"></figcaption>
                                                        </figure>
                                                        <%--//0823 이미지, 텍스트 분리 --%>

                                                        <dl class="product_info">
                                                            <dt class="tt4">
                                                                ${ct:getJSONString(resultMap.TITLE_JSON, 'ko')}
                                                            </dt>
                                                            <dd class="tb2">
                                                                ${resultMap.FROM_DT} ~ ${resultMap.TO_DT}<br />
                                                                ${resultMap.ACADEMY_TIME}
                                                            </dd>
                                                        </dl>
                                                    </div>

                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit tt5">수강료</span>
                                                        <span class="won tt3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /><i class="tb1">원</i></span>
                                                    </p>
                                                    <p class="fees">
                                                        <span class="tit tb1">할인금액</span>
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
                                                수강료 <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /> <i class="tb1">원</i><i class="br-mo"></i>
                                                + 할인금액 0 <i class="tb1">원</i> <i class="br-mo"></i>
                                                = <span>총 결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /><i class="tb1">원</i></span>
                                            </div>
                                        </li>
                                    </ul>

                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set-float tac">
                                            <%@ include file="../include/payForm.jsp" %>
                                            <a class="btn btn_point btn_lg" onclick="nicepayStart();" role="button"><span>결제하기</span></a>
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
</body>
<script>
    const academy_cd = $("#academy-img").attr("data");
    $("#academy-img").attr("src", "/images/pc/service/"+getAcademyImg(academy_cd));
    $("#academy-name").text(getAcademyNm(academy_cd));
</script>
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
<!-- 아래 js는 PC 결제창 전용 js입니다.(모바일 결제창 사용시 필요 없음) -->
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script src="/js/payment/payment.js" type="text/javascript"></script>
<script src="/js/payment/payment_common.js" type="text/javascript"></script>
</html>