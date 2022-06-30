<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>
<body>
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
                                    <p>아이디 찾기</p>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-cont active" id="tab-cont-1">
                                    <div class="txt_wrap tt6">
                                        <ul class="mark_dot-list">
                                            <li>회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</li>
                                            <li>가입 시 입력한 정보를 입력하신 후 <strong>아이디 찾기 버튼을 클릭해<br class="only-pc"> 주세요.</strong></li>
                                        </ul>
                                    </div>
                                    <!--[2022-0503]//-->
                                    <div class="radio_wrap js-menuType-header">
                                        <span class="trp radio-box">
                                            <input id="radio2-1" type="radio" name="radioSet2" value="phone" checked>
                                            <i></i>
                                            <label for="radio2-1">휴대폰 번호로 찾기</label>
                                        </span>
                                        <span class="trp radio-box">
                                            <input id="radio2-2" type="radio" name="radioSet2" value="email" >
                                            <i></i>
                                            <label for="radio2-2">이메일로 찾기</label>
                                        </span>
                                    </div>
                                    <div class="js-menuType-body">
                                    <form id="phone">
                                        <div class="info_wrap js-ds_item js-ds_item0">
                                            <dl class="info_name">
                                                <dt>이름</dt>
                                                <dd><input type="text" data-id="이름을" class="textType" id="custNameByPhone" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>휴대폰 번호</dt>
                                                <dd><input type="text" data-id="휴대폰 번호를"  class="textType" id="custPhone" placeholder="" maxLength=13 onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);"  style="width:100%"></dd>
                                            </dl>
                                        </div>
                                    </form>
                                    <form id="email">
                                        <div class="info_wrap js-ds_item js-ds_item1" style="display: none;">
                                            <dl class="info_name">
                                                <dt>이름</dt>
                                                <dd><input type="text" data-id="이름을" class="textType" id="custNameByEmail" placeholder="" style="width:100%"></dd>
                                            </dl>
                                            <dl class="info_number">
                                                <dt>이메일 주소</dt>
                                                <dd><input type="text" data-id="이메일을"  class="textType" id="custEmail" placeholder="" style="width:100%"></dd>
                                            </dl>
                                        </div>
                                     </form>
                                    </div>
                                    <!--//[2022-0503]-->

                                    <article class="button-area search_btn">
                                        <div class="btn_set-float tac">
                                            <a class="btn btn_point" href="#" role="button" id="findId"><span>아이디 찾기</span></a>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <div class="panel-bottom">
                                <div class="info_box">
                                    <p><strong>안내사항</strong></p>
                                    <ul class="mark_dot-list tb2">
                                        <li>아이디를 찾으실 수 없을 경우, 대표번호 02-395-0330로<br class="only-pc"> 연락바랍니다.</li>
                                        <li>해외 국적으로 가입하신 회원은 서울옥션 영문홈페이지를<br class="only-pc"> 이용해 주세요.</li>
                                    </ul>
                                    <p class="info_txt">Please, foreigners use English pages.</p>
                                    <div class="btn_set">
                                        <a class="btn btn_gray_line" href="/findId?lang=en">
                                            <span>SeoulAuction ENG</span>
                                        </a>
                                    </div>
                                    <ul class="mark_dot-list tb2">
                                        <li><span>비밀번호를 찾으시나요?</span><a href="/findPassword">비밀번호찾기</a></li>
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

<script type="text/javascript" src="/js/customer/findId.js"></script>

  <!-- 아이디찾기-아이디 검색 결과 -->
<div id="popup_idsearch1-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box_tac">
                            <span class="title_tac tt4">회원님의 아이디는<br class="only-mb"> <strong id="custId"></strong> 입니다</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="info_box">
                            <ul class="tb2 mark_dot-list">
                                <li>개인정보 보호를 위해 아이디 일부는 *로 표시됩니다.</li>
                                <li>아이디가 확인되지 않을 경우 이름과 등록시 입력한 이메일을 확인 후 다시 조회 부탁드립니다.</li>
                                <li>아이디를 찾으실 수 없을 경우, 대표번호 02-395-0330로 연락바랍니다.</li>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point " href="#" role="button" id="confirm_1"><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- 아이디찾기-일치하는 정보가 없을 경우 -->
<div id="popup_idsearch2-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box_tac">
                        <div class="title-box_tac">
                            <span class="title_tac tt4">일치하는 회원 정보가 없습니다.</span>

                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="info_box">
                            <ul class="tb2 mark_dot-list">
                                <li>아이디가 확인되지 않을 경우 이름과 등록시 입력한 이메일을 확인 후 다시 조회 부탁드립니다.</li>
                                <li>아이디를 찾으실 수 없을 경우, 대표번호 02-395-0330로 연락바랍니다.</li>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_2"><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- 아이디찾기-항목 미입력 -->
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
                                <a class="btn btn_point" href="#" role="button" id="confirm_3"><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 아이디찾기-소셜 회원인 경우-->
<div id="popup_idsearch4-wrap" class="trp popupfixed-wrap login-popup">
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
                            </span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="sns_box">
                            <p>연동 SNS : <span id ="socialType" ></span></p>
                        </div>
                        <div class="info_box">
                            <ul class="tb2 mark_dot-list">
                                <li>아이디가 확인되지 않을 경우 이름과 등록시 입력한 이메일을 확인 후 다시 조회 부탁드립니다.</li>
                                <li>아이디를 찾으실 수 없을 경우, 대표번호 02-395-0330로 연락바랍니다.</li>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" href="#" role="button" id="confirm_4"><span>확인</span></a>
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