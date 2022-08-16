/**
 * [Render] 경매 랏 렌더링
 * @param {Partial<{ data: Array<Object>; totalCount: number; append: boolean; }>} params
 */
async function renderLotListSection(params) {
  const pageData = loadPageData();
  const root = document.getElementById('lot-list');
  const lang = getLanguage();
  const currency = window.globalData.currency;
  const saleNo = pageData.saleNo;

  // State
  let state = createState({}, (target, key, value, receiver) => {
    if (key === 'data') {
      const htmlArray = value.map(item => {
        return renderLotItem(item, { saleNo, lang, currency });
      });

      if (params.append) {
        root.insertAdjacentHTML('beforeend', htmlArray.join('\n'));
      } else {
        root.innerHTML = htmlArray.join('\n');
      }

      // 관심작품 토글
      root.querySelectorAll('li .favorite-btn').forEach(item => {
        const lotNo = item.dataset.lotNo;
        item.addEventListener('click', e => handleToggleFavoriteLots(e, saleNo, Number(lotNo)));
      });

      // 응찰하기 버튼 클릭
      root.querySelectorAll('.go-bid-btn').forEach(item => {
        const lotNo = item.dataset.lotNo;
        const lotData = value.find(lot => lot.LOT_NO === Number(lotNo));
        const option = { saleNo, lang, currency };
        item.addEventListener('click',e => handleOpenBidPopup(e, saleNo, lotData));
      });
    }

    if (key === 'totalCount') {
      document.getElementById('lot-total-count').innerHTML = `${format(value)}`;
    }
  });

  // Set State
  state.data = params.data;
  state.totalCount = params.totalCount || 0;
}

/**
 * [Event] 관심작품 토글
 * @param {Event<HTMLButtonElement>} e
 * @param {number} saleNo
 * @param {number} lotNo
 */
async function handleToggleFavoriteLots(e, saleNo, lotNo) {
  e.preventDefault();

  // 로그인 체크
  if (!window.globalData.isLogin) {
    // TODO: 얼럿 확인
    window.alert('로그인이 필요합니다');
    return;
  }

  const target = e.currentTarget;
  const isActive = target.classList.contains('on');

  if (isActive) {
    await callApiDeleteFavoriteLot(saleNo, lotNo);
    target.classList.remove('on');
  } else {
    await callApiAddFavoriteLot(saleNo, lotNo);
    target.classList.add('on');
  }
}

/**
 * [Event] 응찰팝업 열기
 * @param {Event<HTMLButtonElement>} e
 * @param {number} saleNo
 * @param {object} lotData
 */
async function handleOpenBidPopup(e, saleNo, lotData) {
  e.preventDefault();
  const popupContentId = '#popup_biddingPopup2-wrap';

  // 만약에 팝업이 없을 경우, 팝업을 추가
  if (!document.querySelector(popupContentId)) {
    const popupTemplate = document.querySelector('#online-bid-popup');
    const clone = document.importNode(popupTemplate.content, true);
    document.body.appendChild(clone);
  }

  const popupContent = document.querySelector(popupContentId);
  if (popupContent.classList.contains('open')) {
    toggleBidPopup(popupContent, false);
    return;
  }

  // 팝업 데이터 렌더링
  renderPopupContent(popupContent, saleNo, lotData);

  toggleBidPopup(popupContent, true);

  popupContent.querySelector('.js-closepop').addEventListener('click', e => {
    e.preventDefault();
    toggleBidPopup(popupContent, false);
  });

  popupContent.addEventListener('click', e => {
    if (e.target.classList.contains('popup-dim')) {
      toggleBidPopup(popupContent, false);
    }
  });
}

/**
 * 응찰 팝업 열기
 * @param {Element} popupContent
 * @param {boolean} visible
 */
function toggleBidPopup(popupContent, visible) {
  if (visible) {
    window.globalData.usePolling = false;
    popupContent.classList.add('open');
    document.body.style.overflow = 'hidden';
    document.body.style.touchAction = 'none';
  } else {
    window.globalData.usePolling = true;
    popupContent.classList.remove('open');
    document.body.style.overflow = 'auto';
    document.body.style.touchAction = 'default';
  }
}

/**
 * 각 랏별로 렌더링
 * @param {Object} data
 * @param {Object} option
 */
