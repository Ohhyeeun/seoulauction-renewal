<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>POPUP | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <!-- //header -->
</head>

<body>
    <div class="wrapper">
        <div class="sub-wrap pageclass">
            <!-- container -->
            <div id="container">
                <div id="contents" class="contents ">

                    <section class="basis-section last-section">
                        <div class="section-inner">
                            <a class="btn btn_default js-popup_online_confirm mt10" href="#" role="button"><span>온라인 경매 번호 인증</span><i class="icon-page_next"></i></a>
                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <footer class="footer">
                <div class="innerfooter">
                    <section class="flex_wrap footer_menubox">
                        <ul class="footer-gnbmenu">
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">언론보도</a></li>
                            <li><a href="#">채용공고</a></li>
                            <li><a href="#">위치안내</a></li>
                            <li><a href="#">고객센터</a></li>
                        </ul>

                        <ul class="snsbox_icon">
                            <li><a href="#" class="sns-icon sns-icon01"></a></li>
                            <li><a href="#" class="sns-icon sns-icon02"></a></li>
                            <li><a href="#" class="sns-icon sns-icon03"></a></li>
                            <li><a href="#" class="sns-icon sns-icon04"></a></li>
                            <li><a href="#" class="sns-icon sns-icon05"></a></li>
                        </ul>
                    </section>
                    <section class="flex_wrap footer_infobox">
                        <div class="footer-infomenubox">
                            <ul class="flex_wrap footer-infomenu">
                                <li><a href="#">경매약관</a></li>
                                <li><a href="#">개인정보처리방침</a></li>
                                <li><a href="#">내부관리규정</a></li>
                            </ul>

                            <div class="Familysite-selectbox">
                                <span class="Familysite">Family Site</span>
                                <ul class="familyselect">
                                    <li><a href="https://www.auctionblue.com/index" target="_blank">Print Bakery</a></li>
                                    <li><a href="https://printbakery.com/" target="_blank">Auction Blue</a></li>
                                    <li><a href="https://sotwo.com/" target="_blank">SOTOW</a></li>
                                </ul>
                            </div>
                        </div>

                        <p class="bottom-p-spacing20">
                            ㈜서울옥션 · 대표이사 : 이옥경 사업자등록번호 : 101-81-46818 통신판매업신고 : 종로 제01-2173호<br>
                            주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10) 고객센터 : 02-395-0330<br>
                            ⓒ Seoul Auction Corp.
                        </p>
                        <p>
                            (주)서울옥션이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)서울옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                            따라서 (주)서울옥션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
                        </p>
                    </section>
                </div>
            </footer>
            <!-- //footer -->

            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>
    </div>

    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>





    <div id="popup_online_confirm-wrap" class="trp popupfixed-wrap online_confirm-popup ">
        <div class="popup-dim"></div>
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
                                                        <div class="trp checkbox-box">
                                                            <input id="checkbox_01" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_01"><span class="required">[필수]</span> 온라인 응찰 안내</label>
                                                        </div>
                                                    </div>
                                                    <a href="#" class="acc_btn">
                                                        <i class="icon-accordion_arrow_down"></i>
                                                    </a>
                                                </div>
                                                <div class="con-area">
                                                    <div class="con-header">
                                                        <div class="policy_cont">
                                                            <div class="trp checkbox-box">
                                                                <input id="checkbox_01" class="" type="checkbox" name="">
                                                                <i></i>
                                                                <label for="checkbox_01 tb1">확인 하였습니다.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="con-body">
                                                        <div class="text-area scroll-type">
                                                            <ul>
                                                                <li>낙찰 시, 낙찰금의 18%(부가세별도)의 구매수수료가 발생합니다.</li>
                                                                <li class="point_item">응찰 및 낙찰은 취소가 불가능합니다. 낙찰 철회 시 낙찰가의 30%에 해당하는 낙찰철회비가 부과되오니 신중히 응찰 바랍니다.</li>
                                                                <li>응찰은 작품 컨디션 확인 후 진행 되는 것을 전제로 하며, 작품 컨디션에 액자 상태는 포함되지 않습니다.</li>
                                                                <li>마감시간 30초 내에 응찰이 있을 경우, 자동으로 30초 연장됩니다.</li>
                                                                <li>접속자의 컴퓨터, 인터넷 환경에 따라 반영 속도 차이가 있을 수 있으니 비딩 시 유의해 주시기 바랍니다.</li>
                                                                <li class="point_item">[1회 응찰] 또는 [자동 응찰] 버튼을 누르시면 ‘확인안내 없이’ 바로 응찰이 되어 취소가 가능합니다.</li>
                                                                <li class="point_item">남은 시간 1초 미만 시 응찰은 서버 반영 전 종료 될 수 있으니, 주의가 필요합니다.</li>
                                                                <li>[자동 응찰 중지하기]는 자동 응찰 ‘취소가 아닙니다’, 응찰자가 자동응찰을 중지하는 경우 중지 전까지의 응찰 및 낙찰은 유효합니다. 또한 자동응찰의 중지는 서버에 반영이 되는 시점에 효력이 발생하므로, <em>응찰자가 중지버튼을 클릭한 시점보다 더 높은 금액에 중지되고 이 금액에 낙찰 될 수 있습니다.</em></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="trp_acitem">
                                                <div class="header-area">
                                                    <div class="accordion_name">
                                                        <div class="trp checkbox-box">
                                                            <input id="checkbox_02" class="js_item" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_02"><span class="required">[필수]</span> 약관 동의 안내</label>
                                                        </div>
                                                    </div>
                                                    <a href="#" class="acc_btn">
                                                        <i class="icon-accordion_arrow_down"></i>
                                                    </a>
                                                </div>
                                                <div class="con-area">
                                                    <div class="con-header">
                                                        <div class="policy_cont">
                                                            <div class="trp checkbox-box">
                                                                <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                                                <i></i>
                                                                <label for="checkbox_all tb1">모두 동의합니다.</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="con-body">
                                                        <div class="text-area scroll-type check_item">
                                                            <ul class="">
                                                                <li>
                                                                    <div class="trp checkbox-box">
                                                                        <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                                        <i></i>
                                                                        <label for="checkbox_all1">본인은 서울옥션 경매약관(바로가기)을 모두 읽고 이해하였으며, 그 적용에 동의합니다.</label>
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
                                                                        <label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다.</label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="trp checkbox-box">
                                                                        <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                                        <i></i>
                                                                        <label for="checkbox_all4">낙찰자가 ①지정된 기일에 낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을 낙찰철회(위약금)로 납부하여야 합니다.</label>
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
                                        <p class="tb2">응찰 관련 문의가 있으신 경우, 귀하의 담당자(<em>홍길동 02-2075-4411</em>)에게 <br class="only-pc">연락주시기 바랍니다.
                                        </p>
                                    </div>
                                </div>
                                <div class="btn-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_gray_line" href="" role="button">
                                            <span>취소</span>
                                        </a>
                                        <a class="btn btn_point" href="" role="button">
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
    <script>
        (function() {
            var popup_offline_payment = $(".js-popup_online_confirm").trpLayerFixedPopup("#popup_online_confirm-wrap");
            $(popup_offline_payment.getBtn).on("click", function($e) {
                $e.preventDefault();
                console.log("open11")
                popup_offline_payment.open(this); // or false 
                popup_fixation("#popup_online_confirm-wrap"); // pc 하단 붙이기
            });

            $("body").on("click", "#popup_online_confirm-wrap .js-closepop, #popup_online_confirm-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_offline_payment.close();
            });


            /* 아코디언 */
            var pop_accordion = $(".js-accordion-btn").trpToggleBtn(
                function($this) {
                    $($this).addClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideDown("fast");
                },
                function($this) {
                    $($this).removeClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideUp("fast");
                });

        })();
    </script>
    <script>
        //비밀번호마스킹버튼
        $('.js-pw_mask').click(function() {
            $(this).toggleClass('on');
        })

        //약관아코디언
        $(".js-accordion_policy").trpAccordionMenu(".acc_btn", ".con-area", "on");
        //약관체크
        $(".js_all-1").trpCheckBoxAllsImg(".js_all", ".js_item");

        //     if($("#license_check").is(":checked")){
        //   $('.license_input').prop("type", "password");
        // }else{
        //   $('.license_input').prop("type", "text");
        // }
    </script>
</body>

</html>