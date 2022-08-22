/**
 * [API] 관심작품 목록
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
 * [API] 관심작품 등록
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
 * [API] 관심작품 삭제
 * @param {number | string} saleNo
 * @param {number | string} lotNo
 * @return {Promise<any>}
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

/**
 * [API] 응찰 목록 조회
 * @param {number | string} saleNo
 * @param {number | string} lotNo
 * @param {number} page
 * @param {number} size
 * @return {Promise<{ totalCount: number; rows: object[] }>}
 */
async function callApiBidList(saleNo, lotNo, page = 1, size = 20) {
  const emptyValue = { totalCount: 0, rows: [] }
  try {
    const { data } = await axios.get(`/api/auction/online/bid/sales/${saleNo}/lots/${lotNo}?page=${page}&size=${size}`);
    if (!data.success) return emptyValue;

    return {
      totalCount: data.data.cnt,
      rows: data.data.list,
    }
  } catch (error) {
    console.log(error);
    return emptyValue;
  }
}

/**
 * [Type] 랏 상세 데이터 구조
 * @typedef {Object} LotDetail
 * @property {number} SALE_NO
 * @property {number} LOT_NO
 * @property {number} ARTIST_NO
 * @property {string} ARTIST_NAME_EN_TXT
 * @property {string} ARTIST_NAME_JSON
 * @property {string} ARTIST_NAME_KO_TXT
 * @property {string} ARTWORK_NOS
 * @property {number} 1
 * @property {string | null} BORN_YEAR
 * @property {string | null} DIE_YEAR
 * @property {string | null} EDITION
 * @property {string} EXPE_PRICE_FROM_JSON
 * @property {string} EXPE_PRICE_TO_JSON
 * @property {'Y' | 'N'} EXPE_PRICE_INQ_YN
 * @property {string} COND_RPT_JSON
 * @property {string} CMMT_JSON
 * @property {string} FRAME_CD
 * @property {string} ETC_INFO_JSON
 * @property {string} EXHI_INFO_JSON
 * @property {string} LITE_INFO_JSON
 * @property {string} LOT_SIZE_JSON
 * @property {string} LOT_SIZE_STRING
 * @property {string} MAKE_YEAR_JSON
 * @property {string} MAKE_YEAR_KO
 * @property {string} MATE_NM
 * @property {string | null} MATE_NM_CN
 * @property {string} MATE_NM_EN
 * @property {string} NOTICE_DTL_JSON
 * @property {string} PROFILE_JSON
 * @property {string} PROV_INFO_JSON
 * @property {string} SALE_TH
 * @property {string} SIGN_INFO_JSON
 * @property {string} STAT_CD
 * @property {string} STITLE_JSON
 * @property {string} TITLE_EN_TXT
 * @property {string} TITLE_KO_TXT
 * @property {string} TITLE_JSON
 * @property {number | null} GROW_PRICE
 * @property {number | null} LAST_PRICE
 * @property {number | null} START_PRICE
 * @property {'Y' | 'N' | null} LIVE_BID_YN
 * @property {'Y' | 'N' | null} END_YN
 * @property {'Y' | 'N' | null} GUARANTEE_YN
 * @property {'Y' | 'N' | null} IMG_DISP_YN
 * @property {'Y' | 'N' | null} SOLD_YN
 * @property {'Y' | 'N' | null} WINE_YN
 * @property {'Y' | 'N' | null} ZEROBASE_PRICE_YN
 * @property {string | null} DB_NOW
 * @property {string | null} AUTO_BID_REQ_CLOSE_DT
 * @property {string | null} FROM_DT
 * @property {string | null} SALE_TO_DT
 * @property {string | null} TO_DT
 * @property {string | null} LIVE_BID_DT
 * @property {object[]} imageList
 */

/**
 * [API] 랏 상세 정보 조회
 * @param {number} saleNo
 * @param {number} lotNo
 * @return {Promise<LotDetail>}
 */
async function callApiGetLotInfo(saleNo, lotNo) {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/sales/${saleNo}/lots/${lotNo}`);
    const { success, data } = response;
    if (!success) throw new Error('Error');
    return data;
  } catch (error) {
    return null;
  }
}

/**
 * [API] 경매 번호, 랏 번호의 마지막 자동응찰 내역을 조회
 * @param saleNo
 * @param lotNo
 * @return {Promise<void>}
 */
async function callApiGetLastAutoBid(saleNo, lotNo) {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/last-auto-bid-req/sales/${saleNo}/lots/${lotNo}`);
    const { success, data } = response;
    if (!success) throw new Error('Error');
    return data || null;
  } catch (error) {
    return null;
  }
}

/**
 * [API] 자동응찰 등록
 * @param {number} saleNo
 * @param {number} lotNo
 * @param {number} custNo
 * @param {number | string} price
 * @return {Promise<null|*>}
 */
async function callApiRegisterAutoBid({ saleNo, lotNo, custNo, price }) {
  try {
    const { data: response } = await window.axios.post(`/api/auction/online/bid-auto/sales/${saleNo}/lots/${lotNo}`, {
      bid_price: Number(price),
      cust_no: custNo,
    });
    const { success } = response;
    return success;
  } catch (error) {
    return null;
  }
}

/**
 * [API] 1회 응찰
 * @param {number} saleNo
 * @param {number} lotNo
 * @param {number} custNo
 * @param {number | string} price
 * @return {Promise<boolean>}
 */
async function callApiBidOnce({ saleNo, lotNo, custNo, price }) {
  try {
    const { data: response } = await window.axios.post(`/api/auction/online/bid/sales/${saleNo}/lots/${lotNo}`, {
      bid_price: Number(price),
      cust_no: custNo,
    });
    const { success } = response;
    return success;
  } catch (error) {
    console.log(error);
    return false;
  }
}

/**
 * [Type] 내 로그인 정보
 * @typedef {Object} Me
 * @property {number} CUST_NO
 * @property {'Y' | 'N'} IS_EMPLOYEE
 * @property {'Y' | 'N'} IS_LOGIN
 * @property {'Y' | 'N'} IS_MEMBERSHIP
 */

/**
 * [API] 내 로그인 정보 조회
 * @return {Promise<Me>}
 */
async function callApiGetMe() {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/me`);
    const { success, data } = response;
    if (!success) throw new Error('Error');

    return data;
  } catch (error) {
    return null;
  }
}