function renderLotItem(data, option) {
  const saleNo = option.saleNo;
  const lang = option.lang || 'ko';
  const currency = option.currency || 'KRW';

  const lotNo = data.LOT_NO; // 랏 번호
  const isCancelLots = data.STAT_CD === 'reentry'; // 출품 취소 여부

  const title = JSON.parse(data.TITLE_JSON)[lang]; // 작품명
  const artist = data.ARTIST_NAME_JSON ? JSON.parse(data.ARTIST_NAME_JSON)[lang] : '&nbsp;'; // 작가명
  const createdYear = JSON.parse(data.MAKE_YEAR_JSON)[lang] || '&nbsp;'; // 제작연도
  const material = lang === 'en' ? data.MATE_NM_EN : data.MATE_NM; // 재질
  let lotSizeHtml = ''; // 랏 사이즈 정보
  if (data.LOT_SIZE_JSON) {
    lotSizeHtml = js_size_text_cm(JSON.parse(data.LOT_SIZE_JSON));
  }

  // 이미지 정보
  let imagePath = '/images/bg/no_image.jpg';
  if ('LOT_IMG_PATH' in data && 'LOT_IMG_NAME' in data) {
    imagePath = `https://www.seoulauction.com/nas_img/${data.LOT_IMG_PATH}/${data.LOT_IMG_NAME}`;
  }

  const expectPriceFrom = JSON.parse(data.EXPE_PRICE_FROM_JSON)[currency]; // 추정 시작가
  const expectPriceTo = JSON.parse(data.EXPE_PRICE_TO_JSON)[currency]; // 추정 최대가격
  const isNotExpectPrice = !expectPriceFrom && !expectPriceTo; // 추정가 보유 여부

  const startPrice = data.START_PRICE || 0; // 시작가
  const bidCount = data.BID_CNT || 0; // 응찰 횟수

  const currentPrice = data.LAST_PRICE >= 0 && data.END_YN === 'N' ? format(data.LAST_PRICE) : '-';

  const remainTime = timerFormat(new Date(data?.TO_DT).getTime() - new Date().getTime()); // 남은 timestamp
  let remainTimeFormat = '';
  if (remainTime) {
    remainTimeFormat = [
      remainTime[0] > 0 ? remainTime[0] + '일 ' : '',
      remainTime[1] > 0 ? `${toFixTen(remainTime[1])}:` : '',
      remainTime[2] > 0 ? `${toFixTen(remainTime[2])}:` : '00:',
      remainTime[3] > 0 ? toFixTen(remainTime[3]) : '00',
    ].filter(Boolean).join('');
  }

  const isProcessing = ['online'].includes(data.SALE_KIND_CD) && data.END_YN === 'N'; // 진행중 여부
  const isAuctioned = data.LAST_PRICE >= 0 && data.BID_CNT > 0 && data.END_YN == 'Y'; // 낙찰 여부
  const hammerPrice = data.LAST_PRICE; // 낙찰가

  let hammerPriceField = '';
  if (isAuctioned) {
    hammerPriceField = `<strong>${currency} ${format(hammerPrice)}</strong><em>(응찰${format(bidCount)})</em>`;
  }

  const isFavoriteClassName = data?.isFavorite ? 'on' : ''; // 관심작품 등록 여부 클래스

  if (isCancelLots) {
    return `
      <li>
        <div class="li-inner">
          <article class="item-article">
            <div class="product_cancle-area" style="display:block;">
              <div class="area-inner">
                <i class="icon-cancle_box"></i>
                <div class="typo">
                  <div class="name"><span class="ng-binding">LOT ${lotNo}</span></div>
                  <div class="msg"><span>출품이 취소되었습니다.</span></div>
                </div>
              </div>
            </div>
          </article>
        </div>
      </li>
    `;
  }

  return `
    <li data-lot-no="${lotNo}">
      <div class="li-inner">
        <article class="item-article">
          <div class="image-area">
            <figure class="img-ratio">
              <a href="/auction/online/${saleNo}/${lotNo}" class="img-align">
                <img src="${imagePath}" alt="${title}">
              </a>
            </figure>
          </div>

          <div class="typo-area">
            <div class="product_info">
              <div class="num_heart-box">
                <a href="/auction/online/${saleNo}/${lotNo}">
                  <span class="num">${lotNo}</span>
                </a>
                <button class="heart js-work_heart favorite-btn ${isFavoriteClassName}" data-sale-no="${saleNo}" data-lot-no="${lotNo}">
                  <i class="icon-heart_off"></i>
                </button>
              </div>
              <div class="info-box">
                <div class="title">
                  <a href="#">
                    <span>${artist}</span>
                  </a>
                </div>
                <div class="desc">
                  <a href="#">
                    <span>${title}</span>
                  </a>
                </div>
                <div class="standard">
                  <a href="#">
                    <span style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;">${material}</span>
                  </a>
                  <div class="size_year">
                    <a href="#" style="white-space: nowrap;">
                      ${lotSizeHtml ? `<span>${lotSizeHtml}</span>` : '&nbsp;'} 
                      ${createdYear ? `<span>${createdYear}</span>` : ''}
                    </a>
                  </div>
                </div>
              </div>
              <div class="price-box">
                <a href="#">
                  <dl class="price-list" id="data-lot-${lotNo}-expect-price">
                    <dt>추정가</dt>
                    <dd>${isNotExpectPrice ? '별도문의' : currency + ' ' + format(expectPriceFrom)}</dd>
                    <dd>${isNotExpectPrice ? '' : '~ ' + format(expectPriceTo)}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${lotNo}-start-price">
                    <dt>시작가</dt>
                    <dd>${currency} ${startPrice > 0 ? format(startPrice) : '-'}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${lotNo}-current-price">
                    <dt>현재가</dt>
                    <dd>${currentPrice}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${lotNo}-hammer-price">
                    <dt>낙찰가</dt>
                    <dd>${hammerPriceField}</dd>
                  </dl>
                </a>
              </div>
              <div class="bidding-box">
                <div class="deadline_set">
                  <a href="#" id="data-lot-${lotNo}-remain-time">
                    <span>${remainTime && remainTimeFormat ? remainTimeFormat : ''}</span>
                  </a>
                </div>
                <div class="btn_set">
                  <a href="#" role="button" class="btn btn_point go-bid-btn" data-sale-no="${saleNo}" data-lot-no="${lotNo}">
                    <span>응찰</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </li>
  `;
}

