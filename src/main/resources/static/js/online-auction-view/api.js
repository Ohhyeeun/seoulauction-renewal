/**
 * 랏 상세 데이터 구조
 * @typedef {Object} LotDetail
 * @property {number} SALE_NO
 * @property {number} LOT_NO
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
 */

/**
 * 랏 상세 정보 조회
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