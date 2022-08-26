let prevData = {
  bidCount: 0,
  isEnd: false,
  expectFromPrice: null,
  expectToPrice: null,
  fromDate: null,
  toDate: null,
  growPrice: 0,
  lastPrice: 0,
  startPrice: 0,
  status: 'entry',
};

/**
 * Network API Polling Worker
 * 응찰 팝업에서 데이터 갱신
 */
addEventListener('message', async function (e) {
  const data = e.data;
  const { currency, saleNo, lotNo } = data;
  if (!saleNo || !lotNo) return;

  try {
    const resp = await fetch(`/api/auction/online/refresh/sales/${saleNo}/lots/${lotNo}`);

    /** @type {{ success: boolean; data: RefreshLotData }} */
    const result = await resp.json();
    const { data } = result;

    // TODO: 이전 Object 변경사항과 비교해서 변경된 사항만 교체
    const updatedData = compareObjects(prevData, makeDiffData(data, currency));
    if (Object.keys(updatedData).length > 0) {
      updatedData.remainTime = fromNow(data.TO_DT);
      postMessage(updatedData);
    }

    prevData = makeDiffData(data, currency);
  } catch (error) {
    console.log(error)
    postMessage(null);
  }
});

/**
 * Object 비교
 * @param {Object} oldValue
 * @param {Object} newValue
 * @return {Object | null}
 */
function compareObjects(oldValue, newValue) {
  if (typeof oldValue !== 'object' || typeof newValue !== 'object') {
    return null;
  }

  let updatedData = {}
  Object.keys(newValue).forEach(key => {
    if (typeof oldValue[key] === 'undefined') {
      updatedData[key] = newValue[key];
      return;
    }

    if (oldValue[key] !== newValue[key]) {
      updatedData[key] = newValue[key];
    }
  });

  return updatedData;
}

/**
 * Number 포맷
 * @param {number | string} num
 * @param {number?} precision - 자릿수
 * @return {string}
 * @example
 * const value1 = format(999_999.999)     // 999,999.999
 * const value2 = format(999_999, -3)     // 999,000
 * const value3 = format(999_999.999, 1)  // 999,000.9
 */
function formatNumber(num, precision) {
  if (typeof num === 'string') {
    num = Number(num);
  }

  if (precision) {
    const modifier = 10 ** precision;
    return new Intl.NumberFormat().format(Math.floor(num * modifier) / modifier);
  }

  return new Intl.NumberFormat().format(num);
}

/**
 * 두 시간차 계산
 * @param {Date | string | number} targetDate
 */
function fromNow(targetDate) {
  const secondMs = 1000;
  const minuteMs = secondMs * 60;
  const hourMs = minuteMs * 60;
  const dayMs = hourMs * 24;

  let targetDateMs;
  if (targetDate instanceof Date) {
    targetDateMs = targetDate.getTime();
  } else if (typeof targetDate === 'string') {
    targetDateMs = new Date(targetDate).getTime();
  } else {
    targetDateMs = targetDate;
  }

  const durationMs = targetDateMs - Date.now();

  // Calculate duration 2 times
  let durations = {
    isAfter: durationMs >= 0,
    day: Math.floor(durationMs / dayMs),
    hour: Math.floor((durationMs % dayMs) / hourMs),
    minute: Math.floor((durationMs % hourMs) / minuteMs),
    second: Math.floor((durationMs % minuteMs) / secondMs),
  };

  durations.format = '';
  if (durations.isAfter) {
    if (durations.day > 0) {
      durations.format += `${durations.day}일 `;
    }
    durations.format += [
      zerofillNumber(durations.hour),
      zerofillNumber(durations.minute),
      zerofillNumber(durations.second),
    ].join(':');
  }

  return durations;
}

/**
 * 비교에 필요한 데이터 생성
 * @param {RefreshLotData} data
 * @param {string} currency
 */
function makeDiffData(data, currency) {
  return {
    bidCount: data.BID_CNT,
    isEnd: data.END_YN === 'Y',
    expectFromPrice: JSON.parse(data.EXPE_PRICE_FROM_JSON)[currency],
    expectToPrice: JSON.parse(data.EXPE_PRICE_TO_JSON)[currency],
    growPrice: data.GROW_PRICE,
    lastPrice: data.LAST_PRICE,
    startPrice: data.START_PRICE,
    status: data.STAT_CD,
    startTime: data.FROM_DT,
    endTime: data.TO_DT,
  };
}

/**
 * Zerofill
 * @param {number} num
 * @param {number} length
 */
function zerofillNumber(num, length = 2) {
  return String(num).padStart(length, '0');
}