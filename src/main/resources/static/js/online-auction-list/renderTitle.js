/**
 * [Render] 경매 타이틀 섹션 렌더링
 * @param {Object} data
 */
async function renderSaleTitleSection(data) {
  const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  const root = document.querySelector('#contents');
  const lang = getLanguage();

  const saleTitle = JSON.parse(data.TITLE_JSON)[lang];
  const previewDate = [
    window.moment(data.PREV_FROM_DT).format('MM.DD(ddd)'),
    ' ~ ',
    window.moment(data.PREV_TO_DT).format('MM.DD(ddd)'),
  ];
  const toDate = window.moment(data.FROM_DT).format('MM.DD(ddd) HH:mm');

  const categories = [
    { type: 'category', title: '전체', value: 'ALL' },
    ...data.categoryList.map(item => {
      const title = lang === 'ko' ? item.CD_NM : item.CD_NM_EN;
      return { type: 'category', title, value: item.CD_ID };
    }),
    ...data.lotTagList.map(item => {
      return { type: 'tag', title: item.LOT_TAG, value: item.LOT_TAG };
    }),
  ].filter(Boolean);

  const categoriesHtml = categories.map(item => {
    if (item.type === 'category' && item.value === 'ALL') {
      const isAllTypeActive = (!urlData?.category && !urlData?.tag) ? 'active' : '';
      return `
        <li class="${isAllTypeActive}">
          <a href="#" data-category-type="${item.type}" data-category-value="${item.value}">
            <span>${item.title}</span>
          </a>
        </li>
      `;
    }

    const isActive = (item.value === urlData.category || item.value === urlData.tag) ? 'active' : '';
    return `
      <li class="${isActive}">
        <a href="#" data-category-type="${item.type}" data-category-value="${item.value}">
          <span>${item.title}</span>
        </a>
      </li>
    `;
  });

  root.querySelector('#data-sale-name').textContent = saleTitle;
  root.querySelector('#data-preview-date').textContent = previewDate.join('\n');
  root.querySelector('#data-to-dt').textContent = toDate;

  const categoryRoot = root.querySelector('#data-sale-category');
  if (categoryRoot.hasChildNodes()) {
    [...categoryRoot.children].forEach(item => {
      categoryRoot.removeChild(item);
    });
  }
  categoryRoot.insertAdjacentHTML('beforeend', categoriesHtml.join('\n'));

  // TODO: 안내사항 & 버튼 목록 세팅

  // Add Click Event
  root.querySelectorAll('.sticky-tab-menu .tab-list li a').forEach(item => {
    attachEvent(item, 'click', onClickCategory);
  });
}

/**
 * [Event] 카테고리 클릭 이벤트
 */
async function onClickCategory(e) {
  e.preventDefault();
  const target = e.currentTarget;
  const { categoryType, categoryValue } = target.dataset;
  const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  urlData.page = 1;

  if (categoryType === 'category' && categoryValue === 'ALL') {
    urlData.category = '';
    urlData.tag = '';
  } else if (categoryType === 'category') {
    urlData.category = categoryValue;
    urlData.tag = '';
  } else if (categoryType === 'tag') {
    urlData.category = '';
    urlData.tag = categoryValue;
  }

  window.location.href = makeListPageUrl(urlData);
}
