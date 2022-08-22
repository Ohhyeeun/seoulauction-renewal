// TODO: HTML 이 중복으로 로드되면서, 이벤트가 중복으로 호출되는 문제가 발생

/**
 * [Event] 온라인 응찰팝업 열기(목록 / 상세)
 * @param {Event<HTMLButtonElement> | null} e
 * @param {number} saleNo
 * @param {number | string} lotNo
 */
async function handleOpenBidPopup(saleNo, lotNo) {
  window.usePolling = true;
  const me = await callApiGetMe();
  const lotData = await callApiGetLotInfo(saleNo, Number(lotNo));

  const popup = createBidPopupFromTemplate();
  // TODO: 자동응찰 / 취소 컨펌 처리
  const confirmPopup = createPopupFromTemplate('#bidding_go-wrap', '#go-bidding-popup-template');
  const cancelPopup = createPopupFromTemplate('#bidding_stop-wrap', '#stop-bidding-popup-template');

  /**
   * 랏 정보 Polling Worker
   */
  const fetcherWorker = new Worker('/js/online-auction/bid-fetcher.worker.js');
  setInterval(() => {
    if (window.usePolling) {
      fetcherWorker.postMessage({
        currency: lotData.CURR_CD || 'KRW',
        saleNo: lotData.SALE_NO,
        lotNo: lotData.LOT_NO,
      });
    }
  }, 2000);

  // 워커에서 데이터 수신
  fetcherWorker.onmessage = (evt) => {
    // TODO: HTML 렌더링(새로고침)
  }

  /**
   * [Onload] 팝업 로드 시, 데이터 바인딩 & 렌더링
   */
  await onLoadBidPopup(popup, lotData);

  /**
   * [Onunload]
   */
  const unload = async () => {
    document.getElementById('bid-once-btn').removeEventListener('click', bidOnce);
    window.usePolling = false;
  }

  /**
   * [Event] 팝업 닫기 버튼
   */
  popup.querySelector('.js-closepop').addEventListener('click', async e => {
    e.preventDefault();
    await toggleBidPopup(popup, false);
    await unload();
  });

  /**
   * [Event] 배경 클릭 시 닫기
   */
  popup.querySelector('.popup-dim').addEventListener('click', async e => {
    e.preventDefault();
    await toggleBidPopup(popup, false);
    await unload();
  });

  /**
   * [Event] 응찰 타입 선택
   */
  document.querySelectorAll('.select-bid-type-btn').forEach(element => {
    element.addEventListener('click', e => {
      e.preventDefault();
      const target = e.currentTarget;
      const value = target.dataset.bidTypeValue;
      selectBidType(value);
    });
  });

  /**
   * [Event] 자동응찰 금액 변경 셀렉트
   * @see https://select2.org/programmatic-control/events
   */
  $('.js-bidding_option').select2({ minimumResultsForSearch: -1 })
    .on('select2:opening', e => {
      e.target.innerHTML = renderAutoBidPriceList(lotData);
    })
    .on('select2:select', (e) => {
      const value = e.target.value;
      // TODO: 응찰 금액 선택 시 처리
    });

  /**
   * [Event] 1회 응찰
   */
  document.getElementById('bid-once-btn').addEventListener('click', bidOnce);

  async function bidOnce(e) {
    e.preventDefault();
    e.stopPropagation();

    const saleNo = lotData.SALE_NO;
    const lotNo = lotData.LOT_NO;
    const custNo = me.CUST_NO;
    const isLogin = me.IS_LOGIN === 'Y';
    const price = Number(document.getElementById('bid-once-btn-price').dataset.price) || 0;

    if (custNo < 1 || !isLogin) {
      // TODO: 로그인 팝업 처리
      window.alert(`로그인이 필요합니다`);
      return;
    }

    // 1회응찰 신청
    const result = await callApiBidOnce({ saleNo, lotNo, custNo, price });
    if (result) {
      window.alert('성공');
    } else {
      window.alert('실패');
    }

    // 팝업 데이터 렌더링 (응찰 목록)
    const { rows: bidListData } = await callApiBidList(saleNo, lotNo);
    await renderPopupContentBidList(popup, bidListData);
  }

  /**
   * [Event] 자동 응찰 등록 / 중지
   */
  document.getElementById('bid-auto-btn').addEventListener('click', async e => {
    e.preventDefault();
    const saleNo = lotData.SALE_NO;
    const lotNo = lotData.LOT_NO;
    const custNo = me.CUST_NO;
    const isLogin = me.IS_LOGIN === 'Y';
    const price = $('.js-bidding_option').val();

    if (custNo < 1 || !isLogin) {
      // TODO: 로그인 팝업 처리
      window.alert(`로그인이 필요합니다`);
      return;
    }

    // 자동응찰 등록
    await callApiRegisterAutoBid({ saleNo, lotNo, custNo, price });

    // 팝업 데이터 렌더링 (응찰 목록)
    const { rows: bidListData } = await callApiBidList(saleNo, lotNo);
    await renderPopupContentBidList(popup, bidListData);
  });
}

