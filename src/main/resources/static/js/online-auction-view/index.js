window.addEventListener('DOMContentLoaded', () => {
  let style = document.createElement('style');
  style.textContent = `    
    .select2-container.select2-container--open {
      z-index: 10;
    }
  `;
  document.head.appendChild(style);
});

window.onload = async () => {
  // TODO: 뷰스케일
  // TODO: 이미지 확대보기
  // TODO: 폴링 Fetcher 생성

  const urlData = getDataFromUrl(`/auction/online/{saleNo}/{lotNo}`);
  if (!urlData) return;

  stickyScrollDetailPage();

  const { saleNo, lotNo } = urlData;

  // [API] 인증 정보
  const me = await callApiGetMe();

  // [API] 랏 상세 정보
  const lotDetail = await callApiGetLotInfo(saleNo, lotNo);

  // [API] 작가 정보
  const artistData = await callApiGetArtistInfo(lotDetail.ARTIST_NO);

  // [API] 관심작품 목록 정보
  const favoriteData = await callApiGetFavoriteLots(saleNo);

  // [Render] 관심작품 토글 처리
  await initToggleFavoriteLot(saleNo, lotNo, favoriteData);

  // [Render] 상세 영역 렌더링
  await renderDetailInfo(lotDetail);

  // [Render] 상세 영역 렌더링
  await renderArtistInfo(artistData);

  // [Render] 최근 본 작품
  await renderRecentLots(saleNo);

  // [Onload] 최근 본 작품에 추가
  await addRecentLots(saleNo, lotNo);

  // [Onload] 전체랏 보기 현재 랏 추가
  const dropdownButtonText = document.querySelector('.js-dropdown-btn span');
  if (dropdownButtonText) {
    dropdownButtonText.textContent = `LOT ${lotNo}`;
  }

  // [Event] 전체 랏 보기
  attachEvent('.js-dropdown-btn', 'click', async e => {
    e.preventDefault();
    e.stopPropagation(); // 배경 클릭시 이벤트 전파 방지
    const target = e.currentTarget;
    await addDropdownLotListEvent(target);
  });

  // [Event] SNS 공유하기 토글
  attachEvent('.sns_share', 'click', handleShareSns);

  // [Event] 카카오 공유하기
  attachEvent('.js-share_kakao', 'click', handleShareKakao);

  // [Event] 클립보드에 복사
  attachEvent('.js-share_url', 'click', handleCopyToClipboard);

  // [Event] 프린트 페이지로 이동
  attachEvent('.print-btn', 'click', handleGoPrintPage);

  // [Event] 응찰하기 팝업 오픈
  attachEvent('.go-bid-btn', 'click', handleClickOpenBidPopup);

  // [Event] 낙찰 수수료 토글
  document.querySelectorAll('.bid-fee-btn').forEach(el => {
    attachEvent(el, 'click', handleToggleFee)
  });

  // [Event] 경매 호가표 토글
  attachEvent('.bid-grow-price-btn', 'click', handleToggleGrowPriceModal);

  // [Event] 관심작품 토글
  attachEvent('.js-work_heart', 'click', handleToggleFavoriteLot);

  // [Event] 랏 바로가기 셀렉트 팝업 토글
  attachEvent('toggle-direct-lot-popup', 'click', handleToggleDirectLots);

  // [Event] 모바일에서 전체 LOT 클릭 이벤트
  attachEvent('.js-lotbox-btn', 'click', handleToggleDropdownMobile);

  // [Event] 배경 클릭 시, 팝업 닫기
  window.addEventListener('click', handleClickBackground);
}

$(window).on('scroll resize', function($e) {
  stickyScrollDetailPage();
});

/**
 * SNS 공유하기
 * @param {Event} e
 */
async function handleShareSns(e) {
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
}

/**
 * 카카오 공유하기
 * @param {Event} e
 */
async function handleShareKakao(e) {
  // TODO: 카카오 공유
}

/**
 * 클립보드에 복사
 * @param {Event} e
 */
async function handleCopyToClipboard(e) {
  // TODO: 클립보드에 복사
}

/**
 * 프린트페이지로 이동
 * @param {Event} e
 */
async function handleGoPrintPage(e) {
  e.preventDefault();
  const urlData = getDataFromUrl(`/auction/online/{saleNo}/{lotNo}`);
  window.location.href = `/auction/view/print/${urlData?.saleNo}/${urlData?.lotNo}`;
}

/**
 * 응찰 팝업 오픈
 * @param {Event} e
 */
async function handleClickOpenBidPopup(e) {
  e.preventDefault();
  const { saleNo, lotNo } = getDataFromUrl(`/auction/online/{saleNo}/{lotNo}`);
  await handleOpenBidPopup(saleNo, lotNo);
}

/**
 * 낙찰 수수료 팝업 토글
 * @param {Event} e
 */
async function handleToggleFee(e) {
  e.preventDefault();
  console.log('111')

  const feeModal = await createModal({
    selector: '#auction-fee-popup',
    onCloseSelector: '.popup-layer',
    beforeClose: root => {
      root.querySelector('.popupfixed-wrap').style.display = 'none';
    }
  });

  console.log(feeModal)

  await feeModal.init();
  await feeModal.open(root => {
    root.querySelector('.popupfixed-wrap').style.display = 'block';
  });

  attachEvent(feeModal.root.querySelector('.btn_close'), 'click', e => {
    e.preventDefault();
    feeModal.close(null);
  });
}

