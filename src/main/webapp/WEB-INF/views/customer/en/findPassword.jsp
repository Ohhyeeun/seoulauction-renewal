<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<body>
<div class="wrapper">
    <div class="sub-wrap pageclass bgpage-wrap">
        <jsp:include page="../../include/en/nav.jsp" flush="false"/>
          <!-- container -->
        <div id="container">
            <div id="contents" class="contents">
                <section class="basis-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-searchid">
                            <div class="panel-header">
                                <div class="title">
                                    <p>Find Password</p>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-cont active" id="tab-cont-1">
                                    <div class="txt_wrap tt6">
                                        <ul class="mark_dot-list">
                                            <li>If the password is encrypted, it can not be retrieved if the password is lost.</li>
                                            <li>We will send you <em>a temporary password via email to your membership information.</em></li>
                                        </ul>
                                    </div>
                                    <div class="radio_wrap  js-menuType-header">
                                        <span class="trp radio-box">
                                           <input id="radio2-1" type="radio" name="radioSet2" value="email" checked>
                                            <i></i>
                                            <label for="radio2-2">Email</label>
                                        </span>
                                        <span class="trp radio-box">
                                            <input id="radio2-2" type="radio" name="radioSet2" value="phone" >
                                            <i></i>
                                            <label for="radio2-1">Mobile</label>
                                        </span>
                                    </div>
                                    <div class="js-menuType-body">
                                    <form id="phone">
                                        <div class="info_wrap  js-ds_item js-ds_item1" style="display: none;">
                                            <dl class="info_id">
                                                <dt>ID</dt>
                                                <dd><input type="text"  data-id="ID" id="custIdByPhone"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_name">
                                                <dt>NAME</dt>
                                                <dd><input type="text" data-id="NAME" id="custNameByPhone" class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>Mobile</dt>
                                                <dd><input type="text" data-id="Mobile"  id="custPhone"  maxLength=13 onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);" class="textType" onblur="phoneNumberBlur(this);"  placeholder="" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                        </form>
                                         <form id="email">
                                        <div class="info_wrap  js-ds_item js-ds_item0" >
                                            <dl class="info_id">
                                                <dt>ID</dt>
                                                <dd><input type="text" data-id="ID" id="custIdByEmail"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_name">
                                                <dt>NAME</dt>
                                                <dd><input type="text" data-id="NAME" id="custNameByEmail"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>Email</dt>
                                                <dd><input type="text" data-id="Email" id="custEmail"  class="textType" placeholder="" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                        </form>
                                    </div>
                                    <!--//[2022-0503]-->

                                    <article class="button-area search_btn">
                                        <div class="btn_set-float tac">
                                            <a class="btn btn_point" href="#" role="button" id="findPassword"><span>Find your password</span></a>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="panel-bottom">
                                <div class="info_box">
                                    <p><strong>Notification</strong></p>
                                    <ul class="mark_dot-list tb2">
                                        <li>If you cannot find your password, please email</li>
                                    </ul>
                                    <p class="info_txt">email :
                                        <span>
                                            <a href="mailto:info@seoulauction.com">info@seoulauction.com</a>
                                        </span>

                                    </p>
                                    <ul class="mark_dot-list tb2">
                                        <li><span>Forgot your ID?</span><a href="/findId?lang=en">find ID</a></li>
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

<div id="popup_idsearch3-wrap" class="trp popupfixed-wrap login-popup" style="display: none;">
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
                                <a class="btn btn_point" href="#" id="confirm_1" role="button"><span>OK</span></a>
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
                            <span class="title_tac tt4">A text has been sent.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_2" ><span>OK</span></a>
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
                            <span class="title_tac tt4">A mail has been sent.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_3" ><span>OK</span></a>
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
                            <span class="title_tac tt4">No matching member information found.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn confirm_btn_md">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_4" ><span>OK</span></a>
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
                            <span class="title_tac tt4">Members are registered <br class="only-mb">through social media.<br>
                                Please log in through the linked SNS.
                            </span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="sns_box sns_box_pw">
                            <p>Linked SNS : <span id="socialType">NAVER</span></p>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_5" ><span>OK</span></a>
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