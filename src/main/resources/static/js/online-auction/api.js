// TODO: API 의 데이터를 파싱하는 객체 생성(현재가에 따른 변경 또는 날짜에 따른... 등등 조건식 추가)

/**
 * [API] 관심작품 목록
 * @return {Promise<Object[]>}
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
 * @param {number} saleNo 
 * @param {number} lotNo 
 * @return {Promise<any>}
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
 * [API] 랏 상세 정보 조회
 * @param {number} saleNo
 * @param {number | string} lotNo
 * @return {Promise<LotDetail>}
 */
async function callApiGetLotInfo(saleNo, lotNo) {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/sales/${saleNo}/lots/${Number(lotNo)}`);
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
 * [API] 자동응찰 중지
 * @param {number} saleNo
 * @param {number} lotNo
 * @param {number} custNo
 * @param {number} reqNo
 */
async function callApiCancelAutoBid({ saleNo, lotNo, custNo, reqNo }) {
  try {
    const { data: response } = await window.axios.delete(`/api/auction/online/bid-auto/sales/${saleNo}/lots/${lotNo}`, {
      data: {
        req_no: reqNo,
        cust_no: custNo,
      }
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

/**
 * 작가 정보 조회
 * @param {number} artistNo
 */
async function callApiGetArtistInfo(artistNo) {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/artists/${artistNo}`);
    const { success, data } = response;
    if (!success) throw new Error('Error');
    return data || null;
  } catch (error) {
    return null;
  }
}

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
 * [API Call] 랏 목록
 * @param {Object} pageData
 * @param {boolean} useFavoriteLots
 * @return {Promise<{ totalCount: number; rows: Partial<LotData[]> }>}
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

    if (pageData.lotList) {
      params.lotList = encodeURI(pageData.lotList.join(','));
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

/**
 * 온라인 번호 인증 여부 조회
 * @param {number} saleNo
 */
async function callApiCheckAuthBid(saleNo) {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/sale-cert/sales/${saleNo}`);
    const { success, data } = response;
    if (!success) throw new Error('Error');
    return /** @type {{ CNT: number; HP: string; }} */ data || null;
  } catch (error) {
    return null;
  }
}

/**
 * 내 담당자 조회
 */
async function callApiGetMyManager() {
  try {
    const { data: response } = await window.axios.get(`/api/auction/online/manager`);
    const { success, data } = response;
    if (!success) throw new Error('Error');
    return /** @type {{ EMP_NAME: string; EMP_NAME_EN: string; TEL: string; }} */ data || null;
  } catch (error) {
    return null;
  }
}
