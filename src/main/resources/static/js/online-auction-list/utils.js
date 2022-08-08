/**
 * ----------------------------------------------------------------------------
 * Utils
 * ----------------------------------------------------------------------------
 */

/**
 * URL 생성
 */
function makeUrl(page, sort, search) {
  const pathname = window.location.pathname;
  let params = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });

  if (page !== 1) {
    params.page = page;
  } else {
    delete params.page;
  }

  if (sort) {
    params.sort = sort;
  } else {
    delete params.sort;
  }

  if (search) {
    params.search = search;
  } else {
    delete params.search;
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