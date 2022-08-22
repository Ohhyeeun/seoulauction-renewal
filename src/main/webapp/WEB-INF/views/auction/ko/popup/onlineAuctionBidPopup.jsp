<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 응찰하기(온라인) -->
<template id="online-bid-popup">
  <style>
    #popup_biddingPopup2-wrap.open {
      z-index: 10 !important;
      display: flex;
      position: fixed;
    }

    #popup_biddingPopup2-wrap.open .popup-dim {
      background-color: rgba(0,0,0,0.6);
      opacity: 1;
    }

    #popup_biddingPopup2-wrap .online-bid-list-empty {
      display: none;
    }

    #popup_biddingPopup2-wrap .online-bid-list {
      display: none;
    }
  </style>
  <div id="popup_biddingPopup2-wrap" class="trp popupfixed-wrap bidding-online-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-lg mode-mb_full">
      <div class="popup-vertical">
        <div class="popup-layer">
          <div class="pop-panel">
            <div class="pop-header">
              <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
              <div class="title-box">
                <span class="txt_title bid-lot-no">LOT 0</span>
              </div>
            </div>

            <div class="pop-body scroll-type">
              <section class="section">
                <div class="bidding-online-wrap">
                  <article class="bidding-online-left">
                    <figure class="view-area">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img class="bid-lot-image" src="/images/bg/no_image.jpg" alt="LOT 02" />
                          </div>
                        </div>
                      </div>
                      <figcaption class="view-typo">
                        <div class="typo-header">
                          <div class="title"><span class="bid-lot-artist">&nbsp;</span></div>
                          <div class="year"><span class="bid-lot-artist-born">&nbsp;</span></div>
                          <div class="desc"><span class="bid-lot-title">&nbsp;</span></div>
                        </div>
                        <div class="typo-body">
                          <span class="bid-lot-material">&nbsp;</span>
                          <ul>
                            <li class="bid-lot-size">&nbsp;</li>
                            <li class="bid-lot-year">&nbsp;</li>
                          </ul>
                        </div>
                      </figcaption>
                    </figure>
                  </article>

                  <article class="bidding-online-right js-bidding_tab">
                    <div class="legend-area">
                      <div class="side_time">
                        <span class="bid-lot-remain-times">남은시간 20:00:00</span>
                      </div>
                      <div class="unit">
                        <span>호가단위 : </span>
                        <em class="bid-lot-grow-price">KRW 200,000 </em>
                      </div>
                    </div>
                    <div class="product-list-area">
                      <div class="list-header">
                        <div class="price-name"><span class="bid-lot-price-title">현재가</span></div>
                        <div class="price-amount bid-lot-price-data"><em>KRW 1,700,000</em> <span>(응찰11)</span></div>
                      </div>
                      <div class="list-body scroll-type">
                        <ul class="product-list online-bid-list">
                          <!-- [0516]최고가표기 -->
                          <li>
                            <div class="product-user on_green"><span>dj****</span></div>
                            <div class="product-price on_red"><span>1,600,000</span></div>
                            <div class="product-day"><em class="type-success">낙찰</em><span>2033-03-16</span><span>14:20:21</span></div>
                          </li>
                          <li>
                            <div class="product-user"><span>dj****</span></div>
                            <div class="product-price "><span>1,600,000</span></div>
                            <div class="product-day"><em class="type-auto">자동</em><span>2033-03-16</span><span>14:20:21</span></div>
                          </li>
                          <!-- // [0516]최고가표기 -->
                          <li>
                            <div class="product-user"><span>dj****</span></div>
                            <div class="product-price"><span>1,600,000</span></div>
                            <div class="product-day"><span>2033-03-16</span><span>14:20:21</span></div>
                          </li>
                          <li>
                            <div class="product-user"><span>dj****</span></div>
                            <div class="product-price"><span>1,600,000</span></div>
                            <div class="product-day"><span>2033-03-16</span><span>14:20:21</span></div>
                          </li>
                          <li>
                            <div class="product-user"><span>dj****</span></div>
                            <div class="product-price"><span>1,600,000</span></div>
                            <div class="product-day"><span>2033-03-16</span><span>14:20:21</span></div>
                          </li>
                          <li>
                            <div class="product-user"><span>dj****</span></div>
                            <div class="product-price"><span>1,600,000</span></div>
                            <div class="product-day"><span>2033-03-16</span><span>14:20:21</span></div>
                          </li>
                        </ul>
                        <div class="data-empty online-bid-list-empty">
                          <p class="txt_empty tb1">응찰내역이 없습니다.</p>
                        </div>
                      </div>
                    </div>

                    <!-- Online End -->
                    <div class="online_end bid-end">
                      <div class="txt">
                        현재 LOT의 경매가 <span>종료</span>되었습니다.
                      </div>
                    </div>
                    <!-- Online End //-->

                    <!-- Online Ongoing -->
                    <div class="bid-ongoing">
                      <div class="topbtn-area">
                        <div class="btn_set">
                          <div class="btn_item select-bid-type-btn" data-bid-type-value="once">
                            <a class="btn btn_lg btn_gray" href="#" role="button"><span>1회 응찰</span></a>
                          </div>
                          <div class="btn_item select-bid-type-btn" data-bid-type-value="auto">
                            <a class="btn btn_lg btn_default" href="#" role="button"><span>자동응찰</span></a>
                          </div>
                        </div>
                      </div>

                      <div class="caution-area">
                        <ul class="mark_char-list">
                          <li class="accent"><span>응찰하기 버튼을 누르시면 취소가 불가능합니다.</span></li>
                          <li class=""><span>동시 응찰자 경우, 서버시각 기준 우선순위가 부여됩니다.</span></li>
                        </ul>
                      </div>

                      <div class="bottombtn-area">
                        <div class="btn_set bid-type-once">
                          <div class="btn_item">
                            <a id="bid-once-btn" class="btn btn_point btn_lg typo-pc_mb-line" href="#" role="button">
                              <span id="bid-once-btn-price">KRW 1,800,000</span> <span>응찰하기</span>
                            </a>
                          </div>
                        </div>
                        <div class="btn_set bid-type-auto">
                          <div class="btn_item">
                            <div class="select-box">
                              <!-- disabled 옵션 -->
                              <!-- [0613]자동응찰 옵션활성화,js 수정 -->
                              <select class="select2Basic56_line js-bidding_option select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                <!-- //[0613]자동응찰 옵션활성화,js 수정 -->
                                <option value="1">KRW 1,800,000</option>
                                <option value="2">KRW 1,900,000</option>
                                <option value="3">KRW 2,000,000</option>
                                <option value="4">KRW 2,100,000</option>
                                <option value="5">KRW 2,200,000</option>
                              </select>
                            </div>
                          </div>
                          <div class="btn_item">
                            <a id="bid-auto-btn" class="btn btn_point btn_lg js-bidding_btn" href="#" role="button">
                              <span>응찰하기</span>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </article>
                </div>
                <!-- Online Ongoing //-->
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 응찰하기(온라인) //-->

