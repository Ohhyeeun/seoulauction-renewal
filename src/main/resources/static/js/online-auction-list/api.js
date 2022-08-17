// @ts-check

/**
 * ----------------------------------------------------------------------------
 * API 콜
 * ----------------------------------------------------------------------------
 */

/**
 * 랏 태그 타입
 * @typedef {object} LotTag
 * @property {string} LOT_TAG
 */

/**
 * 카테고리 타입
 * @typedef {object} LotCategory
 * @property {string} CD_ID
 * @property {string} CD_NM_EN
 * @property {string} CD_NM
 */

/**
 * 경매 정보 리턴타입
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
 * [API Call] 경매 정보
 * @return {Promise<Partial<SaleInfoReturn>>}
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
 * 랏 데이터
 * @typedef {object} LotData
 * @property {string} EXPE_PRICE_TO_JSON
 * @property {string} MATE_NM_CN
 * @property {string} LOT_IMG_PATH
 * @property {string} EXPE_PRICE_FROM_JSON
 * @property {string} FRAME_CD
 * @property {'Y' | 'N'} ZEROBASE_PRICE_YN
 * @property {'Y' | 'N'} GUARANTEE_YN
 * @property {string} TO_DT
 * @property {number} GROW_PRICE
 * @property {string} MATE_NM
 * @property {string} COND_RPT_JSON
 * @property {'Y' | 'N'} CLOSE_YN
 * @property {number} START_PRICE
 * @property {string} FROM_DT
 * @property {string} STAT_CD
 * @property {string} MATE_NM_EN
 * @property {string | null} EDITION
 * @property {'Y' | 'N'} EXPE_PRICE_INQ_YN
 * @property {string} ARTIST_NAME_JSON
 * @property {string} DB_NOW
 * @property {'Y' | 'N'} SOLD_YN
 * @property {number | null} LAST_PRICE
 * @property {string} DIE_YEAR
 * @property {string} BORN_YEAR
 * @property {string} SIGN_INFO_JSON
 * @property {string} LOT_SIZE_JSON
 * @property {'Y' | 'N'} END_YN
 * @property {number} BID_CNT
 * @property {'Y' | 'N'} WINE_YN
 * @property {string} STITLE_JSON
 * @property {string} TITLE_JSON
 * @property {number} LOT_NO
 * @property {string} LOT_IMG_NAME
 * @property {string} MAKE_YEAR_JSON
 * @property {'Y' | 'N'} IMG_DISP_YN
 */

/**
 * [API Call] 랏 목록
 * @param {Object} pageData
 * @param {boolean} useFavoriteLots
 * @return {{ totalCount: number; rows: Promise<Array<Partial<LotData>>> }}
 */
async function callApiLotList(pageData, useFavoriteLots = false) {
  const emptyValue = { totalCount: 0, rows: [] }

  if (typeof axios === 'undefined') return emptyValue;
  if (!pageData.saleNo) return emptyValue;

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

    if (params.cateCd === 'ALL') {
      delete params.cateCd;
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

    const { cnt, list } = data.data;

    // 관심 작품은 검색 안함
    if (!useFavoriteLots || cnt === 0) {
      return { totalCount: cnt, rows: list };
    }

    // 관심 작품도 같이 검색
    let includeList = [...list];
    const { data: favoriteResult } = await axios.get(`/api/auction/online/cust-inte-lot/sales/${pageData.saleNo}`);
    if (!favoriteResult.success) {
      throw new Error(favoriteResult.data);
    }

    const favoriteData = favoriteResult.data;
    if (favoriteData.length > 0) {
      favoriteData.forEach(item => {
        const { LOT_NO, INTE_LOT } = item;
        const lotIndex = includeList.findIndex(lot => lot.LOT_NO === LOT_NO && INTE_LOT === 'Y');
        if (lotIndex > -1) {
          includeList[lotIndex].isFavorite = true;
        }
      });
    }

    return { totalCount: cnt, rows: includeList };
  } catch (error) {
    console.log(error);
    return emptyValue;
  }
}
