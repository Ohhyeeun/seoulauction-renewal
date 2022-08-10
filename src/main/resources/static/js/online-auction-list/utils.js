/**
 * ----------------------------------------------------------------------------
 * Utils
 * ----------------------------------------------------------------------------
 */

/**
 * URL 에서 페이지 데이터 가져오기
 * @returns {{search: string, size: (number), page: (number), sort: string, tag: string, category: (string), saleNo: number}}
 */
function loadPageData() {
  const pathname = window.location.pathname;
  const pageParams = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });
  const pathSaleNo = pathname.replace(/^\/auction\/online\/(\d+).*/, '$1');

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

  return {
    saleNo,
    page,
    size,
    search,
    sort,
    tag,
    category,
    view,
  }
}

/**
 * URL 생성
 */
function makeUrl(data) {
  const { page, size, search, sort, tag, category, view } = data;
  const pathname = window.location.pathname;
  let params = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });

  console.log(data)

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

  return pathname + '?' +  window.Qs.stringify(params);
}

/**
 * 현재 언어모드 가져오기
 */
function getLanguage() {
  return document.documentElement.lang || 'ko';
}

/**
 * Number 포맷
 * @param {number} num
 * @param {number} precision - 자릿수
 * @example
 * const value1 = format(999_999.999)     // 999,999.999
 * const value2 = format(999_999, -3)     // 999,000
 * const value3 = format(999_999.999, 1)  // 999,000.9
 */
function format(num, precision) {
  if (precision) {
    const modifier = 10 ** precision;
    return new Intl.NumberFormat().format(Math.floor(num * modifier) / modifier);
  }

  return new Intl.NumberFormat().format(num);
}

/**
 * 시간 포맷
 */
function timerFormat(countDown) {
  const second = 1000;
  const minute = second * 60;
  const hour = minute * 60;
  const day = hour * 24;

  if (countDown < 0) {
    return null;
  }

  // calculate time left
  return [
    Math.floor(countDown / day), // days
    Math.floor((countDown % day) / hour), // hours
    Math.floor((countDown % hour) / minute), // minutes
    Math.floor((countDown % minute) / second), // seconds
  ];
}

/**
 * 자릿수 string으로 리턴
 */
function toFixTen(num) {
  return num >= 10 ? num.toString() : `0${num}`;
}

/**
 * Sleep
 */
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}