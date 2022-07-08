<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="popup_biddingPopup1-wrap" class="trp popupfixed-wrap bidding-online-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-lg mode-mb_full">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span id="pop_lot_no" class="txt_title">LOT </span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section  " style="display: block;">
                            <div class="bidding-online-wrap">
                                <article class="bidding-online-left">
                                    <figure class="view-area">
                                        <div class="view-img">
                                            <div class="img-box">
                                                <div class="box-inner">
                                                    <img id="pop_img_url" alt="LOT 02">
                                                </div>
                                            </div>
                                        </div>
                                        <figcaption class="view-typo">
                                            <div class="typo-header">
                                                <div class="title"><span id="pop_artist_nm"></span><em
                                                        id="pop_born_year"></em>
                                                </div>
                                                <div class="desc"><span id="pop_lot_title"></span>
                                                </div>
                                            </div>
                                            <div class="typo-body">
                                                <span id="pop_material"></span>
                                                <ul>
                                                    <li id="pop_size"></li>
                                                    <li id="pop_make_year"></li>
                                                </ul>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                                <article class="bidding-online-right js-bidding_tab">
                                    <div class="legend-area">
                                        <div class="side_time">
                                            <span id="bid_tick"></span>
                                        </div>
                                        <div class="unit">
                                            <span>호가단위 : </span>
                                            <em id="quote_unit"></em>
                                        </div>
                                    </div>
                                    <div class="product-list-area">
                                        <div class="list-header">
                                            <div class="price-name"><span id="bid_cost_text">현재가</span></div>
                                            <div class="price-amount"><em id="bid_cost_val"></em> <span
                                                    id="bid_cost_cnt"></span></div>
                                        </div>
                                        <div class="list-body scroll-type">
                                            <ul id="bid_lst" class="product-list">
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="topbtn-area">
                                        <div class="btn_set">
                                            <div class="btn_item"><a class="btn btn_default btn_lg" href="#"
                                                                     role="button"><span>1회 응찰</span></a></div>
                                            <div class="btn_item"><a class="btn btn_gray btn_lg" href="#" role="button"><span>자동응찰</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="caution-area">
                                        <ul class="mark_char-list">
                                            <li class="accent"><span>응찰하기 버튼을 누르시면 취소가 불가능합니다.</span></li>
                                            <li class=""><span>동시 응찰자 경우, 서버시각 기준 우선순위가 부여됩니다.</span></li>
                                        </ul>
                                    </div>
                                    <div class="bottombtn-area">
                                        <div class="btn_set active">
                                            <div class="btn_item"><a class="btn btn_point btn_lg typo-pc_mb-line"
                                                                     id="bid_new_cost_val" href="javascript:bid();"
                                                                     role="button" value=""><span
                                                    id="bid_new_cost"></span> <span id="bid_new_cost_btn">응찰하기</span></a></div>
                                        </div>
                                        <div class="btn_set type-pc_mb-column">
                                            <div class="btn_item">
                                                <div id="reservation_bid_layer" class="select-box">
                                                    <select id="reservation_bid" class="select2Basic56_line">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="btn_item"><a id="auto_bid_btn"  class="btn btn_point btn_lg" href="javascript:autoBid();"
                                                                     role="button"><span id="auto_bid_txt">응찰하기</span></a></div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 응찰하기 -->
<div id="bidding_go-wrap" class="trp popupfixed-wrap auction_info-popup  ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">

                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <article class="auction_info-article">
                                <div class="img">
                                    <img class="only_ib-pc" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                    <img class="only_ib-mb" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                </div>
                                <div class="title"><span>Seoul Auction 안내</span></div>
                                <div class="gray-box">
                                    <ul class="mark_dot-list">
                                        <li>자동응찰 중지하기 전까지의 응찰 낙찰 내역은 모두 기록되며 유효합니다.</li>
                                    </ul>
                                </div>

                                <div class="query"><span>응찰 하시겠습니까?</span></div>
                                <div class="btn_set">
                                    <a id="auto_on_cancel" class="btn btn_default" href="#" role="button"><span>취소</span></a>
                                    <a id="auto_on_ok" class="btn btn_point" href="#" role="button"><span>응찰하기</span></a>
                                </div>
                            </article>
                        </section>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- 응찰중지 -->
<div id="bidding_stop-wrap" class="trp popupfixed-wrap auction_info-popup  ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <article class="auction_info-article">
                                <div class="img">
                                    <img class="only_ib-pc" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                    <img class="only_ib-mb" src="/images/pc/auction/symbol-none_data.png" alt="안내" />
                                </div>
                                <div class="title"><span>Seoul Auction 안내</span></div>
                                <div class="gray-box">
                                    <ul class="mark_dot-list">
                                        <li>자동응찰 중지는 자동 응찰 취소가 아닙니다.</li>
                                        <li>비딩이 올라간 상태에서 정지됩니다.</li>
                                    </ul>
                                </div>

                                <div class="query"><span>자동 응찰을 중지 하시겠습니까?</span></div>
                                <div class="btn_set">
                                    <a id="auto_off_cancel" class="btn btn_default" href="#" role="button"><span>취소</span></a>
                                    <a id="auto_off_ok" class="btn btn_point" href="#" role="button"><span>자동응찰 중지</span></a>
                                </div>
                            </article>
                        </section>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>