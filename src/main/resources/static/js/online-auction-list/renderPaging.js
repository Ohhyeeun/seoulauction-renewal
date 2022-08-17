/**
 * [Render] 페이징 영역
 */
async function renderPaginationSection(currentPage = 1, totalCount = 0, perPage = 20, blockCount = 10) {
  const root = document.querySelector('.paging');
  const totalPage = Math.ceil(totalCount / perPage);
  const totalBlock = Math.ceil(totalPage / blockCount);
  const currentBlock = Math.ceil(currentPage / blockCount);
  const startPage = currentBlock * blockCount - (blockCount - 1);
  const endPage = (currentBlock * blockCount) > totalPage ? totalPage : currentBlock * blockCount;
  const prevBlock = (currentBlock - 1) * blockCount;
  const nextBlock = (currentBlock * blockCount) + 1;

  const handleClickPagination = async (e) => {
    e.preventDefault();
    const target = e.currentTarget;

    if (target.classList.contains('disabled')) return;

    let urlData = getDataFromUrl(`/auction/online/{saleNo}`);
    urlData.page = target.dataset.page || 1;

    // 동기적으로 처리(페이지 리로드)
    window.location.href = makeUrl(urlData);
  }

  const pageList = Array.from({ length: endPage - startPage + 1 }).map((_, index) => {
    return {
      title: startPage + index,
      page: startPage + index,
      active: startPage + index === currentPage,
    }
  });

  const pagingObject = [
    prevBlock > 0 ? { title: 'FIRST', page: 1 } : null, // first
    currentBlock > 1 ? { title: 'PREV', page: prevBlock } : null, // prev
    ...pageList,
    currentBlock <= totalBlock - 1 &&  { title: 'NEXT', page: nextBlock }, // Next
    currentPage !== totalPage ? { title: 'END', page: totalPage } : null // last
  ].filter(Boolean);

  const renderHtml = pagingObject.map(item => {
    if (item.title === 'FIRST') {
      return `<a href="#" class="prev_end icon-page_prevprev" data-page="1">FIRST</a>`;
    }
    if (item.title === 'PREV') {
      return `<a href="#" class="prev icon-page_prev" data-page="${item.page}">PREV</a>`;
    }
    if (item.title === 'NEXT') {
      return `<a href="#" class="next icon-page_next" data-page="${item.page}"><em>NEXT</em></a>`;
    }
    if (item.title === 'END') {
      return `<a href="#" class="next_end icon-page_nextnext" data-page="${item.page}">END</a>`;
    }

    if (item.active) {
      return `<a href="#" class="on"><strong>${item.page}</strong></a>`;
    }

    return `<a href="#" data-page="${item.page}"><em>${item.title}</em></a>`;
  }).join('\n');

  root.innerHTML = renderHtml;
  root.querySelectorAll('a').forEach((element, index) => {
    element.addEventListener('click', handleClickPagination);
  });
}
