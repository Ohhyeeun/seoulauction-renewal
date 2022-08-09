// @ts-check

/**
 * ----------------------------------------------------------------------------
 * API 콜
 * ----------------------------------------------------------------------------
 */

/**
 * [API Call] 경매 정보
 * @return {Promise<Object>}
 */
async function callApiSaleInfo(saleNo) {
  if (typeof axios === 'undefined') return null;
  if (!saleNo) return null;

  try {
    const { data } = await axios.get(`/api/auction/online/sales/${saleNo}`);
    if (!data.success) return null;

    return data.data;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 관심작품 목록
 * @return {Promise<Array<Object>>}
 */
async function callApiFavoriteLots(saleNo) {
  if (typeof axios === 'undefined') return [];
  if (!saleNo) return [];

  try {
    const { data } = await axios.get(`/api/auction/online/cust-inte-lot/sales/${saleNo}`);
    if (!data.success) return [];
    return data.data;
  } catch (error) {
    console.log(error);
    return [];
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
async function callApiLotList(pageData) {
  if (typeof axios === 'undefined') return;
  if (!pageData.saleNo) return;

  try {
    let params = {
      page: pageData.page || 1,
      size: pageData.size || 20,
      sortBy: pageData.sort || 'LOTAS',
    }

    if (pageData.search) {
      params.searchText = pageData.search;
    }

    if (pageData.category) {
      params.cateCd = pageData.category;
    }

    if (pageData.tag) {
      params.lotTag = encodeURI(pageData.tag);
      delete params.cateCd;
    }

    const paramString = window.Qs.stringify(params);
    const url = `/api/auction/online/sales/${pageData.saleNo}/lots?${paramString}`;
    const { data } = await axios.get(url);
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