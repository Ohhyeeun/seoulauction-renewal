<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/ko/header.jsp" />
<body>
<style>

@-webkit-keyframes skeleton-gradient {
  0% {
    background-color: rgba(165, 165, 165, 0.1);
  }

  50% {
    background-color: rgba(165, 165, 165, 0.3);
  }

  100% {
    background-color: rgba(165, 165, 165, 0.1);
  }
}

@keyframes skeleton-gradient {
  0% {
    background-color: rgba(165, 165, 165, 0.1);
  }

  50% {
    background-color: rgba(165, 165, 165, 0.3);
  }

  100% {
    background-color: rgba(165, 165, 165, 0.1);
  }
}

.wrapper.online-auction .sticky-tab-menu {
  position: -webkit-sticky;
  position: sticky;
  top: 6.36rem;
  z-index: 4;
  margin-top: 1rem;
  padding: 0 3rem;
  background-color: #fff;
}

@media screen and (max-width: 1023px) {
  .wrapper.online-auction .sticky-tab-menu {
    padding: 0;
    top: 3.55rem;
  }
}
</style>

<div class="wrapper online-auction">
  <div class="sub-wrap pageclass type-width_list">
    <jsp:include page="../../include/ko/nav.jsp" />

    <!-- container -->
    <div id="container">
      <div id="contents" class="contents">
        <!-- page title (ing, view)   -->
        <section class="page_title-section list_page-section">
          <div class="section-inner full_size">
            <div class="padding-inner">
              <article class="auction_head_info-article">
                <div class="center-box ing">
                  <h2 class="page_title">
                    <span class="th1" data-title>2월 e BID 프리미엄 온라인 경매</span>
                  </h2>
                  <ul class="event_day-list">
                    <li>
                      <span class="colorB2">프리뷰</span>
                      <span class="" data-preview> : 01.28(금) - 02.08(화)</span>
                    </li>
                    <li>
                      <span class="colorB2">경매일</span>
                      <span class="" data-to-date> : 02.09(화) 14:00</span>
                    </li>
                  </ul>
                  <div class="btn_set">
                    <a class="btn btn_white" href="#" role="button">
                      <span>안내사항</span>
                    </a>
                  </div>
                </div>
              </article>
              <article class="proceeding-article">
                <a href="#" title="진행중 Lot 10|김선우">
                  <div class="article-inner">
                    <div class="column ing">
                      <strong class="note_msg">진행중 Lot</strong>
                      <ul class="ac-list">
                        <li>
                          <span class="count">10</span>
                        </li>
                        <li>
                          <span class="name">김선우</span>
                        </li>
                      </ul>
                    </div>
                    <i class="icon-link_arrow"></i>
                  </div>
                </a>
              </article>
            </div>
          </div>
        </section>

        <section class="sticky-tab-menu">
          <div class="tab-wrap js-tabmenu-sticky">
            <div class="tab-area type-left">
              <ul class="tab-list js-list_tab" data-category>
                <li class="active">
                  <a href="#tab-cont-1">
                    <span>전체</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </section>

        <section class="basis-section tab-auction-section">
          <div class="section-inner">
            <!-- 텝메뉴 -->
            <div class="content-panel type_panel-search_tab">
              <div class="panel-body">
                <article class="search_tab-article">
                  <div class="article-body">
                    <div class="col_item mb-col1">
                      <!-- [0617]카운트/LOT셀렉트박스 분리 -->
                      <div class="count tb1">
                        <span>ALL <em data-total-count>0</em>
                        </span>
                      </div>
                      <!-- [0714]LOT셀렉트박스 모바일 분리/변경 -->
                      <div class="select-box only-pc">
                        <div class="trp-dropdown-area h42-line">
                          <button class="js-dropdown-btn">
                            <span>LOT</span>
                            <i class="form-select_arrow_md"></i>
                          </button>
                          <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                            <div class="search-box">
                              <input type="search" placeholder="LOT 번호 입력" id="" class="">
                              <i class="form-search_md"></i>
                            </div>
                            <div class="list-box scroll-type">
                              <ul>
                                <li>
                                  <a href="#">
                                    <div class="image-area">
                                      <figure class="img-ratio">
                                        <div class="img-align">
                                          <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                        </div>
                                      </figure>
                                    </div>
                                    <div class="typo-area">
                                      <span>LOT</span>
                                    </div>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <div class="image-area">
                                      <figure class="img-ratio">
                                        <div class="img-align">
                                          <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                        </div>
                                      </figure>
                                    </div>
                                    <div class="typo-area">
                                      <span>LOT1</span>
                                    </div>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <div class="image-area">
                                      <figure class="img-ratio">
                                        <div class="img-align">
                                          <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                        </div>
                                      </figure>
                                    </div>
                                    <div class="typo-area">
                                      <span>LOT2</span>
                                    </div>
                                  </a>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="select-box js-lotbox-slct only-mb">
                        <button class="js-lotbox-btn">
                          <span>LOT</span>
                          <i class="slct-arrow"></i>
                        </button>
                      </div>
                      <!-- //[0714]LOT셀렉트박스 모바일 분리/변경 -->
                    </div>

                    <div class="col_item mb-col2">
                      <!-- [0617]검색창위치 변경 -->
                      <div class="search-box">
                        <input type="search" placeholder="작가/작품명" id="search-input" class="h42">
                        <i class="form-search_md"></i>
                      </div>
                      <!-- //[0617]검색창위치 변경 -->
                      <div class="select-box">
                        <select class="select2Basic42" id="sort-order">
                          <option value="LOTAS">LOT 번호순</option>
                          <option value="ESTDE">추정가 높은 순</option>
                          <option value="ESTAS">추정가 낮은 순</option>
                          <option value="BIPDE">응찰가 높은 순</option>
                          <option value="BIPAS">응찰가 낮은 순</option>
                          <option value="BICDE">응찰수 높은 순</option>
                          <option value="BICAS">응찰수 낮은 순</option>
                        </select>
                      </div>
                      <div class="select-box">
                        <select class="select2Basic42 js-select_page" id="view-type">
                          <option value="page">페이지 방식</option>
                          <option value="more">더보기 방식</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </article>
              </div>
            </div>
          </div>
        </section>

        <section class="basis-section last-section auction_list-section">
          <div class="section-inner">
            <div class="content-panel type_panel-product_list">
              <div class="panel-body">
                <ul class="product-list"></ul>
              </div>

              <div class="panel-footer">
                <div class="paging-area">
                  <div class="paging"></div>
                </div>
                <button class="btn btn_gray_line" type="button">
                  <span>더보기</span>
                </button>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
    <!-- container //-->

    <jsp:include page="../../include/ko/footer.jsp" />

    <!-- stykey -->
    <div class="scroll_top-box">
      <div class="box-inner">
        <a href="#" class="btn-scroll_top js-scroll_top">
          <i class="icon-scroll_top"></i>
        </a>
      </div>
    </div>
    <!-- stykey -->
  </div>
