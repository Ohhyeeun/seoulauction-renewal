/**
 * 랏 정보 영역 렌더링
 * @param {object} data
 */
function renderDetailInfo(data) {
  const lang = document.documentElement.lang || 'ko';
  const currency = data.CURR_CD || 'KRW';
  const saleNo = data.SALE_NO;
  const lotNo = data.LOT_NO;
  const lotState = data.STAT_CD;
  const isEnd = data.END_YN === 'Y';
  const isClose = data.CLOSE_YN === 'Y';

  // 세일 정보
  const saleTitleJson = JSON.parse(data.TITLE_JSON);
  const saleTitle = saleTitleJson[lang] || '';

  // 이미지 정보
  const lotImageList = data.imageList;
  let imageThumbnail = [];
  let imageOriginal = [];

  if (lotImageList.length > 0) {
    lotImageList.sort((a,b) => a.DISP_ORD - b.DISP_ORD); // DISP_ORD ASC
    lotImageList.forEach((item, index) => {
      const fullImagePath = `${item.IMAGE_URL}${item.FILE_PATH}/${item.FILE_NAME}`;
      imageThumbnail.push(`
        <div class="slide images" data-index="${index}">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${fullImagePath}" alt="${item.FILE_NAME}" />
            </div>
          </figure>
          <div class="line"></div>
        </div>
      `);

      imageOriginal.push(`
        <div class="swiper-slide" data-index="${index}">
          <div class="image-area">
            <figure class="img-ratio">
              <div class="img-align">
                <img src="${fullImagePath}" alt="${item.FILE_NAME}" />
              </div>
            </figure>
           </div>
        </div>
      `);
    });
  }

  // 작가
  const artistName = JSON.parse(data.ARTIST_NAME_JSON)[lang] || '&nbsp;';
  let bornYear =  '&nbsp;';
  if (data.BORN_YEAR && data.DIE_YEAR) {
    bornYear = `${data.BORN_YEAR} ~ ${data.DIE_YEAR}`;
  } else if (data.BORN_YEAR) {
    bornYear = `b.${data.BORN_YEAR}`;
  }

  // TITLE_KO_TXT | TITLE_EN_TXT | TITLE_ZH_TXT
  let title;
  switch (lang) {
    case 'ko':
      title = data.TITLE_KO_TXT || '&nbsp;';
      break;
    case 'en':
      title = data.TITLE_EN_TXT || '&nbsp;';
      break;
    // case 'zh':
    //   title = data.TITLE_ZH_TXT || '&nbsp;';
    //   break;
    default:
      title = '&nbsp;';
      break;
  }

  // 기본정보 Row
  let basicInfoHtml = [];
  // 재질 정보
  let material = '&nbsp;';
  if (lang === 'ko') {
    material = data.MATE_NM;
  } else if (lang === 'en') {
    material = data.MATE_NM_EN;
  } else if (lang === 'zh') {
    material = data.MATE_NM_CN;
  }
  basicInfoHtml.push(material);

  // 사이즈 정보
  // data.LOT_SIZE_STRING
  let lotSize = '&nbsp;';
  if (data.LOT_SIZE_STRING) {
    lotSize = data.LOT_SIZE_STRING;
  } else if (data.LOT_SIZE_JSON) {
    lotSize = js_size_text_cm(JSON.parse(data.LOT_SIZE_JSON));
  }
  basicInfoHtml.push(lotSize);

  // 사인 정보
  const signInfoJson = JSON.parse(data.SIGN_INFO_JSON);
  if (signInfoJson[lang]) {
    basicInfoHtml.push(signInfoJson[lang]);
  }

  // 추가정보 data-lot-additional-info
  let lotAdditionalInfo = [];

  const conditions = JSON.parse(data.COND_RPT_JSON)[lang];
  if (conditions) {
    lotAdditionalInfo.push(`
      <div class="info-sub-box">
        <div class="tit tt5">CONDITION</div>
        <div class="desc">${conditions}</div>
      </div>
    `);
  }

  const provenance = JSON.parse(data.PROV_INFO_JSON)[lang];
  if (provenance) {
    lotAdditionalInfo.push(`
      <div class="info-sub-box">
        <div class="tit tt5">PROVENANCE</div>
        <div class="desc">${provenance}</div>
      </div>
    `);
  }

  const literature = JSON.parse(data.LITE_INFO_JSON)[lang];
  if (literature) {
    lotAdditionalInfo.push(`
      <div class="info-sub-box">
        <div class="tit tt5">LITERATURE</div>
        <div class="desc">${literature}</div>
      </div>
    `);
  }

  const exhibited = JSON.parse(data.EXHI_INFO_JSON)[lang];
  if (exhibited) {
    lotAdditionalInfo.push(`
      <div class="info-sub-box">
        <div class="tit tt5">EXHIBITED</div>
        <div class="desc">${literature}</div>
      </div>
    `);
  }

  // 작품 설명
  let lotDescription = '';
  const lotDescriptionJson = JSON.parse(data.CMMT_JSON);
  if (lotDescriptionJson[lang]) {
    lotDescription = lotDescriptionJson[lang];
  }

  // 추정가
  let expectPrice = '0';
  // 추정가 별도문의
  if (data.EXPE_PRICE_INQ_YN === 'Y') {
    expectPrice = '추정가 별도문의';
  } else if (data.EXPE_PRICE_FROM_JSON && data.EXPE_PRICE_TO_JSON) {
    const expectFrom = JSON.parse(data.EXPE_PRICE_FROM_JSON);
    const expectTo = JSON.parse(data.EXPE_PRICE_TO_JSON);
    expectPrice = `${currency} ${formatNumber(expectFrom[currency])} ~ ${formatNumber(expectTo[currency])}`;
  }

   // 시작가
  let startPrice = `${currency} 0`;
  if (lotState !== 'reentry') {
    startPrice = `${currency} ${formatNumber(data.START_PRICE)}`;
  }

  // 현재가 Or 낙찰가
  let lastPriceTitle = isEnd && isClose ? '낙찰가' : '현재가';
  let lastPrice = `<strong>${currency} ${formatNumber(data.LAST_PRICE)}</strong>`;
  if (data.BID_CNT > 0) {
    lastPrice += `<em>(응찰 ${formatNumber(data.BID_CNT)})</em>`;
  }

  // 마감일
  let toDate = window.moment(data.TO_DT).format('M/D(ddd) HH:mm');

  // current-grow-price
  // const growPrice = getCurrentGrowPrice(data.LAST_PRICE || 0);
  const currentFee = floor(data.LAST_PRICE * 0.18);

  /**
   * HTML Rendering
   */
  document.getElementById('data-sale-title').innerHTML = saleTitle;
  document.getElementById('data-lot-thumbnail').children[0].innerHTML = imageThumbnail.join('\n');
  document.getElementById('data-lot-image').children[0].innerHTML = imageOriginal.join('\n');
  document.getElementById('data-lot-no').innerHTML = lotNo;
  document.getElementById('data-artist-name').innerHTML = artistName;
  document.getElementById('data-artist-born-year').innerHTML = bornYear;
  document.getElementById('data-lot-title').innerHTML = title; // TODO: 작품명이 없음
  document.getElementById('data-lot-basic-desc').innerHTML = basicInfoHtml.filter(Boolean).join('<br/>');
  if (!lotDescription) {
    document.getElementById('data-lot-description-title').innerHTML = '';
  }
  document.getElementById('data-lot-description').innerHTML = lotDescription;
  document.getElementById('data-expect-price').innerHTML = expectPrice;
  document.getElementById('data-start-price').innerHTML = startPrice;
  document.getElementById('data-last-price-title').innerHTML = lastPriceTitle;
  document.getElementById('data-last-price').innerHTML = lastPrice;
  document.getElementById('data-to-date').innerHTML = toDate;
  if (lotAdditionalInfo.length > 0) {
    document.getElementById('data-lot-additional-info').innerHTML = lotAdditionalInfo.join('\n');
  }

  document.querySelector('.current-fee').innerHTML = formatNumber(currentFee);
}
