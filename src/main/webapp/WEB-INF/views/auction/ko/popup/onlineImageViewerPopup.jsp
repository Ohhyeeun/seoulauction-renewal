<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 이미지 뷰어 팝업 -->
<div id="popup_images-wrap" class="trp popupfixed-wrap images-popup">
  <div class="popup-dim"></div>
  <div class="popup-align">
    <div class="popup-vertical">
      <div class="popup-layer">

        <div class="pop-panel">
          <div class="pop-header">
            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
          </div>
          <div class="pop-body">

            <!-- [0725]zoom관련 클래스 위치 변경
<article class="viewer-article js-zoom_inout">
<div class="gallery_view js-imagesSwiper" style=""> -->
            <article class="viewer-article">
              <div class="gallery_view js-imagesSwiper js-zoom_inout" style="">
                <!-- //[0725]zoom관련 클래스 위치 변경 -->
                <div class="gallery_center">
                  <div class="swiper-wrapper">

                    <div class="swiper-slide">
                      <div class="img-area">
                        <div class="img-box">
                          <div class="images">
                            <!-- <img class="imageViewer" src="/images/temp/img_viewer.jpg" alt="" /> -->
                            <img class="imageViewer" src="/images/temp/prduct_result-05.jpg" alt="" />
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="swiper-slide">
                      <div class="img-area">
                        <div class="img-box ">
                          <div class="images">
                            <img class="imageViewer" src="/images/temp/img_viewer-2.jpg" alt="" />
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="swiper-slide">
                      <div class="img-area">
                        <div class="img-box ">
                          <div class="images">
                            <img class="imageViewer" src="https://via.placeholder.com/500x300" alt="" />
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="swiper-slide">
                      <div class="img-area">
                        <div class="img-box ">
                          <div class="images">
                            <img class="imageViewer" src="https://via.placeholder.com/240x440" alt="" />
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </article>
            <div class="page_prev"><i class="icon-img_swiper_prev"></i></div>
            <div class="page_next"><i class="icon-img_swiper_next"></i></div>
          </div>
          <div class="pop-footer">
            <div class="pagination js-imagesSwiper_pagination"></div>
            <article class="thumbnail-article">
              <ul class="thumbnail-list js-thumbnail-list">
                <li class="active">
                  <a href="#">
                    <div class="imgs-item">
                      <figure class="img-ratio">
                        <div class="img-align">
                          <img src="/images/temp/view_thumbnail-1.jpg" alt="" />
                        </div>
                      </figure>
                      <div class="line"></div>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="imgs-item ">
                      <figure class="img-ratio">
                        <div class="img-align">
                          <img src="/images/temp/view_thumbnail-2.jpg" alt="" />
                        </div>
                      </figure>
                      <div class="line"></div>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="imgs-item ">
                      <figure class="img-ratio">
                        <div class="img-align">
                          <img src="/images/temp/view_thumbnail-3.jpg" alt="" />
                        </div>
                      </figure>
                      <div class="line"></div>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="imgs-item active">
                      <figure class="img-ratio">
                        <div class="img-align">
                          <img src="/images/temp/view_thumbnail-4.jpg" alt="" />
                        </div>
                      </figure>
                      <div class="line"></div>
                    </div>
                  </a>
                </li>
              </ul>
            </article>
            <!-- [0516]이동 -->
            <div class="zoom-box">
              <div class="btnitem">
                <button class="zoomout js-zoomout"><i class="icon-zoom_out"></i></button>
              </div>
              <div class="btnitem">
                <button class="zoomin js-zoomin"><i class="icon-zoom_in"></i></button>
              </div>
            </div>
            <!-- //[0516]이동 -->
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
<!-- 이미지 뷰어 팝업 //-->