</div>

<!-- 전체 LOT 보기 팝업 -->
<aside class="allview_fixed-wrap lot">
  <div class="popup-dim"></div>
  <div class="fixed-panel js-modal">
    <div class="panel-header">
      <button class="js-fixed_total">
        <span>전체 LOT</span>
        <i class="icon-fixed_arrow-2x"></i>
      </button>
    </div>
    <div class="panel-body">
      <article class="bidding-offline-left">
        <div class="lotlist-wrap">
          <div class="lotlist-header">
            <div class="header_top">
              <p class="totalcount">
                <span class="num">300</span>
                <span class="unit">LOT</span>
              </p>
            </div>
            <!-- [0728]탭수정 -->
            <div class="tab-area type-left_mm_3">
              <ul class="tab-list js-left_mm">
                <li class="active">
                  <a href="#tab-cont-1">
                    <span>전체</span>
                  </a>
                </li>
                <li class="">
                  <a href="#tab-cont-2">
                    <span>근현대</span>
                  </a>
                </li>
                <li class="">
                  <a href="#tab-cont-3">
                    <span>고미술</span>
                  </a>
                </li>
                <li class="">
                  <a href="#tab-cont-4">
                    <span>시계</span>
                  </a>
                </li>
              </ul>
            </div>
            <!-- //[0728]탭수정 -->
          </div>

          <div class="lotlist-tabCont">
            <div class="mobile_scroll-type">
              <div class="lotlist-box">
                <ul class="lotlist-inner">
                  <li class="lotitem bidded">
                    <div class="js-select_lotitem lotitem_wrap">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img src="/images/temp/temp_img0.jpg" alt="LOT 02">
                          </div>
                        </div>
                      </div>
                      <div class="item-cont">
                        <div class="num-box">
                          <div class="num">
                            <span class="snum">1</span>
                          </div>
                        </div>
                        <div class="typo-box">
                          <div class="title">
                            <span>데미안허스트</span>
                          </div>
                          <div class="desc">
                            <span>Air (From The Series The Elements)</span>
                          </div>
                        </div>
                        <div class="btn-box">
                          <button class="btn-lotChk js-work_heart on ">Favorite</button>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="lotitem live">
                    <div class="js-select_lotitem lotitem_wrap">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img src="/images/temp/temp_img1.jpg" alt="LOT 02">
                          </div>
                        </div>
                      </div>
                      <div class="item-cont">
                        <div class="num-box">
                          <div class="num">
                            <span class="snum">1</span>
                          </div>
                        </div>
                        <div class="typo-box">
                          <!-- [0516]년도삭제 리스트공통// -->
                          <div class="title">
                            <span>데미안허스트</span>
                          </div>
                          <div class="desc">
                            <span>Air (From The Series The Elements)</span>
                          </div>
                        </div>
                        <div class="btn-box">
                          <button class="btn-lotChk js-work_heart ">Favorite</button>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="lotitem">
                    <div class="js-select_lotitem lotitem_wrap">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img src="/images/temp/temp_img2.jpg" alt="LOT 02">
                          </div>
                        </div>
                      </div>
                      <div class="item-cont">
                        <div class="num-box">
                          <div class="num">
                            <span class="snum">1</span>
                          </div>
                        </div>
                        <div class="typo-box">
                          <!-- [0516]년도삭제 리스트공통// -->
                          <div class="title">
                            <span>데미안허스트</span>
                          </div>
                          <div class="desc">
                            <span>Air (From The Series The Elements)</span>
                          </div>
                        </div>
                        <div class="btn-box">
                          <button class="btn-lotChk js-work_heart ">Favorite</button>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="lotitem">
                    <div class="js-select_lotitem lotitem_wrap">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img src="/images/temp/temp_img3.jpg" alt="LOT 02">
                          </div>
                        </div>
                      </div>
                      <div class="item-cont">
                        <div class="num-box">
                          <div class="num">
                            <span class="snum">1</span>
                          </div>
                        </div>
                        <div class="typo-box">
                          <!-- [0516]년도삭제 리스트공통// -->
                          <div class="title">
                            <span>데미안허스트</span>
                          </div>
                          <div class="desc">
                            <span>Air (From The Series The Elements)</span>
                          </div>
                        </div>
                        <div class="btn-box">
                          <button class="btn-lotChk js-work_heart ">Favorite</button>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="lotitem cancel">
                    <p class="txt">LOT 4 <br>출품이 취소되었습니다.</p>
                  </li>
                  <li class="lotitem">
                    <div class="js-select_lotitem lotitem_wrap">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img src="/images/temp/temp_img4.jpg" alt="LOT 02">
                          </div>
                        </div>
                      </div>
                      <div class="item-cont">
                        <div class="num-box">
                          <div class="num">
                            <span class="snum">1</span>
                          </div>
                        </div>
                        <div class="typo-box">
                          <!-- [0516]년도삭제 리스트공통// -->
                          <div class="title">
                            <span>데미안허스트</span>
                          </div>
                          <div class="desc">
                            <span>Air (From The Series The Elements)</span>
                          </div>
                        </div>
                        <div class="btn-box">
                          <button class="btn-lotChk js-work_heart ">Favorite</button>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="lotitem">
                    <div class="js-select_lotitem lotitem_wrap">
                      <div class="view-img">
                        <div class="img-box">
                          <div class="box-inner">
                            <img src="/images/temp/temp_img4.jpg" alt="LOT 02">
                          </div>
                        </div>
                      </div>
                      <div class="item-cont">
                        <div class="num-box">
                          <div class="num">
                            <span class="snum">1</span>
                          </div>
                        </div>
                        <div class="typo-box">
                          <!-- [0516]년도삭제 리스트공통// -->
                          <div class="title">
                            <span>데미안허스트</span>
                          </div>
                          <div class="desc">
                            <span>Air (From The Series The Elements)</span>
                          </div>
                        </div>
                        <div class="btn-box">
                          <button class="btn-lotChk js-work_heart ">Favorite</button>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </article>
    </div>
  </div>
