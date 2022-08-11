<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/ko/header.jsp" />
<body>
<div class="wrapper online-auction">
  <div class="sub-wrap pageclass type-width_list">
    <jsp:include page="../../include/ko/nav.jsp" />

    <!-- container -->
    <div id="container">
      <div id="contents" class="contents">
        <section class="basis-section last-section auction_view-section">
          <div class="section-inner">
            <div class="content-panel type_panel-product_view">
              <div class="panel-header">
                <div class="header-inner ">
                  <article class="page_name-article js-page_name-article">
                    <div class="row-box">
                      <div class="col_item">
                        <div class="page_title">
                          <a href="#" conclick="window.history.back()" title="뒤로가기">
                            <i class="icon-page_back"></i>
                          </a>
                          <span>2월 e BID 프리미엄 온라인 경매</span>
                        </div>
                      </div>
                      <div class="col_item">
                        <!-- [0516]select 변경 -->
                        <div class="select-box">
                          <div class="trp-dropdown-area h42-lines">
                            <button class="js-dropdown-btn"><span>LOT 10</span><i class="form-select_arrow_md"></i>
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
                                        <span>LOT 10</span>
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
                                  <li><a href="#">
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
                        <!-- // [0516]select 변경 -->

                      </div>
                    </div>
                  </article>
                </div>
              </div>
              <div class="panel-body">

                <div class="row_view">
                  <div class="col_item">

                    <article class="product_view-article">
                      <div class="view_row">
                        <div class="viewer-area">
                          <div class="gallery_visual js-view_visual">
                            <div class="gallery_center">
                              <div class="swiper-wrapper">

                                <div class="swiper-slide " data-index="0">

                                  <div class="image-area">
                                    <figure class="img-ratio">
                                      <div class="img-align">
                                        <img src="/images/temp/view_big-1.jpg" alt="">
                                      </div>
                                    </figure>
                                  </div>

                                </div>
                                <div class="swiper-slide  " data-index="1">

                                  <div class="image-area">
                                    <figure class="img-ratio">
                                      <div class="img-align">
                                        <img src="/images/temp/view_big-2.jpg" alt="">
                                      </div>
                                    </figure>
                                  </div>

                                </div>
                                <div class="swiper-slide  " data-index="2">

                                  <div class="image-area">
                                    <figure class="img-ratio">
                                      <div class="img-align">
                                        <img src="/images/temp/view_big-3.jpg" alt="">
                                      </div>
                                    </figure>
                                  </div>

                                </div>
                                <div class="swiper-slide  " data-index="3">

                                  <div class="image-area">
                                    <figure class="img-ratio">
                                      <div class="img-align">
                                        <img src="/images/temp/view_big-4.jpg" alt="">
                                      </div>
                                    </figure>
                                  </div>

                                </div>

                              </div>
                            </div>
                            <div class="pagination"></div>
                          </div>
                        </div>

                        <div class="product_thumbnail-area">
                          <div class="gallery_thumbnail js-view_thumnail">
                            <div class="gallery_center">
                              <div class="swiper-wrapper">
                                <div class="slide images active" data-index="0">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/temp/view_thumbnail-1.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>
                                <div class="slide images " data-index="1">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/temp/view_thumbnail-2.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>
                                <div class="slide images " data-index="2">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/temp/view_thumbnail-3.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>
                                <div class="slide images " data-index="3">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/temp/view_thumbnail-4.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>

                                <div class="slide" data-index="4">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>
                                <div class="slide" data-index="5">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>
                                <div class="slide" data-index="5">
                                  <figure class="img-ratio">
                                    <div class="img-align">
                                      <img src="/images/pc/auction/view_thumbnail_bg.jpg" alt="" />
                                    </div>
                                  </figure>
                                  <div class="line"></div>
                                </div>
                              </div>
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
                        <div class="index-box"><span>10</span></div>
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
                          <strong>김선우</strong>
                          <span>b.1988</span>
                        </div>
                        <div class="desc">
                          <span>Flight of 3 Dodos</span>
                        </div>
                      </div>
                      <div class="price-area">
                        <dl class="price-list">
                          <dt>추정가</dt>
                          <!-- [0613]텍스트 수정 -->
                          <dd>KRW 5,000,000 ~ 9,900,000,000</dd>
                          <!-- [0613]텍스트 수정 -->
                        </dl>
                        <dl class="price-list">
                          <dt>시작가</dt>
                          <dd>KRW 9,900,000,000</dd>
                        </dl>
                        <dl class="price-list">
                          <dt>현재가</dt>
                          <dd><strong>KRW 9,900,000,000</strong><em>(응찰 20)</em></dd>
                        </dl>
                        <dl class="price-list">
                          <dt>마감일</dt>
                          <!-- [0613]b태그 삭제 -->
                          <dd>4/22(금) 14:00</dd>
                          <!-- //[0613]b태그 삭제 -->
                        </dl>
                      </div>
                      <div class="button-area">
                        <div class="btn_set only-pc">
                          <div class="btn_item">
                            <a class="btn btn_point btn_lg" href="#" role="button"><span>응찰하기</span></a>
                          </div>
                        </div>
                        <div class="btn_set cols_2">
                          <div class="btn_item hover_change only-pc">
                            <div class="op_default">
                              <a class="btn btn_default btn_lg       " href="#" role="button"><span>낙찰수수료</span></a>
                            </div>
                            <div class="op_hover">
                              <a class="btn btn_black btn_2 btn_lg   " href="#" role="button">
                                <em>현재가 기준</em>
                                <strong>1,584,000</strong>
                              </a>
                            </div>
                          </div>
                          <div class="btn_item only-mb">
                            <a class="btn btn_default btn_lg js-delivery_price" href="#" role="button"><span>낙찰수수료</span></a>
                          </div>
                          <div class="btn_item">
                            <a class="btn btn_default btn_lg" href="#" role="button"><span>경매 호가표</span></a>
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

                <article class="product_detail_view-article">
                  <div class="view_editor-warp">

                    <div class="info-box">
                      <div class="title">작품정보</div>
                      <div class="desc">
                        gouache on canvas <br />
                        100.0X80.3cm (40) 2020 <br />
                        signed and dated on the right side <br />
                        signed titled and dated on the reverse <br />
                      </div>
                      <!-- [0714]작품정보 하위댑스 추가 -->
                      <div class="info-sub-wrap">
                        <div class="info-sub-box">
                          <div class="tit tt5">CONDITION</div>
                          <div class="desc">good condition 종이 작품의 경우, 재질 특성상 산화·울음이 있을 수 있습니다.</div>
                        </div>
                        <div class="info-sub-box">
                          <div class="tit tt5">PROVENANCE</div>
                          <div class="desc">Tonari no Zingaro(Tokyo)</div>
                        </div>
                        <div class="info-sub-box">
                          <div class="tit tt5">LITERATURE</div>
                          <div class="desc">
                            GRIMM Gallery, Amsterdam.<br>
                            Acquired from the above by the present owner.
                          </div>
                        </div>
                        <div class="info-sub-box">
                          <div class="tit tt5">EXHIBITED</div>
                          <div class="desc">Online, Praz-Delavallade, Focus: Guy Yanai, 2020.</div>
                        </div>
                      </div>
                      <!-- //[0714]작품정보 하위댑스 추가 -->
                    </div>
                    <!-- [0714]작품설명 추가 -->
                    <div class="info-box">
                      <div class="title">작품 설명</div>
                      <div class="desc">
                        조디커윅은 혜성처럼 미술계에 나타난 호주 작가로 정규 미술 교육을 받지 않고 본인만의 독보적인 화풍을 발전시켜 화폭에 담아낸다.
                      </div>
                    </div>
                    <!-- //[0714]작품설명 추가 -->

                    <!-- [0613]notice 추가 -->
                    <div class="info-box">
                      <!-- [0714]텍스트 대소문자 수정 -->
                      <div class="title">NOTICE</div>
                      <!-- //[0714]텍스트 대소문자 수정 -->
                      <div class="desc">
                        <ul class="mark_dot-list">
                          <li>서울옥션은 작가 및 작품명에 한하여 낙찰일로부터 3년간 낙찰자에 대해서만 보증하며, 사전 고지한 작품에 대해서는 보증책임을 부담하지 않습니다.</li>
                          <li>작품은 판매 당시 상태 그대로 판매되므로, 응찰 전 반드시 실물을 확인하여 주시기 바랍니다.<br>
                            홈페이지에 기재된 컨디션은 작품 상태에 대한 당사의 주관적 의견을 제시하는 것일 뿐이므로, 내재된 모든 결함, 수리, 변형 등을 언급하지 않을 수 있습니다. 또한 제작된 지 오랜 시간이 경과한 작품에 자연스럽게 확인되는 노화 현상(구김, 마모, 오염, 산화 등)에 대해서도 별도 언급이 없을 수 있습니다.<br>
                            컨디션은 작품만을 대상으로 하며 액자, 족자, 병풍, 좌대, 케이스 등 작품 구성품의 상태는 포함하지 않습니다. 온라인에 게재된 이미지로 작품의 일부 컨디션을 확인할 수 있으나 실제 상태를 정확하게 반영하지 못할 수 있으며 작품의 색상, 밝기 등이 실물과 다르게 보일 수 있습니다.<br>
                            실물을 확인하지 않고 발생되는 문제에 대한 책임은 응찰자에게 있으며, 이와 같은 유의사항을 반드시 확인하시고 신중히 응찰해 주시길 바랍니다.</li>
                        </ul>
                      </div>
                    </div>
                    <!-- //[0613]notice 추가 -->

                    <div class="info-box">
                      <div class="title">작가정보</div>
                      <div class="desc">
                        작가는 멸종된 도도새의 모습을 통해 메시지를 전달한다. 표류하는 청년들에게 이상을 잃지
                        말자는 경험 어린 격려를 건넨다. 작품에 등장하는 도도새는 '날지 못하는 바보 새'가 아니라
                        다시 날아오를 수 있는 가능성을 품은 존재다.
                      </div>
                      <div class="desc">
                        <b>참고자료</b> <br />
                        <!-- [0728]a태그로수정 -->
                        <a href="#" class="sub-links">“날지 못해 멸종된 모리셔스 도도새 그리며 꿈과 자유를 본다”</a>
                        <!-- //[0728]a태그로수정 -->
                      </div>
                      <div class="desc">
                        <div class="video_img-box">
                          <!-- [0725]비디오 수정 -->
                          <a href="#" target="_blank">
                            <div class="dim">
                              <i class="icon-video_play_white"></i>
                            </div>
                            <img src="/images/temp/video_img-5.jpg" alt="" />
                          </a>
                          <a href="#" target="_blank">
                            <div class="dim">
                              <i class="icon-video_play_white"></i>
                            </div>
                            <img src="/images/temp/video_img-6.png" alt="" />
                          </a>
                          <a href="#" target="_blank">
                            <div class="dim">
                              <i class="icon-video_play_white"></i>
                            </div>
                            <img src="/images/temp/video_img-9.jpg" alt="" />
                          </a>
                          <a href="#" target="_blank">
                            <div class="dim">
                              <i class="icon-video_play_white"></i>
                            </div>
                            <img src="/images/temp/video_img-8.png" alt="" />
                          </a>
                          <!-- //[0725]비디오 수정 -->
                        </div>
                      </div>
                    </div>

                  </div>
                </article>

              </div>
              <div class="panel-footer">

                <article class="product_recent_work-article">
                  <div class="article-header">
                    <!-- [0613]텍스트수정 -->
                    <div class="title"><span>이 경매의 최근 본 작품</span></div>
                    <!-- //[0613]텍스트수정 -->
                  </div>
                  <div class="article-body">
                    <div class="scroll-type">
                      <div class="product-area">

                        <ul class="product-list">
                          <li>
                            <div class="li-inner">

                              <article class="item-article">
                                <div class="image-area">
                                  <figure class="img-ratio">
                                    <a href="#" class="img-align">
                                      <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                    </a>
                                    <a href="javascript:void(0);" class="img-align">
                                      <img src="https://www.seoulauction.com/nas_img/front/main0713/02a92925-09d8-4457-a12d-e2cb858c5102.jpg" alt="">
                                    </a>
                                  </figure>
                                </div>
                                <div class="typo-area">
                                  <div class="product_info">
                                    <div class="num_heart-box">
                                      <a href="javascript:void(0);" class=" ng-binding" ng-bind="item.LOT_NO"><span class="num">10</span></a>
                                      <a ng-class="{'heart':item.FAVORITE_YN,'js-work_heart':item.FAVORITE_YN,'on':item.FAVORITE_YN==='Y'}" ng-click="favorite2(item.SALE_NO, item.LOT_NO, $index);" class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                    </div>
                                    <div class="info-box">

                                      <div class="title">
                                        <a href="javascript:void(0);">
                                                                                            <span ng-bind="item.ARTIST_NAME_BLOB_JSON.ko" class="ng-binding">운보 김기창
                                                                                            </span>
                                        </a>
                                      </div>
                                      <div class="desc">
                                        <a href="javascript:void(0);">
                                          <span ng-bind="item.TITLE_BLOB_JSON.ko" class="ng-binding">청록산수(靑綠山水)</span>
                                        </a>
                                      </div>

                                    </div>
                                  </div>
                                </div>
                                <div class="product_cancle-area">
                                  <div class="area-inner">
                                    <i class="icon-cancle_box"></i>
                                    <div class="typo">
                                      <div class="name"><span>LOT 5</span></div>
                                      <div class="msg"><span>출물이 취소되었습니다.</span>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </article>

                            </div>
                          </li>



                          <li class="">
                            <div class="li-inner">
                              <article class="item-article">
                                <div class="image-area">
                                  <figure class="img-ratio">
                                    <!-- [0617]a태그로 변경 -->
                                    <a href="#" class="img-align">
                                      <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                    </a>
                                    <!-- //[0617]a태그로 변경 -->
                                  </figure>
                                </div>
                                <div class="typo-area">
                                  <!-- [0617]a태그 -->
                                  <div class="product_info">
                                    <div class="num_heart-box">
                                      <a href="#"><span class="num">
                                                                                            1
                                                                                        </span></a>
                                      <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                    </div>
                                    <div class="info-box">
                                      <div class="title"><a href="#"><span>데미안허스트</span></a>
                                        <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                      </div>
                                      <div class="desc"><a href="#"><span>Air (From The Series The
                                                                                                Elements)</span></a></div>
                                    </div>
                                  </div>
                                </div>
                                <div class="product_cancle-area">
                                  <div class="area-inner">
                                    <i class="icon-cancle_box"></i>
                                    <div class="typo">
                                      <div class="name"><span>LOT 5</span></div>
                                      <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                    </div>
                                  </div>
                                </div>
                              </article>
                            </div>
                          </li>

                          <li class="">
                            <div class="li-inner">
                              <article class="item-article">
                                <div class="image-area">
                                  <figure class="img-ratio">
                                    <!-- [0617]a태그로 변경 -->
                                    <a href="#" class="img-align">
                                      <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                    </a>
                                    <!-- //[0617]a태그로 변경 -->
                                  </figure>
                                </div>
                                <div class="typo-area">
                                  <!-- [0617]a태그 -->
                                  <div class="product_info">
                                    <div class="num_heart-box">
                                      <a href="#"><span class="num">
                                                                                            2
                                                                                        </span></a>
                                      <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                    </div>
                                    <div class="info-box">
                                      <div class="title"><a href="#"><span>데미안허스트</span></a>
                                        <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                      </div>
                                      <div class="desc"><a href="#"><span>Air (From The Series The
                                                                                                Elements)</span></a></div>
                                    </div>
                                  </div>
                                </div>
                                <div class="product_cancle-area">
                                  <div class="area-inner">
                                    <i class="icon-cancle_box"></i>
                                    <div class="typo">
                                      <div class="name"><span>LOT 5</span></div>
                                      <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                    </div>
                                  </div>
                                </div>
                              </article>
                            </div>
                          </li>

                          <li class="">
                            <div class="li-inner">
                              <article class="item-article">
                                <div class="image-area">
                                  <figure class="img-ratio">
                                    <!-- [0617]a태그로 변경 -->
                                    <a href="#" class="img-align">
                                      <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                    </a>
                                    <!-- //[0617]a태그로 변경 -->
                                  </figure>
                                </div>
                                <div class="typo-area">
                                  <!-- [0617]a태그 -->
                                  <div class="product_info">
                                    <div class="num_heart-box">
                                      <a href="#"><span class="num">
                                                                                            3
                                                                                        </span></a>
                                      <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                    </div>
                                    <div class="info-box">
                                      <div class="title"><a href="#"><span>데미안허스트</span></a>
                                        <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                      </div>
                                      <div class="desc"><a href="#"><span>Air (From The Series The
                                                                                                Elements)</span></a></div>
                                    </div>
                                  </div>
                                </div>
                                <div class="product_cancle-area">
                                  <div class="area-inner">
                                    <i class="icon-cancle_box"></i>
                                    <div class="typo">
                                      <div class="name"><span>LOT 5</span></div>
                                      <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                    </div>
                                  </div>
                                </div>
                              </article>
                            </div>
                          </li>

                          <li class="">
                            <div class="li-inner">
                              <article class="item-article">
                                <div class="image-area">
                                  <figure class="img-ratio">
                                    <!-- [0617]a태그로 변경 -->
                                    <a href="#" class="img-align">
                                      <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                    </a>
                                    <!-- //[0617]a태그로 변경 -->
                                  </figure>
                                </div>
                                <div class="typo-area">
                                  <!-- [0617]a태그 -->
                                  <div class="product_info">
                                    <div class="num_heart-box">
                                      <a href="#"><span class="num">
                                                                                            4
                                                                                        </span></a>
                                      <a class="heart js-work_heart"><i class="icon-heart_off"></i></a>
                                    </div>
                                    <div class="info-box">
                                      <div class="title"><a href="#"><span>데미안허스트</span></a>
                                        <!-- [0516]삭제  <span class="sub">(1965)</span> -->
                                      </div>
                                      <div class="desc"><a href="#"><span>Air (From The Series The
                                                                                                Elements)</span></a></div>
                                    </div>
                                  </div>
                                </div>
                                <div class="product_cancle-area">
                                  <div class="area-inner">
                                    <i class="icon-cancle_box"></i>
                                    <div class="typo">
                                      <div class="name"><span>LOT 5</span></div>
                                      <div class="msg"><span>출물이 취소되었습니다.</span></div>
                                    </div>
                                  </div>
                                </div>
                              </article>
                            </div>
                          </li>


                        </ul>

                      </div>
                    </div>
                  </div>
                </article>

              </div>
            </div>
          </div>
        </section>


        <article class="sticky_bidding-article">
          <div class="btn_set">
            <!-- [0628]클릭 시 액션 추가 -->
            <div class="btn_lot-box">
              <button class="js-lotbox-btn">
                <div class="txt">전체 LOT</div>
                <i class="form-select_arrow_view-2x"></i>
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
                          <span>LOT 10</span>
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
                    <li><a href="#">
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
            <div class="btn-box">
              <button>응찰하기</button>
            </div>
          </div>
        </article>
      </div>
    </div>
    <!-- container //-->

    <jsp:include page="../../include/ko/footer.jsp" />
  </div>
</div>

<script src="/js/online-auction-view/index.js" defer></script>
</body>
</html>
