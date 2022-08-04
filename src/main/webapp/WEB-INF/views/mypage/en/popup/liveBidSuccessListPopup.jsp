
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<div id="popup_offline_payment-wrap"
	class="trp popupfixed-wrap offline_payment-popup ">
	<div class="popup-dim"></div>
	<div class="popup-align mode-xl mode-mb_full">
		<div class="popup-vertical">
			<div class="popup-layer">

				<div class="pop-panel">
					<div class="pop-header">
						<a class="btn_close icon-pop_close js-closepop" href="#"
							title="닫기">X</a>
						<div class="title-box">
							<span class="txt_title">{{liveBidHisHammerList[0].SALE_TITLE_EN}}</span>
						</div>
					</div>
					<div class="pop-body scroll-type">
						<section class="section" style="display: block;">
							<article class="articles-area">

								<div class="only-pc">
									<table class="table_base data-table name-payment_price">
										<thead>
											<tr>
												<th>LOT</th>
												<th>Author/Title of work</th>
												<th>Hammer</th>
												<th>Fees</th>
												<th>Buy Price</th>
												<th>Shipping</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="liveBidHisHammer in liveBidHisHammerList">
												<td class=""><span>{{liveBidHisHammer.LOT_NO}}</span></td>
												<td class=""><span class="tb1">{{liveBidHisHammer.ARTIST_NAME_EN}}
														/ {{liveBidHisHammer.LOT_TITLE_EN}}</span></td>
												<td class="tar"><span>{{comma(liveBidHisHammer.BID_PRICE)}}</span>
												</td>
												<td class="tar"><span>{{comma(liveBidHisHammer.FEE)}}</span>
												</td>
												<td class="tar"><span>{{comma(liveBidHisHammer.PAY_PRICE)}}</span>
												</td>
												<td class="tar"><span>0</span></td>
											</tr>
											<tr>
												<td class=""><strong>Total</strong></td>
												<td class=""><strong></strong></td>
												<td class="tar"><strong>{{comma(liveBidHisHammerTotalBidPrice)}}</strong>
												</td>
												<td class="tar"><strong>{{comma(liveBidHisHammerTotalFee)}}</strong>
												</td>
												<td class="tar"><strong>{{comma(liveBidHisHammerTotalPayPrice)}}</strong>
												</td>
												<td class="tar"><strong>0</strong></td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<th colspan="6" class="tar"><strong>Payment
														amount</strong> <em>{{comma(liveBidHisHammerTotalPayPrice)}}</em></th>
											</tr>
										</tfoot>
									</table>
								</div>
								<div class="only-mb">

									<div class="payment_price-accordion">
										<div class="accordion-header">
											<a href="#" class="accordion-inner js-accordion-btn">
												<div class="title">
													<strong>Winning Bid</strong>
												</div>
												<div class="count">
													<em>{{liveBidHisHammerCnt}}</em>
												</div> <i class="icon-accordion_arrow-2x"></i>
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
																		<img
																			src="${imageRootPath}{{liveBidHisHammer.FILE_PATH}}/{{liveBidHisHammer.FILE_NAME}}"
																			alt="">
																	</div>
																</figure>
															</div>

															<div class="typo-area">
																<div class="num">
																	<span>{{liveBidHisHammer.LOT_NO}}</span>
																</div>
																<div class="title">{{liveBidHisHammer.ARTIST_NAME_EN}}</div>
																<div class="desc">
																	<span>{{liveBidHisHammer.LOT_TITLE_EN}}</span>
																</div>
															</div>
														</div>
														<div class="item-body">
															<dl class="price-list">
																<dt>Hammer</dt>
																<dd>{{comma(liveBidHisHammer.BID_PRICE)}}</dd>
															</dl>
															<dl class="price-list">
																<dt>Fees</dt>
																<dd>{{comma(liveBidHisHammer.FEE)}}</dd>
															</dl>
															<dl class="price-list">
																<dt>Buy Price</dt>
																<dd>{{comma(liveBidHisHammer.PAY_PRICE)}}</dd>
															</dl>
															<dl class="price-list">
																<dt>Shipping</dt>
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
													<dt>Total</dt>
													<dd></dd>
												</dl> 
												<dl class="price-list">
													<dt>Hammer</dt>
													<dd>
														<strong>{{comma(liveBidHisHammerTotalBidPrice)}}</strong>
													</dd>
												</dl>
												<dl class="price-list">
													<dt>Fees</dt>
													<dd>{{comma(liveBidHisHammerTotalFee)}}</dd>
												</dl>
												<dl class="price-list">
													<dt>Buy Price</dt>
													<dd>{{comma(liveBidHisHammerTotalPayPrice)}}</dd>
												</dl>
												<dl class="price-list">
													<dt>Shipping</dt>
													<dd>0</dd>
												</dl>
											</div>
											<div class="total-box">
												<dl class="price-list">
													<dt>Payment amount</dt>
													<dd>
														<em>{{comma(liveBidHisHammerTotalPayPrice)}}</em>
													</dd>
												</dl>
											</div>
										</div>

									</div>
								</div>
							</article>

							<article class="articles-area">
								<div class="area-header">
									<div class="title">Checklist</div>
								</div>
								<div class="area-body">
									<ul class="mark_dot-list">
										<li class="">The successful bidder cannot withdraw the
											winning bid.</li>
										<li class="">In case of unavoidable withdrawal, the
											intention to withdraw must be notified in writing within 7
											days of the successful bid, and 30% of the successful bid
											price for each breach must be paid within 7 days of the
											successful bid.</li>
									</ul>
								</div>
							</article>
							<article class="articles-area">
								<div class="area-header">
									<div class="title">Settlement</div>
								</div>
								<div class="area-body">
									<!-- <div class="payment_info-box">
                      <div class="text-account">
                        <strong class="tt5">입금계좌</strong> <br class="only-mb" />
                        <em class="tt5">우리은행  1005-902-012409</em>
                        <span class="tt5">(서울옥션)</span>
                      </div>
                      <div class="text-notice">
                        <i class="icon-inquiry"></i>
                        <span class="tb2">입금 후 전화 확인 바랍니다 &nbsp; (02-395-0330)</span>
                      </div>
                    </div> -->
									<!-- <p class="contact_us">
                      <span>문의 02-395-0330 / 메일</span> <a href="mailto:sos@seoulauction.com">sos@seoulauction.com</a>
                    </p> -->
									<ul class="mark_dot-list">
										<li class="">After payment is confirmed, delivery is
											possible.</li>
										<li class="">You can pick it up directly at Head Office.</li>
										<li class="">Inquiry : +82 (0)2 2075 4422 (English), +82
											(0)2 2075 4391 (中國語)(Head Office)<br> Operation time :
											Mon~Fri 9:00~17:00 (lunch time 12:00~1:00)
										</li>
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