</aside>
<!-- 전체 LOT 보기 팝업 //-->

<script>
window.onload = async () => {
  /**
   * [Variable] 글로벌 변수
   */
  window.currency = 'KRW';

  /**
   * [Event] 정렬 변경 이벤트
   */
   $('#sort-order').on('select2:select', function (e) {
    console.log(e.target.value);
  });

  /**
   * [Event] 보기방식 변경 이벤트
   */
  $('#view-type').on('select2:select', function (e) {
    console.log(e.target.value);
  });

  /**
   * [Load] URL에서 SaleNo 가져오기
   */
  const pathname = window.location.pathname;
  const pageParams = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });
  const saleNo = Number(pathname.replace(/^\/auction\/online\/list\/(\d+).*/, '$1')) || 0;
  if (!saleNo) return;

  const lotPage = pageParams.page ? Number(pageParams.page) : 1;
  const lotSize = pageParams.size ? Number(pageParams.size) : 10;
  if (lotPage < 1) lotPage = 1;
  if (lotSize > 101) lotSize = 100;

  const [saleInfoResult, lotListResult] = await Promise.all([
    await callApiSaleInfo(saleNo),
    await callApiLotList(saleNo, lotPage, lotSize),
  ]);

  window.currency = saleInfoResult.CURR_CD;

  // 타이틀 섹션 렌더
  renderSaleTitleSection(saleInfoResult);

  // 랏 목록 렌더
  renderLotListSection(lotListResult);

  // 페이징 렌더
  renderPaginationSection(lotPage, lotListResult.totalCount, lotSize);
}

