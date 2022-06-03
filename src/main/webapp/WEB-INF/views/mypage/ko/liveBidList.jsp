<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<body class="">
    <div class="wrapper" ng-app="myApp">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false" />
            <script type="text/javascript" src="/js/mypage/liveBid.js"></script>
            <!-- //header -->

            <!-- container -->
            <div id="container" class="liveBidReq" ng-controller="liveBidReqListCtl" data-ng-init="loadLiveBidReqList(1);">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_auction">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">온라인패들응찰내역</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <!-- [0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
                                                <article class="bid-list-wrap">
                                                    <div class="bid-list">
                                                        <dl class="bid-item">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                        <span>2022 4월 e-BID 온라인 프리미엄 경매 II</span>
                                                                    </div>
                                                                    <div class="sub">
                                                                        <div class="desc tb1">
                                                                            <span class="tit">경매일</span>
                                                                            <span>2022.04.14 14:00 순차마감</span>
                                                                        </div>
                                                                        <div class="desc tb1">
                                                                            <span class="tit">패들번호</span>
                                                                            <span class="paddle-num">633</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-area">
                                                                    <button class="btn btn_black btn-view-bid" type="button"><span>낙찰결과보기</span></button>
                                                                </div>
                                                            </dt>
                                                            <dd>
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
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
                                                                            <div class="desc">Speed </div>
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
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">2022.04.14 14:43:25</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            <dd>
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                                                    <!-- <div class="success"><span class="bid_result-icon">낙찰</span></div> -->
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">24</div>
                                                                            <div class="title">
                                                                                <div class="titlename">데미안허스트</div>
                                                                            </div>
                                                                            <div class="desc">
                                                                                Black Neon BE2016
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
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">2022.04.14 14:43:25</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <dl class="bid-item">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                        <span>말줄임없애기로 변경 - 2022 1월 라이브 경매 Draw a Black tiger Step by Step 제목은 최대 2줄. 2줄 이상은 말줄임 2022 1월 라이브 경매 Draw a Black tiger Step by Step 제목은 최대 2줄. 2줄 이상은 말줄임 2022 1월 라이브 경매 Draw a Black tiger Step by Step 제목은 최대 2줄. 2줄 이상은 말줄임</span>
                                                                    </div>
                                                                    <div class="desc tb1">
                                                                        <span class="tit">경매일</span>
                                                                        <span>2022.04.14 14:00 순차마감</span>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-area">
                                                                    <!-- [0526]버튼수정 -->
                                                                    <button class="btn btn_black btn-view-bid" type="button"><span>낙찰결과보기</span></button>
                                                                    <!-- //[0526]버튼수정 -->
                                                                </div>
                                                            </dt>
                                                            <dd>
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
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
                                                                            <div class="desc">Speed </div>
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
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">2022.04.14 14:43:25</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            <dd>
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
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
                                                                                <div class="titlename">데미안허스트</div>
                                                                            </div>
                                                                            <div class="desc">
                                                                                Black Neon BE2016
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
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">2022.04.14 14:43:25</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            <dd>
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">8</div>
                                                                            <div class="title">
                                                                                <div class="titlename">데미안허스트</div>
                                                                            </div>
                                                                            <div class="desc">
                                                                                Air (From The Series The Elelments)
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
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">2022.04.14 14:43:25</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                    </div>
                                                    <div class="wrap_paging" ng-if="liveBidReqCnt != 0">
														<paging page="currentPage"
															page-size=3
															total="liveBidReqCnt"
															paging-action="loadLiveBidReqList(page)"
															scroll-top="true"
															hide-if-empty="true"
															show-prev-next="true"
															show-first-last="true"
															ul-class="page_ul"
															active-class="page_active"
														    disabled-class="page_disable"
														    text-next-class="icon-page_next next page_btn sp_btn btn_next02"
														    text-prev-class="icon-page_prev prev page_btn sp_btn btn_prev02"
														    text-first-class="icon-page_prevprev prev_end page_btn sp_btn btn_prev "
														    text-last-class="icon-page_nextnext next_end page_btn sp_btn btn_next">
														</paging>				
													</div>
                                                </article>
                                                <!-- //[0526]상품진열디자인 변경 : product-infobox 안에 product-infobox-inner 생성 -->
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