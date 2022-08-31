/**
 * 최근 본 작품 가져오기
 */
async function getRecentLots(saleNo) {
  const list = window.localStorage.getItem(`recent-lot-${saleNo}`);
  if (!list) return [];
  return JSON.parse(list);
}

/**
 * 최근 본 작품 추가
 */
async function addRecentLots(saleNo, lotNo) {
  const selectLot = Number(lotNo);
  const recentLots = await getRecentLots(saleNo);

  let filtered = recentLots.filter((savedLot) => savedLot !== selectLot);
  filtered.unshift(selectLot);
  filtered = filtered.slice(0, 5);

  window.localStorage.setItem(`recent-lot-${saleNo}`, JSON.stringify(filtered));
}
