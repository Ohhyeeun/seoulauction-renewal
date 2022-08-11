/**
 * 랏 정보 영역 렌더링
 * @param {object} data
 */

function renderDetailInfo(data) {
  const lang = window.globalData.lang || 'ko';
  const root = document.querySelector('.product_detail-article');
  const currency = window.globalData.currency || 'KRW';

  const lotNo = data.LOT_NO;
  const artistName = JSON.parse(data.ARTIST_NAME_JSON)[lang] || '&nbsp;';
  const bornYear = data.BORN_YEAR ? `b.${data.BORN_YEAR}` : '&nbsp;';
  // const lotSize = data.LOT_SIZE_JSON ? js_size_text_cm(JSON.parse(data.LOT_SIZE_JSON)) : '&nbsp;';

  let title;
  switch (lang) {
    case 'ko':
      title = data.TITLE_KO_TXT;
      break;
    case 'en':
      title = data.TITLE_EN_TXT;
      break;
    // case 'zh':
    //   title = data.TITLE_ZH_TXT;
    //   break;
    default:
      title = '&nbsp;';
      break;
  }

  const expectPriceFrom = JSON.parse(data.EXPE_PRICE_FROM_JSON)[currency]; // 추정 시작가
  const expectPriceTo = JSON.parse(data.EXPE_PRICE_TO_JSON)[currency]; // 추정 최대가격
  const isNotExpectPrice = !expectPriceFrom && !expectPriceTo; // 추정가 보유 여부
  let expectPriceText = '';
  if (!isNotExpectPrice) {
    expectPriceText = `${formatNumber(expectPriceFrom)} ~ ${formatNumber(expectPriceTo)}`; // 추정가
  }

  const startPrice = data.START_PRICE ? `${formatNumber(data.START_PRICE)}` : '0'; // 시작가
  const lastPrice = data.LAST_PRICE ? `${formatNumber(data.LAST_PRICE)}` : '0'; // 현재가
  const bidCount = data.BID_CNT || 0; // 응찰 횟수
  const toDate = window.moment(data.TO_DT).format('M/DD(ddd) HH:mm'); // 마감일

  // current-grow-price
  // const growPrice = getCurrentGrowPrice(data.LAST_PRICE || 0);
  const currentFee = floor(data.LAST_PRICE * 0.18);

  root.querySelector('.data-lot-no').innerHTML = `${lotNo}`;
  root.querySelector('.artist-area').innerHTML = `
    <div class="name">
      <strong>${artistName}</strong>
      <span>${bornYear}</span>
    </div>
    <div class="desc">
      <span>${title}</span>
    </div>
  `;

  root.querySelector('.price-area').innerHTML = `
    <dl class="price-list">
      <dt>추정가</dt>
      <dd>${currency} ${expectPriceText}</dd>
    </dl>
    <dl class="price-list">
      <dt>시작가</dt>
      <dd>${currency} ${startPrice}</dd>
    </dl>
    <dl class="price-list">
      <dt>현재가</dt>
      <dd>
        <strong>${currency} ${lastPrice}</strong>
        ${bidCount > 0 ? `<em>(응찰 ${bidCount})</em>` : ''}
      </dd>
    </dl>
    <dl class="price-list">
      <dt>마감일</dt>
      <dd>${toDate}</dd>
    </dl>
  `;
  root.querySelector('.current-fee').innerHTML = formatNumber(currentFee);
}