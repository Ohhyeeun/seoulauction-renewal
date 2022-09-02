<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 전체 LOT 보기 팝업 -->
<template id="online-auction-list-popup">
  <aside class="allview_fixed-wrap lot">
    <!--<div class="popup-dim"></div> -->
    <div class="fixed-panel js-modal">
      <div class="panel-header">
        <button class="js-fixed_total">
          <span>전체 LOT</span>
          <i class="icon-fixed_arrow-2x"></i>
        </button>
      </div>
      <div class="panel-body">
        <article class="bidding-offline-left">
          <div class="lotlist-wrap">
            <div class="lotlist-header">
              <div class="header_top">
                <p class="totalcount dropdown-lots">
                  <span class="num"></span>
                  <span class="unit">LOT</span>
                </p>
              </div>
              <div class="tab-area type-left_mm_3">
                <ul class="tab-list js-left_mm">
                  <li class="active">
                    <a href="#tab-cont-1">
                      <span>전체</span>
                    </a>
                  </li>
                  <li class="">
                    <a href="#tab-cont-2">
                      <span>근현대</span>
                    </a>
                  </li>
                  <li class="">
                    <a href="#tab-cont-3">
                      <span>고미술</span>
                    </a>
                  </li>
                  <li class="">
                    <a href="#tab-cont-4">
                      <span>시계</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="lotlist-tabCont">
              <div class="mobile_scroll-type">
                <div class="lotlist-box">
                  <ul class="lotlist-inner">
                    <li class="lotitem bidded">
                      <div class="js-select_lotitem lotitem_wrap">
                        <div class="view-img">
                          <div class="img-box">
                            <div class="box-inner">
                              <img src="/images/temp/temp_img0.jpg" alt="LOT 02">
                            </div>
                          </div>
                        </div>
                        <div class="item-cont">
                          <div class="num-box">
                            <div class="num">
                              <span class="snum">1</span>
                            </div>
                          </div>
                          <div class="typo-box">
                            <div class="title">
                              <span></span>
                            </div>
                            <div class="desc">
                              <span>Air (From The Series The Elements)</span>
                            </div>
                          </div>
                          <div class="btn-box">
                            <button class="btn-lotChk js-work_heart on ">Favorite</button>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>
  </aside>
</template>
<!-- 전체 LOT 보기 팝업 //-->