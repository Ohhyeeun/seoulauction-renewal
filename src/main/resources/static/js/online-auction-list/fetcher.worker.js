/**
 * Network API Polling Worker
 */
addEventListener('message', async function (e) {
  const data = e.data;
  if (data.saleNo && data.lots) {
    try {
      const resp = await fetch(`/api/auction/online/refresh/sales/${data.saleNo}/lots?lotList=${data.lots}`);
      const result = await resp.json();

      if (!result.success) {
        postMessage([]);
        return;
      }

      /** @type {Array<Object>} */
      const resultData = result.data;

      if (resultData.length > 0) {
        const currency = 'KRW';
        const resultDataString = resultData.map(item => {
          const lotNo = item.LOT_NO;
          const expectPriceFrom = JSON.parse(item.EXPE_PRICE_FROM_JSON)[currency];
          const expectPriceTo = JSON.parse(item.EXPE_PRICE_TO_JSON)[currency];
          const isNotExpectPrice = !expectPriceFrom && !expectPriceTo;

          const remainTime = timerFormat(new Date(item?.TO_DT).getTime() - new Date().getTime()); // 남은 timestamp
          let remainTimeFormat = '';
          if (remainTime) {
            remainTimeFormat = [
              remainTime[0] > 0 ? remainTime[0] + '일 ' : '',
              remainTime[1] > 0 ? `${toFixTen(remainTime[1])}:` : '00:',
              remainTime[2] > 0 ? `${toFixTen(remainTime[2])}:` : '00:',
              remainTime[3] > 0 ? toFixTen(remainTime[3]) : '00',
            ].filter(Boolean).join('');
          }

          const startPrice = item.START_PRICE || 0;
          const currentPrice = item.LAST_PRICE >= 0 && item.END_YN === 'N' ? format(item.LAST_PRICE) : '-';
          const isAuctioned = item.LAST_PRICE >= 0 && item.BID_CNT > 0 && (item.END_YN == 'Y' || item.CLOSE_YN == 'Y');

          const hammerPrice = data.LAST_PRICE; // 낙찰가
          let hammerPriceField = '';
          if (isAuctioned) {
            hammerPriceField = `<strong>${currency} ${format(hammerPrice)}</strong><em>(응찰${format(bidCount)})</em>`;
          }

          return {
            lotNo,
            expectPrice: `
              <dt>추정가</dt>
              <dd>${isNotExpectPrice ? '별도문의' : currency + ' ' + format(expectPriceFrom)}</dd>
              <dd>${isNotExpectPrice ? '' : '~ ' + format(expectPriceTo)}</dd>
            `,
            startPrice: `
              <dt>시작가</dt>
              <dd>${currency} ${startPrice > 0 ? format(startPrice) : '-'}</dd>
            `,
            currentPrice: `
              <dt>현재가</dt>
              <dd>${currency} ${currentPrice}</dd>
            `,
            hammerPrice: `
              <dt>낙찰가</dt>
              <dd>${hammerPriceField}</dd>
            `,
            remainTimeValues: `
              <span>${remainTimeFormat}</span>
            `,
          }
        });
        postMessage(resultDataString);
        return;
      }

      postMessage([]);
    } catch (error) {
      postMessage([]);
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