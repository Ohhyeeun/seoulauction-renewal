<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 응찰하기 확인 팝업 -->
<template id="go-auto-bid-popup">
  <div id="bidding_go-wrap" class="trp popupfixed-wrap auction_info-popup">
    <!-- <div class="popup-dim"></div> -->
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
                    <a class="btn btn_default cancel-btn" href="#" role="button"><span>취소</span></a>
                    <a class="btn btn_point confirm-btn" href="#" role="button"><span>응찰하기</span></a>
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