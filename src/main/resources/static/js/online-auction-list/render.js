/**
 * ----------------------------------------------------------------------------
 * 화면 렌더링
 * ----------------------------------------------------------------------------
 */

/**
 * [Render] 경매 타이틀 섹션 렌더링
 * @param {Object} data
 */
async function renderSaleTitleSection(data) {
  // 타이틀 영역
  document.querySelector('[data-title]').innerHTML = `${JSON.parse(data.TITLE_JSON).ko}`;
  document.querySelector('[data-preview]').innerHTML = `
    ${window.moment(data.PREV_FROM_DT).format('MM.DD(ddd)')} ~
    ${window.moment(data.PREV_TO_DT).format('MM.DD(ddd)')}`.trim();
  document.querySelector('[data-to-date]').innerHTML = `${window.moment(data.FROM_DT).format('MM.DD(ddd) HH:mm')}`;

  // 카테고리
  let categories = [];
  data.categoryList.forEach(item => {
    categories.push({ title: item.CD_NM, value: item.CD_ID });
  });

  // 태그
  data.lotTagList.forEach(item => {
    categories.push({ title: item.LOT_TAG, value: item.LOT_TAG });
  });

  if (categories.length > 0) {
    let categoryHtml = `
      <li>
        <a href="#" data-category-value="ALL">
          <span>전체</span>
        </a>
      </li>`;

    categoryHtml += categories.map((item, index) => {
      return `
        <li>
          <a href="#" data-category-value="${item.value}">
            <span>${item.title}</span>
          </a>
        </li>`.trim();
    }).join('');

    const categoryElement = document.querySelector('[data-category]');
    categoryElement.innerHTML = categoryHtml;

    const handleClickCategory = e => {
      e.preventDefault();
      console.log(e.currentTarget);
      console.log(e.currentTarget.dataset.categoryValue);
    }

    [...categoryElement.querySelectorAll('li a')].forEach(item => {
      item.addEventListener('click', handleClickCategory);
    });
  }
}

/**
 * [Render] 경매 랏 렌더링
 */
