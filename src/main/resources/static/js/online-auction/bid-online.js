/**
 * 응찰 팝업 열기
 * @param {number | string} saleNo
 * @param {number | string} lotNo
 * @return {Promise<void>}
 */
async function handleOpenBidPopup(saleNo, lotNo) {
  const me = await callApiGetMe();
  if (!me.IS_LOGIN) {
    window.alert('로그인이 필요합니다');
    return;
  }

  const checkAuth = await callApiCheckAuthBid(saleNo);
  if (checkAuth.CNT < 1) {
    await openAuthPopup(saleNo, lotNo);
    return;
  }

  await openBidPopup(saleNo, lotNo);
}

/**
 * 응찰 휴대폰 인증 팝업 열기
 */
async function openAuthPopup(saleNo, lotNo) {
  const authModal = await createModal({
    selector: '#online-auth-phone-popup',
    onCloseSelector: '.popup-layer',
    beforeClose: root => {
      root.querySelector('.online_confirm-popup').style.display = 'none';
    },
  });

  if (!authModal) return;

  const lang = getLanguage();
  const manager = await callApiGetMyManager();
  const managerName = lang === 'ko' ? manager.EMP_NAME : manager.EMP_NAME_EN;
  authModal.root.querySelector('#data-manager-contact').textContent = `${managerName} ${manager.TEL}`;

  await authModal.init();
  await authModal.open(root => {
    root.querySelector('.online_confirm-popup').style.display = 'block';
  });

  attachEvent(authModal.root.querySelector('.btn_close'), 'click', e => {
    e.preventDefault();
    authModal.close(null);
  });

  attachEvent(authModal.root.querySelector('.close-auth-modal-btn'), 'click', e => {
    e.preventDefault();
    authModal.close(null);
  });

  attachEvent(authModal.root.querySelector('.confirm-auth-modal-btn'), 'click', async e => {
    e.preventDefault();
    await authModal.close(null);
    await openBidPopup(saleNo, lotNo);
  });

  // TODO: 체크박스 안됨
  attachEvent(authModal.root.querySelector('#checkbox_all'), 'change', e => {
    console.log(e.target);
  });

  // 약관 아코디언
  // $(".js-accordion_policy").trpAccordionMenu(".acc_btn", ".con-area", "on").setBtn(0);
  $(".js-accordion_policy").trpAccordionMenu(".acc_btn", ".con-area", "on");
}

/**
 * 응찰 팝업 열기
 */
async function openBidPopup(saleNo, lotNo) {
  window.usePolling = true;
  const bidModal = await createModal({
    selector: '#online-bid-popup',
    onCloseSelector: '.popup-layer',
    beforeClose: root => {
      root.querySelector('.trp.popupfixed-wrap').style.display = 'none';
    }
  });
  if (!bidModal) return;

  await bidModal.init();
  await onLoadBidPopup(bidModal.root, saleNo, lotNo);
  await bidModal.open(root => {
    root.querySelector('.trp.popupfixed-wrap').style.display = 'block';
  });

  attachEvent(bidModal.root.querySelector('.js-closepop'), 'click', async e => {
    e.preventDefault();
    await bidModal.close(null);
  });
}

/**
 * 응찰 팝업 페이지 전체 업데이트
 */
async function updateAll(saleNo, lotNo) {
  const lotData = await callApiGetLotInfo(saleNo, lotNo);
  const lastAutoBid = await callApiGetLastAutoBid(saleNo, lotNo);
  const { rows: bidListData } = await callApiBidList(saleNo, lotNo);

  // 데이터 렌더링
  await renderPopupContentLeftInfo(lotData); // 팝업 데이터 렌더링 (PC 기준 왼쪽 정보 영역)
  await renderPopupContentBidList(bidListData); // 팝업 데이터 렌더링 (응찰 목록)
  await renderButtons(lotData); // 팝업 데이터 렌더링 (버튼 영역)
  await renderAutoBidButtons(lastAutoBid); // 선택한 랏의 자동응찰 정보(내가 걸어놓은 자동응찰 정보)
  await renderOnceBidPrice(lotData); // 1회 응찰 가격 텍스트 수정

  return { lotData, lastAutoBid, bidListData };
}

/**
 * 시간 필드 업데이트
 * @param {number} targetDateTimestamp
 */
function renderRemainTimes(targetDateTimestamp) {
  const times = fromNow(targetDateTimestamp);
  const timesField = document.querySelector('.bid-lot-remain-times');
  if (timesField) {
    timesField.innerHTML = `남은시간: ${times.format}`;
  }
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
  priceList.push(currentPrice);

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
  const { currency, minPrice } = calculateBidPrice(data);

  const growPrice = getCurrentGrowPrice(minPrice);
  const currentPrice = minPrice;
  const nextPrice = minPrice + growPrice;
  const priceValue = !data.LAST_PRICE ? currentPrice : nextPrice;

  const $bidPrice = document.getElementById('bid-once-btn-price');
  $bidPrice.dataset.price = priceValue;
  $bidPrice.innerHTML = `${currency} ${formatNumber(priceValue)}`;
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
 * 버튼 영역 렌더링
 * @param {LotDetail} lotData
 * @return {Promise<void>}
 */
async function renderButtons(lotData) {
  const isEndBid = lotData.END_YN === 'Y';

  // 경매 종료 여부
  if (isEndBid) {
    document.querySelector('.bid-end').style.display = 'flex';
    document.querySelector('.bid-ongoing').style.display = 'none';
  } else {
    document.querySelector('.bid-end').style.display = 'none';
    document.querySelector('.bid-ongoing').style.display = 'block';
  }

  // TODO: 버튼 처리
}

/**
 * 왼쪽 정보 영역 렌더링
 * @param {LotDetail} data
 * @return {Promise<void>}
 */
async function renderPopupContentLeftInfo(data) {
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

  const popup = document.querySelector('.bidding-online-popup');

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
 * TODO: 인터벌 별도로 분리 처리(여러번 동작해버림)
 * @param data
 * @return {Promise<void>}
 */
async function renderPopupContentRightData(data) {
  const isEndBid = data.END_YN === 'Y';
  const currency = data.CURR_CD || 'KRW';
  const growPrice = formatNumber(data.GROW_PRICE);
  const lastPrice = formatNumber(data.LAST_PRICE);
  const bidCount = data.BID_CNT;
  const currentPriceTitle = data.LAST_PRICE > 0 && data.BID_CNT > 0 && data.END_YN === 'Y' ? '낙찰가' : '현재가';

  document.querySelector('.bid-lot-grow-price').innerHTML = `${currency} ${growPrice}`;
  document.querySelector('.bid-lot-price-title').innerHTML = currentPriceTitle;
  document.querySelector('.bid-lot-price-data').innerHTML = `<em>${currency} ${lastPrice}</em> <span>(응찰${bidCount})</span>`;

  let toDate = new Date(data.TO_DT).getTime();
  let interval = setInterval(() => {
    renderRemainTimes(toDate);
  }, 1000);

  if (isEndBid) {
    clearInterval(interval);
    document.querySelector('.bid-lot-remain-times').innerHTML = `남은시간 종료`;
  }
}

/**
 * 응찰 목록 렌더링
 * @param {object[]} data
 * @return {Promise<void>}
 */
async function renderPopupContentBidList(data) {
  const listElement = document.querySelector('.online-bid-list');
  const emptyElement = document.querySelector('.online-bid-list-empty');

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
