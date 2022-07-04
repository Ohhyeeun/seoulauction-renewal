<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<div class="wrapper">
    <div class="sub-wrap pageclass bgpage-wrap">
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
          <!-- container -->
        <div id="container">
            <div id="contents" class="contents">
                <section class="basis-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-searchid">
                            <div class="panel-header">
                                <div class="title">
                                    <p>비밀번호 찾기</p>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-cont active" id="tab-cont-1">
                                    <div class="txt_wrap tt6">
                                        <ul class="mark_dot-list">
                                            <li>비밀번호의 경우, 암호화 저장되어 분실 시 찾아드릴 수 없습니다.</li>
                                            <li><em>회원정보에 등록된 이메일로 임시 비밀번호를 발송</em>해 드립니다.</li>
                                        </ul>
                                    </div>
                                    <!--[2022-0503]//-->
                                    <div class="radio_wrap  js-menuType-header">
                                        <span class="trp radio-box">
                                            <input id="radio2-1" type="radio" name="radioSet2" value="phone" checked>
                                            <i></i>
                                            <label for="radio2-1">휴대폰 번호로 찾기</label>
                                        </span>
                                        <span class="trp radio-box">
                                            <input id="radio2-2" type="radio" name="radioSet2" value="email">
                                            <i></i>
                                            <label for="radio2-2">이메일로 찾기</label>
                                        </span>
                                    </div>
                                    <div class="js-menuType-body">
                                        <form id="phone">
                                        <div class="info_wrap  js-ds_item js-ds_item0">
                                            <dl class="info_id">
                                                <dt>아이디</dt>
                                                <dd><input type="text" data-id="아이디를" id="custIdByPhone"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_name">
                                                <dt>이름</dt>
                                                <dd><input type="text" data-id="이름을" id="custNameByPhone" class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>휴대폰 번호</dt>
                                                <dd><input type="text"  data-id="휴대폰 번호를" id="custPhone"  maxLength=13 onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);" onblur="phoneNumberBlur(this);" class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                        </form>
                                        <form id="email">
                                        <div class="info_wrap  js-ds_item js-ds_item1" style="display: none;">
                                            <dl class="info_id">
                                                <dt>아이디</dt>
                                                <dd><input type="text" data-id="아이디를" id="custIdByEmail"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_name">
                                                <dt>이름</dt>
                                                <dd><input type="text" data-id="이름을" id="custNameByEmail"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>이메일 주소</dt>
                                                <dd><input type="text" data-id="이메일을" id="custEmail"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                        </form>
                                    </div>
                                    <!--//[2022-0503]-->

                                    <article class="button-area search_btn">
                                        <div class="btn_set-float tac">
                                            <a class="btn btn_point" href="#" role="button" id="findPassword"><span>비밀번호 찾기</span></a>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="panel-bottom">
                                <div class="info_box">
                                    <p><strong>안내사항</strong></p>
                                    <ul class="mark_dot-list tb2">
                                        <li>해외 국적으로 가입하신 회원은 서울옥션 영문홈페이지를<br class="only-pc"> 이용해 주세요.</li>
                                    </ul>
                                    <p class="info_txt">Please, foreigners use English pages.</p>
                                    <div class="btn_set">
                                        <a class="btn btn_gray_line" href="/findPassword?lang=en">
                                            <span>SeoulAuction ENG</span>
                                        </a>
                                    </div>
                                    <ul class="mark_dot-list tb2">
                                        <li><span>아이디를 찾으시나요?</span><a href="/findId">아이디찾기</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
             <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
        <!-- //footer -->

    </div>
</div>


<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/customer/findPassword.js"></script>


<script>
    /*아이디찾기선택 */
    $('.js-menuType-header input').on('change', function() {
        $('.js-menuType-body .js-ds_item').hide();
        var idx = $('.js-menuType-header input').index($('.js-menuType-header input:checked'));
        $('.js-menuType-body .js-ds_item' + idx).show();

        if (idx >= 1) {
            $(".js-ds_item2_check").hide();
        } else {
            $(".js-ds_item2_check").show();
        }
    });
</script>

<div id="popup_idsearch3-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="ico_box">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
                        </div>
                        <div class="title-box_tac title_md">
                            <span class="title_tac tt4" id="inputTitle"></span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" id="confirm_1" role="button"><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호찾기-휴대폰 번호로 찾기 -->
<div id="popup_pwsearch1-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="ico_box">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_02_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_02.png">
                        </div>
                        <div class="title-box_tac title_md">
                            <span class="title_tac tt4">문자가 발송되었습니다.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_2" ><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호찾기-이메일로 찾기 -->
<div id="popup_pwsearch2-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="ico_box">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_03_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_03.png">
                        </div>
                        <div class="title-box_tac title_md">
                            <span class="title_tac tt4">메일이 발송되었습니다.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_3" ><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호찾기-일치정보가 없을 경우 -->
<div id="popup_pwsearch3-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="ico_box">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
                        </div>
                        <div class="title-box_tac title_md">
                            <span class="title_tac tt4">일치하는 회원정보가 없습니다.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_4" ><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호찾기-소셜 회원인 경우-->
<div id="popup_pwsearch4-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box_tac">
                            <span class="title_tac tt4">회원님은 SNS를 통해 <br class="only-mb">회원가입 되어 있습니다.<br>
                                연동된 SNS를 통해 로그인 하여<br class="only-mb"> 주시기 바랍니다.
                            </span>1
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="sns_box sns_box_pw">
                            <p>연동 SNS : <span id="socialType"></span></p>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_5" ><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
  
