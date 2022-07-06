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
                                    <p>Find ID</p>
                                 </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-cont active" id="tab-cont-1">
                                    <div class="txt_wrap tt6">
                                        <ul class="mark_dot-list">
                                            <li>You can find the ID by the information registered in the member information.</li>
                                            <li>Enter your information that you entered when you signed up and <strong>click the Find ID button.</strong></li>
                                        </ul>
                                    </div>
                                    <!--[2022-0503]//-->
                                    <div class="radio_wrap js-menuType-header">
                                        <span class="trp radio-box">
                                            <input id="radio2-1" type="radio" name="radioSet2" value="email" checked>
                                            <i></i>
                                            <label for="radio2-1">Email</label>
                                        </span>
                                        <span class="trp radio-box">
                                           <input id="radio2-2" type="radio" name="radioSet2" value="phone" >
                                            <i></i>
                                            <label for="radio2-2">Mobile</label>
                                        </span>
                                    </div>
                                    <div class="js-menuType-body">
                                         <form id="email">
                                        <div class="info_wrap js-ds_item js-ds_item0">
                                            <dl class="info_name">
                                                <dt>NAME</dt>
                                                <dd><input type="text" data-id="NAME" class="textType" id="custNameByEmail" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>Email</dt>
                                                <dd><input type="text" data-id="Email" class="textType" id="custEmail" placeholder="" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                        </form>
                                           <form id="phone">
                                        <div class="info_wrap js-ds_item js-ds_item1"  style="display: none;">
                                            <dl class="info_name">
                                                <dt>NAME</dt>
                                                <dd><input type="text" data-id="NAME" class="textType" id="custNameByPhone" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>Mobile</dt>
                                                <dd><input type="text" data-id="Mobile" class="textType" id="custPhone" placeholder="" maxLength=13 onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);"  onblur="phoneNumberBlur(this);" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                        </form>
                                    </div>
                                    <!--//[2022-0503]-->

                                    <article class="button-area search_btn">
                                        <div class="btn_set-float tac">
                                            <a class="btn btn_point" href="#" role="button" id="findId"><span>Find your ID</span></a>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="panel-bottom">
                                <div class="info_box">
                                    <p><strong>Notification</strong></p>
                                    <ul class="mark_dot-list tb2">
                                        <li>If you can not find your ID, please</li>
                                    </ul>
                                    <p class="info_txt">email :
                                        <span>
                                            <a href="mailto:info@seoulauction.com">info@seoulauction.com</a>
                                        </span>
                                    </p>

                                    <ul class="mark_dot-list tb2">
                                        <li><span>Forgot your password?</span><a href="/findPassword?lang=en">find password</a></li>
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
              <jsp:include page="../../include/en/footer.jsp" flush="false"/>
        <!-- //footer --><!-- stykey -->

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
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/customer/findId.js"></script>

  <!-- 아이디찾기-아이디 검색 결과 -->
<div class="popup-dim popup_idsearch1-wrap"  style="display: none;"></div>
<div id="popup_idsearch1-wrap" class="trp popupfixed-wrap login-popup popup_idsearch1-wrap" style="display: none;">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box_tac">
                            <span class="title_tac tt4">Your ID is<br class="only-mb"> <strong id="custId"></strong></span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="info_box">
                            <ul class="tb2 mark_dot-list">
                                <li>For privacy protection, some IDs are marked with *.</li>
                                <li>If your ID is not verified, please check your name and e-mail entered during registration and check again.</li>
                                <li>If you cannot find your ID, please email <a href="mailto:info@seoulauction.com">info@seoulauction.com</a>.</li>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point js-closepop" href="#" role="button"><span>OK</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 아이디찾기-일치하는 정보가 없을 경우 -->
<div class="popup-dim popup_idsearch2-wrap"  style="display: none;"></div>
<div id="popup_idsearch2-wrap" class="trp popupfixed-wrap login-popup popup_idsearch2-wrap" style="display: none;">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box_tac">
                            <span class="title_tac tt4">No matching member information found.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="info_box">
                             <ul class="tb2 mark_dot-list">
                                <li>If your ID is not verified, please check your name and e-mail entered during registration and then check again.</li>
                                <li>If you cannot find your ID, please </li>
                                <p class="info_txt">email <span><a href="mailto:info@seoulauction.com">info@seoulauction.com</a></span></p>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point js-closepop" href="#" role="button"><span>OK</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 아이디찾기-항목 미입력 -->
<div class="popup-dim popup_idsearch3-wrap"  style="display: none;"></div>
<div id="popup_idsearch3-wrap" class="trp popupfixed-wrap login-popup popup_idsearch3-wrap" style="display: none;">
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
                                <a class="btn btn_point js-closepop" href="#" role="button"><span>OK</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 아이디찾기-소셜 회원인 경우-->
<div class="popup-dim popup_idsearch4-wrap"  style="display: none;"></div>
<div id="popup_idsearch4-wrap" class="trp popupfixed-wrap login-popup popup_idsearch4-wrap" style="display: none;">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box_tac">
                             <span class="title_tac tt4">Members are registered<br class="only-mb"> through social media.<br>
                                Please log in through the linked SNS.
                            </span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="sns_box">
                             <p>Linked SNS : <span id="socialType">NAVER</span></p>
                        </div>
                        <div class="info_box">
                            <ul class="tb2 mark_dot-list">
                                <li>If your ID is not verified, please check your name and e-mail entered during registration and then check again.</li>
                                <li>If you cannot find your ID, please</li>
                                <p class="info_txt">email <span><a href="mailto:info@seoulauction.com">info@seoulauction.com</a></span></p>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point js-closepop" href="#" role="button"><span>OK</span></a>
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