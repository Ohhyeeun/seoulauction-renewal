/**
 * [Render] 경매 타이틀 섹션 렌더링
 * @param {Object} data
 */
async function renderSaleTitleSection(data) {
  const urlData = getDataFromUrl(`/auction/online/{saleNo}`);
  const root = document.querySelector('#contents');
  const lang = getLanguage();

  const handleClickCategory = (e) => {
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

    window.location.href = makeUrl(urlData);
  }

  let state = createState({}, (target, key, value, receiver) => {
    switch (key) {
      case 'title':
        root.querySelector('.page_title-section .page_title span.th1').innerHTML = value;
        break;

      case 'categories':
        const categoriesHtml = value.map(item => {
          if (item.type === 'category' && item.value === 'ALL') {
            const isAllTypeActive = urlData.category === '' && urlData.tag === '' ? 'active' : '';
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
        })
        root.querySelector('.sticky-tab-menu .tab-list').innerHTML = categoriesHtml.join('\n');
        root.querySelectorAll('.sticky-tab-menu .tab-list li a').forEach(item => {
          item.addEventListener('click', handleClickCategory);
        });
        break;

      case 'preview':
        root.querySelector('.preview-date').innerHTML = value;
        break;

      case 'toDate':
        root.querySelector('.to-date').innerHTML = value;
        break;
    }
  });

  // Set State
  state.title = JSON.parse(data.TITLE_JSON)[lang];
  state.categories = [
    { type: 'category', title: '전체', value: 'ALL' },
    ...data.categoryList.map(item => {
      const title = lang === 'ko' ? item.CD_NM : item.CD_NM_EN;
      return { type: 'category', title, value: item.CD_ID };
    }),
    ...data.lotTagList.map(item => {
      return { type: 'tag', title: item.LOT_TAG, value: item.LOT_TAG };
    }),
  ].filter(Boolean);
  state.preview = [
    window.moment(data.PREV_FROM_DT).format('MM.DD(ddd)'),
    ' ~ ',
    window.moment(data.PREV_TO_DT).format('MM.DD(ddd)'),
  ].join('\n');
  state.toDate = window.moment(data.FROM_DT).format('MM.DD(ddd) HH:mm');
}