async function renderLotListSection(data) {
  try {
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
      const isAuctioned = item.LAST_PRICE >= 0 && item.BID_CNT > 0 && (item.END_YN == 'Y' || item.CLOSE_YN == 'Y');
      const hammerPrice = item.LAST_PRICE;
      const hammerPriceField = isAuctioned ? `<strong>${currency} ${format(hammerPrice)}</strong><em>(응찰${format(bidCount)})</em>` : '';

      const isProcessing = ['online'].includes(item.SALE_KIND_CD) && item.END_YN === 'N'; // 진행중 여부
      const remainTime = timerFormat(new Date(item.TO_DT).getTime() - new Date().getTime());
      const remainTimeFormat = [
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
        <li data-index="${index}">
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
                    <a href="#">
                      <span class="num">${lotNo}</span>
                    </a>
                    <button class="heart js-work_heart favorite-btn" data-sale-no="${saleNo}" data-lot-no="${lotNo}">
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
                        <a href="#">
                          <span>${js_size_text_cm(lotSizeJson)}</span>
                          ${createdYear ? `<span>${createdYear}</span>` : ''}
                        </a>
                      </div>
                    </div>
                  </div>
                  <div class="price-box">
                    <a href="#">
                      <dl class="price-list">
                        <dt>추정가</dt>
                        <dd>${isNotExpectPrice ? '별도문의' : currency + ' ' + format(expectPriceFrom)}</dd>
                        <dd>${isNotExpectPrice ? '' : '~ ' + format(expectPriceTo)}</dd>
                      </dl>
                      <dl class="price-list">
                        <dt>시작가</dt>
                        <dd>${currency} ${startPrice > 0 ? format(startPrice) : '-'}</dd>
                      </dl>
                      <dl class="price-list">
                        <dt>낙찰가</dt>
                        <dd>${hammerPriceField}</dd>
                      </dl>
                    </a>
                  </div>
                  <div class="bidding-box">
                    <div class="deadline_set">
                      <a href="#">
                        <span>${!remainTime ? '' : remainTimeFormat}</span>
                      </a>
                    </div>
                    <div class="btn_set">
                      <a class="btn btn_point" href="#" role="button">
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
    root.innerHTML = lotListElement.join('\n');

    // 관심작품 토글
    root.querySelectorAll('li .favorite-btn').forEach(item => {
      item.addEventListener('click', async (e) => {

        // 로그인 체크
        if (!isLogin) {
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
      });
    });

  } catch (error) {
    console.log(error);
  }
}

/**
 * [Render] 페이징 영역
 */
async function renderPaginationSection(currentPage = 1, totalCount = 0, perPage = 20, blockCount = 10) {
  const root = document.querySelector('.paging');

  const totalPage = Math.ceil(totalCount / perPage);
  const totalBlock = Math.ceil(totalPage / blockCount);
  const currentBlock = Math.ceil(currentPage / blockCount);
  const startPage = currentBlock * blockCount - (blockCount - 1);
  const endPage = (currentBlock * blockCount) > totalPage ? totalPage : currentBlock * blockCount;
  const prevBlock = (currentBlock - 1) * blockCount;
  const nextBlock = (currentBlock * blockCount) + 1;

  const pageList = Array.from({ length: endPage - startPage + 1 }).map((_, index) => {
    return {
      title: startPage + index,
      page: startPage + index,
      active: startPage + index === currentPage,
    }
  });

  const pagingObject = [
    prevBlock > 0 ? { title: 'FIRST', page: 1 } : null, // first
    currentBlock > 1 ? { title: 'PREV', page: prevBlock } : null, // prev
    ...pageList,
    currentBlock <= totalBlock - 1 &&  { title: 'NEXT', page: nextBlock }, // Next
    currentPage !== totalPage ? { title: 'END', page: totalPage } : null // last
  ].filter(Boolean);

  const html = pagingObject.map(item => {
    if (item.title === 'FIRST') {
      return `<a href="#" class="prev_end icon-page_prevprev" data-page="1">FIRST</a>`;
    }
    if (item.title === 'PREV') {
      return `<a href="#" class="prev icon-page_prev" data-page="${item.page}">PREV</a>`;
    }
    if (item.title === 'NEXT') {
      return `<a href="#" class="next icon-page_next" data-page="${item.page}"><em>NEXT</em></a>`;
    }
    if (item.title === 'END') {
      return `<a href="#" class="next_end icon-page_nextnext" data-page="${item.page}">END</a>`;
    }

    if (item.active) {
      return `<a href="#" class="on"><strong>${item.page}</strong></a>`;
    }

    return `<a href="#" data-page="${item.page}"><em>${item.title}</em></a>`;
  }).join('\n');

  const handleUpdatePaging = async (e) => {
    e.preventDefault();
    const target = e.currentTarget;

    if (target.classList.contains('disabled')) return;
    window.location.href = makeUrl(target.dataset.page);

    // 페이징 변경 시,
    // if (target.dataset?.page) {
    //   const currentPage = target.dataset?.page ? Number(target.dataset?.page) : 1;
    //   const pageData = loadPageData();
    //   window.history.pushState({}, '', makeUrl(target.dataset.page));

    //   const lotListResult = await callApiLotList(pageData.saleNo, Number(target.dataset?.page), pageData.lotSize);
    //   renderLotListSection(lotListResult);
    //   renderPaginationSection(currentPage, lotListResult.totalCount, pageData.lotSize);
    //   window.scrollTo({ top: 0, behavior: 'smooth' })
    // }
  }

  root.innerHTML = html;
  root.querySelectorAll('a').forEach((element, index) => {
    element.addEventListener('click', handleUpdatePaging);
  });
}