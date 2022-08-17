window.onload = async () => {
  /**
   * [Variable] Global Variables
   */
  window.globalData = {};
  window.globalData.isLogin = Boolean(window.sessionStorage.getItem('is_login')) || false; // 로그인 유무
  window.globalData.currency = 'KRW'; // 기축 통화
  window.globalData.usePolling = true; // 폴링 여부

  /**
   * [Onload] 랏 상세 정보 조회
   */
  const pageData = loadPageData();
  if (pageData) {
    const lotDetailData = await callApiGetLotInfo(pageData.saleNo, pageData.lotNo);
    renderDetailInfo(lotDetailData);

    const artistData = await callApiGetArtistInfo(lotDetailData.ARTIST_NO);
    renderArtistInfo(artistData);

    const favoriteData = await callApiGetFavoriteLots(pageData.saleNo);
    console.log(favoriteData);
  }

  /**
   * [Event] SNS 공유하기
   */
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

  /**
   * [Event] 배경 클릭 시, 팝업 닫기
   */
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

  /**
   * [Event] 카카오 공유하기 버튼 클릭
   */
  document.querySelector('.js-share_kakao').addEventListener('click', (e) => {
    e.preventDefault();
  });

  /**
   * [Event] 클립보드에 복사
   */
  document.querySelector('.js-share_url').addEventListener('click', (e) => {
    e.preventDefault();
  });

  /**
   * [Event] 프린트 페이지로 이동
   */
  document.querySelector('.print-btn').addEventListener('click', e => {
    e.preventDefault();
    window.location.href = `/auction/view/print/${pageData.saleNo}/${pageData.lotNo}`;
  });

  /**
   * [Event] 응찰하기 팝업 오픈
   */
  document.querySelector('.go-bid-btn').addEventListener('click', async e => {
    e.preventDefault();
    const { saleNo, lotNo } = loadPageData();
    const lotData = await callApiGetLotInfo(saleNo, lotNo);
    await handleOpenBidPopup(null, saleNo, lotData);
  });

  /**
   * [Event] 낙찰 수수료 토글
   */
  document.querySelectorAll('.bid-fee-btn').forEach(el => {
    el.addEventListener('click', (e) => {
      e.preventDefault();

      const popup = createPopupWithTemplate('auction-fee-popup');
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

  /**
   * [Event] 경매 호가표 토글
   */
  document.querySelectorAll('.bid-grow-price-btn').forEach(el => {
    el.addEventListener('click', (e) => {
      e.preventDefault();

      const popup = createPopupWithTemplate('auction-grow-price-popup');
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

  /**
   * [Event] 관심작품 토글
   * @param {Event<HTMLButtonElement>} e
   * @param {number} saleNo
   * @param {number} lotNo
   */
  document.querySelector('.js-work_heart').addEventListener('click', async e => {
    e.preventDefault();
    e.stopPropagation();

    if (!window.globalData.isLogin) {
      // TODO: 얼럿 확인
      window.alert('로그인이 필요합니다');
      return;
    }

    const { saleNo, lotNo } = loadPageData();
    const target = e.currentTarget;
    const isActive = target.classList.contains('on');

    if (isActive) {
      await callApiDeleteFavoriteLot(saleNo, lotNo);
      target.classList.remove('on');
    } else {
      await callApiAddFavoriteLot(saleNo, lotNo);
      target.classList.add('on');
    }
  });
}
