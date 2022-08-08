/**
 * Network API Polling Wroker
 */
addEventListener('message', async function (e) {
  const data = e.data;
  if (data.indexes) {
    try {
      // TODO: API 콜
      // const resp = await fetch(`/api?ids=${data.indexes}`);
      // const result = (await resp.json()).result;
      //
      // const list = result.map(item => {
      //   return { id: item.id, value: `Lot ${item.id} Price: ${format(item.value)}` }
      // })
      // postMessage(list);
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