<!-- 응찰하기 확인 팝업 -->
<template id="go-bidding-popup-template">
  <div id="bidding_go-wrap" class="trp popupfixed-wrap auction_info-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
      <div class="popup-vertical">
        <div class="popup-layer">
          <div class="pop-panel">
            <div class="pop-header">
              <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
            </div>
            <div class="pop-body scroll-type">
              <section class="section" style="display: block;">
                <article class="auction_info-article">
                  <div class="img">
                    <img class="only_ib-pc" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                    <img class="only_ib-mb" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                  </div>
                  <div class="title"><span>Seoul Auction 안내</span></div>
                  <div class="gray-box">
                    <ul class="mark_dot-list">
                      <li>자동응찰 중지하기 전까지의 응찰 낙찰 내역은 모두 기록되며 유효합니다.</li>
                    </ul>
                  </div>
                  <div class="query"><span>응찰 하시겠습니까?</span></div>
                  <div class="btn_set">
                    <a class="btn btn_default" href="#" role="button"><span>취소</span></a>
                    <a class="btn btn_point" href="#" role="button"><span>응찰하기</span></a>
                  </div>
                </article>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 응찰하기 확인 팝업 //-->

<!-- 응찰중지 확인 팝업 -->
<template id="stop-bidding-popup-template">
  <div id="bidding_stop-wrap" class="trp popupfixed-wrap auction_info-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
      <div class="popup-vertical">
        <div class="popup-layer">
          <div class="pop-panel">
            <div class="pop-header">
              <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
            </div>
            <div class="pop-body scroll-type">
              <section class="section" style="display: block;">
                <article class="auction_info-article">
                  <div class="img">
                    <img class="only_ib-pc" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                    <img class="only_ib-mb" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                  </div>
                  <div class="title"><span>Seoul Auction 안내</span></div>
                  <div class="gray-box">
                    <ul class="mark_dot-list">
                      <li>자동응찰 중지는 자동 응찰 취소가 아닙니다.</li>
                      <li>비딩이 올라간 상태에서 정지됩니다.</li>
                    </ul>
                  </div>
                  <div class="query"><span>자동 응찰을 중지 하시겠습니까?</span></div>
                  <div class="btn_set">
                    <a class="btn btn_default" href="#" role="button"><span>취소</span></a>
                    <a class="btn btn_point" href="#" role="button"><span>자동응찰 중지</span></a>
                  </div>
                </article>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 응찰중지 확인 팝업 //-->