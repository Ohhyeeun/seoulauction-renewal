window.addEventListener('DOMContentLoaded', () => {
  let style = document.createElement('style');
  style.textContent = `
    .wrapper.online-auction .sticky-tab-menu { position: sticky; top: 6.36rem; z-index: 4; margin-top: 1rem; padding: 0 3rem; background-color: #fff; }
    .view-more-area { display: flex; justify-content: center; }
    @media screen and (max-width: 1023px) {
      .wrapper.online-auction .sticky-tab-menu { padding: 0; top: 3.55rem; }
    }
    
    .select2-container.select2-container--open {
      z-index: 10;
    }
  `;
  document.head.appendChild(style);
});

window.onload = async () => {
  window.visibleLots = new Set();
  window.usePolling = true;

  await loadPage();

  /**
   * [Event] 현재 탭이 포커싱 되어 있지 않으면, 폴링을 중지
   */
  document.addEventListener('visibilitychange', () => {
    window.usePolling = document.visibilityState === 'visible';
  });

  /**
   * [Event] 정렬 변경 이벤트
   */
  $('#sort-order').select2({ minimumResultsForSearch: -1 }).on('select2:select', (e) => {
    /** @type {string} */
    const value = e.target.value;

    let urlData = getDataFromUrl(`/auction/online/{saleNo}`);
    urlData.page = 1;
    urlData.sort = value;
    window.location.href = makeListPageUrl(urlData);
  });

  /**
   * [Event] 보기방식 변경 이벤트 (page | more)
   */
  $('#view-type').select2({ minimumResultsForSearch: -1 }).on('select2:select', (e) => {
    /** @type {string} */
    const value = e.target.value;
    window.viewType = value;
    window.location.href = makeListPageUrl({ view: value });
  });

  /**
   * [Event][PC] 전체랏 보기 드롭다운
   */
  attachEvent(document.querySelector('.js-dropdown-btn'), 'click', async e => {
    e.preventDefault();
    e.stopPropagation(); // 배경 클릭시 이벤트 전파 방지
    const target = e.currentTarget;
    await addDropdownLotListEvent(target);
  });

  /**
   * [Event][Mobile] 전체랏 보기 드롭다운
   */
  attachEvent(document.querySelector('.js-lotbox-btn'), 'click', async e => {
    e.preventDefault();
    const lotListPopup = await createModal({
      selector: '#online-auction-list-popup',
      onCloseSelector: '.fixed-panel',
      beforeClose: async (root) => {
        root.querySelector('.allview_fixed-wrap.lot').classList.remove('active');
      },
    });
    if (!lotListPopup) return;

    await lotListPopup.init();
    await renderMobileDropdownLotList();
    await lotListPopup.open(async popup => {
      popup.querySelector('.allview_fixed-wrap.lot').classList.add('active');
    });

    attachEvent(lotListPopup.root.querySelector('.js-fixed_total'), 'click', e => {
      lotListPopup.close(null);
    });
  });

  // 배경 클릭
  window.addEventListener('click', e => {
    const target = e.target;

    const isOpenDropdown = document.querySelector('.js-dropdown-btn');
    if (isOpenDropdown && !target.closest('.trp-dropdown_list-box')) {
      isOpenDropdown.classList.remove('active');
      document.querySelector('.trp-dropdown_list-box').style.display = 'none';
      document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]').value = '';
    }
  });

  /**
   * TODO: 탭 영역에 자동으로 포커싱 되도록 가로 스크롤 처리
   */
  // let windowWidth = window.innerWidth;
  // let tabListSum = 0;
  // document.querySelectorAll('#data-sale-category li').forEach(el => {
  //   tabListSum += el.offsetWidth;
  // });
  // $('.js-left_mm a').on('click', function(e) {
  //   e.preventDefault();
  //   var tar = $(this).position().left;
  //   var scrollX = tar - ($(".js-left_mm").parents(".tab-area").width() / 2) + $(this).width() / 2;
  //
  //   if ($(this).parents('li').hasClass('active')) {
  //     return false;
  //   } else {
  //     $(".js-left_mm li").removeClass('active');
  //     $(this).parents('li').addClass('active');
  //
  //     $(".js-left_mm").parents(".tab-area").scrollLeft(scrollX);
  //   }
  // });

  /**
   * 미디어 포스 UI
   */
  // $(".js-lotbox-btn").on("click", function($e) {
  //   $(".allview_fixed-wrap.lot .js-fixed_total").addClass("on")
  //   $(".allview_fixed-wrap.lot").addClass("active");
  // });
  // $(".allview_fixed-wrap.lot .js-fixed_total").on("click", function() {
  //   $(this).removeClass("on");
  //   $(".allview_fixed-wrap.lot").removeClass("active");
  // });
};

