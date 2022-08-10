window.addEventListener('DOMContentLoaded', () => {
  renderCss();
});

window.onload = async () => {
  /**
   * [Variable] Global Variables
   */
  window.globalData = {};
  window.globalData.isLogin = Boolean(window.sessionStorage.getItem('is_login')) || false; // 로그인 유무
  window.globalData.currency = 'KRW'; // 기축 통화
  window.globalData.visibleLots = new Set(); // 현재 보고 있는 Lot 목록
  window.globalData.usePolling = true;

  // 문자열(숫자) 정렬
  const collator = new Intl.Collator(undefined, { numeric: true, sensitivity: 'base' });
  const fetcherWorker = new Worker('/js/online-auction-list/fetcher.worker.js');

  // [Load] URL 에서 각종 필수 데이터 가져오기
  const pageData = loadPageData();

  // 정렬 값 변경
  $('#sort-order').val(pageData.sort || 'LOTAS').select2();

  // 뷰 타입 변경
  if (!pageData.view || pageData.view === 'page') {
    $('#view-type').val('page').select2();
    document.querySelector('.paging-area').style.display = 'block';
    document.querySelector('.view-more-area').style.display = 'none';
  } else {
    $('#view-type').val('more').select2();
    document.querySelector('.paging-area').style.display = 'none';
    document.querySelector('.view-more-area').style.display = 'flex';
  }

  // API 콜 (세일 정보)
  const saleInfoResult = await callApiSaleInfo(pageData.saleNo);
  // 기축 통화 재설정
  if (saleInfoResult?.CURR_CD) {
    window.globalData.currency = saleInfoResult.CURR_CD;
  }

  // API 콜 (랏 목록, 좋아요 목록)
  const [lotListResult, favoriteLotsResult] = await Promise.all([
    await callApiLotList(pageData),
    await callApiFavoriteLots(pageData.saleNo),
  ]);

  const totalCount = lotListResult.totalCount;
  let rows = [...lotListResult.rows];

  // 관심작품 처리
  if (favoriteLotsResult.length > 0) {
    favoriteLotsResult.forEach(item => {
      const { LOT_NO, INTE_LOT } = item;
      const lotIndex = lotListResult.rows.findIndex(lot => lot.LOT_NO === LOT_NO && INTE_LOT === 'Y');
      if (lotIndex > -1) {
        rows[lotIndex].isFavorite = true;
      }
    });
  }

  // 화면 렌더링
  await Promise.all([
    renderSaleTitleSection(saleInfoResult), // 타이틀 섹션 렌더링
    renderLotListSection({ totalCount, rows }), // 랏 목록 렌더
    renderPaginationSection(pageData.page, totalCount, pageData.size), // 페이징 렌더
  ]);

  await sleep(300);

  // 더보기 처리
  renderViewMore();

  // [Event] 정렬 변경 이벤트
  $('#sort-order').on('select2:select', function (e) {
    let pageData = loadPageData();
    pageData.page = 1;
    pageData.sort = e.target.value;
    window.location.href = makeUrl(pageData);
  });

  // [Event] 보기방식 변경 이벤트 (page | more)
  $('#view-type').on('select2:select', function (e) {
    renderViewMore();
    window.globalData.viewType = e.target.value;

    if (e.target.value === 'more') {
      const data = { view: 'more' };
      window.location.href = makeUrl(data);
      return;
    }

    const data = { view: 'page' };
    window.location.href = makeUrl(data);
  });

  /**
   * Polling Logic 시작
   */
  const io = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        window.globalData.visibleLots.add(entry.target.dataset.lotNo);
      } else {
        window.globalData.visibleLots.delete(entry.target.dataset.lotNo);
      }
    });
  }, {
    threshold: 0.5, // 겹침 정도 (1: 전체보임)
  });

  document.querySelector('ul.product-list').querySelectorAll('li').forEach(el => {
    io.observe(el);
  });

  // 일정 주기별로 보고 있는 항목들을 데이터로 옮김
  setInterval(visibleLotsInterval, 1000);
  function visibleLotsInterval() {
    const activeLots = [...window.globalData.visibleLots].sort(collator.compare);
    const activeLotsString = activeLots.join(',');
    // document.querySelector('#lot-title').innerHTML = `<div style="color:blue;">${activeIndexesString}</div>`;

    if (window.globalData.usePolling && navigator.onLine) {
      fetcherWorker.postMessage({ saleNo: pageData.saleNo, lots: activeLotsString });
    }
  }

  fetcherWorker.onmessage = evt => {
    if (evt.data.length > 0) {
      evt.data.forEach(item => {
        document.getElementById(`data-lot-${item.lotNo}-expect-price`).innerHTML = item.expectPrice;
        document.getElementById(`data-lot-${item.lotNo}-start-price`).innerHTML = item.startPrice;
        document.getElementById(`data-lot-${item.lotNo}-hammer-price`).innerHTML = item.hammerPrice;
        document.getElementById(`data-lot-${item.lotNo}-remain-time`).innerHTML = item.remainTimeValues;
      })
    }
  };
}

/**
 * 전역 CSS 렌더링
 */
function renderCss() {
  const styleString = `
  @-webkit-keyframes skeleton-gradient {
    0% {
      background-color: rgba(165, 165, 165, 0.1);
    }

    50% {
      background-color: rgba(165, 165, 165, 0.3);
    }

    100% {
      background-color: rgba(165, 165, 165, 0.1);
    }
  }

  @keyframes skeleton-gradient {
    0% {
      background-color: rgba(165, 165, 165, 0.1);
    }

    50% {
      background-color: rgba(165, 165, 165, 0.3);
    }

    100% {
      background-color: rgba(165, 165, 165, 0.1);
    }
  }

  .wrapper.online-auction .sticky-tab-menu {
    position: -webkit-sticky;
    position: sticky;
    top: 6.36rem;
    z-index: 4;
    margin-top: 1rem;
    padding: 0 3rem;
    background-color: #fff;
  }

  @media screen and (max-width: 1023px) {
    .wrapper.online-auction .sticky-tab-menu {
      padding: 0;
      top: 3.55rem;
    }
  }
  #lot-title {
    position: fixed;
    top: 0;
    background: #fff;
    z-index: 100;
  }

  #popup_biddingPopup2-wrap.open {
    z-index: 10 !important;
    display: flex;
    position: fixed;
  }
  
  #popup_biddingPopup2-wrap.open .popup-dim {
    background-color: rgba(0,0,0,0.6);
    opacity: 1;
  }
  
  .view-more-area {
    display: flex;
    justify-content: center;
  }
  `;

  let style = document.createElement('style');
  style.textContent = styleString;
  document.head.appendChild(style);
}