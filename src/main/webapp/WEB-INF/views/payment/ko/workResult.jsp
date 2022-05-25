<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/taglibs.tld"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>결제 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    <!-- //header -->
</head>

<body class="">
    <div class="wrapper footer-bottom">
        <div class="sub-wrap pageclass"> 

            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>
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
                                        <c:if test="${param.payMethod == 'VBANK'}">
                                        <li>
                                            <div class="account_info">
                                                <p class="tit">가상계좌 정보</p>
                                                <p class="txt tb1">
                                                    <fmt:parseDate value="${resultMap.vbank_exp_dt}" var="vbank_exp_dt" pattern="yyyyMMdd"/>
                                                    <fmt:formatDate value="${vbank_exp_dt}" var="vbank_exp_dt" pattern="yyyy-MM-dd hh:mm:ss"/>
                                                    <span>${vbank_exp_dt}</span> 까지 아래의<i class="br-mo"></i> 가상계좌로 결제금액을 입금해 주시기 바랍니다.
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
                                            <div class="table_box">
                                                <div class="guide">

                                                    <div class="product-box">
                                                        <p class="img"><img src="https://www.seoulauction.com/nas_img/${resultMap.FILE_PATH}/${resultMap.FILE_NAME}" alt="" /></p>
                                                        <dl class="product_info">
                                                            <dt class="tt4">
                                                                ${ct:getJSONString(resultMap.ARTIST_NAME_JSON, 'ko')}
                                                                <span class="sub_txt tb1">${ct:getJSONString(resultMap.LOT_TITLE_JSON, 'ko')}</span>
                                                            </dt>
                                                            <dd class="tb2">
                                                                <span>${resultMap.MATE_CD}</span>
                                                                <div class="size_year">
                                                                    <span>${resultMap.LOT_SIZE_STRING}</span>
                                                                    <span>${resultMap.LOT_MAKE_YEAR}</span>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>

                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit tt5">낙찰가</span>
                                                        <span class="won tt3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${resultMap.no_vat_price}" /><i class="tb1">원</i></span>
                                                    </p>
                                                    <p class="fees">
                                                        <span class="tit tb1">낙찰 수수료</span>
                                                        <span class="won tb1"><fmt:formatNumber type="number" maxFractionDigits="3" value="${resultMap.vat_price}" /><i class="tb2">원</i></span>
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
                                                    <span class="td pay">낙찰가 <fmt:formatNumber type="number" maxFractionDigits="3" value="${resultMap.no_vat_price}"/> 원
                                                        <br class="only-mb" />+ 낙찰수수료 <fmt:formatNumber type="number" maxFractionDigits="3" value="${resultMap.vat_price}"/> 원
                                                        <br class="only-mb" />= <i class="total">총 결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${resultMap.pay_price}"/> 원</i></span>
                                                </li>
                                                <li>
                                                    <span class="th">결제방법</span>
                                                    <span class="td">${param.payMethod == 'VBANK' ? "가상계좌" : "신용/체크카드"}</span>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>

                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set tac btn_double">
                                            <a class="btn btn_default btn_lg" href="#" role="button"><span>홈으로 이동</span></a>
                                            <a class="btn btn_black btn_lg" href="#" role="button"><span>마이페이지로 이동</span></a>
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