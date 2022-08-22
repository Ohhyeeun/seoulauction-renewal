<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/ko/header.jsp" />
<body>
<div class="wrapper online-auction">
  <div class="sub-wrap pageclass type-width_list">
    <jsp:include page="../../include/ko/nav.jsp" />

    <!-- container -->
    <div id="container">
      <div id="contents" class="contents">
        <!-- 페이지 타이틀 영역 -->
        <section class="page_title-section list_page-section">
          <div class="section-inner full_size">
            <div class="padding-inner">
              <article class="auction_head_info-article">
                <div class="center-box ing">
                  <h2 class="page_title">
                    <span class="th1">&nbsp;</span>
                  </h2>
                  <ul class="event_day-list">
                    <li>
                      <span class="colorB2">프리뷰</span>
                      <span class="preview-date"> : &nbsp;</span>
                    </li>
                    <li>
                      <span class="colorB2">경매일</span>
                      <span class="to-date"> : &nbsp;</span>
                    </li>
                  </ul>
                  <div class="btn_set">
                    <a class="btn btn_white" href="#" role="button">
                      <span>안내사항</span>
                    </a>
                  </div>
                </div>
              </article>

              <!-- 진행중 랏 영역 -->
              <article class="proceeding-article">
                <a href="#" title="진행중 Lot 10|김선우">
                  <div class="article-inner">
                    <div class="column ing">
                      <strong class="note_msg">진행중 Lot</strong>
                      <ul class="ac-list">
                        <li>
                          <span class="count">10</span>
                        </li>
                        <li>
                          <span class="name">김선우</span>
                        </li>
                      </ul>
                    </div>
                    <i class="icon-link_arrow"></i>
                  </div>
                </a>
              </article>
              <!-- 진행중 랏 영역 //-->
            </div>
          </div>
        </section>
        <!-- 페이지 타이틀 영역 //-->

        <!-- 카테고리 영역 -->
        <section class="sticky-tab-menu">
          <div class="tab-wrap js-tabmenu-sticky">
            <div class="tab-area type-left">
              <ul class="tab-list js-list_tab" data-category></ul>
            </div>
          </div>
        </section>
        <!-- 카테고리 영역 //-->

        <section class="basis-section tab-auction-section">
          <div class="section-inner">
            <!-- 텝메뉴 -->
            <div class="content-panel type_panel-search_tab">
              <div class="panel-body">
                <article class="search_tab-article">
                  <div class="article-body">
                    <div class="col_item mb-col1">
                      <div class="count tb1">
                        <span>ALL <em id="lot-total-count">0</em>
                        </span>
                      </div>
                      <div class="select-box only-pc">
                        <div class="trp-dropdown-area h42-line">
                          <button class="js-dropdown-btn">
                            <span>LOT</span>
                            <i class="form-select_arrow_md"></i>
                          </button>
                          <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                            <div class="search-box">
                              <input type="search" placeholder="LOT 번호 입력" id="" class="">
                              <i class="form-search_md"></i>
                            </div>
                            <div class="list-box scroll-type">
                              <ul>
                                <li>
                                  <a href="#">
                                    <div class="image-area">
                                      <figure class="img-ratio">
                                        <div class="img-align">
                                          <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                        </div>
                                      </figure>
                                    </div>
                                    <div class="typo-area">
                                      <span>LOT</span>
                                    </div>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <div class="image-area">
                                      <figure class="img-ratio">
                                        <div class="img-align">
                                          <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                        </div>
                                      </figure>
                                    </div>
                                    <div class="typo-area">
                                      <span>LOT1</span>
                                    </div>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <div class="image-area">
                                      <figure class="img-ratio">
                                        <div class="img-align">
                                          <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                        </div>
                                      </figure>
                                    </div>
                                    <div class="typo-area">
                                      <span>LOT2</span>
                                    </div>
                                  </a>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="select-box js-lotbox-slct only-mb">
                        <button class="js-lotbox-btn">
                          <span>LOT</span>
                          <i class="slct-arrow"></i>
                        </button>
                      </div>
                      <!-- //[0714]LOT셀렉트박스 모바일 분리/변경 -->
                    </div>

                    <div class="col_item mb-col2">
                      <div class="search-box">
                        <input type="search" id="search-input" placeholder="작가/작품명" class="h42" />
                        <i class="form-search_md"></i>
                      </div>
                      <div class="select-box">
                        <select id="sort-order" class="select2Basic42">
                          <option value="LOTAS">LOT 번호순</option>
                          <option value="ESTDE">추정가 높은 순</option>
                          <option value="ESTAS">추정가 낮은 순</option>
                          <option value="BIPDE">응찰가 높은 순</option>
                          <option value="BIPAS">응찰가 낮은 순</option>
                          <option value="BICDE">응찰수 높은 순</option>
                          <option value="BICAS">응찰수 낮은 순</option>
                        </select>
                      </div>
                      <div class="select-box">
                        <select class="select2Basic42 js-select_page" id="view-type">
                          <option value="page">페이지 방식</option>
                          <option value="more">더보기 방식</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </article>
              </div>
            </div>
          </div>
        </section>

        <section class="basis-section last-section auction_list-section">
          <div class="section-inner">
            <div class="content-panel type_panel-product_list">
              <div class="panel-body">
                <ul id="lot-list" class="product-list"></ul>
              </div>

              <div class="panel-footer">
                <div class="paging-area">
                  <div class="paging"></div>
                </div>
                <div class="view-more-area">
                  <button type="button" class="btn btn_gray_line">
                    <span>더보기</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
    <!-- container //-->

    <jsp:include page="../../include/ko/footer.jsp" />

    <!-- Scroll Top Button -->
    <div class="scroll_top-box">
      <div class="box-inner">
        <a href="#" class="btn-scroll_top js-scroll_top">
          <i class="icon-scroll_top"></i>
        </a>
      </div>
    </div>
    <!-- Scroll Top Button //-->
  </div>
</div>

<jsp:include page="popup/onlineAuctionListPopup.jsp" />
<jsp:include page="popup/onlineAuctionBidPopup.jsp" />

<!-- 순차적으로 실행 -->
<script src="/js/online-auction/api.js" defer></script>
<script src="/js/online-auction/utils.js" defer></script>
<script src="/js/online-auction/bid-utils.js" defer></script>
<script src="/js/online-auction-list/api.js" defer></script>
<script src="/js/online-auction-list/renderTitle.js" defer></script>
<script src="/js/online-auction-list/renderLotList.js" defer></script>
<script src="/js/online-auction-list/renderPaging.js" defer></script>
<script src="/js/online-auction-list/ui.js" defer></script>
<script src="/js/online-auction-list/utils.js" defer></script>
<script src="/js/online-auction-list/index.js" defer></script>
</body>
</html>