/**
 * ----------------------------------------------------------------------------
 * API 콜
 * ----------------------------------------------------------------------------
 */

/**
 * [API Call] 경매 정보
 */
async function callApiSaleInfo(saleNo) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;

  try {
    const { data } = await axios.get(`/api/auction/online/sales/${saleNo}`);
    if (!data.success) {
      throw new Error(data.data);
    }

    const result = data.data;
    return result;
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * [API Call] 랏 목록
 */
async function callApiLotList(saleNo, page = 1, size = 20) {
  if (typeof axios === 'undefined') return;
  if (!saleNo) return;

  try {
    const { data } = await axios.get(`/api/auction/online/sales/\${saleNo}/lots?page=\${page}&size=\${size}`);
    if (!data.success) {
      throw new Error(data.data);
    }

    const { cnt: totalCount, list: rows } = data.data;
    return { totalCount, rows };
  } catch (error) {
    console.log(error);
    return null;
  }
}

/**
 * ----------------------------------------------------------------------------
 * 화면 렌더링
 * ----------------------------------------------------------------------------
 */

/**
 * [Render] 경매 타이틀 섹션 렌더링
 */
async function renderSaleTitleSection(data) {
  // 타이틀 영역
  document.querySelector('[data-title]').innerHTML = `\${JSON.parse(data.TITLE_JSON).ko}`;
  document.querySelector('[data-preview]').innerHTML = `
  \${window.moment(data.PREV_FROM_DT).format('MM.DD(ddd)')} ~
  \${window.moment(data.PREV_TO_DT).format('MM.DD(ddd)')}`.trim();
  document.querySelector('[data-to-date]').innerHTML = `\${window.moment(data.FROM_DT).format('MM.DD(ddd) HH:mm')}`;

  // 카테고리
  let categoryies = [];
  data.categoryList.forEach(item => {
    categoryies.push({ title: item.CD_NM, value: item.CD_ID });
  });

  data.lotTagList.forEach(item => {
    categoryies.push({ title: item.LOT_TAG, value: item.LOT_TAG });
  });

  if (categoryies.length > 0) {
    let categoryHtml = `
      <li>
        <a href="#tab-cont-s\${999}">
          <span>전체</span>
        </a>
      </li>`;

    categoryHtml += categoryies.map((item, index) => {
      return `
        <li>
          <a href="#tab-cont-s\${index}">
            <span>\${item.title}</span>
          </a>
        </li>`.trim();
    }).join('');

    const categoryElement = document.querySelector('[data-category]');
    categoryElement.innerHTML = categoryHtml;

    [...categoryElement.querySelectorAll('li a')].forEach(item => {
      item.addEventListener('click', (e) => {
        e.preventDefault();
        console.log(e.currentTarget);
      });
    });
  }
}

/**
 * [Render] 경매 랏 렌더링
 */
async function renderLotListSection(data) {
  try {
    const { totalCount, rows } = data;
    document.querySelector('[data-total-count]').innerHTML = totalCount;

    if (rows.length < 1) {
      // TODO: 데이터 없음
      return;
    }

    console.log(window.currency);
    console.log(rows);

    const lotListElement = rows.map(item => {
      const lang = getLanguage();
      const isCancelLots = item.STAT_CD === 'reentry';
      const artist = JSON.parse(item.ARTIST_NAME_JSON)[lang];
      const lotNo = item.LOT_NO;
      const title = JSON.parse(item.TITLE_JSON)[lang];
      const material = lang === 'en' ? item.MATE_NM_EN : item.MATE_NM;
      const createdYear = JSON.parse(item.MAKE_YEAR_JSON)[lang];
      const lotSizeJson = JSON.parse(item.LOT_SIZE_JSON);
      const imagePath = item.LOT_IMG_PATH && item.LOT_IMG_NAME ?
        `https://www.seoulauction.com/nas_img/\${item.LOT_IMG_PATH}/\${item.LOT_IMG_NAME}` :
        `images/bg/no_image.jpg`;

      const expectPriceFrom = JSON.parse(item.EXPE_PRICE_FROM_JSON)[currency];
      const expectPriceTo = JSON.parse(item.EXPE_PRICE_TO_JSON)[currency];
      const isNotExpectPrice = !expectPriceFrom && !expectPriceTo;

      const startPrice = item.START_PRICE || 0;
      const bidCount = item.BID_CNT || 0;
      const isAuctioned = item.LAST_PRICE >= 0 && item.BID_CNT > 0 && (item.END_YN == 'Y' || item.CLOSE_YN == 'Y');
      const hammerPrice = item.LAST_PRICE;

      const isProcessing = ['online'].includes(item.SALE_KIND_CD) && item.END_YN === 'N'; // 진행중 여부
      const remainTime = timerFormat(new Date(item.TO_DT).getTime() - new Date().getTime());
      const remainTimeFormat = [
        remainTime[0] > 0 ? remainTime[0] + '일 ' : '',
        remainTime[1] > 0 ? toFixTen(remainTime[1]) + ':' : '',
        remainTime[2] > 0 ? toFixTen(remainTime[2]) + ':' : '',
        remainTime[3] > 0 ? toFixTen(remainTime[3]) : '',
      ].filter(Boolean).join('');

      if (isCancelLots) {
        return `
          <li>
            <div class="li-inner">
              <article class="item-article">
                <div class="product_cancle-area" style="display:block;">
                  <div class="area-inner">
                    <i class="icon-cancle_box"></i>
                    <div class="typo">
                      <div class="name"><span class="ng-binding">LOT \${lotNo}</span></div>
                      <div class="msg"><span>출품이 취소되었습니다.</span></div>
                    </div>
                  </div>
                </div>
              </article>
            </div>
          </li>
        `;
      }

      return `
      <li>
        <div class="li-inner">
          <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="#" class="img-align">
                  <img src="\${imagePath}" alt="\${title}">
                </a>
              </figure>
            </div>

            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">\${lotNo}</span>
                  </a>
                  <button class="heart js-work_heart">
                    <i class="icon-heart_off"></i>
                  </button>
                </div>
                <div class="info-box">
                  <div class="title">
                    <a href="#">
                      <span>\${artist}</span>
                    </a>
                  </div>
                  <div class="desc">
                    <a href="#">
                      <span>\${title}</span>
                    </a>
                  </div>
                  <div class="standard">
                    <a href="#">
                      <span>\${material}</span>
                    </a>
                    <div class="size_year">
                      <a href="#">
                        <span>80.9 X 73.4cm</span>
                        \${createdYear ? `<span>\${createdYear}</span>` : ''}
                      </a>
                    </div>
                  </div>
                </div>
                <div class="price-box">
                  <a href="#">
                    <dl class="price-list">
                      <dt>추정가</dt>
                      <dd>\${isNotExpectPrice ? '별도문의' : currency + ' ' + format(expectPriceFrom)}</dd>
                      <dd>\${isNotExpectPrice ? '' : '~ ' + format(expectPriceTo)}</dd>
                    </dl>
                    <dl class="price-list">
                      <dt>시작가</dt>
                      <dd>\${currency} \${startPrice > 0 ? format(startPrice) : '-'}</dd>
                    </dl>
                    <dl class="price-list">
                      <dt>낙찰가</dt>
                      <dd>
                        \${isAuctioned ? `
                          <strong>\${currency} \${format(hammerPrice)}</strong>
                          <em>(응찰\${format(bidCount)})</em>  
                        ` : ''}
                      </dd>
                    </dl>
                  </a>
                </div>
                <div class="bidding-box">
                  <div class="deadline_set">
                    <a href="#">
                      <span>\${!remainTime ? '' : remainTimeFormat}</span>
                    </a>
                  </div>
                  <div class="btn_set">
                    <a class="btn btn_point" href="#" role="button">
                      <span>응찰</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </div>
      </li>`;
    });

    const root = document.querySelector('.product-list');
    root.innerHTML = lotListElement.join('\n');

  } catch (error) {
    console.log(error);
  }
}

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
      return `<a href="#" class="prev icon-page_prev" data-page="\${item.page}">PREV</a>`;
    }
    if (item.title === 'NEXT') {
      return `<a href="#" class="next icon-page_next" data-page="\${item.page}"><em>NEXT</em></a>`;
    }
    if (item.title === 'END') {
      return `<a href="#" class="next_end icon-page_nextnext" data-page="\${item.page}">END</a>`;
    }

    if (item.active) {
      return `<a href="#" class="on"><strong>\${item.page}</strong></a>`;
    }

    return `<a href="#" data-page="\${item.page}"><em>\${item.title}</em></a>`;
  }).join('\n');

  root.innerHTML = html;
  root.querySelectorAll('a').forEach((element, index) => {
    element.addEventListener('click', async e => {
      e.preventDefault();
      const target = e.currentTarget;
      if (target.classList.contains('disabled')) return;

      console.log(target.dataset);

      if (target.dataset?.page) {
        // window.history.pushState({}, '', makeUrl(target.dataset.page));
        window.location.href = makeUrl(target.dataset.page);
      }
    });
  });
}

