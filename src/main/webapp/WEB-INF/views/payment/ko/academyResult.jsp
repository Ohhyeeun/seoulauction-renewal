<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                        <span class="tt1">결제 완료</span>
                                    </div>
                                    <div class="guide_box">
                                        <span class="tb2">통화 : KRW</span>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <ul class="form_table_pay">
                                        <c:if test="${param.payMethod == 'CARD'}">
                                        <li class="comment_pay">
                                            <p class="tt1">결제가 완료되었습니다.</p>
                                        </li>
                                        </c:if>
                                        <c:if test="${param.payMethod == 'VBANK'}">
                                        <li class="comment_pay">
                                            <p class="tt1">가상계좌 신청이 완료 되었습니다.</p>
                                            <div class="desc-box">
                                                <p class="tt6"><em>${resultMap.vbank_nm} ${resultMap.vbank_num}</em></p>
                                                <p class="tb1">예금주명 <em>서울옥션</em> 으로 ${vbank_exp_dt} 까지 입금해주세요.</p>
                                            </div>
                                        </li>
                                        </c:if>
                                        <li>
                                            <div class="table_box">
                                                <div class="guide">
                                                    <div class="product-box">
                                                        <%--0823 이미지, 텍스트 분리 --%>
                                                        <figure class="img paythumb">
                                                            <img id="academy-img" data="${resultMap.ACADEMY_CD}" alt="아카데미 결제 썸네일 이미지">
                                                            <figcaption id="academy-name" class="paythumb-text"></figcaption>
                                                        </figure>
                                                        <%-- //0823 이미지, 텍스트 분리 --%>  
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
                                                        <span class="won tt3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${resultMap.pay_price}" /><i class="tb1">원</i></span>
                                                    </p>
                                                    <p>
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
                                                    <span class="td">${resultMap.cust_name}</span>
                                                </li>
                                                <li>
                                                    <span class="th">연락처</span>
                                                    <span class="td">${resultMap.hp}</span>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <p class="list_tit tt4">결제 정보</p>
                                            <ul class="pay_info tb1">
                                                <li>
                                                    <span class="th">총 결제금액</span>
                                                    <fmt:formatNumber type="number" maxFractionDigits="3" var="pay_price" value="${resultMap.pay_price}" />
                                                    <span class="td pay">수강료 ${pay_price} 원
                                                        <br class="only-mb" />+ 할인금액 0 원
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
                                            <a class="btn btn_black btn_lg" onclick="goMypage();" role="button"><span>마이페이지로 이동</span></a>
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

    function goMypage() {
        if(checkPlatform(window.navigator.userAgent) == "mobile") {
            location.href = "/mypage/main";
        } else {
            location.href = "/mypage/liveBidReqList";
        }
    }
</script>
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>
</html>