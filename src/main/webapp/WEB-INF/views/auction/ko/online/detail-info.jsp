<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Detail Info Area -->
<div class="row_view">
  <div class="col_item">
    <article class="product_view-article">
      <div class="view_row">
        <div class="viewer-area">
          <div class="gallery_visual js-view_visual">
            <div class="gallery_center" id="data-lot-image">
              <div class="swiper-wrapper"></div>
            </div>
            <div class="pagination"></div>
          </div>
        </div>

        <div class="product_thumbnail-area">
          <div class="gallery_thumbnail js-view_thumnail">
            <div class="gallery_center" id="data-lot-thumbnail">
              <div class="swiper-wrapper"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="view_scale-area">
        <a href="#"><i class="icon-view_scale"></i><span>VIEW SCALE</span></a>
      </div>
    </article>
  </div>

  <div class="col_item">
    <article class="product_detail-article js-product_detail-article">
      <div class="index-area">
        <div class="index-box"><span id="data-lot-no"> </span></div>
        <div class="btn-box">
          <a href="#" title="" class="sns_share js-sns_share"><i class="icon-view_sns"></i></a>
          <a href="#" title="" class="work_heart js-work_heart"><i class="icon-view_heart_off"></i></a>
          <div class="sns_layer-area">
            <div class="sns-layer">
              <div class="sns-item">
                <button class="js-share_kakao">
                  <i class="icon-share_sns_kakao"></i>
                  <div class="txt"><span>카카오톡</span></div>
                </button>
              </div>
              <div class="sns-item">
                <button class="js-share_url">
                  <i class="icon-share_url_copy"></i>
                  <div class="txt"><span>URL 복사</span></div>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="artist-area">
        <div class="name">
          <strong id="data-artist-name">&nbsp;</strong>
          <span id="data-artist-born-year">&nbsp;</span>
        </div>
        <div class="desc">
          <span id="data-lot-title">&nbsp;</span>
        </div>
      </div>
      <div class="price-area">
        <dl class="price-list">
          <dt>추정가</dt>
          <dd id="data-expect-price">&nbsp;</dd>
        </dl>
        <dl class="price-list">
          <dt>시작가</dt>
          <dd id="data-start-price">&nbsp;</dd>
        </dl>
        <dl class="price-list">
          <dt id="data-last-price-title">현재가</dt>
          <dd id="data-last-price">&nbsp;</dd>
        </dl>
        <dl class="price-list">
          <dt>마감일</dt>
          <dd id="data-to-date">4/22(금) 14:00</dd>
        </dl>
      </div>
      <div class="button-area">
        <div class="btn_set only-pc">
          <div class="btn_item">
            <a class="btn btn_point btn_lg go-bid-btn" href="#" role="button">
              <span>응찰하기</span>
            </a>
          </div>
        </div>
        <div class="btn_set cols_2">
          <div class="btn_item hover_change only-pc">
            <div class="op_default">
              <a class="btn btn_default btn_lg bid-fee-btn" href="#" role="button">
                <span>낙찰수수료</span>
              </a>
            </div>
            <div class="op_hover">
              <a class="btn btn_black btn_2 btn_lg bid-fee-btn" href="#" role="button">
                <em>현재가 기준</em>
                <strong class="current-fee">1,584,000</strong>
              </a>
            </div>
          </div>
          <div class="btn_item only-mb">
            <a class="btn btn_default btn_lg js-delivery_price bid-fee-btn" href="#" role="button">
              <span>낙찰수수료</span>
            </a>
          </div>
          <div class="btn_item">
            <a class="btn btn_default btn_lg bid-grow-price-btn" href="#" role="button">
              <span>경매 호가표</span>
            </a>
          </div>
        </div>
      </div>
      <div class="other-area">
        <div class="inquiry-box">
          <i class="icon-view_inquiry"></i>
          <span>작품문의 02-395-0330</span>
        </div>
        <div class="print-box">
          <button class="print-btn">
            <i class="icon-view_print"></i>
          </button>
        </div>
      </div>
    </article>
  </div>
</div>
<!-- Detail Info Area //-->