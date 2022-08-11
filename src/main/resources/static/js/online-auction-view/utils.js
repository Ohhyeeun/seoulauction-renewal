/**
 * 페이지 데이터 리턴타입
 * @typedef {object} PageData
 * @property {number} saleNo
 * @property {number} lotNo
 */

/**
 * URL 에서 페이지 데이터 가져오기
 * @return {Partial<PageData> | null}
 */
function loadPageData() {
  const pathname = window.location.pathname;
  const pathInfoString = pathname.replace(/^\/auction\/online\/(\d+)\/(\d+).*/, '$1|$2');
  const pathInfo = pathInfoString.split('|');
  if (pathInfo.length !== 2) return null;

  const saleNo = pathInfo[0] ? Number(pathInfo[0]) : null;
  const lotNo = pathInfo[1] ? Number(pathInfo[1]) : null;

  if (!saleNo || !lotNo) return null;
  return { saleNo, lotNo };
}

/**
 * Number 포맷
 * @param {number | string} num
 * @param {number?} precision - 자릿수
 * @return {string}
 * @example
 * const value1 = format(999_999.999)     // 999,999.999
 * const value2 = format(999_999, -3)     // 999,000
 * const value3 = format(999_999.999, 1)  // 999,000.9
 */
function formatNumber(num, precision) {
  if (typeof num === 'string') {
    num = Number(num);
  }

  if (precision) {
    const modifier = 10 ** precision;
    return new Intl.NumberFormat().format(Math.floor(num * modifier) / modifier);
  }

  return new Intl.NumberFormat().format(num);
}

/**
 * 현재가 기준의 호가
 * @param {number} price
 */
function getCurrentGrowPrice(price) {
  const growPriceTable = [
    { grow: 50_000, from: 0, to: 1_000_000 },
    { grow: 100_000, from: 1_000_000, to: 3_000_000 },
    { grow: 200_000, from: 3_000_000, to: 5_000_000 },
    { grow: 300_000, from: 5_000_000, to: 10_000_000 },
    { grow: 500_000, from: 10_000_000, to: 30_000_000 },
    { grow: 1_000_000, from: 30_000_000, to: 50_000_000 },
    { grow: 2_000_000, from: 50_000_000, to: 100_000_000 },
    { grow: 3_000_000, from: 100_000_000, to: 200_000_000 },
    { grow: 5_000_000, from: 200_000_000, to: Infinity },
  ];

  const currentGrowPrice = growPriceTable.reduce((acc, range) => {
    if (range.from <= price && price < range.to) {
      acc = range.grow;
    }
    return acc;
  }, 0);

  return currentGrowPrice;
}

/**
 * 절삭
 * @param {number} num
 * @param {number?} precision - 자릿수
 * @example
 * const value1 = floor(1_999_999.12345)      // 1,999,999
 * const value2 = floor(1_999_999.12345, 2)   // 1,999,999.12
 * const value3 = floor(1_999_999.12345, -3)  // 1,999,000
 */
function floor(num, precision = 0) {
  const modifier = 10 ** precision;
  return Math.floor(num * modifier) / modifier;
}
