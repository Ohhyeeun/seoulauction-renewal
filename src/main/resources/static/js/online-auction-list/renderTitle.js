/**
 * [Render] 경매 타이틀 섹션 렌더링
 * @param {Object} data
 */
async function renderSaleTitleSection(data) {
  // 타이틀 영역
  document.querySelector('[data-title]').innerHTML = `${JSON.parse(data.TITLE_JSON).ko}`;
  document.querySelector('[data-preview]').innerHTML = `
    ${window.moment(data.PREV_FROM_DT).format('MM.DD(ddd)')} ~
    ${window.moment(data.PREV_TO_DT).format('MM.DD(ddd)')}`.trim();
  document.querySelector('[data-to-date]').innerHTML = `${window.moment(data.FROM_DT).format('MM.DD(ddd) HH:mm')}`;

  // 카테고리
  let categories = [];
  data.categoryList.forEach(item => {
    categories.push({ type: 'category', title: item.CD_NM, value: item.CD_ID });
  });

  // 태그
  data.lotTagList.forEach(item => {
    categories.push({ type: 'tag', title: item.LOT_TAG, value: item.LOT_TAG });
  });

  const pageData = loadPageData();

  if (categories.length > 0) {
    let categoryHtml = [];

    const isAllTypeActive = pageData.category === '' && pageData.tag === '' ? 'active' : '';
    categoryHtml.push(`
      <li class="${isAllTypeActive}">
        <a href="#" data-category-value="ALL" data-category-type="category">
          <span>전체</span>
        </a>
      </li>
    `);

    categories.forEach(item => {
      const isActive = (item.value === pageData.category || item.value === pageData.tag) ? 'active' : '';
      categoryHtml.push(`
        <li class="${isActive}">
          <a href="#" data-category-value="${item.value}" data-category-type="${item.type}">
            <span>${item.title}</span>
          </a>
        </li>
      `);
    });

    const categoryElement = document.querySelector('[data-category]');
    categoryElement.innerHTML = categoryHtml.join('\n');

    const handleClickCategory = (e) => {
      e.preventDefault();
      const target = e.currentTarget;
      const { categoryType, categoryValue } = target.dataset;
      const pageData = loadPageData();

      pageData.page = 1;

      if (categoryType === 'category' && categoryValue === 'ALL') {
        pageData.category = '';
        pageData.tag = '';
      } else if (categoryType === 'category') {
        pageData.category = categoryValue;
        pageData.tag = '';
      } else if (categoryType === 'tag') {
        pageData.category = '';
        pageData.tag = categoryValue;
      }

      window.location.href = makeUrl(pageData);
    }

    [...categoryElement.querySelectorAll('li a')].forEach(item => {
      item.addEventListener('click', handleClickCategory);
    });
  }
}
