<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="popup_online_confirm-wrap" class="trp popupfixed-wrap online_confirm-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_full footer_fixed">
        <div class="popup-vertical">
            <div class="popup-layer" style="display: inline-block;">
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
                                <p class="text-base">온라인 경매 회차당 한번 번호 인증 후 경매에 참여하실 수 있습니다.</p>
                            </div>
                            <div class="form-area">
                                <div class="form_label">
                                    <label for="name-1" class="mem_txt">휴대폰 인증</label>
                                    <i>*</i>
                                </div>
                                <div class="form_body">
                                    <div class="input-group">
                                        <input type="text" id="phone" class="form-control" value="" placeholder=""maxLength=13 onkeyup="onlyNumber(this);">
                                        <input type="hidden" id="cust_hp" value="" />
                                        <input type="hidden" id="is_sale_cert" value="" />
                                        <button class="btn btn_light_gray_line" type="button" onClick="authNumRequest()"><span id="authNumRequest">인증번호 요청</span></button>
                                    </div>
                                    <p class="error_text tb2 messageArea" id="messageArea1"></p>
                                    <div class="re-check">
                                        <div class="form_body">
                                            <div class="input-group">
                                                <input type="text" id="authNum" class="form-control" value="" placeholder="인증번호 입력" maxlength=6 onkeyup="onlyNumber(this, 'number');">
                                                <button class="btn btn_light_gray_line" type="button" onClick="authNumConfirm()"><span>인증</span></button>
                                            </div>
                                            <p class="error_text tb2 messageArea" id="messageArea2"></p>
                                            <p class="error_text tb2 messageArea" id="messageArea3"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- [0613] 전체수정 -->
                            <div class="inquiry_area">
                                <p>낙찰자가 ①지정된 기일에 낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을 낙찰철회비(위약금)로 납부하여야 합니다.</p>
                                <div class="inquiry_txt">
                                    <i class="icon-inquiry"></i>
                                    <span>낙찰철회시 낙찰가의 30%에 해당하는 낙찰철회비가 부과됩니다.</span>
                                </div>
                            </div>
                            <div class="accordion-area policy_accordion">
                                <div class="check_all-wrap js_all-1">
                                    <ul class="accordion-list policy js-accordion_policy">
                                        <li class="trp_acitem on" data-index="0">
                                            <div class="header-area">
                                                <div class="accordion_name">
                                                    <div class="trp checkbox-box">
                                                        <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all">모두 동의합니다.</label>
                                                    </div>
                                                </div>
                                                <a href="#" class="acc_btn">
                                                </a>
                                            </div>
                                            <div class="con-area" style="display: block;">
                                                <div class="con-body">
                                                    <div class="text-area  check_item">
                                                        <ul class="">
                                                            <li>
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all1"><em>본인은 서울옥션 경매약관(<span><a href="#">바로가기</a></span>)을 모두 읽고<br class="only-pc"> 이해하였으며, 그 적용에 동의합니다.</em></label>
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
                                                                    <label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에<br class="only-pc"> 구매수수료를 포함한 금액을 입금하여야 합니다.</label>
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
                                    <p class="tb2">응찰 관련 문의가 있으신 경우, 귀하의 담당자<br class="only-mb">(<em id="manager">고객관리자 02-395-0330</em>)에게 <br class="only-pc">연락주시기 바랍니다.
                                    </p>
                                </div>
                            </div>
                            <!-- //[0613] 전체수정 -->
                            <div class="btn-area">
                                <div class="btn_set-float tac">
                                    <!-- [0523]a 버튼 href에 # 삽입 -->
                                    <a class="btn btn_gray_line" href="#" role="button">
                                        <span>취소</span>
                                    </a>
                                    <a class="btn btn_point" href="#" role="button" onClick="saleCertSuccess();">
                                        <span>확인</span>
                                    </a>
                                    <!-- //[0523]a 버튼 href에 # 삽입 -->
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- [2022-0613] 스크립트수정 -->
<script>

</script>
<!-- // [2022-0613] -->