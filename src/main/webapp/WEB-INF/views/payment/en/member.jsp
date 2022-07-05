<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">

    <div class="wrapper footer-bottom">
        <div class="sub-wrap pageclass">
            <jsp:include page="../../include/en/nav.jsp" flush="false"/>
            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-payment">
                                <div class="panel-header">
                                    <div class="title">
                                        <span class="tt1">Membership’s Payment</span>
                                    </div>
                                    <div class="guide_box">
                                        <span class="tb2">Currency : KRW</span>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <ul class="form_table_pay">
                                        <li>
                                            <div class="table_box">
                                                <div class="guide">
                                                    <p class="list_tit tt4">Notice</p>
                                                    <ul class="dot_list tb1">
                                                        <li>You can participate in the Seoul Auction offline auction bid.</li>
                                                        <li>You cans receive publications (various catalogs, exhibition guides, etc.) issued by Seoul Auction.</li>
                                                    </ul>
                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit tt5">Cost</span>
                                                        <span class="won tt3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /><i class="tb1">KRW</i></span>
                                                    </p>
                                                    <p class="fees">
                                                        <span class="tit tb1">Fees</span>
                                                        <span class="won tb1">0<i class="tb2">KRW</i></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">Buyer’s Information</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">Name</span>
                                                    <span class="td">${cust_name}</span>
                                                </li>
                                                <li>
                                                    <span class="th">Call</span>
                                                    <span class="td">${hp}</span>
                                                </li>
                                                <li>
                                                    <span class="th">Address</span>
                                                    <span class="td">${address}</span>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">Payment Method</p>
                                            <div id="payMethod" class="btn_wrap">
                                                <a class="btn btn_black" role="button" data="CARD" onclick="changePayMethod(this);"><span>Credit card</span></a>
                                                <a class="btn btn_default" role="button" data="VBANK" onclick="changePayMethod(this);"><span>Virtual Account</span></a>
                                            </div>
                                            <div class="text_wrap">
                                                <dl>
                                                    <dt class="tit tt6">Information on issuance of corporate and individual business certificates</dt>
                                                    <dd class="con tb2">Credit card sales slips and business receipts are the same qualifications as tax invoices.</dd>
                                                </dl>
                                            </div>
                                        </li>
                                        <li class="no-line">
                                            <p class="list_tit tt4">Total payment amount</p>
                                            <div class="total_pay_box tt3">
                                                Membership <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /> <i class="tb1">KRW</i><i class="br-mo"></i>
                                                + Fees 0 <i class="tb1">KRW</i> <i class="br-mo"></i>
                                                = <span>Total <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /> <i class="tb1">KRW</i></span>
                                            </div>
                                        </li>

                                        <li class="no-line">
                                            <p class="check check-header">
                                                <span class="trp checkbox-box">
                                                    <input id="checkboxall" type="checkbox" name="">
                                                    <i></i>
                                                    <label for="checkboxall" class="tb1"><span class="colorP">I agree to all member benefits, information, and auction terms and conditions.</span>
                                                    </label>
                                                </span>
                                            </p>
                                            <ul class="check-body mark_dot-list tb1">
                                                <li>
                                                    <span>I have read and understood all of the Seoul Auction auction terms and conditions and agree to their application.</span>
                                                </li>
                                                <li>
                                                    <span>Bidding is based on the assumption that you have checked the real work and condition.</span>
                                                </li>
                                                <li>
                                                    <span>The successful bidder must deposit the amount including the purchase fee within 7 days (within 21 days if the winning bid price is 300 million won or
                                                        more). The purchase fee is 18% of the successful bid price (excluding VAT).</span>
                                                </li>
                                                <li>
                                                    <span>When a successful bid is withdrawn, a successful bid withdrawal fee equal to 30% of the successful bid price is charged.</span>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set-float tac">
                                            <%@ include file="../include/payForm.jsp" %>
                                            <a id="paymentStartBtn" class="btn btn_point btn_lg" role="button"><span>Payment</span></a>
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
            <jsp:include page="../../include/en/footer.jsp" />
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
    <%--<script src="/js/pages_common_ko.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
</body>

</html>