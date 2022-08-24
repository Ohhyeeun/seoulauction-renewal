<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../../include/ko/header.jsp" />
<jsp:include page="./onlineAuctionListHeadJs.jsp" />
</head>
<body>
<div class="wrapper online-auction">
  <div class="sub-wrap pageclass type-width_list">
    <jsp:include page="../../include/ko/nav.jsp" />

    <!-- container -->
    <div id="container">
      <div id="contents" class="contents">
        <!-- Page Title Area -->
        <section class="page_title-section list_page-section">
          <div class="section-inner full_size">
            <div class="padding-inner">
              <!-- 헤더 -->
              <article class="auction_head_info-article">
                <div class="center-box ing">
                  <h2 class="page_title">
                    <span class="th1" id="data-sale-name">&nbsp;</span>
                  </h2>
                  <ul class="event_day-list">
                    <li>
                      <span class="colorB2">프리뷰</span>
                      <span class="preview-date" id="data-preview-date"> : &nbsp;</span>
                    </li>
                    <li>
                      <span class="colorB2">경매일</span>
                      <span class="to-date" id="data-to-dt"> : &nbsp;</span>
                    </li>
                  </ul>
                  <div class="btn_set">
                    <a class="btn btn_white" href="#" role="button">
                      <span>안내사항</span>
                    </a>
                  </div>
                </div>
              </article>
              <!-- 헤더 //-->

              <!-- 마감중 헤더 -->
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
              <!-- 마감중 헤더 //-->
            </div>
          </div>
        </section>
        <!-- Page Title Area //-->

        <!-- Category Area -->
        <section class="sticky-tab-menu">
          <div class="tab-wrap js-tabmenu-sticky">
            <div class="tab-area type-left">
              <ul id="data-sale-category" class="tab-list js-list_tab"></ul>
            </div>
          </div>
        </section>
        <!-- Category Area //-->

        <section class="basis-section tab-auction-section">
          <div class="section-inner">
            <div class="content-panel type_panel-search_tab">
              <div class="panel-body">
                <article class="search_tab-article">
                  <div class="article-body">
                    <div class="col_item mb-col1">
                      <div class="count tb1">
                        <span>ALL <em id="lot-total-count">0</em></span>
                      </div>
                      <div class="select-box only-pc">
                        <jsp:include page="online/modal-lot-summary-dropdown.jsp" />
                      </div>
                      <div class="select-box js-lotbox-slct only-mb">
                        <button class="js-lotbox-btn">
                          <span>LOT</span>
                          <i class="slct-arrow"></i>
                        </button>
                      </div>
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
  </div>
</div>

<div class="scroll_top-box">
  <div class="box-inner">
    <a href="#" class="btn-scroll_top js-scroll_top">
      <i class="icon-scroll_top"></i>
    </a>
  </div>
</div>

<!-- Popup List -->
<jsp:include page="popup/onlineLotListPopupMobile.jsp" />
<jsp:include page="popup/onlineAuthPhonePopup.jsp" />
<jsp:include page="popup/onlineBidPopup.jsp" />
<jsp:include page="popup/onlineAutoBidConfirmPopup.jsp" />
<jsp:include page="popup/onlineAutoBidStopPopup.jsp" />
<!-- Popup List //-->

<jsp:include page="./onlineAuctionListBodyJs.jsp" />
</body>
</html>
