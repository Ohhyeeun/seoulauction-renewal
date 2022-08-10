/**
 * 더보기 레이아웃
 *
 * TODO: 더보기 이후에, 폴링을 위한 옵저버를 추가해줘야 함
 */
function renderViewMore() {
  let page = 2;
  let size = 20;
  const pageData = loadPageData();

  const viewMoreButton = document.querySelector('.view-more-area');

  const viewMoreButtonIo = new IntersectionObserver(entries => {
    entries.forEach(async entry => {
      if (entry.isIntersecting) {
        const pageData = loadPageData();
        pageData.page = page;
        pageData.size = size;
        const resultData = await callApiLotList(pageData);
        viewMoreButton.style.display = 'none';

        if (resultData.totalCount > page * size) {
          await renderLotListSection(resultData, page > 1);
          page += 1;
          viewMoreButton.style.display = 'block';
        }
      }
    });
  });

  if (pageData.view === 'page') {
    viewMoreButtonIo.unobserve(viewMoreButton);
  } else {
    viewMoreButtonIo.observe(viewMoreButton);
  }
}
