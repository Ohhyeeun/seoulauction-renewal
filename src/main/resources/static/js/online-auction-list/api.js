/**
 * ----------------------------------------------------------------------------
 * API 콜
 * ----------------------------------------------------------------------------
 */

/**
 * [API Call] 경매 정보
 */
async function callApiSaleInfo(saleNo) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;

  try {
    const { data } = await axios.get(`/api/auction/online/sales/${saleNo}`);
    if (!data.success) {
      throw new Error(data.data);
    }

    const result = data.data;
    return result;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 관심작품 목록
 */
async function callApiFavoriteLots(saleNo) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;

  try {
    const { data } = await axios.get(`/api/auction/online/cust-inte-lot/sales/${saleNo}`);
    console.log(data);
    if (!data.success) {
      throw new Error(data.data);
    }

    const result = data.data;
    return result;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 관심작품 등록
 */
async function callApiAddFavoriteLot(saleNo, lotNo) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;
  if (!lotNo) return;

  try {
    const { data } = await axios.post(`/api/auction/online/cust-inte-lot/sales/${saleNo}/lots/${lotNo}`, {});
    if (!data.success) {
      throw new Error(data.data);
    }

    const result = data.data;
    return result;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 관심작품 삭제
 */
async function callApiDeleteFavoriteLot(saleNo, lotNo) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;
  if (!lotNo) return;

  try {
    const { data } = await axios.delete(`/api/auction/online/cust-inte-lot/sales/${saleNo}/lots/${lotNo}`);
    if (!data.success) {
      throw new Error(data.data);
    }
    return data.data;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 랏 목록
 */
async function callApiLotList(saleNo, page = 1, size = 20) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;

  try {
    const { data } = await axios.get(`/api/auction/online/sales/${saleNo}/lots?page=${page}&size=${size}`);
    if (!data.success) {
      throw new Error(data.data);
    }

    const { cnt: totalCount, list: rows } = data.data;
    return { totalCount, rows };
  } catch (error) {
    console.log(error);
    return null;
  }
}