/**
 * 팝업 로딩 시 실행
 * @param {HTMLElement} popup
 * @param {LotDetail} data
 * @return {Promise<void>}
 */
async function onLoadBidPopup(popup, data) {
  // 로그인 여부
  const isLogin = window.sessionStorage.getItem('is_login') === 'true' || false;

  // 만약 팝업이 열려있으면, 닫기
  if (popup.classList.contains('open')) {
    await toggleBidPopup(popup, false);
    return;
  }

  // 팝업 데이터 렌더링 (PC 기준 왼쪽 정보 영역)
  await renderPopupContentLeftInfo(popup, data);

  // 팝업 데이터 렌더링 (PC 기준 오른쪽 실시간 갱신 영역)
  await renderPopupContentRightData(popup, data);

  // 팝업 데이터 렌더링 (응찰 목록)
  const { rows: bidListData } = await callApiBidList(data.SALE_NO, data.LOT_NO);
  await renderPopupContentBidList(popup, bidListData);

  // 팝업 데이터 렌더링 (버튼 영역)
  await renderButtons(popup, data);

  // 팝업 열기
  await toggleBidPopup(popup, true);

  // 기본 Bid type 선택
  selectBidType('once');

  // 선택한 랏의 자동응찰 정보(내가 걸어놓은 자동응찰 정보)
  const lastAutoBid = await callApiGetLastAutoBid(data.SALE_NO, data.LOT_NO);
  await renderAutoBidButtons(lastAutoBid);

  // 1회 응찰 가격 텍스트 수정
  await renderOnceBidPrice(data);

  // 자동 응찰 셀렉트 초기화
  document.querySelector('.js-bidding_option').innerHTML = renderAutoBidPriceList(data);
}

/**
 * 새로운 응찰 팝업을 생성
 */
function createBidPopupFromTemplate() {
  // select2의 z-index 변경하는 스타일 시트를 추가
  const dynamicStyle = document.querySelector('#select2-style');
  if (!dynamicStyle) {
    const style = document.createElement('style');
    style.id = 'select2-style';
    style.textContent = ` .select2-container.select2-container--open { z-index: 10; } `;
    document.head.appendChild(style);
  }

  return createPopupFromTemplate('#popup_biddingPopup2-wrap', '#online-bid-popup');
}

/**
 * 팝업 생성
 * @param {string} $popup
 * @param {string} $template
 * @return {*}
 */
function createPopupFromTemplate($popup, $template) {
  // 만약에 팝업이 없을 경우, 팝업을 추가
  if (!document.querySelector($popup)) {
    const popupTemplate = document.querySelector($template);
    const clone = document.importNode(popupTemplate.content, true);
    document.body.appendChild(clone);
  }

  return document.querySelector($popup);
}

/**
 * 자동응찰 버튼 렌더링
 * @param {Object | null} data
 * @return {Promise<void>}
 */
async function renderAutoBidButtons(data) {
  const button = document.getElementById('bid-auto-btn');
  if (data) {
    button.dataset.dataType = 'stop';
    button.innerHTML = `<span>자동응찰 중지</span>`;
  } else {
    button.dataset.dataType = 'bid';
    button.innerHTML = `<span>응찰 하기</span>`;
  }
}

/**
 * 응찰 팝업 토글
 * @param {Element} content
 * @param {boolean} visible
 */
async function toggleBidPopup(content, visible) {
  if (visible) {
    window.globalData.usePolling = false;
    content.classList.add('open');
    document.body.style.overflow = 'hidden';
    document.body.style.touchAction = 'none';
  } else {
    window.globalData.usePolling = true;
    content.classList.remove('open');
    document.body.style.overflow = 'auto';
    document.body.style.touchAction = 'default';
  }
}

/**
 * 왼쪽 정보 영역 렌더링
 * @param {Element} popup
 * @param {LotDetail} data
 * @return {Promise<void>}
 */
