<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../../include/ko/header.jsp" />
<body>
<div class="wrapper online-auction">
  <div class="sub-wrap pageclass type-width_list">
    <jsp:include page="../../include/ko/nav.jsp" />

    <div id="container">
      <div id="contents" class="contents">
        <section class="basis-section last-section auction_view-section">
          <div class="section-inner">
            <div class="content-panel type_panel-product_view">
              <div class="panel-header">
                <!-- Page Header Area -->
                <div class="header-inner">
                  <article class="page_name-article js-page_name-article">
                    <div class="row-box">
                      <div class="col_item">
                        <div class="page_title">
                          <a href="#" onclick="window.history.back()" title="뒤로가기">
                            <i class="icon-page_back"></i>
                          </a>
                          <span id="data-sale-title">&nbsp;</span>
                        </div>
                      </div>
                      <div class="col_item">
                        <div class="select-box">
                          <div class="trp-dropdown-area h42-lines">
                            <jsp:include page="online/modal-lot-summary-dropdown.jsp" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </article>
                </div>
                <!-- Page Header Area //-->
              </div>

              <div class="panel-body">
                <jsp:include page="online/detail-info.jsp" />
                <jsp:include page="online/detail-descriptions.jsp" />
              </div>

              <div class="panel-footer">
                <jsp:include page="online/detail-recent-views.jsp" />
              </div>
            </div>
          </div>
        </section>
        <jsp:include page="online/detail-sticky-bidding.jsp" />
      </div>
    </div>

    <jsp:include page="../../include/ko/footer.jsp" />
  </div>
</div>
<jsp:include page="online/scroll-top.jsp" />

<!-- Popup List -->
<jsp:include page="popup/onlineFeePopup.jsp" />
<jsp:include page="popup/onlineGrowPricePopup.jsp" />
<jsp:include page="popup/onlineAuthPhonePopup.jsp" />
<jsp:include page="popup/onlineBidPopup.jsp" />
<jsp:include page="popup/onlineDirectLotPopup.jsp" />
<jsp:include page="popup/onlineAllLotList.jsp" />
<jsp:include page="popup/onlineAutoBidConfirmPopup.jsp" />
<jsp:include page="popup/onlineAutoBidStopPopup.jsp" />
<!-- Popup List //-->

<script src="/js/online-auction/types.js" defer></script>
<script src="/js/online-auction/api.js" defer></script>
<script src="/js/online-auction/bid-fetcher.worker.js" defer></script>
<script src="/js/online-auction/bid-online.js" defer></script>
<script src="/js/online-auction/lot-dropdown.js" defer></script>
<script src="/js/online-auction/utils.js" defer></script>
<script src="/js/online-auction/utils-bid.js" defer></script>
<script src="/js/online-auction/utils-recent-view.js" defer></script>

<script src="/js/online-auction-view/renderDetailInfo.js" defer></script>
<script src="/js/online-auction-view/renderArtistInfo.js" defer></script>
<script src="/js/online-auction-view/index.js" defer></script>
</body>
</html>
