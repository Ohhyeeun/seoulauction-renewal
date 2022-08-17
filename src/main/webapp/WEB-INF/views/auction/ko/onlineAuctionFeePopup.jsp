<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 낙찰 수수료 팝업 -->
<template id="auction-fee-popup-template">
  <div id="auction-fee-popup" class="trp popupfixed-wrap default-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-md mode-mb_fixed">
      <div class="popup-vertical">
        <div class="popup-layer" style="display: inline-block;">
          <div class="pop-panel">
            <div class="pop-header">
              <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
              <div class="title-box">
                <span class="txt_title">낙찰 수수료</span>
              </div>
            </div>
            <div class="pop-body scroll-type">
              <!-- [0613]전체수정 -->
              <section class="section" style="display: block;">
                <article class="articles-box">
                  <table class="table_base data-table name-bid_commission">
                    <thead>
                    <tr>
                      <th>국내 경매</th>
                      <th>홍콩 경매</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>
                        <span>일괄 18% (부가세 별도)</span>
                      </td>
                      <td>
                        <span>일괄 18%</span>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </article>
                <article class="articles-typo">
                  <ul class="mark_dot-list">
                    <li class="text-help">낙찰가(Hammer Price) : 경매사가 낙찰봉을 두드리면서 낙찰된 금액</li>
                    <li class="text-help">구매가(Purchase Price) : 낙찰가 + 낙찰 수수료 + 부가가치세가 합산된 금액</li>
                    <li class="text-help">현재가 기준 891,000원</li>
                  </ul>
                </article>
              </section>
              <!-- //[0613]전체수정 -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 낙찰 수수료 팝업 //-->