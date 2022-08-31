<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 응찰하기(온라인) -->
<template id="online-bid-popup">
  <style>
    #popup_biddingPopup2-wrap.open {
      z-index: 10 !important;
      display: flex;
      position: fixed;
    }
  </style>
  <div id="popup_biddingPopup2-wrap" class="trp popupfixed-wrap bidding-online-popup">
    <!-- <div class="popup-dim"></div> -->
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

                      <div class="list-body scroll-type" id="online-bid-list-body">
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
                              <span id="bid-once-btn-price">KRW 0</span> <span>응찰하기</span>
                            </a>
                          </div>
                        </div>
                        <div class="btn_set bid-type-auto">
                          <div class="btn_item">
                            <div class="select-box">
                              <select class="select2Basic56_line js-bidding_option select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                <option value="0">KRW 0</option>
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
