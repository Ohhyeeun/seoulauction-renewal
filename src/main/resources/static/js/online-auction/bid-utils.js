/**
 * [Event] 응찰팝업 열기
 * @param {Event<HTMLButtonElement> | null} e
 * @param {number} saleNo
 * @param {object} lotData
 */
async function handleOpenBidPopup(e, saleNo, lotData) {
  if (e) e.preventDefault();

  const popupContentId = '#popup_biddingPopup2-wrap';

  // 만약에 팝업이 없을 경우, 팝업을 추가
  if (!document.querySelector(popupContentId)) {
    const popupTemplate = document.querySelector('#online-bid-popup');
    const clone = document.importNode(popupTemplate.content, true);
    document.body.appendChild(clone);
  }

  const popupContent = document.querySelector(popupContentId);

  console.log(popupContent)
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
 * 응찰 팝업 HTML
 * @param {Element} element
 * @param {number} saleNo
 * @param {object} data
 */
function renderPopupContent(element, saleNo, data) {
  const lang = getLanguage();
  const currency = window.globalData.currency || 'KRW';
  const lotNo = data.LOT_NO; // 랏 번호
  const title = data.TITLE_JSON ? JSON.parse(data.TITLE_JSON)[lang] : ' '; // 작품명
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

/**
 * 응찰 팝업 토글
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