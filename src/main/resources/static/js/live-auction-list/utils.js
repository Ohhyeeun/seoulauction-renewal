/**
 * 페이지 데이터 리턴타입
 * @typedef {object} PageData
 * @property {number} saleNo
 * @property {number} size
 * @property {number} page
 * @property {string} view
 * @property {string} sort
 * @property {string} category
 * @property {string} tag
 * @property {string} search
 */

/**
 * URL 에서 페이지 데이터 가져오기
 * @return {Partial<PageData>}
 */

function loadPageData() {
  const pathname = window.location.pathname;
  const pageParams = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });
  const pathSaleNo = pathname.replace(/^\/auction\/live\/list\/(\d+).*/, '$1');
  const saleNo = pathSaleNo ? Number(pathSaleNo) : null;

  let page = pageParams.page ? Number(pageParams.page) : 1;
  let size = pageParams.size ? Number(pageParams.size) : 20;

  if (page < 1) page = 1;
  if (size > 100) size = 100;


  const search = pageParams.search || '';
  const sort = pageParams.sort || '';
  const tag = pageParams.tag || '';
  const category = pageParams.category || '';
  const view = pageParams.view || 'page'; // page | more

  let type = '';
  if(category === 'all'){
    type = '';
  }else if(category === '' && tag !== ''){
    type = 'tag';
  }else if(category !== '' && tag === ''){
    type = 'category';
  }

  return {
    saleNo,
    page,
    size,
    search,
    sort,
    type,
    tag,
    category,
    view,
  }
}

/**
 * URL 생성
 * @param {Partial<PageData>} data
 */
function makeUrl(data) {
  const { page, size, search, sort, tag, category, view } = data;
  const pathname = window.location.pathname;
  let params = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });

  // page
  if (page !== 1) {
    params.page = page;
  } else {
    delete params.page;
  }

  // size
  if (size !== 20) {
    params.size = size;
  } else {
    delete params.size;
  }

  // search
  if (search) {
    params.search = search;
  } else {
    delete params.search;
  }

  // sort
  if (sort) {
    params.sort = sort;
  } else {
    delete params.sort;
  }

  // tag
  if (tag) {
    params.tag = tag;
  } else {
    delete params.tag;
  }

  // category
  if (category) {
    params.category = category;
  } else {
    delete params.category;
  }

  // view
  if (view && view === 'more') {
    params.view = 'more';
  } else {
    delete params.view;
  }

  // Return
  if (Object.keys(params).length < 1) {
    return pathname;
  }

  return `${pathname}?${window.Qs.stringify(params)}`;
}

/**
 * Set State Callback Type
 * @callback SetHandler
 * @param {Object} target
 * @param {string | number | Symbol} key
 * @param {any} value
 * @param {any} receiver
 * @return {boolean}
 */

/**
 * Get State Callback Type
 * @callback GetHandler
 * @param {Object} target
 * @param {string | number | Symbol} key
 * @param {any} receiver
 * @return {any}
 */

/**
 * State(Proxy Object)
 * @param {object} initialState
 * @param {SetHandler} setHandler
 * @param {GetHandler} getHandler
 */
function createState(initialState = {}, setHandler, getHandler) {
  return new Proxy(initialState, {
    set(target, key, value, receiver) {
      setHandler && setHandler(target, key, value, receiver);
      return Reflect.set(target, key, value, receiver);
    },
    get(target, key, receiver) {
      getHandler && getHandler(target, key, receiver);
      return Reflect.get(target, key, receiver);
    }
  });
}

/**
 * 전역 CSS 렌더링
 */
function renderCss() {
  const styleString = `
  @-webkit-keyframes skeleton-gradient {
    0% {
      background-color: rgba(165, 165, 165, 0.1);
    }

    50% {
      background-color: rgba(165, 165, 165, 0.3);
    }

    100% {
      background-color: rgba(165, 165, 165, 0.1);
    }
  }

  @keyframes skeleton-gradient {
    0% {
      background-color: rgba(165, 165, 165, 0.1);
    }

    50% {
      background-color: rgba(165, 165, 165, 0.3);
    }

    100% {
      background-color: rgba(165, 165, 165, 0.1);
    }
  }

  .wrapper.online-auction .sticky-tab-menu {
    position: -webkit-sticky;
    position: sticky;
    top: 6.36rem;
    z-index: 4;
    margin-top: 1rem;
    padding: 0 3rem;
    background-color: #fff;
  }

  @media screen and (max-width: 1023px) {
    .wrapper.online-auction .sticky-tab-menu {
      padding: 0;
      top: 3.55rem;
    }
  }
  
  .view-more-area {
    display: flex;
    justify-content: center;
  }
  `;

  let style = document.createElement('style');
  style.textContent = styleString;
  document.head.appendChild(style);
}