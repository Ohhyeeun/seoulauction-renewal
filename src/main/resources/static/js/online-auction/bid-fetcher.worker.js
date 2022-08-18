/**
 * @typedef {Object} RefreshLotData
 * @property {number} LOT_NO
 * @property {number} BID_CNT
 * @property {number} GROW_PRICE
 * @property {number} LAST_PRICE
 * @property {number} START_PRICE
 * @property {string} EXPE_PRICE_FROM_JSON "{\"KRW\":1500000}"
 * @property {string} EXPE_PRICE_TO_JSON "{\"KRW\":3000000}"
 * @property {string} STAT_CD "entry"
 * @property {'Y' | 'N'} END_YN
 * @property {string} DB_NOW "2022-08-18T09:23:36.000+00:00"
 * @property {string} FROM_DT "2022-05-04T07:00:00.000+00:00"
 * @property {string} TO_DT  "2022-08-31T05:01:00.000+00:00"
 */

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

  if (saleNo && lotNo) {
    try {
      const resp = await fetch(`/api/auction/online/refresh/sales/${saleNo}/lots/${lotNo}`);
      const result = await resp.json();
      /** @type {RefreshLotData} */
      const data = result.data;
      console.log(data)

      // TODO: 이전 Object 변경사항과 비교해서 변경된 사항만 교체
      postMessage(null);

      // const startTime = timerFormat(new Date(data.FROM_DT).getTime() - new Date().getTime()); // 남은 timestamp
      // const remainTime = timerFormat(new Date(data.TO_DT).getTime() - new Date().getTime()); // 남은 timestamp

      prevData = {
        bidCount: data.BID_CNT,
        isEnd: data.END_YN === 'Y',
        expectFromPrice: JSON.parse(data.EXPE_PRICE_FROM_JSON)[currency],
        expectToPrice: JSON.parse(data.EXPE_PRICE_TO_JSON)[currency],
        growPrice: data.GROW_PRICE,
        lastPrice: data.LAST_PRICE,
        startPrice: data.START_PRICE,
        status: data.STAT_CD,
      };
    } catch (error) {
      postMessage(null);
    }
  }
});

function format(num, precision = 0) {
  if (precision) {
    const modifier = 10 ** precision;
    return new Intl.NumberFormat().format(Math.floor(num * modifier) / modifier);
  }

  return new Intl.NumberFormat().format(num);
}

function timerFormat(countDown) {
  const second = 1000;
  const minute = second * 60;
  const hour = minute * 60;
  const day = hour * 24;

  if (countDown < 0) {
    return null;
  }

  // calculate time left
  return [
    Math.floor(countDown / day), // days
    Math.floor((countDown % day) / hour), // hours
    Math.floor((countDown % hour) / minute), // minutes
    Math.floor((countDown % minute) / second), // seconds
  ];
}

function remainTimeFormat(remainTime) {
  if (!remainTime) return '';
  if (remainTime.length !== 4) return '';

  return [
    remainTime[0] > 0 ? remainTime[0] + '일 ' : '',
    remainTime[1] > 0 ? toFixTen(remainTime[1]) + ':' : '',
    remainTime[2] > 0 ? toFixTen(remainTime[2]) + ':' : '',
    remainTime[3] > 0 ? toFixTen(remainTime[3]) : '',
  ].filter(Boolean).join('');
}

function toFixTen(num) {
  return num >= 10 ? num.toString() : `0${num}`;
}
