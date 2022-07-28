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

                            <%--결제 폼--%>
                                <div class="content-panel type_panel-payment">
                                    <div class="panel-header">
                                        <div class="title">
                                            <span class="tt1">작품 결제</span>
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
                                                            <p class="img"><img src="https://www.seoulauction.com/nas_img/${lotInfo.FILE_PATH}/${lotInfo.FILE_NAME}" alt="" /></p>
                                                            <dl class="product_info">
                                                                <dt class="tt4">
                                                                    ${ct:getJSONString(lotInfo.ARTIST_NAME_JSON, 'ko')}
                                                                    <span class="sub_txt tb1">${ct:getJSONString(lotInfo.LOT_TITLE_JSON, 'ko')}</span>
                                                                </dt>
                                                                <dd class="tb2">
                                                                    <span> ${lotInfo.MATE_CD}</span>
                                                                    <div class="size_year">
                                                                        <span id="lotSizeString"></span>
<%--                                                                        <span>${fn:size_text_cm(lotInfo.LOT_SIZE_JSON)}</span>--%>
<%--                                                                        <span>${size_text_cm(lotInfo.LOT_SIZE_JSON)}</span>--%>
<%--                                                                        <span>${lotInfo.LOT_SIZE_JSON}</span>--%>
                                                                        <span>${lotInfo.LOT_MAKE_YEAR}</span>
                                                                    </div>
                                                                </dd>
                                                            </dl>
                                                        </div>

                                                    </div>
                                                    <div class="member_pay">
                                                        <p>
                                                            <span class="tit tt5">낙찰가</span>
                                                            <span class="won tt3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lotInfo.no_vat_price}"/><i class="tb1">원</i></span>
                                                        </p>
                                                        <p class="fees">
                                                            <span class="tit tb1">낙찰 수수료</span>
                                                            <span class="won tb1"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lotInfo.vat_price}"/><i class="tb2">원</i></span>
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
                                                <div id="payMethod" class="btn_wrap ">
                                                    <a id="payCard" class="btn btn_black"  role="button" data="CARD" onclick="changePayMethod(this);"><span>신용/체크카드</span></a>
                                                    <a id="payVBank" class="btn btn_default"  role="button" data="VBANK" onclick="changePayMethod(this);"><span>가상 계좌</span></a>
                                                </div>
                                            </li>
                                            <li class="no-line">
                                                <p class="list_tit tt4">총 결제금액</p>
                                                <div class="total_pay_box tt3">
                                                    낙찰가 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lotInfo.no_vat_price}" /> <i class="tb1">원</i><i class="br-mo"></i>
                                                    + 낙찰 수수료 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lotInfo.vat_price}" /> <i class="tb1">원</i> <i class="br-mo"></i>
                                                    = <span>총 결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lotInfo.pay_price}" /> <i class="tb1">원</i></span>
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
    <script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
    <script src="/js/payment/payment.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
    <script>
        const lotSizeString = js_size_text_cm(${lotInfo.LOT_SIZE_JSON});
        const elId = document.getElementById("lotSizeString");
        elId.insertAdjacentText("beforeend", lotSizeString)
    </script>
</body>

</html>