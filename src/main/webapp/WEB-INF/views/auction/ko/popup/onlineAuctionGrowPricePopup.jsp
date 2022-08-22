<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 경매 호가표 팝업 -->
<template id="auction-grow-price-popup-template">
  <div id="auction-grow-price-popup" class="trp popupfixed-wrap default-popup" style="display: block;">
    <div class="popup-dim"></div>
    <div class="popup-align mode-md mode-mb_fixed">
      <div class="popup-vertical">
        <div class="popup-layer" style="display: inline-block;">
          <div class="pop-panel">
            <div class="pop-header">
              <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
              <div class="title-box">
                <span class="txt_title">경매호가표 안내</span>
              </div>
            </div>
            <div class="pop-body scroll-type">
              <section class="section" style="display: block;">
                <article class="articles-box">
                  <table class="table_base data-table name-price_tag">
                    <thead>
                    <tr>
                      <th>현재가 구간 (원)</th>
                      <th>호가 단위 (원)</th>
                    </tr>
                    </thead>
                    <tbody id="grow_off_tbody">
                    <tr>
                      <td><span> ~ 100만 미만</span></td>
                      <td><span>50,000</span></td>
                    </tr>
                    <tr>
                      <td><span>100만 이상 ~ 300만 미만</span></td>
                      <td><span>100,000</span></td>
                    </tr>
                    <tr>
                      <td><span>300만 이상 ~ 500만 미만</span></td>
                      <td><span>200,000</span></td>
                    </tr>
                    <tr>
                      <td><span>500만 이상 ~ 1,000만 미만</span></td>
                      <td><span>300,000</span></td>
                    </tr>
                    <tr>
                      <td><span>1,000만 이상 ~ 3,000만 미만</span></td>
                      <td><span>500,000</span></td>
                    </tr>
                    <tr>
                      <td><span>3,000만 이상 ~ 5,000만 미만</span></td>
                      <td><span>1,000,000</span></td>
                    </tr>
                    <tr>
                      <td><span>5,000만 이상 ~ 1억 미만</span></td>
                      <td><span>2,000,000</span></td>
                    </tr>
                    <tr>
                      <td><span>1억 이상 ~ 2억 미만</span></td>
                      <td><span>3,000,000</span></td>
                    </tr>
                    <tr>
                      <td><span>2억 이상 ~ </span></td>
                      <td><span>5,000,000</span></td>
                    </tr>
                    </tbody>
                  </table>
                </article>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 경매 호가표 팝업 //-->