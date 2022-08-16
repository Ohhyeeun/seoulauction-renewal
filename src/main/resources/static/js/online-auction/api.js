/**
 * [API Call] 관심작품 목록
 * @method GET
 * @return {Promise<Array<Object>>}
 */
async function callApiGetFavoriteLots(saleNo) {
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
 *
 */
async function callApiAddFavoriteLot(saleNo, lotNo) {
  try {
    const { data } = await axios.post(`/api/auction/online/cust-inte-lot/sales/${saleNo}/lots/${lotNo}`, {});
    if (!data.success) return null;
    return data.data;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 관심작품 삭제
 */
async function callApiDeleteFavoriteLot(saleNo, lotNo) {
  try {
    const { data } = await axios.delete(`/api/auction/online/cust-inte-lot/sales/${saleNo}/lots/${lotNo}`);
    if (!data.success) return null;
    return data.data;
  } catch (error) {
    console.log(error);
    return null;
  }
}