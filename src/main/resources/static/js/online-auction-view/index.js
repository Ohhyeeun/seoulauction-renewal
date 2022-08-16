window.onload = async () => {
  /**
   * [Variable] Global Variables
   */
  window.globalData = {};
  window.globalData.isLogin = Boolean(window.sessionStorage.getItem('is_login')) || false; // 로그인 유무
  window.globalData.currency = 'KRW'; // 기축 통화
  window.globalData.usePolling = true; // 폴링 여부

  // 낙찰 수수료 토글
  const feePopupName = 'auction-fee-popup';
  document.querySelectorAll('.bid-fee-btn').forEach(el => {
    el.addEventListener('click', (e) => {
      e.preventDefault();

      const popup = createPopupWithTemplate(feePopupName);
      togglePopup(popup, true);

      popup.addEventListener('click', (e) => {
        e.preventDefault();
        const target = e.target;
        if (target.classList.contains('popup-dim') || target.classList.contains('js-closepop')) {
          togglePopup(popup, false);
        }
      });
    });
  });

  // 경매 호가표 토글
  const growPricePopupName = 'auction-grow-price-popup';
  document.querySelectorAll('.bid-grow-price-btn').forEach(el => {
    el.addEventListener('click', (e) => {
      e.preventDefault();

      const popup = createPopupWithTemplate(growPricePopupName);
      togglePopup(popup, true);

      popup.addEventListener('click', (e) => {
        e.preventDefault();
        const target = e.target;
        if (target.classList.contains('popup-dim') || target.classList.contains('js-closepop')) {
          togglePopup(popup, false);
        }
      });
    });
  });

  // 랏 상세 정보 조회
  const pageData = loadPageData();
  if (pageData) {
    const lotDetail = await callApiGetLotInfo(pageData.saleNo, pageData.lotNo);
    renderDetailInfo(lotDetail);
  }

  // SNS 공유하기
  document.querySelector('.sns_share').addEventListener('click', (e) => {
    e.preventDefault();
    e.stopPropagation();

    const target = e.currentTarget;
    if (target.classList.contains('on')) {
      target.classList.remove('on');
      document.querySelector('.sns_layer-area').style.display = 'none';
    } else {
      target.classList.add('on');
      document.querySelector('.sns_layer-area').style.display = 'block';
    }
  });

  // 배경 클릭
  window.addEventListener('click', async (e) => {
    e.preventDefault();

    if (document.querySelector('.sns_share').classList.contains('on')) {
      const popup = e.target.closest('.sns_layer-area'); // 해당 영역을 클릭했는지 여부
      if (popup === null) {
        document.querySelector('.sns_share').classList.remove('on');
        document.querySelector('.sns_layer-area').style.display = 'none';
      }
    }
  });

  // 카카오 공유하기
  document.querySelector('.js-share_kakao').addEventListener('click', (e) => {
    e.preventDefault();
  });

  // 클립보드에 복사
  document.querySelector('.js-share_url').addEventListener('click', (e) => {
    e.preventDefault();
  });


}

/**
 * 팝업 생성
 * - template#popup-id-template > #popup-id 사전에 존재해야 함
 * @param {string} id
 */
function createPopupWithTemplate(id) {
  // <template> 값 레이어 Dom 으로 추가
  if (!document.getElementById(id)) {
    const popupTemplate = document.getElementById(`${id}-template`);
    const clone = document.importNode(popupTemplate.content, true);
    document.body.appendChild(clone);
  }

  const popup = document.getElementById(id);
  popup.style.height = `${window.innerHeight}px`;
  popup.style.position = 'fixed';
  return popup;
}

/**
 * createPopupWithTemplate 으로 생성된 팝업 토글
 * @param {HTMLElement} popup
 * @param {boolean} isOpen
 */
function togglePopup(popup, isOpen) {
  const popupContentBg = popup.querySelector('.popup-dim');
  if (popupContentBg) {
    popupContentBg.style.backgroundColor = '#000';
  }

  if (isOpen) {
    if (popupContentBg) {
      popupContentBg.style.opacity = 0.7;
    }
    popup.style.display = 'block';
    document.body.style.overflow = 'hidden';
    document.body.style.touchAction = 'none';
  } else {
    if (popupContentBg) {
      popupContentBg.style.opacity = 0;
    }
    popup.style.display = 'none';
    document.body.style.overflow = 'visible';
    document.body.style.touchAction = 'auto';
  }
}

/**
 * Sleep
 * @param {number} ms
 * @return {Promise<any>}
 */
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}