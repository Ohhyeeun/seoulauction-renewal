/**
 * 랏 드롭다운 목록 (모바일)
 */
async function renderMobileDropdownLotList() {
  const lang = getLanguage();
  let urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  urlData.size = 500;
  const { rows } = await callApiLotList(urlData, false);
  // TODO: 전체 LOT 렌더링
  // TODO: 전체 LOT 렌더링 - 좋아요 표시
  // TODO: 전체 LOT 렌더링 - 현재 마감중 랏 표시
}

/**
 * 전체랏 보기 드롭다운
 */
async function addDropdownLotListEvent(target) {
  const listTarget = document.querySelector('.trp-dropdown_list-box');

  if (target.classList.contains('active')) {
    target.classList.remove('active');
    listTarget.style.display = 'none';
    document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]').value = '';
  } else {
    await renderDropdownLotList();

    target.classList.add('active');
    listTarget.style.display = 'block';

    // 랏 필터링
    attachEvent(document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]'), 'keyup', debounce(e => {
      const target = e.target;
      const value = e.target.value.replace(/[^\d]/g, '');
      target.value = value;

      if (!value) {
        listTarget.querySelectorAll('li[data-lot-no]').forEach(el => {
          el.style.display = 'block';
        });
        return;
      }

      listTarget.querySelectorAll('li[data-lot-no]').forEach(el => {
        if (el.dataset.lotNo === value) {
          el.style.display = 'block';
        } else {
          el.style.display = 'none';
        }
      });

    }, 300));
  }
}

/**
 * 랏 드롭다운 목록
 * TODO: 로딩 및 데이터 없음 처리
 */
async function renderDropdownLotList() {
  const lang = getLanguage();
  let urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  urlData.size = 500;

  const { rows } = await callApiLotList(urlData, false);
  if (rows.length > 0) {
    const rowsHtml = rows.map(item => {
      const title = JSON.parse(item.TITLE_JSON)[lang]; // 작품명

      let imagePath = '/images/bg/no_image.jpg';
      if ('LOT_IMG_PATH' in item && 'LOT_IMG_NAME' in item) {
        imagePath = `https://www.seoulauction.com/nas_img/${item.LOT_IMG_PATH}/${item.LOT_IMG_NAME}`;
      }

      return renderDropdownLotListItem({
        saleNo: urlData?.saleNo,
        lotNo: item.LOT_NO,
        imagePath,
        title,
      });
    });

    document.querySelector('.trp-dropdown_list-box .list-box').innerHTML = rowsHtml.join('\n');
  }
}

/**
 * 랏 드롭다운 아이템
 * @param {{
 *   saleNo: number | string;
 *   lotNo: number | string;
 *   imagePath: string;
 *   title: string;
 * }} data
 * @return {string}
 */
function renderDropdownLotListItem(data) {
  return `
    <li data-lot-no="${data.lotNo}">
      <a href="/auction/online/${data.saleNo}/${data.lotNo}">
        <div class="image-area">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${data.imagePath}" alt="${data.title}">
            </div>
          </figure>
        </div>
        <div class="typo-area">
          <span>LOT ${data.lotNo}</span>
        </div>
      </a>
    </li>
  `;
}