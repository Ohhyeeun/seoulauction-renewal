/**
 * [Render] 경매 랏 렌더링
 */
async function renderLotListSection(data, append = false) {

  /**
   * [Event] 관심작품 토글
   * @param {Event<HTMLButtonElement>} e
   */
  const handleToggleFavoriteLots = async e => {
    e.preventDefault();

    // 로그인 체크
    if (!window.globalData.isLogin) {
      // TODO: 얼럿 확인
      window.alert('로그인이 필요합니다');
      return;
    }

    const target = e.currentTarget;
    const { saleNo, lotNo } = target.dataset;
    const isActive = target.classList.contains('on');

    if (isActive) {
      const result = await callApiDeleteFavoriteLot(saleNo, lotNo);
      target.classList.remove('on');
      console.log(result);
    } else {

      const result = await callApiAddFavoriteLot(saleNo, lotNo);
      target.classList.add('on');
      console.log(result);
    }
  }

  /**
   * [Event] 응찰팝업 열기
   */
  const handleOpenBidPopup = async e => {
    e.preventDefault();
    const { saleNo, lotNo } = e.target.dataset;
    const popupContentId = '#popup_biddingPopup2-wrap';

    console.log(saleNo, lotNo);

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

  try {
    const currency = window.globalData.currency;
    const saleNo = loadPageData()?.saleNo;
    const { totalCount, rows } = data;
    document.querySelector('[data-total-count]').innerHTML = totalCount;

    if (rows.length < 1) {
      // TODO: 데이터 없음
      return;
    }

    const lotListElement = rows.map((item, index) => {
      const lang = getLanguage();
      const isCancelLots = item.STAT_CD === 'reentry';

      let artist = '';
      if (item.ARTIST_NAME_JSON) {
        artist = JSON.parse(item.ARTIST_NAME_JSON)[lang];
      } else {
        artist = '&nbsp;';
      }

      const lotNo = item.LOT_NO;
      const title = JSON.parse(item.TITLE_JSON)[lang];
      const material = lang === 'en' ? item.MATE_NM_EN : item.MATE_NM;
      const createdYear = JSON.parse(item.MAKE_YEAR_JSON)[lang] || '&nbsp;';
      const lotSizeJson = JSON.parse(item.LOT_SIZE_JSON);
      const imagePath = item.LOT_IMG_PATH && item.LOT_IMG_NAME ?
        `https://www.seoulauction.com/nas_img/${item.LOT_IMG_PATH}/${item.LOT_IMG_NAME}` :
        `/images/bg/no_image.jpg`;

      const expectPriceFrom = JSON.parse(item.EXPE_PRICE_FROM_JSON)[currency];
      const expectPriceTo = JSON.parse(item.EXPE_PRICE_TO_JSON)[currency];
      const isNotExpectPrice = !expectPriceFrom && !expectPriceTo;

      const startPrice = item.START_PRICE || 0;
      const bidCount = item.BID_CNT || 0;
      const isAuctioned = item.LAST_PRICE >= 0 && item.BID_CNT > 0 && (item.END_YN == 'Y');
      const hammerPrice = item.LAST_PRICE;
      const hammerPriceField = isAuctioned ? `<strong>${currency} ${format(hammerPrice)}</strong><em>(응찰${format(bidCount)})</em>` : '';

      const isProcessing = ['online'].includes(item.SALE_KIND_CD) && item.END_YN === 'N'; // 진행중 여부
      const remainTime = timerFormat(new Date(item?.TO_DT).getTime() - new Date().getTime());
      const isFavoriteClassName = item?.isFavorite ? 'on' : '';

      const remainTimeFormat = remainTime && [
        remainTime[0] > 0 ? remainTime[0] + '일 ' : '',
        remainTime[1] > 0 ? toFixTen(remainTime[1]) + ':' : '',
        remainTime[2] > 0 ? toFixTen(remainTime[2]) + ':' : '',
        remainTime[3] > 0 ? toFixTen(remainTime[3]) : '',
      ].filter(Boolean).join('');

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
        <li data-index="${index}" data-lot-no="${lotNo}">
          <div class="li-inner">
            <article class="item-article">
              <div class="image-area">
                <figure class="img-ratio">
                  <a href="#" class="img-align">
                    <img src="${imagePath}" alt="${title}">
                  </a>
                </figure>
              </div>

              <div class="typo-area">
                <div class="product_info">
                  <div class="num_heart-box">
                    <a href="/auction/online/view/${saleNo}/${lotNo}">
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
                          <span>${js_size_text_cm(lotSizeJson)}</span>
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
        </li>`;
    });

    const root = document.querySelector('.product-list');

    if (append) {
      root.insertAdjacentHTML('beforeend', lotListElement.join('\n'));
    } else {
      root.innerHTML = lotListElement.join('\n');
    }

    // 관심작품 토글
    root.querySelectorAll('li .favorite-btn').forEach(item => {
      item.addEventListener('click', handleToggleFavoriteLots);
    });

    // 응찰하기 버튼 클릭
    root.querySelectorAll('.go-bid-btn').forEach(item => {
      item.addEventListener('click', handleOpenBidPopup);
    });

  } catch (error) {
    console.log(error);
  }
}
