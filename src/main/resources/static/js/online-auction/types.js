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
 * [Type] 랏 태그 타입
 * @typedef {object} LotTag
 * @property {string} LOT_TAG
 */

/**
 * [Type] 카테고리 타입
 * @typedef {object} LotCategory
 * @property {string} CD_ID
 * @property {string} CD_NM_EN
 * @property {string} CD_NM
 */

/**
 * [Type] 경매 정보 리턴타입
 * @typedef {object} SaleInfoReturn
 * @property {string} PREV_TO_DT
 * @property {string} DB_NOW
 * @property {string} PREV_FROM_DT
 * @property {number} SALE_NO
 * @property {Array<object>} buttonList
 * @property {string} TO_DT
 * @property {string} SALE_TH
 * @property {string | null} LIVE_BID_YN
 * @property {'Y' | 'N'} CLOSE_YN
 * @property {number} WRITE_NO
 * @property {Array<LotTag>} lotTagList
 * @property {Array<LotCategory>} categoryList
 * @property {string} CURR_CD
 * @property {'Y' | 'N'} IS_OLD_SALE
 * @property {string} TITLE_JSON
 * @property {string} FROM_DT
 * @property {string} STAT_CD
 * @property {string} PREVIEW_JSON
 * @property {string | null} LIVE_BID_DT
 * @property {string} SALE_KIND_CD
 * @property {string} END_DT
 * @property {string} AUTO_BID_REQ_CLOSE_DT
 */

/**
 * [Type] 랏 데이터
 * @typedef {object} LotData
 * @property {'Y' | 'N'} ZEROBASE_PRICE_YN
 * @property {'Y' | 'N'} GUARANTEE_YN
 * @property {'Y' | 'N'} CLOSE_YN
 * @property {'Y' | 'N'} EXPE_PRICE_INQ_YN
 * @property {'Y' | 'N'} SOLD_YN
 * @property {'Y' | 'N'} END_YN
 * @property {'Y' | 'N'} WINE_YN
 * @property {'Y' | 'N'} IMG_DISP_YN
 * @property {string} EXPE_PRICE_TO_JSON
 * @property {string} MATE_NM_CN
 * @property {string} LOT_IMG_PATH
 * @property {string} EXPE_PRICE_FROM_JSON
 * @property {string} FRAME_CD
 * @property {string} TO_DT
 * @property {number} GROW_PRICE
 * @property {string} MATE_NM
 * @property {string} COND_RPT_JSON
 * @property {number} START_PRICE
 * @property {string} FROM_DT
 * @property {string} STAT_CD
 * @property {string} MATE_NM_EN
 * @property {string | null} EDITION
 * @property {string} ARTIST_NAME_JSON
 * @property {string} DB_NOW
 * @property {number | null} LAST_PRICE
 * @property {string} DIE_YEAR
 * @property {string} BORN_YEAR
 * @property {string} SIGN_INFO_JSON
 * @property {string} LOT_SIZE_JSON
 * @property {number} BID_CNT
 * @property {string} STITLE_JSON
 * @property {string} TITLE_JSON
 * @property {number} LOT_NO
 * @property {string} LOT_IMG_NAME
 * @property {string} MAKE_YEAR_JSON
 */

/**
 * [Type] 내 로그인 정보
 * @typedef {Object} Me
 * @property {number} CUST_NO
 * @property {'Y' | 'N'} IS_EMPLOYEE
 * @property {'Y' | 'N'} IS_LOGIN
 * @property {'Y' | 'N'} IS_MEMBERSHIP
 */

/**
 * [Type] Set State Callback Type
 * @callback SetHandler
 * @param {Object} target
 * @param {string | number | Symbol} key
 * @param {any} value
 * @param {any} receiver
 * @return {boolean}
 */

/**
 * [Type] Get State Callback Type
 * @callback GetHandler
 * @param {Object} target
 * @param {string | number | Symbol} key
 * @param {any} receiver
 * @return {any}
 */
