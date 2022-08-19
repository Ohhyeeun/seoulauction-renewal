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
 * 자릿수 10자리로 고정
 * @param {number} num
 * @return {string}
 */
function toFixTen(num) {
  return num >= 10 ? num.toString() : `0${num}`;
}

/**
 * 현재가 기준의 호가
 * @param {number} price
 */
function getCurrentGrowPrice(price) {
  const growPriceTable = [
    { grow: 50_000, from: 0, to: 1_000_000 },
    { grow: 100_000, from: 1_000_000, to: 3_000_000 },
    { grow: 200_000, from: 3_000_000, to: 5_000_000 },
    { grow: 300_000, from: 5_000_000, to: 10_000_000 },
    { grow: 500_000, from: 10_000_000, to: 30_000_000 },
    { grow: 1_000_000, from: 30_000_000, to: 50_000_000 },
    { grow: 2_000_000, from: 50_000_000, to: 100_000_000 },
    { grow: 3_000_000, from: 100_000_000, to: 200_000_000 },
    { grow: 5_000_000, from: 200_000_000, to: Infinity },
  ];

  const currentGrowPrice = growPriceTable.reduce((acc, range) => {
    if (range.from <= price && price < range.to) {
      acc = range.grow;
    }
    return acc;
  }, 0);

  return currentGrowPrice;
}

/**
 * 절삭
 * @param {number} num
 * @param {number?} precision - 자릿수
 * @example
 * const value1 = floor(1_999_999.12345)      // 1,999,999
 * const value2 = floor(1_999_999.12345, 2)   // 1,999,999.12
 * const value3 = floor(1_999_999.12345, -3)  // 1,999,000
 */
function floor(num, precision = 0) {
  const modifier = 10 ** precision;
  return Math.floor(num * modifier) / modifier;
}

/**
 * 팝업 생성
 * - template#popup-id-template > #popup-id 사전에 존재해야 함
 * @param {string} id
 */
function createPopupWithTemplate(id) {
  // <template> 값 레이어 Dom 으로 추가
  if (!document.getElementById(id)) {
    const popupTemplate = document.getElementById(`${id}-template`);
    const clone = document.importNode(popupTemplate.content, true);
    document.body.appendChild(clone);
  }

  const popup = document.getElementById(id);
  popup.style.height = `${window.innerHeight}px`;
  popup.style.position = 'fixed';
  return popup;
}

/**
 * createPopupWithTemplate 으로 생성된 팝업 토글
 * @param {HTMLElement} popup
 * @param {boolean} isOpen
 */
function togglePopup(popup, isOpen) {
  const popupContentBg = popup.querySelector('.popup-dim');
  if (popupContentBg) {
    popupContentBg.style.backgroundColor = '#000';
  }

  if (isOpen) {
    if (popupContentBg) {
      popupContentBg.style.opacity = 0.7;
    }
    popup.style.display = 'block';
    document.body.style.overflow = 'hidden';
    document.body.style.touchAction = 'none';
  } else {
    if (popupContentBg) {
      popupContentBg.style.opacity = 0;
    }
    popup.style.display = 'none';
    document.body.style.overflow = 'visible';
    document.body.style.touchAction = 'auto';
  }
}

/**
 * Sleep
 * @param {number} ms
 * @return {Promise<any>}
 */
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * 현재 언어모드 가져오기
 * @return {'ko' | 'en' | 'zh'}
 */
function getLanguage() {
  return document.documentElement.lang || 'ko';
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
 * Zerofill
 * @param {number} num
 * @param {number} length
 */
function zerofillNumber(num, length = 2) {
  return String(num).padStart(length, '0');
}

/**
 * 문자열(숫자) 정렬
 * @return {Intl.Collator}
 */
function sortCollator() {
  return new Intl.Collator(undefined, { numeric: true, sensitivity: 'base' });
}

/**
 * URL 에서 페이지 데이터 가져오기
 * @requires {window.Qs}
 * @param {string} urlPath
 * @return {Partial<object>}
 */
function getDataFromUrl(urlPath = '') {
  const pathname = window.location.pathname;
  const pageParams = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });

  let pathData = {}
  if (urlPath) {
    const pathArray = pathname.split('/').filter(Boolean);
    const urlPathArray = urlPath.split('/').filter(Boolean);

    urlPathArray.forEach((item, index) => {
      if (item.match(/{(.+)}/g)) {
        const name = item.replace(/{(.+)}/g, '$1');
        if (pathArray[index]) {
          pathData[name] = pathArray[index];
        }
      }
    });
  }

  return {
    ...pathData,
    ...pageParams,
  }
}

/**
 * Dom 업데이트
 * innerHTML vs ✅ createElement
 * - innerHTML 은 DOM 을 직접적으로 수정 (Modify)하기 때문에, innerHTML 이 실행될 때마다
 *   모든 DOM 요소가 전부 재분석 (reparse)되고 재생성 (recreate)된다.
 * - innerHTML 로 추가된 요소는 자동으로 이벤트 등록이 되지 않는다.
 * - cross-site scripting(XSS) 방지
 * 결론: createElement, createDocumentFragment, appendChild 를 활용
 */
