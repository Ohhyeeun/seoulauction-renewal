/**
 * 최근 본 작품 가져오기
 * @param {number} saleNo
 * @return {Promise<any[]>}
 */
async function getRecentLots(saleNo) {
  const list = window.localStorage.getItem(`recent-lot-${saleNo}`);
  if (!list) return [];
  return JSON.parse(list);
}

/**
 * 최근 본 작품 추가
 * @param {number} saleNo
 * @param {number | string} lotNo
 */
async function addRecentLots(saleNo, lotNo) {
  const selectLot = Number(lotNo);
  const recentLots = await getRecentLots(saleNo);
  let filtered = recentLots.filter(savedLot => savedLot !== selectLot);
  filtered.unshift(selectLot);
  filtered = filtered.slice(0, 5);
  window.localStorage.setItem(`recent-lot-${saleNo}`, JSON.stringify(filtered));
}

/**
 * 최근 본 작품 렌더
 */
async function renderRecentLots(saleNo) {
  const lang = getLanguage();
  const listContainer = document.getElementById('recent-view-list');
  const listRoot = listContainer.querySelector('ul');
  listRoot.remove();

  const recentLots = await getRecentLots(saleNo);
  if (recentLots.length < 1) return;

  const newRoot = document.createElement('ul');
  newRoot.classList.add('product-list');

  const { rows, totalCount } = await callApiLotList({
    saleNo, lotList: recentLots,
  }, true);

  if (totalCount === 0) {
    return;
  }

  let recentLotListHtml = recentLots.map(lotNo => {
    const data = rows.find(item => item.LOT_NO === lotNo);
    if (!data) return ``;

    const title = JSON.parse(data.TITLE_JSON)[lang]; // 작품명
    const artist = data.ARTIST_NAME_JSON ? JSON.parse(data.ARTIST_NAME_JSON)[lang] : '&nbsp;'; // 작가명
    const isFavorite = data?.isFavorite || false;

    // 이미지 정보
    let imagePath = '/images/bg/no_image.jpg';
    if ('LOT_IMG_PATH' in data && 'LOT_IMG_NAME' in data) {
      imagePath = `https://www.seoulauction.com/nas_img/${data.LOT_IMG_PATH}/${data.LOT_IMG_NAME}`;
    }

    return `
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${saleNo}/${lotNo}" class="img-align">
                  <img src="${imagePath}" alt="${artist} - ${title}">
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${lotNo} </span>
                  </a>
                  <a class="${isFavorite ? `heart js-work_heart on` : `heart js-work_heart`}">
                    <i class="${isFavorite ? 'icon-heart_on' : 'icon-heart_off'}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${artist}</span></a>
                  </div>
                  <div class="desc"><a href="#"><span>${title}</span></a></div>
                </div>
              </div>
            </div>
            <div class="product_cancle-area">
              <div class="area-inner">
                <i class="icon-cancle_box"></i>
                <div class="typo">
                  <div class="name"><span>LOT 5</span></div>
                  <div class="msg"><span>출품이 취소되었습니다.</span></div>
                </div>
              </div>
            </div>
          </article>
         </div>
      </li>
    `;
  });

  newRoot.insertAdjacentHTML('beforeend', recentLotListHtml.join('\n'));
  listContainer.appendChild(newRoot);
}
