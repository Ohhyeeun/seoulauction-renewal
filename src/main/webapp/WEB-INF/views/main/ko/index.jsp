<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../../include/ko/header.jsp" flush="false">
    <jsp:param name="main" value="true"/>
</jsp:include>
<script>
window.addEventListener('DOMContentLoaded', () => {
    console.log("theme ", localStorage.getItem('theme'));

    $('*').toggleClass(localStorage.getItem('theme'));

    $('.auctionTab-btn').click(function () {
        const darkIngTab = $(this).index();
        $('.auctionTab-btn').removeClass('dark');
        $('.auctionTab-contents').removeClass('dark');

        $(this).addClass('dark');
        $(".auctionTab-contents").eq(darkIngTab).addClass('dark');
    });

    $('.darktxt').text('다크모드로 보기');
    $('.darktxt.dark').text('라이트모드로 보기');
    $('.darktxt-en').text('Dark Mode');
    $('.darktxt-en.dark').text('Ligth Mode');

    $('.mode-toggle>input').addClass(localStorage.getItem('theme'));
});
</script>
<body>
<%--<jsp:include page="../../main/include/topNotice.jsp" />--%>
<jsp:include page="../../include/ko/nav.jsp" flush="false"/>
<section class="main-contents footer-bottom footer-bottom40">
    <jsp:include page="../include/bigBanner.jsp" />

    <%--auction--%>
    <div class="wrap">
        <section class="container wrap_padding">
            <section class="auction-contents">
                <div class="auction-tit">
                    <h1 class="main-sectiontit">Auction</h1>
                    <div class="auctiontab-scroll">
                        <div class="auctionTab"> <!-- 최대 5개 까지 --></div>
                    </div>
                </div>
                <div id="auction_contents">
<%--                    <div class="flex_wrap auctionTab-contents on"></div>--%>
<%--                    <div class="flex_wrap auctionTab-contents"></div>--%>
<%--                    <div class="flex_wrap auctionTab-contents"></div>--%>
<%--                    <div class="flex_wrap auctionTab-contents"></div>--%>
<%--                    <div class="flex_wrap auctionTab-contents"></div>--%>
                </div>
                <div class="commonbtn-box">
                    <button type="button" id="MoreAuction" class="commonbtn">더보기</button>
                    <a href="javascript:void(0);" id="AllAuction" style="display: none" class="commonbtn">전체보기</a>
                </div>
            </section>
        </section>
    </div>

    <jsp:include page="../../main/include/upcoming.jsp" />

    <jsp:include page="../include/beltBanner.jsp" />

    <jsp:include page="../include/video.jsp" />

    <div class="wrap article-contents">
        <section class="container">
            <section class="flex_wrap sale-contents">
                <figure class="sale-box">
                    <img src="/images/pc/banner/buy.jpg" alt="buy img" class="pc-ver">
                    <img src="/images/mobile/banner/buy.jpg" alt="buy img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Buy</h2>
                        <p>회원가입부터 응찰까지<br>
                            누구나 쉽게 경매에 참여 할 수 있습니다.</p>
                        <a href="/auction/info">경매안내</a>
                    </figcaption>
                </figure>
                <figure class="sale-box">
                    <img src="/images/pc/banner/sell.jpg" alt="sell img" class="pc-ver">
                    <img src="/images/mobile/banner/sell.jpg" alt="sell img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Sell</h2>
                        <p>고객님의 소중한 작품을 기다립니다.<br>
                            서울옥션에 문의하세요</p>
                        <a href="/sell/consignment">위탁안내</a>
                    </figcaption>
                </figure>
            </section>

            <aticle class="flex_wrap article-contents">
                <div class="familysite-box">
                    <h3 class="main-sectiontit familySite-tit">Family Site</h3>
                    <div class="flex_wrap familysiteContents">
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">서울옥션 블루</p>
                                <p class="family-infotxt tit-size16">해외경매대행 "미술을 직구하다"</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://www.auctionblue.com">
                                    <img src="/images/pc/banner/FamilyBanner_01_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_01_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">SOTWO</p>
                                <p class="family-infotxt tit-size16">미술품 공동구매 플랫폼</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://sotwo.com">
                                    <img src="/images/pc/banner/FamilyBanner_02_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_02_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">프린트 베이커리</p>
                                <p class="family-infotxt tit-size16">일상의 예술을 맛보다.</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://printbakery.com">
                                    <img src="/images/pc/banner/FamilyBanner_03_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_03_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="newsletter-box">
                    <h3 class="main-sectiontit newsLetter-tit">Newsletter</h3>
                    <form action="" class="newsletter-formbox">
                        <fieldset class="newsletter-form">
                            <input id ="newsEmail" type="email" placeholder="이메일 주소">
                            <input id ="newsName" type="text" placeholder="이름">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span id="news_sub_label" class="terms-checktxt">개인정보 수집 및 이용에 동의 합니다.</span>
                            </label>
                        </fieldset>
                    </form>
                    <div class="flex_wrap newsletter-btnbox">
                        <button type="button" class="commonbtn btn-bg-b subscriptBtn">구독하기</button>
                        <a href="/newsletter" class="commonbtn btn-border-3">
                            <span>지난 뉴스레터 보기</span>
                        </a>
                    </div>
                </div>

            </aticle>
        </section>
    </div>
    <jsp:include page="../../include/ko/footer.jsp" flush="false">
        <jsp:param name="main" value="true"/>
    </jsp:include>
    <!-- //wrap -->
