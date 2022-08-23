/**
 * 팝업 로딩 시 실행
 * @param {HTMLElement} popup
 * @param {number} saleNo
 * @param {number|string} lotNo
 * @return {Promise<void>}
 */
async function onLoadBidPopup(popup, saleNo, lotNo) {

  // API Call
  const me = await callApiGetMe();
  const { lotData, lastAutoBid } = await updateAll(saleNo, lotNo);

  await renderPopupContentRightData(lotData); // 팝업 데이터 렌더링 (PC 기준 오른쪽 실시간 갱신 영역)
  document.querySelector('.js-bidding_option').innerHTML = renderAutoBidPriceList(lotData); // 자동 응찰 셀렉트 초기화

  // 기본 Bid type 선택
  selectBidType('once');

  // 워커 실행
  // 랏 정보 Polling Worker
  const fetcherWorker = new Worker('/js/online-auction/bid-fetcher.worker.js');
  setInterval(() => {
    if (window.usePolling) {
      // 워커에 데이터 송신
      fetcherWorker.postMessage({
        currency: lotData.CURR_CD || 'KRW',
        saleNo,
        lotNo,
      });
    }
  }, 2000);

  // 워커에서 데이터 수신 (API 에서 변경된 데이터가 있으면 업데이트 됨)
  fetcherWorker.onmessage = async (evt) => {
    const currency = lotData.CURR_CD || 'KRW';
    if (evt.data.growPrice) {
      // TODO: 호가 변경
    }

    if (evt.data.endTime) {
      // evt.data.remainTime
      // TODO: 남은시간 변경
    }

    if (evt.data.lastPrice) {
      // TODO: 현재가 변경
    }

    // 데이터의 변경이 있으면, 새로고침
    await updateAll(saleNo, lotNo);
  }

  /**
   * [Event] 응찰 타입 선택
   */
  document.querySelectorAll('.select-bid-type-btn').forEach(element => {
    attachEvent(element, 'click', e => {
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
    });
    // .on('select2:select', (e) => {
    //   const value = e.target.value;
    //   console.log(value)
    // });

  /**
   * [Event] 1회 응찰
   */
  attachEvent(document.getElementById('bid-once-btn'), 'click', async e => {
    e.preventDefault();
    const price = Number(document.getElementById('bid-once-btn-price').dataset.price) || 0;
    await bidOnce({
      saleNo: lotData.SALE_NO,
      lotNo: lotData.LOT_NO,
      custNo: me.CUST_NO,
      price,
    });
  });

  /**
   * [Event] 자동 응찰 등록 / 중지
   */
  attachEvent(document.getElementById('bid-auto-btn'), 'click', async e => {
    e.preventDefault();
    await bidAuto({
      type: lastAutoBid?.BID_KIND_CD === 'online_auto' ? 'stop' : 'bid',
      saleNo: lotData.SALE_NO,
      lotNo: lotData.LOT_NO,
      custNo: me.CUST_NO,
      price: $('.js-bidding_option').val(),
      reqNo: lastAutoBid?.REQ_NO || null,
    });
  });
}

/**
 * 응찰 최소 / 최대 가격 계산
 * @param {Partial<LotDetail>} data
 */
function calculateBidPrice(data) {
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

/**
 * [Event] 1회 응찰
 * @typedef {Object} BidAutoParams
 * @property {'bid' | 'stop'} type
 * @property {number} saleNo
 * @property {number} lotNo
 * @property {number} custNo
 * @property {number | string} price
 */
async function bidOnce(data) {
  // 1회 응찰
  const result = await callApiBidOnce({
    saleNo: data.saleNo,
    lotNo: data.lotNo,
    custNo: data.custNo,
    price: data.price,
  });
  if (result) {
    window.alert('성공');
  } else {
    window.alert('실패');
  }

  await updateAll(data.saleNo, data.lotNo);
}

/**
 * [Event] 자동응찰 실행 / 중지
 * @typedef {Object} BidAutoParams
 * @property {'bid' | 'stop'} type
 * @property {number} saleNo
 * @property {number} lotNo
 * @property {number} custNo
 * @property {number | string} price
 */
async function bidAuto(data) {
  // 자동 응찰 실행
  if (data.type === 'bid') {
    const confirmPopup = await openAutoBidConfirmPopup();
    const confirmBtn = confirmPopup.root.querySelector('.confirm-btn');
    let loading = false;

    attachEvent(confirmBtn, 'click', async e => {
      e.preventDefault();
      if (loading) {
        return;
      }

      loading = true;
      await sleep(300);
      // TODO: 유효성 체크
      const result = await callApiRegisterAutoBid({
        saleNo: data.saleNo,
        lotNo: data.lotNo,
        custNo: data.custNo,
        price: Number(data.price),
      });

      if (result) {
        // TODO: 자동응찰 Success 팝업
        window.alert('자동응찰 완료');
      } else {
        // TODO: 처리도중 문제
      }


      await confirmPopup.close(null);
      await updateAll(data.saleNo, data.lotNo);
    });
  }

  // 자동응찰 중지
  if (data.type === 'stop') {
    const cancelPopup = await openAutoBidReleasePopup();
    const confirmBtn = cancelPopup.root.querySelector('.confirm-btn');
    let loading = false;

    attachEvent(confirmBtn, 'click', async e => {
      e.preventDefault();
      if (loading) {
        return;
      }

      loading = true;
      await sleep(300);
      // TODO: 유효성 체크
      console.log(data)

      const result = await callApiCancelAutoBid({
        saleNo: data.saleNo,
        lotNo: data.lotNo,
        custNo: data.custNo,
        reqNo: data.reqNo,
      });

      if (result) {
        // TODO: 자동응찰 Success 팝업
        window.alert('자동응찰 취소 완료');
      } else {
        // TODO: 처리도중 문제
      }

      await cancelPopup.close(null);
      await updateAll(data.saleNo, data.lotNo);
    });
  }
}

/**
 * 자동응찰 확인 팝업
 */
async function openAutoBidConfirmPopup() {
  const modal = await createModal({
    selector: '#go-auto-bid-popup',
    onCloseSelector: '.popup-layer',
    beforeClose: root => {
      root.querySelector('.trp.popupfixed-wrap').style.display = 'none';
    }
  });
  if (!modal) return;

  await modal.init();
  await modal.open(root => {
    root.querySelector('.trp.popupfixed-wrap').style.display = 'block';
  });

  attachEvent(modal.root.querySelector('.js-closepop'), 'click', async e => {
    e.preventDefault();
    await modal.close(null);
  });

  attachEvent(modal.root.querySelector('.cancel-btn'), 'click', async e => {
    e.preventDefault();
    await modal.close(null);
  });

  return modal;
}

/**
 * 자동응찰 중지 팝업
 */
async function openAutoBidReleasePopup() {
  const modal = await createModal({
    selector: '#stop-auto-bid-popup',
    onCloseSelector: '.popup-layer',
    beforeClose: root => {
      root.querySelector('.trp.popupfixed-wrap').style.display = 'none';
    }
  });
  if (!modal) return;

  await modal.init();
  await modal.open(root => {
    root.querySelector('.trp.popupfixed-wrap').style.display = 'block';
  });

  attachEvent(modal.root.querySelector('.js-closepop'), 'click', async e => {
    e.preventDefault();
    await modal.close(null);
  });

  attachEvent(modal.root.querySelector('.cancel-btn'), 'click', async e => {
    e.preventDefault();
    await modal.close(null);
  });

  return modal;
}