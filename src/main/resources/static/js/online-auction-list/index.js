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
  window.globalData.usePolling = true;
  window.globalData.visibleLots = new Set(); // 현재 보고 있는 Lot 목록

  // 폴링 패처
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

  // API 콜 (랏 목록)
  const { totalCount, rows } = await callApiLotList(pageData, true);

  // 화면 렌더링
  await Promise.all([
    renderSaleTitleSection(saleInfoResult), // 타이틀 섹션 렌더링
    renderLotListSection({ data: rows, totalCount, append: false }), // 랏 목록 렌더
    renderPaginationSection(pageData.page, totalCount, pageData.size), // 페이징 렌더
  ]);

  // [Event] 정렬 변경 이벤트
  $('#sort-order').select2({ minimumResultsForSearch: -1 }).on('select2:select', (e) => {
    /** @type {string} */
    const value = e.target.value;

    let pageData = loadPageData();
    pageData.page = 1;
    pageData.sort = value;
    window.location.href = makeUrl(pageData);
  });

  // [Event] 보기방식 변경 이벤트 (page | more)
  $('#view-type').select2({ minimumResultsForSearch: -1 }).on('select2:select', (e) => {
    /** @type {string} */
    const value = e.target.value;
    window.globalData.viewType = value;
    window.location.href = makeUrl({ view: value });
  });

  // Polling Observer
  const pollingObserver = new IntersectionObserver(entries => {
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

  // ViewMore Observer
  let viewMorePage = 2;
  let viewMoreSize = 20;
  const viewMoreObserver = new IntersectionObserver(entries => {
    entries.forEach(async entry => {
      if (entry.isIntersecting) {
        const pageData = loadPageData();
        pageData.page = viewMorePage;
        pageData.size = viewMoreSize;
        const resultData = await callApiLotList(pageData);
        viewMoreButton.style.display = 'none';

        console.log(resultData)

        if (resultData.totalCount > viewMorePage * viewMoreSize) {
          await renderLotListSection({ data: resultData.rows, totalCount: resultData.totalCount, append: viewMorePage > 1 });
          document.getElementById('lot-list').querySelectorAll('li').forEach(el => {
            pollingObserver.observe(el);
          });

          viewMorePage += 1;
          viewMoreButton.style.display = 'block';
        }
      }
    });
  });

  // 폴링 핸들러로 등록
  document.getElementById('lot-list').querySelectorAll('li').forEach(el => {
    pollingObserver.observe(el);
  });

  // 일정 주기별로 보고 있는 항목들을 데이터로 옮김
  setInterval(visibleLotsInterval, 1000);
  function visibleLotsInterval() {
    if (!window.globalData.usePolling || !navigator.onLine) return;
    const activeLots = [...window.globalData.visibleLots].sort(sortCollator().compare);
    const activeLotsString = activeLots.join(',');
    fetcherWorker.postMessage({ saleNo: pageData.saleNo, lots: activeLotsString });
  }

  fetcherWorker.onmessage = evt => {
    if (evt.data.length > 0) {
      evt.data.forEach(item => {
        document.getElementById(`data-lot-${item.lotNo}-expect-price`).innerHTML = item.expectPrice;
        document.getElementById(`data-lot-${item.lotNo}-start-price`).innerHTML = item.startPrice;
        document.getElementById(`data-lot-${item.lotNo}-current-price`).innerHTML = item.currentPrice;
        document.getElementById(`data-lot-${item.lotNo}-hammer-price`).innerHTML = item.hammerPrice;
        document.getElementById(`data-lot-${item.lotNo}-remain-time`).innerHTML = item.remainTimeValues;
      });
    }
  };

  const viewMoreButton = document.querySelector('.view-more-area');
  if (pageData.view === 'page') {
    viewMoreObserver.unobserve(viewMoreButton);
  } else {
    viewMoreObserver.observe(viewMoreButton);
  }

  // 현재 탭이 포커싱 되어 있지 않으면, 폴링을 중지
  document.addEventListener('visibilitychange', () => {
    window.globalData.usePolling = document.visibilityState === 'visible';
  });
}
