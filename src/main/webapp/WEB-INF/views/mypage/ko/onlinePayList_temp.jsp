<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<body class="">
	<div class="wrapper" ng-app="myApp">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/onlinePay.js"></script>
            <!-- container -->
            <div id="container" class="test4"  ng-controller="onlinePayListCtl" data-ng-init="loadOnlinePayList(1);">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_auction online-buy">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />
                                        
                                        
                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">결제/구매내역</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="help-box-wrap">
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>구매가(Purchase Price) : 낙찰가 + 낙찰 수수료 + 부가가치세가 합산된 금액입니다.</span></li>
                                                            <li><span>구매수수료 18%(부가가치세 별도) 일괄 적용합니다.</span></li>
                                                        </ul>
                                                    </div>
                                                </article>
                                                <article class="list_count-wrap">
                                                    <div class="count-area textlist-wrap">
                                                        <div class="tit">총 <span class="point">{{allCnt}}</span> 건의 내역이 있습니다.</div>
                                                        <div class="sub">(결제 할 내역 <span class="point">{{payCnt}}</span> 건, 구매 내역 <span class="point">{{paidCnt}}</span>건)</div>
                                                    </div>
                                                </article>
                                                <article class="bid-list-wrap">
                                                    <div class="bid-list">
                                                        <dl class="bid-item">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4 line-1">
                                                                        <span>2022 4월 e-BID 온라인 프리미엄 경매 II</span>
                                                                    </div>
                                                                    <div class="desc tb1">
                                                                        <span class="tit">경매일</span>
                                                                        <span>2022.04.14 14:00 순차마감</span>
                                                                    </div>
                                                                </div>
                                                            </dt>
                                                            <dd class="item-ea">
                                                                <div class="item-ea-tit">
                                                                    <div class="paystate pending">결제대기중</div>
                                                                </div>
                                                                <div class="item-ea-inner">
                                                                    <div class="product-infobox">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">3</div>
                                                                            <div class="title">
                                                                                <div class="titlename">문형태</div>
                                                                            </div>
                                                                            <div class="desc">Speed</div>
                                                                            <div class="sub-box">
                                                                                <div class="sub-li">2022.04.15 (수)<br class="m-ver"> 15:02:14 (1회 응찰)</div>
                                                                                <div class="sub-li">
                                                                                    <div class="tit">응찰가</div>
                                                                                    <div class="txt">KRW 9,900,000,000</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="pay-infobox">
                                                                        <div class="pay-area">
                                                                            <dl class="price">
                                                                                <dt class="tit">낙찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="price">
                                                                                <dt class="tit">낙찰 수수료</dt>
                                                                                <dd class="txt">KRW 8,000,000</dd>
                                                                            </dl>
                                                                            <dl class="price succ">
                                                                                <dt class="tit">구매가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                        </div>
                                                                        <div class="btn-area">
                                                                            <button class="btn btn_point" type="button"><span>결제하기</span></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            <dd class="item-ea">
                                                                <div class="item-ea-tit">
                                                                    <div class="paystate complete">결제완료</div>
                                                                    <div class="txt">2022.04.16 (목) 16:00:24 (가상계좌)</div>
                                                                </div>
                                                                <div class="item-ea-inner">
                                                                    <div class="product-infobox">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">24</div>
                                                                            <div class="title">
                                                                                <div class="titlename">청신</div>
                                                                            </div>
                                                                            <div class="desc">
                                                                                Black Neon BE2016
                                                                            </div>
                                                                            <div class="sub-box">
                                                                                <div class="sub-li">2022.04.15 (수)<br class="m-ver"> 15:02:14 (1회 응찰)</div>
                                                                                <div class="sub-li">
                                                                                    <div class="tit">응찰가</div>
                                                                                    <div class="txt">KRW 9,900,000,000</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="pay-infobox">
                                                                        <div class="pay-area">
                                                                            <dl class="price">
                                                                                <dt class="tit">응찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="price succ">
                                                                                <dt class="tit">낙찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="date">
                                                                                <dt class="tit">낙찰일</dt>
                                                                                <dd class="txt">2022.04.14 14:43:25</dd>
                                                                            </dl>
                                                                        </div>
                                                                        <div class="btn-area">
                                                                            <button class="btn btn_gray_line btn-half" type="button"><span>현금영수증</span></button>
                                                                            <button class="btn btn_gray btn-half btn-print" type="button" disabled>
                                                                                <span>보증서출력하기</span>
                                                                                <span>7일 이후 가능</span>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            <dd class="item-ea">
                                                                <div class="item-ea-tit">
                                                                    <div class="paystate complete">결제완료</div>
                                                                    <div class="txt">2022.04.16 (목) 16:00:24 (신용카드)</div>
                                                                </div>
                                                                <div class="item-ea-inner">
                                                                    <div class="product-infobox">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">55</div>
                                                                            <div class="title">
                                                                                <div class="titlename">데미안허스트</div>
                                                                            </div>
                                                                            <div class="desc">
                                                                                Air (From The Series The Elements)
                                                                            </div>
                                                                            <div class="sub-box">
                                                                                <div class="sub-li">2022.04.15 (수)<br class="m-ver"> 15:02:14 (1회 응찰)</div>
                                                                                <div class="sub-li">
                                                                                    <div class="tit">응찰가</div>
                                                                                    <div class="txt">KRW 9,900,000,000</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="pay-infobox">
                                                                        <div class="pay-area">
                                                                            <dl class="price">
                                                                                <dt class="tit">응찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="price succ">
                                                                                <dt class="tit">낙찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="date">
                                                                                <dt class="tit">낙찰일</dt>
                                                                                <dd class="txt">2022.04.14 14:43:25</dd>
                                                                            </dl>
                                                                        </div>
                                                                        <div class="btn-area">
                                                                            <button class="btn btn_gray_line btn-half" type="button"><span>결제영수증</span></button>
                                                                            <button class="btn btn_point btn-half btn-print" type="button"><span>보증서출력하기</span></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            <dd class="item-ea">
                                                                <div class="item-ea-tit">
                                                                    <div class="paystate cancel">결제취소</div>
                                                                </div>
                                                                <div class="item-ea-inner">
                                                                    <div class="product-infobox">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">33</div>
                                                                            <div class="title">
                                                                                <div class="titlename">데미안허스트</div>
                                                                            </div>
                                                                            <div class="desc">
                                                                                Air (From The Series The Elements)
                                                                            </div>
                                                                            <div class="sub-box">
                                                                                <div class="sub-li">2022.04.15 (수)<br class="m-ver"> 15:02:14 (1회 응찰)</div>
                                                                                <div class="sub-li">
                                                                                    <div class="tit">응찰가</div>
                                                                                    <div class="txt">KRW 9,900,000,000</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="pay-infobox">
                                                                        <div class="pay-area">
                                                                            <dl class="price">
                                                                                <dt class="tit">응찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="price succ">
                                                                                <dt class="tit">낙찰가</dt>
                                                                                <dd class="txt">KRW 9,900,000,000</dd>
                                                                            </dl>
                                                                            <dl class="date">
                                                                                <dt class="tit">낙찰일</dt>
                                                                                <dd class="txt">2022.04.14 14:43:25</dd>
                                                                            </dl>
                                                                        </div>
                                                                        <div class="btn-area">
                                                                            <button class="btn btn_gray" type="button" disabled><span>결제취소</span></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                    <div class="paging-area">
                                                        <div class="paging">
                                                            <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#" class="prev icon-page_prev">PREV</a>
                                                            <strong class="on">1</strong>
                                                            <a href="#"><em>2</em></a>
                                                            <a href="#"><em>3</em></a>
                                                            <a href="#"><em>4</em></a>
                                                            <a href="#"><em>5</em></a>
                                                            <span class="pc-ver">
                                                                <a href="#"><em>6</em></a>
                                                                <a href="#"><em>7</em></a>
                                                                <a href="#"><em>8</em></a>
                                                                <a href="#"><em>9</em></a>
                                                                <a href="#"><em>100</em></a>
                                                            </span>
                                                            <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-footer"></div>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false" />
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


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>



    <script>
        $(".js-history_back").click(function() {
            window.history.back();
        })
    </script>
</body>

</html>