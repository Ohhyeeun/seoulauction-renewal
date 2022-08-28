let prevData;

/**
 * Online List Network API Polling Worker
 * saleNo, lotList 를 받아서, 변경된 값만 메인 쓰레드에 전달
 */
addEventListener('message', async function (e) {
  const data = e.data;
  const { saleNo, lots } = data;
  if (!saleNo || !lots) return;

  try {
    const resp = await fetch(`/api/auction/online/refresh/sales/${saleNo}/lots?lotList=${lots}`);
    const result = await resp.json();
    const resultData = result.data;

    const currentData = resultData.map(item => {
      const { DB_NOW, ...rest } = item;
      return rest;
    });

    // 이전 Object 변경사항과 비교해서 변경된 사항이 있을 경우,
    // 새로운 항목들을 전부 전송
    const diffData = updatedDiff(prevData, currentData);
    if (!isEmpty(diffData)) {
      this.postMessage(currentData);
    }

    prevData = currentData;
  } catch (error) {
    console.log(error);
  }
});

/**
 * Diff 라이브러리
 */

// @see https://github.com/mattphillips/deep-object-diff/blob/main/src/updated.js
function updatedDiff(lhs, rhs) {
  if (lhs === rhs) return {};

  if (!isObject(lhs) || !isObject(rhs)) return rhs;

  const l = lhs;
  const r = rhs;

  if (isDate(l) || isDate(r)) {
    if (l.valueOf() == r.valueOf()) return {};
    return r;
  }

  return Object.keys(r).reduce((acc, key) => {
    if (hasOwnProperty(l, key)) {
      const difference = updatedDiff(l[key], r[key]);

      // If the difference is empty, and the lhs is an empty object or the rhs is not an empty object
      if (isEmptyObject(difference) && !isDate(difference) && (isEmptyObject(l[key]) || !isEmptyObject(r[key]))) return acc; // return no diff

      acc[key] = difference;
      return acc;
    }

    return acc;
  }, {});
};

function isDate(d) {
  return d instanceof Date;
}

function isEmpty (o) {
  return Object.keys(o).length === 0;
}

function isObject(o) {
  return o != null && typeof o === 'object';
}

function hasOwnProperty(o, ...args) {
  return Object.prototype.hasOwnProperty.call(o, ...args);
}

function isEmptyObject(o) {
  return isObject(o) && isEmpty(o);
}