</section>
<!-- 다크모드 darkmode -->
<span class="darkmodeBg pc-ver">
    <button class="darkmode" type="button"></button><span class="darktxt">다크모드로 보기</span>
</span>
<!--scroll top-->
<a href="javascript:void(0);" class="scroll-top">
    <span class="topBtn up"></span>
</a>

<!-- 뉴스레터 팝업 -->
<jsp:include page="popup/newsletter.jsp" flush="false"/>

<!-- video 팝업 -->
<div class="blackBg video-blackBg" id="videoLayerPopup">
    <div class="video-playbox">
        <div class="video-closebtn closebtn closebtn-w"></div>
        <div class="video-play">

        </div>
    </div>
</div>

<%-- main 레이어 팝업 --%>
<div class="blackBg main-popupBg">
    <div class="main-popupwrap">
        <div class="main-popupbox">
            <a href="javascript:void(0);" id="main_popup_a_link"  title="메인 팝업 이미지">
                <div class="main-popup-img"> <!-- 이미지 레이어팝업 -->
                    <img id="main_popup_img" <%--src="/images/pc/main/pop_event.jpg"--%> alt="레이어팝업 이미지">
                </div>
            </a>

            <!-- 텍스트 레이어팝업 on-->
            <a href="javascript:void(0);" title="메인 팝업 텍스트">
                <div class="main-popup-txt"> 
                    <div class="main-popup-caption">
                        <h2 id="main_popup_title">국내 오프라인 경매 구매수수료율 인상 및 약관 개정 안내</h2>
                        <p id="main_popup_content">항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                        항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
<%--                        <p class="main-popup-green">변경 전 -15%(부가세 별도)</p>--%>
                    </div>
                </div>
            </a>
            <div class="main-popup-close">
                <span id="main_popup_today_stop_btn">오늘 그만보기</span>
                <span class="main-popup-closebtn closebtn closebtn-w"></span>
            </div>
        </div>
    </div>
</div>
<!-- 이중접속 차단 안내 -->
<div id="popup_concurrent-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="javascript:void(0);" title="닫기">X</a>
                        <div class="ico_box">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
                        </div>
                        <div class="title-box_tac title_concurrent">
                            <span class="title_tac">회원님과 동일한 아이디로 다른 PC에서 동시 접속하여 
                                자동으로 로그아웃 되었습니다.<br>
                                ⁠본인이 아닌 경우 다시 로그인을 하시거나,<br class="only-pc">
                                고객센터에 문의해 주세요.</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" id="confirmMaxSession" href="javascript:void(0);" role="button"><span>확인</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호변경알림-비밀번호초기화 -->
<div id="popup_pwsearch6-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="javascript:void(0);" title="닫기">X</a>
                        <div class="ico_box change_ico">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_04_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_04.png">
                        </div>
                        <div class="title-box_tac change_title">
                            <p class="">초기화 비밀번호 변경 안내</p>
                            <p class="title_sub">관리자에 의해 비밀번호가 초기화 되었습니다.<br> 안전한 개인정보 보호를 위해<br class="only-mb"> 비밀번호를 변경해 주세요</p>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn changenew_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_gray_line" onClick="closeResetPassword()" href="javascript:void(0);" role="button"><span>닫기</span></a>
                                <a class="btn btn_point" onClick="closeResetPassword('Y')" href="javascript:void(0);" role="button"><span>지금 변경하기</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호변경알림-비밀번호 변경 안내 -->
<div id="popup_pwsearch5-wrap" class="trp popupfixed-wrap login-popup">
    <div class="popup-dim"></div>
    <div class="popup-align mode-ms mode-mb_center">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="javascript:void(0);" title="닫기">X</a>
                        <div class="ico_box change_ico">
                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_04_pc.png">
                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_04.png">
                        </div>
                        <div class="title-box_tac change_title">
                            <p class="">비밀번호 변경 안내</p>
                            <p class="title_sub">소중한 개인정보 보호를 위해<br> 비밀번호를 변경해 주세요!</p>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="info_box">
                            <ul class="tb1 mark_dot-list change_txt">
                                <li>타사이트와 동일한 로그인 정보를 사용하시는 회원님께서는 반드시 비밀번호를 변경해 주세요.</li>
                                <li>비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합으로 8자~16자로 만들어 주세요.</li>
                                <li>주기적으로 비밀번호를 변경해 주세요.</li>
                            </ul>
                        </div>
                        <article class="button-area confirm_btn change_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_gray_line" onclick="reAlarm();" href="javascript:void(0);" role="button"><span>30일뒤 재알림</span></a>
                                <a class="btn btn_point" onclick="goModPassword();" href="javascript:void(0);" role="button"><span>지금 변경하기</span></a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    var resetPassword = '${sessionScope.PASSWD_RESET_YN}';
    var modPassword = '${sessionScope.PASSWD_MOD_NECESSARY_YN}';
</script>

<script src="/js/main/main.js" type="text/javascript"></script>
<script src="/js/main/auction.js" type="text/javascript"></script>
<script src="/js/main/newsletter.js" type="text/javascript"></script>

</html>