window.onload = async () => {
  /**
   * [Variable] Global Variables
   */

  // 로그인 유무
  window.isLogin = Boolean(window.sessionStorage.getItem('is_login')) || false;

  // Base Currency
  window.currency = 'KRW';

  // Current Visible Lot Numbers
  let visibleIndexes = new Set();

  // 문자열(숫자) 정렬
  const collator = new Intl.Collator(undefined, { numeric: true, sensitivity: 'base' }); //
  const fetcherWorker = new Worker('/js/online-auction-list/fetcher.worker.js');

  window.sessionStorage.getItem('is_login')

  // [Event] 정렬 변경 이벤트
  $('#sort-order').on('select2:select', function (e) {
    console.log(e.target.value);
  });

  // [Event] 보기방식 변경 이벤트
  $('#view-type').on('select2:select', function (e) {
    console.log(e.target.value);
  });

  // [Load] URL 에서 각종 필수 데이터 가져오기
  const pageData = loadPageData();

  // 최초 API 콜(세일 정보, 랏 목록)
  const [saleInfoResult, lotListResult, favoriteLotsResult] = await Promise.all([
    await callApiSaleInfo(pageData.saleNo),
    await callApiLotList(pageData.saleNo, pageData.lotPage, pageData.lotSize),
    await callApiFavoriteLots(pageData.saleNo),
  ]);

  // TODO: favoriteLotsResult 결과 처리(각 랏 별로 좋아요 표시 처리)

  // 기축 통화 재설정
  if (saleInfoResult.CURR_CD) {
    window.currency = saleInfoResult.CURR_CD;
  }

  // 최초 화면 렌더링
  renderCss(); // TODO: 추후에 <head>에 넣어줘야 함

  await Promise.all([
    renderSaleTitleSection(saleInfoResult), // 타이틀 섹션 렌더링
    renderLotListSection(lotListResult), // 랏 목록 렌더
    renderPaginationSection(pageData.lotPage, lotListResult.totalCount, pageData.lotSize), // 페이징 렌더
  ]);

  await sleep(300);

  /**
   * Polling Logic 시작
   */
  const io = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        visibleIndexes.add(entry.target.dataset.index);
      } else {
        visibleIndexes.delete(entry.target.dataset.index);
      }
    });
  }, {
    threshold: 0.2, // 겹침 정도 (1: 전체보임)
  });

  document.querySelector('ul.product-list').querySelectorAll('li').forEach(el => {
    io.observe(el);
  });

  // 일정 주기별로 보고 있는 항목들을 데이터로 옮김
  setInterval(visibleIndexesInterval, 1000);
  function visibleIndexesInterval() {
    const isOnline = navigator.onLine;
    const activeIndexes = [...visibleIndexes].sort(collator.compare);
    const activeIndexesString = activeIndexes.join(',');
    // document.querySelector('#lot-title').innerHTML = `<div style="color:blue;">${activeIndexesString}</div>`;

    if (isOnline) {
      fetcherWorker.postMessage({ indexes: activeIndexesString });
    }
  }
}

/**
 * URL 에서 페이지 데이터 가져오기
 * @returns {null | { lotPage: number, lotSize: number, saleNo: number }}
 */
function loadPageData() {
  const pathname = window.location.pathname;
  const pageParams = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });
  const saleNo = Number(pathname.replace(/^\/auction\/online\/list\/(\d+).*/, '$1')) || 0;
  if (!saleNo) return null;

  let lotPage = pageParams.page ? Number(pageParams.page) : 1;
  let lotSize = pageParams.size ? Number(pageParams.size) : 10;
  if (lotPage < 1) lotPage = 1;
  if (lotSize > 101) lotSize = 100;

  return {
    saleNo,
    lotPage,
    lotSize,
  }
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
  `;

  let style = document.createElement('style');
  style.textContent = styleString;
  document.head.appendChild(style);
}