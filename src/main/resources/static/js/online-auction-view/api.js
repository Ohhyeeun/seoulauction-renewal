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
