<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                        <span class="tt1">결제 완료</span>
                                    </div>
                                    <div class="guide_box">
                                        <span class="tb2">통화 : KRW</span>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <ul class="form_table_pay">
                                        <!-- [0803]결제완료코멘트 추가 -->
                                        <li class="comment_pay"> 
                                            <p class="tt1">결제가 완료되었습니다.</p>
                                        </li>
                                        <!-- [0803]결제완료코멘트 추가 -->

                                        <!-- [0803]결제완료코멘트 추가 -->
                                        <li class="comment_pay">
                                            <p class="tt1">가상계좌 신청이 완료 되었습니다.</p>
                                            <div class="desc-box">
                                                <p class="tt6"><em>우리은행 603-3508001-8678</em></p>
                                                <p class="tb1">예금주명 <em>서울옥션</em> 으로 2022년 07월 26일까지 입금해주세요.</p>
                                            </div>
                                        </li>
                                        <!-- //[0803]결제완료코멘트 추가 -->

                                        <c:if test="${param.payMethod == 'VBANK'}">
                                        <li>
                                            <div class="account_info">
                                                <p class="tit">가상계좌 정보</p>
                                                <p class="txt tb1">
                                                    <fmt:parseDate value="${resultMap.vbank_exp_dt}" var="vbank_exp_dt" pattern="yyyyMMdd"/>
                                                    <fmt:formatDate value="${vbank_exp_dt}" var="vbank_exp_dt" pattern="yyyy-MM-dd"/>
                                                    <span>${vbank_exp_dt}</span>까지 아래의<i class="br-mo"></i> 가상계좌로 결제금액을 입금해 주시기 바랍니다.
                                                </p>
                                                <ul class="pay_info tb1">
                                                    <li>
                                                        <span class="th">은행명</span>
                                                        <span class="td"><strong>${resultMap.vbank_nm}</strong></span>
                                                    </li>
                                                    <li>
                                                        <span class="th">계좌번호</span>
                                                        <span class="td"><strong>${resultMap.vbank_num}</strong></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        </c:if>
                                        <li>
                                            <p class="list_tit tt4">구매자 정보</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">이름</span>
                                                    <span class="td">${resultMap.cust_name}</span>
                                                </li>
                                                <li>
                                                    <span class="th">연락처</span>
                                                    <span class="td">${resultMap.hp}</span>
                                                </li>
                                                <li>
                                                    <span class="th">배송주소</span>
                                                    <span class="td">${resultMap.addr}</span>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">결제 정보</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">총 결제금액</span>
                                                    <fmt:formatNumber type="number" maxFractionDigits="3" var="pay_price" value="${resultMap.pay_price}" />
                                                    <span class="td pay">정회원 비용 ${pay_price} 원
                                                        <br class="only-mb" />+ 수수료 0 원
                                                        <br class="only-mb" />= <i class="total">총 결제금액 ${pay_price} 원</i></span>
                                                </li>
                                                <li>
                                                    <span class="th">결제방법</span>
                                                    <span class="td">${param.payMethod == 'VBANK' ? "가상계좌" : "체크/신용카드"}</span>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set tac btn_double">
                                            <a class="btn btn_default btn_lg" href="/" role="button"><span>홈으로 이동</span></a>
                                            <a class="btn btn_black btn_lg" href="/mypage/liveBidReqList" role="button"><span>마이페이지로 이동</span></a>
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
    <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

</body>

</html>