<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>결제 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
</head>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script src="/js/payment/payment.js" type="text/javascript"></script>
<body class="">

    <div class="wrapper footer-bottom footer-bottom30"> 
        <div class="sub-wrap pageclass">
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>

            <!-- container -->
            <div id="container">  
                <div id="contents" class="contents">

                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <%--결제 폼--%>
                            <form name="payForm" method="post" action="/payment/payResult">
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
                                                            <span class="won tt3">200,000<i class="tb1">원</i></span>
                                                        </p>
                                                        <p class="fees">
                                                            <span class="tit tb1">수수료</span>
                                                            <span class="won tb1">200,000<i class="tb2">원</i></span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <p class="list_tit tt4">구매자 정보</p>
                                                <ul class="pay_info tb1">
                                                    <li>
                                                        <span class="th">이름</span>
                                                        <span class="td">${name}</span>
                                                    </li>
                                                    <li>
                                                        <span class="th">연락처</span>
                                                        <span class="td">${tel}</span>
                                                    </li>
                                                    <li>
                                                        <span class="th">배송주소</span>
                                                        <span class="td">${address}</span>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_tit tt4">결제 방법</p>
                                                <div class="btn_wrap ">
                                                    <a class="btn btn_black " href="#" role="button"><span>신용/체크카드</span></a>
                                                    <a class="btn btn_default " href="#" role="button"><span>가상 계좌</span></a>
                                                </div>
                                            </li>
                                            <li class="no-line">
                                                <p class="list_tit tt4">총 결제금액</p>
                                                <div class="total_pay_box tt3">
                                                    정회원 비용 200,000 <i class="tb1">원</i><i class="br-mo"></i>
                                                    + 수수료 0 <i class="tb1">원</i> <i class="br-mo"></i>
                                                    = <span>총 결제금액 200,000 <i class="tb1">원</i></span>
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
                                                                <input id="checkbox1" type="checkbox" name="">
                                                                <i></i>
                                                                <label for="checkbox1" class="tb1">본인은 서울옥션 경매 약관을 모두 알고 이해하였으며, 그 적용에 동의합니다.
                                                                </label>
                                                            </span>
                                                            <a href="#none" class="terms_link tb1">약관 바로보기</a>
                                                        </p>
                                                    </li>
                                                    <li>
                                                        <p class="check check-list">
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox1" type="checkbox" name="">
                                                                <i></i>
                                                                <label for="checkbox1" class="tb1">응찰은 작품 실물 및 컨디션을 확인하셨음을 전제로 합니다.
                                                                </label>
                                                            </span>
                                                        </p>
                                                    </li>
                                                    <li>
                                                        <p class="check check-list">
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox1" type="checkbox" name="">
                                                                <i></i>
                                                                <label for="checkbox1" class="tb1">낙찰자는 낙찰 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다.구매수수료는 낙찰금액의 18%(부가세 별도)입니다.
                                                                </label>
                                                            </span>
                                                        </p>
                                                    </li>
                                                    <li>
                                                        <p class="check check-list">
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox1" type="checkbox" name="">
                                                                <i></i>
                                                                <label for="checkbox1" class="tb1">낙찰자가 ①지정된 기일에 낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을 낙찰철회비(위약금)로 납부하여야 합니다.
                                                                </label>
                                                            </span>
                                                        </p>
                                                    </li>
                                                </ul>
                                            </li>

                                        </ul>

                                    </div>
                                    <!-- 옵션 -->
                                    <input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
                                    <input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) -->
                                    <input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
                                    <input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->


                                    <input type="hidden" name="EdiDate" value="${eDate}"/>
                                    <input type="hidden" name="EdiDate" value="${eDate}"/>
                                    <input type="hidden" name="EdiDate" value="${eDate}"/>
                                    <input type="hidden" name="EdiDate" value="${eDate}"/>

                                    <!-- 변경 불가능 -->
                                    <input type="hidden" name="EdiDate" value="${eDate}"/>			<!-- 전문 생성일시 -->
                                    <input type="hidden" name="SignData" value="${signData}"/>	<!-- 해쉬값 -->

                                    <div class="panel-footer">
                                        <article class="button-area">
                                            <div class="btn_set-float tac">
                                                <a class="btn btn_point btn_lg" onClick="nicepayStart();" role="button"><span>결제하기</span></a>
                                            </div>
                                        </article>
                                    </div>

                                </div>
                            </form>

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