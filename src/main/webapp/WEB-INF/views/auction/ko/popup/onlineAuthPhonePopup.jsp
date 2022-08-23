<%@ page contentType="text/html;charset=UTF-8" %>

<!-- 번호인증 팝업 -->
<template id="online-auth-phone-popup">
  <div id="popup_online_confirm-wrap" class="trp popupfixed-wrap online_confirm-popup">
    <!-- <div class="popup-dim"></div> -->
    <div class="popup-align mode-ms mode-mb_full">
      <div class="popup-vertical">
        <div class="popup-layer">
          <div class="pop-panel">
            <div class="pop-header">
              <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
              <div class="title-box">
                <span class="txt_title">온라인 경매 번호 인증</span>
              </div>
            </div>
            <div class="pop-body scroll-type">
              <section class="section">
                <div class="text-area">
                  <P class="text-base">온라인 경매 회차당 한번 번호 인증 후 경매에 참여하실 수 있습니다.</P>
                </div>
                <div class="form-area">
                  <div class="form_label">
                    <label for="name-1" class="mem_txt">휴대폰 인증</label>
                    <i>*</i>
                  </div>
                  <div class="form_body">
                    <div class="input-group">
                      <input type="text" id="name-1" class="form-control" value="" placeholder="">
                      <button class="btn btn_light_gray_line" type="button"><span>인증번호 요청</span></button>
                    </div>
                    <div class="re-check">
                      <div class="form_body">
                        <div class="input-group">
                          <input type="text" id="name-2" class="form-control" value="" placeholder="인증번호 입력">
                          <button class="btn btn_light_gray_line" type="button"><span>인증</span></button>
                        </div>
                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="accordion-area policy_accordion">
                  <div class="check_all-wrap js_all-1">
                    <ul class="accordion-list policy js-accordion_policy">
                      <li class="trp_acitem">
                        <div class="header-area">
                          <div class="accordion_name">
                            <div>
                              <label>온라인 응찰 안내</label>
                            </div>
                          </div>
                          <a href="#" class="acc_btn">
                            <i class="icon-accordion_arrow_down"></i>
                          </a>
                        </div>
                        <div class="con-area">
                          <div class="con-body">
                            <div class="text-area">
                              <ul class="mark_dot-list">
                                <li>낙찰 시, 낙찰금의 18%(부가세별도)의 구매수수료가 발생합니다.</li>
                                <li><em>응찰 및 낙찰은 취소가 불가능합니다.</em></li>
                                <li><em>낙찰 철회 시 낙찰가의 30%에 해당하는 낙찰철회비가 부과되오니 신중히 응찰 바랍니다.</em></li>
                                <li>응찰은 작품 컨디션 확인 후 진행 되는 것을 전제로 하며, 작품 컨디션에 액자 상태는 포함되지 않습니다.</li>
                                <li>마감시간 30초 내에 응찰이 있을 경우, 자동으로 30초 연장됩니다.</li>
                                <li>접속자의 컴퓨터, 인터넷 환경에 따라 반영 속도 차이가 있을 수 있으니 비딩 시 유의해 주시기 바랍니다.</li>
                                <li><em>[1회 응찰] 또는 [자동 응찰] 버튼을 누르시면 ‘확인안내 없이’ 바로 응찰이 되어 취소가 가능합니다.</em></li>
                                <li><em>남은 시간 1초 미만 시 응찰은 서버 반영 전 종료 될 수 있으니, 주의가 필요합니다.</em></li>
                                <li>[자동 응찰 중지하기]는 자동 응찰 ‘취소가 아닙니다’, 응찰자가 자동응찰을 중지하는 경우 중지 전까지의 응찰 및 낙찰은 유효합니다. 또한 자동응찰의 중지는 서버에 반영이 되는 시점에 효력이 발생하므로,<br class="only-pc"> <em>응찰자가 중지버튼을 클릭한 시점보다 더 높은 금액에 중지되고 이 금액에 낙찰 될 수 있습니다.</em></li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="trp_acitem">
                        <div class="header-area">
                          <div class="accordion_name">
                            <div class="trp checkbox-box">
                              <input id="checkbox_all" class="js_all" type="checkbox" name="">
                              <i></i>
                              <label for="checkbox_all">약관에 모두 동의합니다.</label>
                            </div>
                          </div>
                          <a href="#" class="acc_btn">
                            <i class="icon-accordion_arrow_down"></i>
                          </a>
                        </div>
                        <div class="con-area">
                          <div class="con-body">
                            <div class="text-area  check_item">
                              <ul class="">
                                <li>
                                  <div class="trp checkbox-box">
                                    <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                    <i></i>
                                    <label for="checkbox_all1">본인은 서울옥션 경매약관(<span><a href="#">바로가기</a></span>)을 모두 읽고<br class="only-pc"> 이해하였으며, 그 적용에 동의합니다.</label>
                                  </div>
                                </li>
                                <li>
                                  <div class="trp checkbox-box">
                                    <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                    <i></i>
                                    <label for="checkbox_all2">응찰은 작품 실물 및 컨디션을 확인하였음을 전제로 합니다.</label>
                                  </div>
                                </li>
                                <li>
                                  <div class="trp checkbox-box">
                                    <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                    <i></i>
                                    <label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다. 구매수수료는 낙찰금액의 18%(부가세 별도)입니다.</label>
                                  </div>
                                </li>
                                <li>
                                  <div class="trp checkbox-box">
                                    <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                    <i></i>
                                    <label for="checkbox_all4"><em>낙찰철회시 낙찰가의 30%에 해당하는 낙찰철회비가 부과됩니다.</em></label>
                                  </div>
                                </li>

                              </ul>
                            </div>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>

                  <div class="text-area">
                    <p class="tb2">
                      응찰 관련 문의가 있으신 경우,
                      귀하의 담당자<br class="only-mb">(<em id="data-manager-contact">홍길동 02-2075-4411</em>)에게 <br class="only-pc">연락주시기 바랍니다.
                    </p>
                  </div>
                </div>
                <div class="btn-area">
                  <div class="btn_set-float tac">
                    <a class="btn btn_gray_line close-auth-modal-btn" href="#" role="button">
                      <span>취소</span>
                    </a>
                    <a class="btn btn_point confirm-auth-modal-btn" href="#" role="button">
                      <span>확인</span>
                    </a>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- 번호인증 팝업 // -->