/**
 * [Onload] 페이지 로딩시 마다 실행
 * TODO: 인증 처리
 */
async function loadPage() {
  // URL 페이지 데이터
  const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  const { saleNo } = urlData;
  if (!urlData) return;

  // 정렬 값 초기화
  $('#sort-order').val(urlData?.sort || 'LOTAS').select2();

  // 뷰 타입 초기화
  if (urlData?.view === 'more') {
    $('#view-type').val('more').select2();
    document.querySelector('.paging-area').style.display = 'none';
    document.querySelector('.view-more-area').style.display = 'flex';
  } else {
    $('#view-type').val('page').select2();
    document.querySelector('.paging-area').style.display = 'block';
    document.querySelector('.view-more-area').style.display = 'none';
  }

  // 경매 정보 조회
  const saleInfoResult = await callApiSaleInfo(saleNo);
  saleInfoResult?.CURR_CD && setCurrency(saleInfoResult.CURR_CD); // 기축통화 세팅

  // 랏 목록 조회
  const { totalCount, rows } = await callApiLotList(urlData, true);

  // 화면 렌더링
  await Promise.all([
    renderSaleTitleSection(saleInfoResult), // 타이틀 섹션 렌더링
    renderLotListSection({ data: rows, totalCount, append: false }), // 랏 목록 렌더
    renderPaginationSection(urlData?.page, totalCount, urlData?.size), // 페이징 렌더
  ]);

  // 폴링 워커 생성
  const worker = createPollingWorker();

  // 폴링 옵저버 생성
  const pollingObserver = createPollingObserver();

  // 폴링 핸들러로 등록
  document.getElementById('lot-list').querySelectorAll('li').forEach(el => {
    pollingObserver.observe(el);
  });

  // 일정 주기별로 보고 있는 항목들을 데이터로 옮김
  setInterval(() => visibleLotsInterval({ worker, saleNo }), 1000);

  // 더보기 옵저버
  const viewMoreObserver = createViewMoreObserver({
    eachCallback: (el) => {
      pollingObserver.observe(el);
    },
  });

  // 더보기 관찰 실행
  const viewMoreButton = document.querySelector('.view-more-area');
  if (!urlData?.view || urlData?.view === 'page') {
    viewMoreObserver.unobserve(viewMoreButton);
  } else {
    viewMoreObserver.observe(viewMoreButton);
  }
}

/**
 * 폴링 워커
 */
function createPollingWorker() {
  const fetcherWorker = new Worker('/js/online-auction-list/fetcher.worker.js');
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
  }

  return fetcherWorker;
}

/**
 * 폴링 옵저버
 */
function createPollingObserver() {
  return new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        window.visibleLots.add(entry.target.dataset.lotNo);
      } else {
        window.visibleLots.delete(entry.target.dataset.lotNo);
      }
    });
  }, {
    threshold: 0.5, // 겹침 정도 (1: 전체보임)
  });
}

/**
 * 폴링 로직 실행
 * @param {{ worker: Worker; saleNo: number; }}
 */
function visibleLotsInterval({ worker, saleNo }) {
  if (!window.usePolling || !navigator.onLine) return;
  const activeLots = [...window.visibleLots].sort(sortCollator().compare);
  const activeLotsString = activeLots.join(',');
  worker.postMessage({ saleNo, lots: activeLotsString });
}

/**
 * 더보기 옵저버 실행
 * @typedef {object} Params
 * @property {(element: HTMLLIElement) => void} eachCallback
 * @param {Params} params
 */
function createViewMoreObserver(params) {
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
