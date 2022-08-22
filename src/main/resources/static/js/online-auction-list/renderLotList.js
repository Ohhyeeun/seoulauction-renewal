/**
 * [Render] 경매 랏 렌더링
 * @param {Partial<{ data: Array<Object>; totalCount: number; append: boolean; }>} params
 */
async function renderLotListSection(params) {
  const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  const root = document.getElementById('lot-list');
  const lang = getLanguage();
  const currency = window.globalData.currency;
  const saleNo = urlData?.saleNo;

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

        item.addEventListener('click',async e => {
          e.preventDefault();
          await handleOpenBidPopup(saleNo, lotNo);
        });
      });
    }

    if (key === 'totalCount') {
      document.getElementById('lot-total-count').innerHTML = `${(value)}`;
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

  const currentPrice = data.LAST_PRICE >= 0 && data.END_YN === 'N' ? formatNumber(data.LAST_PRICE) : '-';

  const times = fromNow(data?.TO_DT);
  // const isProcessing = ['online'].includes(data.SALE_KIND_CD) && data.END_YN === 'N'; // 진행중 여부
  const isAuctioned = data.LAST_PRICE >= 0 && data.BID_CNT > 0 && data.END_YN === 'Y'; // 낙찰 여부
  const hammerPrice = data.LAST_PRICE; // 낙찰가

  let hammerPriceField = '';
  if (isAuctioned) {
    hammerPriceField = `<strong>${currency} ${formatNumber(hammerPrice)}</strong><em>(응찰${formatNumber(bidCount)})</em>`;
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
                    <dd>${isNotExpectPrice ? '별도문의' : currency + ' ' + formatNumber(expectPriceFrom)}</dd>
                    <dd>${isNotExpectPrice ? '' : '~ ' + formatNumber(expectPriceTo)}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${lotNo}-start-price">
                    <dt>시작가</dt>
                    <dd>${currency} ${startPrice > 0 ? formatNumber(startPrice) : '-'}</dd>
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
                    <span>${times ? times.format : ''}</span>
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
