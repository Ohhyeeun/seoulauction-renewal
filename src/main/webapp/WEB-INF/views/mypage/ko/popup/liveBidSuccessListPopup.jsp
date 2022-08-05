   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
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
                                                        <span class="tb1" ng-if="liveBidHisHammer.ARTIST_NAME_KR" >{{liveBidHisHammer.ARTIST_NAME_KR}} / {{liveBidHisHammer.LOT_TITLE_KR}}</span>
                                                        <span class="tb1" ng-if="!liveBidHisHammer.ARTIST_NAME_KR">{{liveBidHisHammer.LOT_TITLE_KR}}</span>
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
                                                                        <img src="${imageRootPath}{{liveBidHisHammer.FILE_PATH}}/{{liveBidHisHammer.FILE_NAME}}" alt="">
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
                                                <span class="tb2">입금 후 전화 확인 바랍니다 &nbsp; (<a href="tel:02-395-0330">02-395-0330</a>)</span>
                                            </div>
                                        </div>
                                        <p class="contact_us">
                                            <span>문의 <a href="tel:02-395-0330">02-395-0330</a> / 메일</span> <a href="mailto:sos@seoulauction.com">sos@seoulauction.com</a>
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
    
        <script>
        (function() {
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