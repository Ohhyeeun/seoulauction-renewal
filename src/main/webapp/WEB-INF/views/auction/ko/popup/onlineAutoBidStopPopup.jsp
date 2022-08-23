<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 응찰중지 확인 팝업 -->
<template id="stop-auto-bid-popup">
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
                    <a class="btn btn_default cancel-btn" href="#" role="button"><span>취소</span></a>
                    <a class="btn btn_point confirm-btn" href="#" role="button"><span>자동응찰 중지</span></a>
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