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
              <section class="section" style="display: block;">
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
                        <span>남은시간 종료</span>
                      </div>
                      <div class="unit">
                        <span>호가단위 : </span>
                        <em>KRW 200,000 </em>
                      </div>
                    </div>
                    <div class="product-list-area">
                      <div class="list-header">
                        <div class="price-name"><span>현재가</span></div>
                        <div class="price-amount"><em>KRW 1,700,000</em> <span>(응찰11)</span></div>
                      </div>
                      <div class="list-body scroll-type">
                        <ul class="product-list">
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
                      </div>
                    </div>
                    <div class="online_end">
                      <div class="txt">
                        현재 LOT의 경매가 <span>종료</span>되었습니다.
                      </div>
                    </div>
                  </article>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 응찰하기(온라인) //-->