/**
 * ----------------------------------------------------------------------------
 * Utils
 * ----------------------------------------------------------------------------
 */
function makeUrl(page, sort, search) {
  const pathname = window.location.pathname;
  let params = window.Qs.parse(window.location.search, { ignoreQueryPrefix: true });

  if (page !== 1) {
    params.page = page;
  } else {
    delete params.page;
  }

  if (sort) {
    params.sort = sort;
  } else {
    delete params.sort;
  }

  if (search) {
    params.search = search;
  } else {
    delete params.search;
  }

  return pathname + '?' +  window.Qs.stringify(params);
}

function getLanguage() {
  return document.documentElement.lang || 'ko';
}

/**
 * Number 포맷 지정
 * @param {number} num
 * @param {number} precision - 자릿수
 * @example
 * const value1 = format(999_999.999)     // 999,999.999
 * const value2 = format(999_999, -3)     // 999,000
 * const value3 = format(999_999.999, 1)  // 999,000.9
 */
function format(num, precision) {
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

/**
 * 자릿수 string으로 리턴
 */
function toFixTen(num) {
  return num >= 10 ? num.toString() : `0${num}`;
}

/**
 * ----------------------------------------------------------------------------
 * UI
 * ----------------------------------------------------------------------------
 */

// 모바일 LOT 버튼 클릭시 팝업 변경(전체 LOT 보기 팝업)
$(".js-lotbox-btn").on("click", function($e) {
  $(".allview_fixed-wrap.lot .js-fixed_total").addClass("on")
  $(".allview_fixed-wrap.lot").addClass("active");
});

$(".allview_fixed-wrap.lot .js-fixed_total").on("click", function() {
  $(this).removeClass("on");
  $(".allview_fixed-wrap.lot").removeClass("active");
});

// 외부영역 클릭 시 닫힘
$(document).mouseup(function(e) {
  if ($(".js-modal").has(e.target).length === 0) {
    $(".js-modal").parent(".allview_fixed-wrap").removeClass("active");
    $(".js-modal").closest(".js-fixed_total").removeClass("on");
  }
});

// 탭 선택
$('.js-left_mm a').on('click', function(e) {
  e.preventDefault();
  var tar = $(this).position().left;
  var scrollX = tar - ($(".js-left_mm").parents(".tab-area").width() / 2) + $(this).width() / 2;

  if ($(this).parents('li').hasClass('active')) {
    return false;
  } else {
    $(".js-left_mm li").removeClass('active');
    $(this).parents('li').addClass('active');

    $(".js-left_mm").parents(".tab-area").scrollLeft(scrollX);
  }
});

// 하트 토글
$(".js-work_heart").trpToggleBtn(function($this) {
  $($this).removeClass("on");
}, function($this) {
  $($this).addClass("on");
});

// 셀렉트 드롭다운
var dropdown = $(".js-dropdown-btn").trpDropdown({
  list: ".trp-dropdown_list-box",
  area: ".trp-dropdown-area"
});

$(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
  $e.preventDefault();
  var _this = $(this);
  _this.closest("ul").find("li").removeClass("on");
  _this.closest("li").addClass("on");
  _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
  dropdown.getClose();
});

// 탭 메뉴
$('.js-list_tab a').on('click', function(e) {
  e.preventDefault();
  var tar = $(this).position().left;
  var scrollX = tar - ($(".js-list_tab").parents(".tab-area").width() / 2) + $(this).width() / 2;

  if ($(this).parents('li').hasClass('active')) {
    return false;
  } else {
    $(".js-list_tab li").removeClass('active');
    $(this).parents('li').addClass('active');

    $(".js-list_tab").parents(".tab-area").scrollLeft(scrollX);
  }
});

// PC, Mobile select 값변경
// $(function() {
//   $(window).on("resize", function($e) {
//     select_resize_change();
//   });

//   function select_resize_change() {
//     if ($("body").hasClass("is_mb")) {
//       $(".js-select_page").val("2");
//     } else {
//       $(".js-select_page").val("1");
//     }
//     $(".js-select_page").trigger('change');
//   }
//   select_resize_change();
// });
</script>
</body>
</html>