/**
 * 응찰 팝업 HTML
 * @param {Element} element
 * @param {number} saleNo
 * @param {object} data
 */
function renderPopupContent(element, saleNo, data) {
  const lang = getLanguage();
  const currency = window.globalData.currency || 'KRW';
  const lotNo = data.LOT_NO; // 랏 번호
  const title = JSON.parse(data.TITLE_JSON)[lang]; // 작품명
  const artist = data.ARTIST_NAME_JSON ? JSON.parse(data.ARTIST_NAME_JSON)[lang] : '&nbsp;'; // 작가명
  const born = data.BORN_YEAR;
  const material = lang === 'en' ? data.MATE_NM_EN : data.MATE_NM; // 재질

  let lotSizeHtml = ''; // 랏 사이즈 정보
  if (data.LOT_SIZE_JSON) {
    lotSizeHtml = js_size_text_cm(JSON.parse(data.LOT_SIZE_JSON));
  }

  const createdYear = JSON.parse(data.MAKE_YEAR_JSON)[lang] || '&nbsp;'; // 제작연도

  let imagePath = '/images/bg/no_image.jpg';
  if ('LOT_IMG_PATH' in data && 'LOT_IMG_NAME' in data) {
    imagePath = `https://www.seoulauction.com/nas_img/${data.LOT_IMG_PATH}/${data.LOT_IMG_NAME}`;
  }

  element.querySelector('.bid-lot-no').innerHTML = `LOT ${lotNo}`;
  element.querySelector('.bid-lot-image').src = imagePath;
  element.querySelector('.bid-lot-artist').innerHTML = artist;
  element.querySelector('.bid-lot-artist-born').innerHTML = born ? `b. ${born}` : '&nbsp;';
  element.querySelector('.bid-lot-title').innerHTML = title;
  element.querySelector('.bid-lot-material').innerHTML = material;
  element.querySelector('.bid-lot-size').innerHTML = lotSizeHtml;
  element.querySelector('.bid-lot-year').innerHTML = createdYear;

  // TODO: 오른쪽 영역 폴링 처리
}