/**
 * 경매 호가표 팝업 토글
 * @param {Event} e
 */
async function handleToggleGrowPriceModal(e) {
  e.preventDefault();

  const growPriceModal = await createModal({
    selector: '#auction-grow-price-popup',
    onCloseSelector: '.popup-layer',
    beforeClose: root => {
      root.querySelector('.popupfixed-wrap').style.display = 'none';
    }
  });

  await growPriceModal.init();
  await growPriceModal.open(root => {
    root.querySelector('.popupfixed-wrap').style.display = 'block';
  });

  attachEvent(growPriceModal.root.querySelector('.btn_close'), 'click', e => {
    e.preventDefault();
    growPriceModal.close(null);
  });
}

/**
 * 관심작품 토글
 * @param {Event} e
 */
async function handleToggleFavoriteLot(e) {
  e.preventDefault();
  e.stopPropagation();

  if (!isLogin()) {
    // TODO: 얼럿 확인
    window.alert('로그인이 필요합니다');
    return;
  }

  const { saleNo, lotNo } = getDataFromUrl(`/auction/online/{saleNo}/{lotNo}`);
  const target = e.currentTarget;
  const isActive = target.classList.contains('on');

  if (isActive) {
    await callApiAddFavoriteLot(saleNo, lotNo);
    target.classList.add('on');
  } else {

    await callApiDeleteFavoriteLot(saleNo, lotNo);
    target.classList.remove('on');
  }
}

/**
 * 랏 바로가기 셀렉트 팝업 토글
 * @param {Event} e
 */
async function handleToggleDirectLots(e) {
  e.preventDefault();
  e.stopPropagation();

  const target = e.currentTarget;
  const id = 'online-direct-lot-select';
  if (!document.getElementById(id)) {
    const popupTemplate = document.getElementById(`${id}-template`);
    const clone = document.importNode(popupTemplate.content, true);
    target.parentNode.appendChild(clone);
  }

  const popup = document.getElementById('online-direct-lot-select');

  // Close
  if (target.classList.contains('active')) {
    console.log('is active')
    target.classList.remove('active');
    popup.classList.remove('open');
    popup.style.display = 'none';
  }
  // Open
  else {
    console.log('is not active')
    target.classList.add('active');
    popup.classList.add('open');
    popup.style.display = 'block';
  }
}

/**
 * 모바일에서 전체 LOT 클릭
 * TODO: 전체 랏 보기 구현
 * @param {Event} e
 */
async function handleToggleDropdownMobile(e) {
  e.preventDefault();

}

/**
 * 배경 클릭 시, 팝업 닫기
 * @param {Event} e
 */
async function handleClickBackground(e) {
  if (document.querySelector('.sns_share')?.classList.contains('on')) {
    const popup = e.target.closest('.sns_layer-area'); // 해당 영역을 클릭했는지 여부
    if (popup === null) {
      document.querySelector('.sns_share').classList.remove('on');
      document.querySelector('.sns_layer-area').style.display = 'none';
    }
  }

  // 랏 바로가기 팝업 닫기
  if (document.getElementById('online-direct-lot-select')?.classList.contains('open')) {
    const popup = e.target.closest('#online-direct-lot-select'); // 해당 영역을 클릭했는지 여부
    if (popup === null) {
      document.getElementById('toggle-direct-lot-popup').classList.remove('active');
      document.getElementById('online-direct-lot-select').classList.remove('on');
      document.getElementById('online-direct-lot-select').style.display = 'none';
    }
  }

  // 드롭다운
  const isOpenDropdown = document.querySelector('.js-dropdown-btn.active');
  if (isOpenDropdown && !e.target.closest('.trp-dropdown_list-box')) {
    isOpenDropdown.classList.remove('active');
    document.querySelector('.trp-dropdown_list-box').style.display = 'none';
    document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]').value = '';
  }
}

/**
 * [UI] 오른쪽 영역 스크롤
 */
function stickyScrollDetailPage() {
  let holdInfo = $(".js-product_detail-article").trpScrollSyncTopView({
    topStart: 172,
    topMagin: 172,
    bottomStop: 1065
  });

  let headerHeight = $("header.header").height();
  let footerHeight = $("footer.footer").height();
  let bottomHeight = $(".type_panel-product_view > .panel-footer").height();
  let stopPos = 110 + bottomHeight + 120 + footerHeight;

  holdInfo.setTopStart(headerHeight + 56);
  holdInfo.setBottomStop(stopPos);
}

/**
 * 현재 랏이 관심작품인지 여부 처리
 * @param saleNo
 * @param lotNo
 * @param data
 */
async function initToggleFavoriteLot(saleNo, lotNo, data) {
  if (!data) return;

  const favoriteIndex = data.findIndex(item => {
    return Number(saleNo) === item.SALE_NO && Number(lotNo) === item.LOT_NO && item.INTE_LOT === 'Y';
  });

  if (favoriteIndex > -1) {
    document.querySelector('.js-work_heart').classList.add('on');
  }
}
