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
 * @param {number} precision - 자릿수
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
 * 중복으로 등록되지 않는 이벤트
 * @param {Element | string} element
 * @param {string} eventName
 * @param callback
 */
function attachEvent(element, eventName, callback) {
  let target;
  if (typeof element === 'string') {
    target = document.querySelector(element);
  } else {
    target = element;
  }

  if (target && eventName && target.getAttribute('listener') !== 'true') {
    target.setAttribute('listener', 'true');
    target.addEventListener(eventName, callback);
  }
}

/**
 * 랜덤 문자열 생성
 * @param {number} length - 결과 문자열 길이
 * @param {string} words - 포함되는 문자열
 * @return {string}
 */
function randomString(length = 8, words = 'abcdefghijklmnopqrstuvwxyz0123456789') {
  return Array.from({ length })
    .map((_) => {
      return words.charAt(~~(Math.random() * words.length));
    })
    .join('');
}

/**
 * Thread.sleep for Promise
 * @param {number} ms
 * @return {Promise<any>}
 */
function sleep(ms = 1000) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * URL 생성
 * @param {Partial<PageData>} data
 */
 function makeListPageUrl(data) {
  const { page, size, search, sort, tag, category, view } = data;
  const pathname = window.location.pathname;
  let params = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });

  // page
  if (page !== 1) {
    params.page = page;
  } else {
    delete params.page;
  }

  // size
  if (size !== 20) {
    params.size = size;
  } else {
    delete params.size;
  }

  // search
  if (search) {
    params.search = search;
  } else {
    delete params.search;
  }

  // sort
  if (sort) {
    params.sort = sort;
  } else {
    delete params.sort;
  }

  // tag
  if (tag) {
    params.tag = tag;
  } else {
    delete params.tag;
  }

  // category
  if (category) {
    params.category = category;
  } else {
    delete params.category;
  }

  // view
  if (view && view === 'more') {
    params.view = 'more';
  } else {
    delete params.view;
  }

  // Return
  if (Object.keys(params).length < 1) {
    return pathname;
  }

  return `${pathname}?${window.Qs.stringify(params)}`;
}

/**
 * State(Proxy Object)
 * @param {object} initialState
 * @param {SetHandler} setHandler
 * @param {GetHandler} getHandler
 */
function createState(initialState = {}, setHandler, getHandler) {
  return new Proxy(initialState, {
    set(target, key, value, receiver) {
      setHandler && setHandler(target, key, value, receiver);
      return Reflect.set(target, key, value, receiver);
    },
    get(target, key, receiver) {
      getHandler && getHandler(target, key, receiver);
      return Reflect.get(target, key, receiver);
    }
  });
}

/**
 * 로그인 여부
 * @returns {boolean}
 */
function isLogin() {
  return Boolean(window.sessionStorage.getItem('is_login')) || false; // 로그인 유무
}

/**
 * 통화
 */
let currency = 'KRW';
function getCurrency() {
  return currency;
}
function setCurrency(value) {
  currency = value;
}

/**
 * debounce
 * @param callback
 * @param limit
 * @return {(function(...[*]): void)|*}
 */
function debounce(callback, limit = 100) {
  let timeout
  return function(...args) {
    clearTimeout(timeout)
    timeout = setTimeout(() => {
      callback.apply(this, args)
    }, limit)
  }
}

/**
 * throttle
 * @param callback
 * @param limit
 * @return {(function(): void)|*}
 */
function throttle(callback, limit = 100) {
  let waiting = false
  return function() {
    if(!waiting) {
      callback.apply(this, arguments)
      waiting = true
      setTimeout(() => {
        waiting = false
      }, limit)
    }
  }
}

/**
 * <template> 태그로 부터 팝업을 생성하는 함수
 * @param {{
 *   selector: string;
 *   useBackdrop?: boolean;
 *   useBodyFix?: boolean;
 *   useDelay?: number;
 *   onCloseSelector?: string | null;
 *   beforeClose?: (popup: Element) => void;
 * }} params
 */
async function createModal({
  selector,
  useBackdrop = true,
  useBodyFix = true,
  useDelay = 150,
  onCloseSelector = null,
  beforeClose,
}) {
  const popupTemplate = document.querySelector(selector);
  if (!popupTemplate) return null;

  const popupIdPrefix = 'custom-template-modal';
  const popupId = `${popupIdPrefix}-${randomString(6)}`;
  const templatePopupContent = /** @type {HTMLTemplateElement} */ document.importNode(popupTemplate.content, true);

  let popupContent;
  let popupStyle;

  // 배경 사용
  if (useBackdrop) {
    const wrapperDiv = document.createElement('div');
    wrapperDiv.classList.add(popupId);
    wrapperDiv.appendChild(templatePopupContent);

    popupContent = wrapperDiv;

    const styleTag = document.createElement('style');
    styleTag.textContent = `
      .${popupId} {
        background: rgba(0, 0, 0, 0.7);
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0;
        transition: all 120ms;
        
        display: none;
        opacity: 0;
      }
      .${popupId}.open {
        display: block;
        opacity: 1;
        z-index: 5;
      }
    `;
    popupStyle = styleTag;
  } else {
    popupContent = templatePopupContent;
    popupStyle = null;
  }

  const root = popupContent;

  const init = async () => {
    popupStyle && await document.head.appendChild(popupStyle);
    await document.body.appendChild(popupContent);
  }

  const destroy = async () => {
    await document.body.removeChild(popupContent);
    popupStyle && await document.head.removeChild(popupStyle);
  }

  /**
   * @param {(root: HTMLElement) => void} onOpen
   */
  const open = async (onOpen) => {
    if (useBodyFix) {
      document.body.style.overflow = 'hidden';
      document.body.style.touchAction = 'none';
    }

    if (useDelay) await sleep(useDelay);
    root.classList.add('open');

    if (onOpen) await onOpen(root);
  }

  /**
   * @param {((root: HTMLElement) => void) | null} onClose
   */
  const close = async (onClose) => {
    if (beforeClose) await beforeClose(root);
    if (onClose) await onClose(root);
    if (useDelay) await sleep(useDelay);

    if (useBodyFix) {
      // 열려있는 팝업이 있으면, Skip
      const openedPopups = document.querySelectorAll(`div[class^="${popupIdPrefix}-"].open`);
      if (openedPopups.length < 2) {
        document.body.style.overflow = 'auto';
        document.body.style.touchAction = 'auto';
      }
    }

    root.classList.remove('open');
    await destroy();
  }

  // 백그라운드 클릭 시, 팝업을 닫기
  popupContent.addEventListener('click', async e => {
    e.preventDefault();
    if (!onCloseSelector) return;

    const target = /** @type {HTMLElement} */ e.target;
    const isClicked = target.closest(onCloseSelector);

    if (!isClicked) {
      await close(null);
    }
  });

  return { root, init, destroy, open, close };
}
