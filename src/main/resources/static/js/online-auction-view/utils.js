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