async function renderPopupContentLeftInfo(popup, data) {
  const lang = getLanguage(); // 언어
  const lotNo = data.LOT_NO; // 랏 번호
  const title = data.TITLE_JSON ? JSON.parse(data.TITLE_JSON)[lang] : ' '; // 작품명
  const artist = data.ARTIST_NAME_JSON ? JSON.parse(data.ARTIST_NAME_JSON)[lang] : '&nbsp;'; // 작가명
  const born = data.BORN_YEAR; // 작가 출생
  const material = lang === 'en' ? data.MATE_NM_EN : data.MATE_NM; // 재질

  let lotSizeHtml = ''; // 랏 사이즈 정보
  if (data.LOT_SIZE_JSON) {
    lotSizeHtml = js_size_text_cm(JSON.parse(data.LOT_SIZE_JSON));
  }

  const createdYear = JSON.parse(data.MAKE_YEAR_JSON)[lang] || '&nbsp;'; // 제작연도

  let imagePath = '/images/bg/no_image.jpg';
  if (data.imageList && data.imageList.length > 0) {
    const img = data.imageList[0];
    if ('FILE_NAME' in img && 'IMAGE_URL' in img && 'FILE_PATH' in img) {
      imagePath = `${img.IMAGE_URL}/${img.FILE_PATH}/${img.FILE_NAME}`.replace(/\/\//g, '/');
    }
  }

  popup.querySelector('.bid-lot-no').textContent = `LOT ${lotNo}`;
  popup.querySelector('.bid-lot-image').src = imagePath;
  popup.querySelector('.bid-lot-artist').textContent = artist;
  popup.querySelector('.bid-lot-artist-born').textContent = born ? `b. ${born}` : '&nbsp;';
  popup.querySelector('.bid-lot-title').textContent = title;
  popup.querySelector('.bid-lot-material').textContent = material;
  popup.querySelector('.bid-lot-size').textContent = lotSizeHtml;
  popup.querySelector('.bid-lot-year').textContent = createdYear;
}

/**
 * 오른쪽 실시간 데이터 영역 렌더링
 * @param popup
 * @param data
 * @return {Promise<void>}
 */
async function renderPopupContentRightData(popup, data) {
  const isEndBid = data.END_YN === 'Y';
  const currency = data.CURR_CD || 'KRW';
  const growPrice = formatNumber(data.GROW_PRICE);
  const lastPrice = formatNumber(data.LAST_PRICE);
  const bidCount = data.BID_CNT;
  const currentPriceTitle = data.LAST_PRICE > 0 && data.BID_CNT > 0 && data.END_YN === 'Y' ? '낙찰가' : '현재가';

  popup.querySelector('.bid-lot-grow-price').innerHTML = `${currency} ${growPrice}`;
  popup.querySelector('.bid-lot-price-title').innerHTML = currentPriceTitle;
  popup.querySelector('.bid-lot-price-data').innerHTML = `<em>${currency} ${lastPrice}</em> <span>(응찰${bidCount})</span>`;

  let toDate = new Date(data.TO_DT).getTime();
  let interval = setInterval(() => {
    renderRemainTimes(popup, toDate);
  }, 1000);

  if (isEndBid) {
    clearInterval(interval);
    popup.querySelector('.bid-lot-remain-times').innerHTML = `남은시간 종료`;
  }
}

/**
 * 응찰 목록 렌더링
 * @param {Element} popup
 * @param {object[]} data
 * @return {Promise<void>}
 */
async function renderPopupContentBidList(popup, data) {
  const listElement = popup.querySelector('.online-bid-list');
  const emptyElement = popup.querySelector('.online-bid-list-empty');

  if (data.length < 1) {
    listElement.style.display = 'none';
    emptyElement.style.display = 'block';
    return;
  }

  const bidListHtml = data.map((item, index) => {
    const userId = item.CUST_ID;
    const bidKind = item.BID_KIND_CD; // 1회응찰: online_auto | 자동응찰 online_once
    const bidKindLabel = bidKind === 'online_auto' ? `<em class="type-auto">자동</em>` : '';
    const bidPrice = formatNumber(item.BID_PRICE);
    const bidTimes = window.moment(item.BID_DT).format('YYYY-MM-DD|HH:mm:ss').split('|');
    const isLastPrice = false;

    return `
      <li>
        <div class="product-user ${isLastPrice ? ' on_green' : ''}">
          <span>${userId}</span>
        </div>
        <div class="product-price ${isLastPrice ? ' on_red' : ''}">
          <span>${bidPrice}</span>
        </div>
        <div class="product-day">
          ${bidKindLabel}<span>${bidTimes[0]}</span><span>${bidTimes[1]}</span>
        </div>
      </li>
    `;
  });

  emptyElement.style.display = 'none';
  listElement.style.display = 'block';
  listElement.innerHTML = bidListHtml.join('\n');
}

/**
 * 버튼 영역 렌더링
 * @param {Element} popup
 * @param {LotDetail} lotData
 * @return {Promise<void>}
 */
async function renderButtons(popup, lotData) {
  const isEndBid = lotData.END_YN === 'Y';

  // 경매 종료 여부
  if (isEndBid) {
    popup.querySelector('.bid-end').style.display = 'flex';
    popup.querySelector('.bid-ongoing').style.display = 'none';
  } else {
    popup.querySelector('.bid-end').style.display = 'none';
    popup.querySelector('.bid-ongoing').style.display = 'block';
  }

  // TODO: 버튼 처리
}

/**
 * 응찰 방식 탭 선택
 * @param {'once' | 'auto'} value
 */
function selectBidType(value) {
  if (value === 'once') {
    document.querySelector('[data-bid-type-value="once"] .btn').className = `btn btn_lg btn_default`;
    document.querySelector('[data-bid-type-value="auto"] .btn').className = `btn btn_lg btn_gray`;
    document.querySelector('.bid-type-once')?.classList.add('active');
    document.querySelector('.bid-type-auto')?.classList.remove('active');
  }

  if (value === 'auto') {
    document.querySelector('[data-bid-type-value="once"] .btn').className = `btn btn_lg btn_gray`;
    document.querySelector('[data-bid-type-value="auto"] .btn').className = `btn btn_lg btn_default`;
    document.querySelector('.bid-type-once')?.classList.remove('active');
    document.querySelector('.bid-type-auto')?.classList.add('active');
  }
}

/**
 * 시간 필드 업데이트
 * @param {HTMLElement} popup
 * @param {number} targetDateTimestamp
 */
function renderRemainTimes(popup, targetDateTimestamp) {
  const times = fromNow(targetDateTimestamp);
  popup.querySelector('.bid-lot-remain-times').innerHTML = `남은시간: ${times.format}`;
}

/**
 * 자동응찰 선책할 수 있는 가격 목록 계산 (호가단위로 추가)
 *
 * 경매전 우선순위
 * 1) 0원 이상의 시작가 * 10
 * 2) 낮은 추정가 * 10
 * 3) 최소 호가 * 10
 *
 * 경매 진행중 (현재가가 있는 경우)
 * 0) 현재가 * 10
 *
 * @param {Partial<LotDetail>} data
 */
function renderAutoBidPriceList(data) {

  const { currency, minPrice, limitPrice, maxPrice } = calculateBidPrice(data);

  // 가격 목록
  let priceList = [];

  // 루프 돌면서 금액을 추가
  let currentPrice = minPrice;
  let growPrice = 0;

  while (currentPrice <= maxPrice) {
    growPrice = getCurrentGrowPrice(currentPrice);
    currentPrice = currentPrice + growPrice;
    priceList.push(currentPrice);
  }

  // 최대가격보다 높으면 제거
  priceList = priceList.filter(price => price <= limitPrice);

  const optionsHtml = priceList.map(price => `
    <option value="${price}">${currency} ${formatNumber(price)}</option>
  `);

  return optionsHtml.join('\n');
}

/**
 * 1회 응찰 가격 할당
 * @param {Partial<LotDetail>} data
 */
async function renderOnceBidPrice(data) {
  const { currency, minPrice } = await calculateBidPrice(data);

  const growPrice = getCurrentGrowPrice(minPrice);
  const currentPrice = minPrice;
  const nextPrice = minPrice + growPrice;
  const priceValue = !data.LAST_PRICE ? currentPrice : nextPrice;

  const $bidPrice = document.getElementById('bid-once-btn-price');
  $bidPrice.dataset.price = priceValue;
  $bidPrice.innerHTML = `${currency} ${formatNumber(priceValue)}`;
}

/**
 * 응찰 최소 / 최대 가격 계산
 * @param {Partial<LotDetail>} data
 */
async function calculateBidPrice(data) {
  const currency = data?.CURR_CD || 'KRW';
  const expectRowPrice = JSON.parse(data.EXPE_PRICE_FROM_JSON)[currency] || 0;
  const startPrice = data.START_PRICE || 0;
  const lastPrice = data.LAST_PRICE;
  const fromDate = moment(data.FROM_DT); // 응찰 시작 날짜
  const isEndBid = data.END_YN === 'Y'; // 응찰 종료 여부
  const isBeforeStart = moment().isBefore(fromDate); // 경매 시작전인지 여부

  // 최소가 구하기
  let minPrice = 0;

  // 경매 진행중(현재가)
  if (lastPrice != null) {
    minPrice = lastPrice;
  }
  // 1) 0원 이상의 시작가 * 10
  else if (startPrice && startPrice > 0) {
    minPrice = startPrice;
  }
  // 2) 낮은 추정가 * 10
  else if (expectRowPrice && expectRowPrice > 0) {
    minPrice = expectRowPrice;
  }

  // 최대 가격
  const limitPrice = minPrice * 10;
  let maxPrice = getCurrentGrowPrice(limitPrice) + limitPrice;

  return { currency, minPrice, limitPrice, maxPrice }
}