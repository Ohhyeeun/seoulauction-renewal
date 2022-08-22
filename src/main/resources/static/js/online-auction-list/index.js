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

  /**
   * [Onload] 랏 목록 정보 조회
   */
  const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  if (urlData) {

    // 정렬 값 초기화
    $('#sort-order').val(urlData?.sort || 'LOTAS').select2();

    // 뷰 타입 초기화 (페이지 모드)
    if (!urlData?.view || urlData?.view === 'page') {
      $('#view-type').val('page').select2();
      document.querySelector('.paging-area').style.display = 'block';
      document.querySelector('.view-more-area').style.display = 'none';
    }

    // 뷰 타입 초기화 (더보기 모드)
    if (urlData?.view === 'more') {
      $('#view-type').val('more').select2();
      document.querySelector('.paging-area').style.display = 'none';
      document.querySelector('.view-more-area').style.display = 'flex';
    }

    // 세일정보 조회
    const saleInfoResult = await callApiSaleInfo(urlData?.saleNo);
    if (saleInfoResult?.CURR_CD) {
      window.globalData.currency = saleInfoResult.CURR_CD;
    }

    // API 콜 (랏 목록)
    const { totalCount, rows } = await callApiLotList(urlData, true);

    // 화면 렌더링
    await Promise.all([
      renderSaleTitleSection(saleInfoResult), // 타이틀 섹션 렌더링
      renderLotListSection({ data: rows, totalCount, append: false }), // 랏 목록 렌더
      renderPaginationSection(urlData?.page, totalCount, urlData?.size), // 페이징 렌더
    ]);
  }

  /**
   * [Onload] 폴링 로직 실행
   */
  // 폴링 워커 초기화
  const fetcherWorker = new Worker('/js/online-auction-list/fetcher.worker.js');

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

  // 폴링 핸들러로 등록
  document.getElementById('lot-list').querySelectorAll('li').forEach(el => {
    pollingObserver.observe(el);
  });

  // 일정 주기별로 보고 있는 항목들을 데이터로 옮김
  setInterval(visibleLotsInterval, 1000);

  // 폴링 로직 실행 처리
  function visibleLotsInterval() {
    if (!window.globalData.usePolling || !navigator.onLine) return;
    const activeLots = [...window.globalData.visibleLots].sort(sortCollator().compare);
    const activeLotsString = activeLots.join(',');
    fetcherWorker.postMessage({ saleNo: urlData?.saleNo, lots: activeLotsString });
  }

  // 워커에서 이벤트 수신(랏 데이터 갱신)
  fetcherWorker.onmessage = (evt) => {
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

  // 현재 탭이 포커싱 되어 있지 않으면, 폴링을 중지
  document.addEventListener('visibilitychange', () => {
    window.globalData.usePolling = document.visibilityState === 'visible';
  });

  /**
   * [Onload] 더보기 옵저버
   */
  const viewMoreObserver = startViewMoreObserver({
    eachCallback: (el) => {
      pollingObserver.observe(el);
    },
  });

  // 더보기 옵저버 시작
  const viewMoreButton = document.querySelector('.view-more-area');
  if (!urlData?.view || urlData?.view === 'page') {
    viewMoreObserver.unobserve(viewMoreButton);
  } else {
    viewMoreObserver.observe(viewMoreButton);
  }

  /**
   * [Event] 정렬 변경 이벤트
   */
  $('#sort-order').select2({ minimumResultsForSearch: -1 }).on('select2:select', (e) => {
    /** @type {string} */
    const value = e.target.value;

    let urlData = getDataFromUrl(`/auction/online/{saleNo}`);
    urlData.page = 1;
    urlData.sort = value;
    window.location.href = makeUrl(urlData);
  });

  /**
   * [Event] 보기방식 변경 이벤트 (page | more)
   */
  $('#view-type').select2({ minimumResultsForSearch: -1 }).on('select2:select', (e) => {
    /** @type {string} */
    const value = e.target.value;
    window.globalData.viewType = value;
    window.location.href = makeUrl({ view: value });
  });
}

/**
 * 더보기 옵저버 실행
 * @typedef {object} Params
 * @property {(element: HTMLLIElement) => void} eachCallback
 * @param {Params} params
 */
function startViewMoreObserver(params) {
  const viewMoreButton = document.querySelector('.view-more-area');
  let viewMorePage = 2;
  let viewMoreSize = 20;

  return new IntersectionObserver(entries => {
    entries.forEach(async entry => {
      if (entry.isIntersecting) {
        const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
        urlData.page = viewMorePage;
        urlData.size = viewMoreSize;
        const { rows: data, totalCount } = await callApiLotList(urlData);
        viewMoreButton.style.display = 'none';

        if (totalCount > viewMorePage * viewMoreSize) {
          await renderLotListSection({ data, totalCount, append: viewMorePage > 1 });
          document.getElementById('lot-list').querySelectorAll('li').forEach(el => {
            if (params.eachCallback) {
              params.eachCallback(el);
            }
          });

          viewMorePage += 1;
          viewMoreButton.style.display = 'block';
        }
      }
    });
  });
}
