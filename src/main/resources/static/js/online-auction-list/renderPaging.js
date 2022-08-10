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

  const html = pagingObject.map(item => {
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

  const handleUpdatePaging = async (e) => {
    e.preventDefault();
    const target = e.currentTarget;

    if (target.classList.contains('disabled')) return;

    let pageData = loadPageData();
    pageData.page = target.dataset.page || 1;
    window.location.href = makeUrl(pageData);

    // 페이징 변경 시,
    // if (target.dataset?.page) {
    //   const currentPage = target.dataset?.page ? Number(target.dataset?.page) : 1;
    //   const pageData = loadPageData();
    //   window.history.pushState({}, '', makeUrl(target.dataset.page));

    //   const lotListResult = await callApiLotList(pageData.saleNo, Number(target.dataset?.page), pageData.lotSize);
    //   renderLotListSection(lotListResult);
    //   renderPaginationSection(currentPage, lotListResult.totalCount, pageData.lotSize);
    //   window.scrollTo({ top: 0, behavior: 'smooth' })
    // }
  }

  root.innerHTML = html;
  root.querySelectorAll('a').forEach((element, index) => {
    element.addEventListener('click', handleUpdatePaging);
  });
}
