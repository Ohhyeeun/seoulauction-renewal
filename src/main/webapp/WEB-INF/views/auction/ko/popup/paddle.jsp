<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 약관동의 안내 (필수) -->
<div id="terms_required-wrap" class="trp popupfixed-wrap terms_required-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_full">
        <div class="popup-vertical">
            <div class="popup-layer">

                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span class="txt_title">약관 동의 안내 (필수)</span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">

                            <article class="terms_required-article js_all-terms">
                                <table class="table_base data-table">
                                    <thead>
                                    <tr>
                                        <th class="tal">
                                            <span class="trp checkbox-box">
                                                <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                                <i></i>
                                                <label for="checkbox_all">약관 전체 동의</label>
                                            </span>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="tal">
                                            <div class="trp checkbox-box">
                                                <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                <i></i>
                                                <label for="checkbox_all1">본인은 서울옥션 경매약관 [약관 바로보기]를
                                                    모두 읽고 이해하였으며 그 적용에 동의합니다.</label>
                                                <!-- [0523]약관 바로보기 링크 삽입 -->
                                                <a href="#">[약관 바로보기]</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tal">
                                            <div class="trp checkbox-box">
                                                <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                                <i></i>
                                                <label for="checkbox_all2">응찰은 작품 실물 및 컨디션을 확인하였음을
                                                    전제로 합니다.</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tal">
                                            <div class="trp checkbox-box">
                                                <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                                <i></i>
                                                <label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가 3억원 이상인
                                                    경우 21일 이내)에 구매수수료를 포함한
                                                    금액을 입금하여야 합니다. 구매수수료는
                                                    낙찰금액의 18%(부가세 별도) 입니다.</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tal">
                                            <div class="trp checkbox-box">
                                                <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                <i></i>
                                                <label for="checkbox_all4">낙찰자가 지정된 기일에 낙찰대금을 납부하지
                                                    않거나, 부득이 낙찰을 철회하는 경우,
                                                    낙찰가의 30%에 해당하는 금액을 낙찰철회비
                                                    (위약금)로 납부하여야 합니다.</label>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="btn_bottom">
                                    <div class="btn_set">
                                        <a class="btn btn_point js-paddle_number" href="#" role="button"><span>동의</span></a>
                                    </div>
                                </div>
                            </article>

                        </section>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- 패들번호 부여 -->
<div id="paddle_number-wrap" class="trp popupfixed-wrap paddle_number-popup ">
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

                            <article class="paddle_number-article">
                                <div class="header-article">
                                    <div class="title"><span>패들번호 부여</span></div>
                                </div>
                                <div class="body-article">
                                    <div class="paddle-box">
                                        <span>고객님의 패들 넘버는</span>
                                        <em id="paddle-number">123번</em>
                                        <span>입니다.</span>
                                    </div>
                                    <div class="gray-box">
                                        <ul class="mark_dot-list">
                                            <li>온라인 실시간 응찰은 철회가 불가합니다. </li>
                                            <li>응찰 우선순위는 서면 > 현장 > 온라인 순입니다. </li>
                                            <li>동영상의 금액은 시차가 있을 수 있으니, 응찰 화면의 응찰가를 확인하시고 응찰해주시기 바랍니다. </li>
                                            <li>경매당일 4시부터 실시간 라이브 응찰이 가능합니다.</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="footer-article">
                                    <div class="btn_set-float tac">
                                        <a id="btn-paddle-number" class="btn btn_point" href="#" role="button"><span>확인</span></a>
                                    </div>
                                </div>
                            </article>

                        </section>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    (function() {
        //약관체크
        $(".js_all-terms").trpCheckBoxAllsImg(".js_all", ".js_item");

        var paddle_number = $(".js-paddle_number").trpLayerFixedPopup("#paddle_number-wrap");
        $(paddle_number.getBtn).on("click", function($e) {
            $e.preventDefault();

            if($(".js_all-terms #checkbox_all").is(":checked")) {
                fetch('/api/auction/paddle', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        'sale_no' : '${saleNo}'
                    })
                })
                    .then(res => res.json())
                    .then(res => {
                        $("em#paddle-number").html(res.data+"번");
                    });

                terms_required.close();
                paddle_number.open(this); // or false
                popup_fixation("#paddle_number-wrap");
                $(".js_all-terms input[type='checkbox']").prop("checked", false);
            } else {
                alert("약관에 동의해주세요.");
            }
        });

        $("body").on("click", "#paddle_number-wrap .js-closepop, #paddle_number-wrap .popup-dim, #paddle_number-wrap #btn-paddle-number", function($e) {
            $e.preventDefault();
            paddle_number.close();
        });
    })();
</script>