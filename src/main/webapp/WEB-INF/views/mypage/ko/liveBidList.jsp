<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<body class="">
    <div class="wrapper" ng-app="myApp">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false" />
            <script type="text/javascript" src="/js/mypage/liveBid.js"></script>
            <!-- //header -->

              <!-- container -->
            <div id="container" class="liveBid" ng-controller="liveBidListCtl" data-ng-init="loadLiveBidList(1);">
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
                                                        <dl class="bid-item" ng-repeat="liveBid in liveBidList">
                                                            <dt>
                                                                <div class="title-area">
                                                                    <div class="title tt4">
                                                                          <span>{{liveBid[1][0].SALE_TH}}{{liveBid[1][0].SALE_TH_DSP}} {{liveBid[1][0].SALE_TITLE_KR}}</span>
                                                                    </div>
                                                                    <div class="sub">
                                                                        <div class="desc tb1">
                                                                            <span class="tit">경매일</span>
                                                                            <span>{{liveBid[1][0].FROM_DT}} 순차마감</span>
                                                                        </div>
                                                                        <div class="desc tb1">
                                                                            <span class="tit">패들번호</span>
                                                                            <span class="paddle-num">{{liveBid[1][0].PADDLE}}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-area">
                                                                    <button class="btn btn_black btn-view-bid" type="button" ng-if="liveBid[1][0].success_bid_count != 0" ng-click="liveBidHammer({'bid':liveBid[1][0]})"><span>낙찰결과보기</span></button>
                                                                </div>
                                                            </dt>
                                                            <dd ng-repeat="data in liveBid[1]">
                                                                <div class="product-infobox">
                                                                    <div class="product-infobox-inner">
                                                                        <div class="thumb-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}" alt="${imageRootPath}{{data.LOT_IMG_PATH}}/{{data.LOT_IMG_NAME}}">
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'N' && data.BID_PRICE == data.success_bid_price"><span class="bid_result-icon">낙찰</span></div>
                                                                                     <div class="success" ng-if="data.HAMMER_CANCEL_YN == 'Y'"><span class="bid_result-icon">낙찰취소</span></div>
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="text-area">
                                                                            <div class="num">{{data.LOT_NO}}</div>
                                                                            <div class="title">
                                                                                <div class="titlename">{{data.ARTIST_NAME_KR}}</div>
                                                                            </div>
                                                                            <div class="desc">{{data.LOT_TITLE_KR}} </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="pay-infobox">
                                                                    <div class="pay-area">
                                                                        <dl class="price">
                                                                            <dt class="tit">응찰가</dt>
                                                                            <dd class="txt">{{data.CURR_CD}} {{comma(data.BID_PRICE)}}</dd>
                                                                        </dl>
                                                                        <dl class="price succ">
                                                                            <dt class="tit">낙찰가</dt>
                                                                            <dd class="txt" ng-if="data.success_bid_price">{{data.CURR_CD}} {{comma(data.success_bid_price)}}</dd>
                                                                        </dl>
                                                                        <dl class="date">
                                                                            <dt class="tit">응찰일</dt>
                                                                            <dd class="txt">{{data.BID_DT}}</dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="btn-area">
                                                                        <button class="btn btn_default js-popup_auction_live_record" type="button" ng-click="liveBidHis({'bid':data})"><span>응찰내역</span></button>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="data-empty" ng-if="liveBidCnt == 0">
                                                            <p class="txt_empty">응찰 내역이 존재하지 않습니다.</p>
                                                        </div>
                                                    </div>
                                                    <div class="wrap_paging" ng-if="liveBidCnt != 0">
														<paging page="currentPage"
															page-size=5
															total="liveBidCnt"
															paging-action="loadLiveBidList(page)"
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
							<!-- 팝업 : 라이브경매관리 온라인패들 응찰 이력 -->
							 <div id="popup_auction_live_record-wrap" class="trp popupfixed-wrap auction_live_record-popup" >
							        <div class="popup-dim"></div>
							        <div class="popup-align mode-lg mode-mb_full">
							            <div class="popup-vertical">
							                <div class="popup-layer">
							                    <div class="pop-panel">
							                        <div class="pop-header">
							                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
							                            <div class="title-box">
							                                <span class="txt_title type-big">응찰 내역</span>
							                            </div>
							                        </div>
							                        <div class="pop-body">
							                            <section class="section">
							                                <article class="article-area thead_item-wrap">
							                                    <div class="table-wrap thead_item">
							                                        <table class="table_base data-table auction-bid-history">
							                                            <thead>
							                                                <tr>
							                                                    <th>응찰가</th>
							                                                    <th>응찰일자</th>
							                                                    <th>응찰방법</th>
							                                                    <th>비고</th>
							                                                </tr>
							                                            </thead>
							                                        </table>
							                                    </div>
							                                </article>
							                                <article class="article-area scroll-type mCustomScrollbar tbody_item-wrap">
							                                    <div class="table-wrap">
							                                        <table class="table_base data-table auction-bid-history">
							                                            <tbody>
							                                            
							                                                <tr ng-repeat="liveBidhis in liveBidHisList">
							                                                    <td>KRW {{comma(liveBidhis.BID_PRICE)}}</td>
							                                                    <td>{{liveBidhis.BID_DT}}</td>
							                                                    <td>온라인응찰</td>
							                                                    <td ><span class="succ" ng-if="liveBidhis.HAMMER_STAT == 'hammer'">낙찰</span></td>
							                                                </tr>
							                                            </tbody>
							                                        </table>
							                                    </div>
							                                </article>
							                            </section>
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							    
							        <!-- 오프라인결제 -->
    <div id="popup_offline_payment-wrap" class="trp popupfixed-wrap offline_payment-popup " >
        <div class="popup-dim"></div>
        <div class="popup-align mode-xl mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title">{{liveBidHisHammerList[0].SALE_TITLE_KR}}</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <article class="articles-area">

                                    <div class="only-pc">
                                        <table class="table_base data-table name-payment_price">
                                            <thead>
                                                <tr >
                                                    <th>LOT</th>
                                                    <th>작가/작품명</th>
                                                    <th>낙찰가</th>
                                                    <th>수수료</th>
                                                    <th>구매가</th>
                                                    <th>배송비</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="liveBidHisHammer in liveBidHisHammerList">
                                                    <td class="">
                                                        <span>{{liveBidHisHammer.LOT_NO}}</span>
                                                    </td>
                                                    <td class="">
                                                        <span class="tb1">{{liveBidHisHammer.ARTIST_NAME_KR}} / {{liveBidHisHammer.LOT_TITLE_KR}}</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>{{comma(liveBidHisHammer.BID_PRICE)}}</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>{{comma(liveBidHisHammer.FEE)}}</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>{{comma(liveBidHisHammer.PAY_PRICE)}}</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>0</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="">
                                                        <strong>합계</strong>
                                                    </td>
                                                    <td class="">
                                                        <strong></strong>
                                                    </td>
                                                    <td class="tar">
                                                    	<strong>{{comma(liveBidHisHammerTotalBidPrice)}}</strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>{{comma(liveBidHisHammerTotalFee)}}</strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>{{comma(liveBidHisHammerTotalPayPrice)}}</strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>0</strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="6" class="tar">
                                                        <strong>총 결제금액</strong>
                                                        <em>{{comma(liveBidHisHammerTotalPayPrice)}}</em>
                                                    </th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="only-mb">

                                        <div class="payment_price-accordion">
                                            <div class="accordion-header">
                                                <a href="#" class="accordion-inner js-accordion-btn">
                                                    <div class="title">
                                                        <strong>낙찰작품</strong>
                                                    </div>
                                                    <div class="count">
                                                        <em>{{liveBidHisHammerCnt}}</em>
                                                        <span>건</span>
                                                    </div>
                                                    <i class="icon-accordion_arrow-2x"></i>
                                                </a>
                                            </div>
                                            <div class="accordion-body">

                                                <ul class="work-list">
                                                    <li ng-repeat="liveBidHisHammer in liveBidHisHammerList">
                                                        <div class="li-inner">

                                                            <div class="item-header">
                                                                <div class="image-area">
                                                                    <figure class="img-ratio">
                                                                        <div class="img-align">
                                                                        <img src="/nas_img{{liveBidHisHammer.FILE_PATH}}/{{liveBidHisHammer.FILE_NAME}}" alt="">
                                                                        </div>
                                                                    </figure>
                                                                </div>
                                                                
                                                                <div class="typo-area">
                                                                    <div class="num"><span>{{liveBidHisHammer.LOT_NO}}</span></div>
                                                                    <div class="title">{{liveBidHisHammer.ARTIST_NAME_KR}}</div>
                                                                    <div class="desc"><span>{{liveBidHisHammer.LOT_TITLE_KR}}</span></div>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <dl class="price-list">
                                                                    <dt>낙찰가</dt>
                                                                    <dd>{{comma(liveBidHisHammer.BID_PRICE)}}</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>수수료</dt>
                                                                    <dd>{{comma(liveBidHisHammer.FEE)}}</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>구매가</dt>
                                                                    <dd>{{comma(liveBidHisHammer.PAY_PRICE)}}</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>배송비</dt>
                                                                    <dd>0</dd>
                                                                </dl>
                                                            </div>

                                                        </div>
                                                    </li>
                                                </ul>

                                            </div>
                                            <div class="accordion-footer">
                                                <div class="calculation-box">
                                                    <dl class="price-list">
                                                        <dt>합계</dt>
                                                        <dd></dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>낙찰가</dt>
                                                        <dd><strong>{{comma(liveBidHisHammerTotalBidPrice)}}</strong></dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>수수료</dt>
                                                        <dd>{{comma(liveBidHisHammerTotalFee)}}</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>구매가</dt>
                                                        <dd>{{comma(liveBidHisHammerTotalPayPrice)}}</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>배송비</dt>
                                                        <dd>0</dd>
                                                    </dl>
                                                </div>
                                                <div class="total-box">
                                                    <dl class="price-list">
                                                        <dt>총결제금액</dt>
                                                        <dd><em>{{comma(liveBidHisHammerTotalPayPrice)}}</em></dd>
                                                    </dl>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </article>

                                <article class="articles-area">
                                    <div class="area-header">
                                        <div class="title">확인사항</div>
                                    </div>
                                    <div class="area-body">
                                        <ul class="mark_dot-list">
                                            <li class="">낙찰자는 낙찰을 철회할 수 없습니다.</li>
                                            <li class="">부득이 철회를 하는 경우에는 낙찰일로부터 7일 이내에 서면으로 철회의사를 통보하고, 위약별로 낙찰가의 30%에 해당하는 금액을 낙찰일로부터 7일 이내에 납부하여야 합니다.</li>
                                        </ul>
                                    </div>
                                </article>
                                <article class="articles-area">
                                    <div class="area-header">
                                        <div class="title">결제안내</div>
                                    </div>
                                    <div class="area-body">
                                        <div class="payment_info-box">
                                            <div class="text-account">
                                                <strong class="tt5">입금계좌</strong> <br class="only-mb" />
                                                <em class="tt5">우리은행 1005-902-012409</em>
                                                <span class="tt5">(서울옥션)</span>
                                            </div>
                                            <div class="text-notice">
                                                <i class="icon-inquiry"></i>
                                                <span class="tb2">입금 후 전화 확인 바랍니다 &nbsp; (02-395-0330)</span>
                                            </div>
                                        </div>
                                        <p class="contact_us">
                                            <span>문의 02-395-0330 / 메일</span> <a href="mailto:sos@seoulauction.com">sos@seoulauction.com</a>
                                        </p>
                                        <ul class="mark_dot-list">
                                            <li class="">계좌입금 시 입금 메모란에 실제 낙찰자의 이름을 명시해 주십시오. 입금자와 낙찰자의 이름이 일치하지 않을 경우,
                                                입금확인이 어려울 수 있으며, 이에 대한 불이익은 서울옥션에서 책임지지 않습니다.</li>
                                            <li class="">낙찰자는 경매후 7일(낙찰가 3억원 이상인 경우는 21일) 이내에 구매수수료를 포함한 금액을 입금하신 후 작품을 인수하시기
                                                바랍니다.</li>
                                            <li class="">낙찰자는 응찰전 당사와의 합의에 의하여 구매대금을 분할 납부할 수 있습니다.</li>
                                            <li class="">낙찰자는 총 구매대금을 당사 지정의 은행계정송금, 자기앞수표, 현금 등으로 지불할 수 있습니다.</li>
                                        </ul>

                                    </div>
                                </article>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
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


    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>




    <script>
        $(".js-history_back").click(function() {
            window.history.back();
        })
    </script>
    <script>
        (function() {
            var popup_marketing1 = $(".js-popup_auction_live_record").trpLayerFixedPopup("#popup_auction_live_record-wrap");
            $(popup_marketing1.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_marketing1.open(this); // or false   
                popup_fixation("#popup_auction_live_record-wrap"); // pc 스크롤
                popup_motion_open("#popup_auction_live_record-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_auction_live_record-wrap .js-closepop, #popup_auction_live_record-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_marketing1.close();
                popup_motion_close("#popup_auction_live_record-wrap");
            });

            $(".js-history_back").click(function() {
                window.history.back();
            })
        })();
    </script>
   <script>
        (function() {
            var popup_offline_payment = $(".js-popup_offline_payment").trpLayerFixedPopup("#popup_offline_payment-wrap");
            $(popup_offline_payment.getBtn).on("click", function($e) {
                $e.preventDefault();
                console.log("open11")
                popup_offline_payment.open(this); // or false 
                popup_fixation("#popup_offline_payment-wrap");
            });

            $("body").on("click", "#popup_offline_payment-wrap .js-closepop, #popup_offline_payment-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_offline_payment.close();
            });

            /* 아코디언 */
            var pop_accordion = $(".js-accordion-btn").trpToggleBtn(
                function($this) {
                    $($this).addClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideDown("fast");
                },
                function($this) {
                    $($this).removeClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideUp("fast");
                });



        })();
    </script>

</body>

</html>