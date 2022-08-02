<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../../include/en/header.jsp" flush="false">
    <jsp:param name="main" value="true"/>
</jsp:include>

<body>
<jsp:include page="../../include/en/nav.jsp" flush="false"/>
<section class="main-contents footer-bottom footer-bottom50">

    <jsp:include page="../include/bigBanner.jsp" />

    <%--auction--%>
    <div class="wrap">
        <section class="container wrap_padding">
            <section class="auction-contents">
                <div class="auction-tit">
                    <h1 class="main-sectiontit main-sectiontit-auction">Auction</h1>
                    <div class="auctiontab-scroll">
                        <div class="auctionTab">
                        </div>
                    </div>
                </div>
                <div id="auction_contents">

                </div>
                <div class="commonbtn-box">
                    <button type="button" id="MoreAuction" class="commonbtn">More</button>
                    <a href="#" id="AllAuction"  STYLE="display: none;" class="commonbtn">View All</a>
                </div>
            </section>
        </section>
    </div>

    <jsp:include page="../include/upcoming.jsp" />

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
                        <p>From membership registration to bidding,
                            anyone can easily participate in the auction.</p>
                        <a href="/auction/info">Auction Guide</a>
                    </figcaption>
                </figure>
                <figure class="sale-box">
                    <img src="/images/pc/banner/sell.jpg" alt="sell img" class="pc-ver">
                    <img src="/images/mobile/banner/sell.jpg" alt="sell img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Sell</h2>
                        <p>We look forward to your valuable work. Contact Seoul Auction.</p>
                        <a href="/sell/consignment">Consignment information</a>
                    </figcaption>
                </figure>
            </section>

            <article class="flex_wrap article-contents">
                <div class="familysite-box">
                    <h3 class="main-sectiontit familySite-tit">Family Site</h3>
                    <div class="flex_wrap familysiteContents">
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">Seoul Auction Blue</p>
                                <p class="family-infotxt tit-size16">Overseas auction agency "Buy art directly"</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href=https://www.auctionblue.com"  target="_blank">
                                    <img src="/images/pc/banner/FamilyBanner_SaBlue_383x150.png" alt="Seoul Auction Blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_SaBlue_520x204.png" alt="Seoul Auction Blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">SOTWO</p>
                                <p class="family-infotxt tit-size16">Platform for joint purchase of artworks</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://sotwo.com" target="_blank">
                                    <img src="/images/pc/banner/FamilyBanner_Sotwo_383x150.png" alt="SOTWO" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_Sotwo_520x204.png" alt="SOTWO" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">Print bakery</p>
                                <p class="family-infotxt tit-size16">"Taste everyday art"</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://printbakery.com"  target="_blank">
                                    <img src="/images/pc/banner/FamilyBanner_PrintBakery_383x150.png" alt="프린트 베이커리" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_PrintBakery_520x204.png" alt="프린트 베이커리" class="m-ver">
                                </a>
                            </figure>
                        </div>
                    </div>
                </div>

                <div class="newsletter-box">
                    <h3 class="main-sectiontit newsLetter-tit">Newsletter</h3>
                    <form action="" class="newsletter-formbox">
                        <fieldset class="newsletter-form">
                            <input id ="newsEmail" type="email" placeholder="Email address">
                            <input id ="newsName" type="text"  placeholder="NAME">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span class="terms-checktxt"><span class="terms-checktxt-line">I agree to the collection and use</span> of personal information.</span>
                            </label>
                        </fieldset>
                    </form>
                    <div class="flex_wrap newsletter-btnbox">
                        <button type="button" class="commonbtn btn-bg-b subscriptBtn">Subscribe</button>
                        <a href="#" class="commonbtn btn-border-3">
                            <span>View past<br> Newsletters</span>
                        </a>
                    </div>
                </div>

            </article>
        </section>
    </div>
    <jsp:include page="../../include/en/footer.jsp" flush="false"/>
    <!-- //wrap -->
</section>

<!-- 다크모드 darkmode -->
<span class="darkmodeBg">
        <button class="darkmode" type="button"></button><span class="darktxt darktxt-en">Dark Mode</span>
    </span>
<!--scroll top-->
<a href="#" class="scroll-top">
    <span class="topBtn up"></span>
</a>

<%-- main 레이어 팝업 --%>
<div class="blackBg main-popupBg"></div>
<div class="main-popupwrap"></div>
    <div class="main-popupbox">
        <a href="#" title="메인 팝업 이미지" id="main_popup_a_link" title="main popup img">
            <div class="main-popup-img"> <!-- 이미지 레이어팝업 -->
                <img id="main_popup_img" <%--src="/images/pc/main/pop_event.jpg"--%> alt="레이어팝업 이미지">
            </div>
            <!-- 텍스트 레이어팝업 -->
        </a>


        <!-- 텍스트 레이어팝업 on-->
        <a href="#" title="메인 팝업 텍스트" id="main_popup_text_a_link" title="main popup text">
            <div class="main-popup-txt">
                <div class="main-popup-caption">
                    <h2 id="main_popup_title"></h2>
                    <p id="main_popup_content"></p>
                </div>
            </div>
        </a>
        <div class="main-popup-close">
            <span id="main_popup_today_stop_btn">stop watching today</span>
            <span class="main-popup-closebtn closebtn closebtn-w"></span>
        </div> 
    </div>
<%-- //main 레이어 팝업 --%>

<!-- 뉴스레터 팝업 -->
<jsp:include page="popup/newsletter.jsp" flush="false"/>

<!-- video 팝업 -->
<div class="blackBg video-blackBg">
    <div class="video-playbox">
        <div class="video-play">

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
                            <!-- [0728]텍스트수정 -->
                            <span class="title_tac">You are automatically logged out by simultaneously accessing from another PC or mobile environment with the same ID as the member.<br>
                                    If you are not the person, please log in again or contact the customer center.
                                </span>
                            <!-- //[0728]텍스트수정 --> 
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_point" id="confirmMaxSession" href="javascript:void(0);" role="button"><span>OK</span></a>
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
    <div class="popup-align mode-ms mode-mb_full">
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
                            <p class="">Information on changing the reset password</p>
                            <p class="title_sub">The password has been reset by the administrator.<br> Please change your password for safe personal information protection.</p>
                        </div>
                    </div>
                    <div class="pop-body">
                        <article class="button-area confirm_btn changenew_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_gray_line" onClick="closeResetPassword()" href="javascript:void(0);" role="button"><span>Close</span></a>
                                <a class="btn btn_point" onClick="closeResetPassword('Y')" href="javascript:void(0);" role="button"><span>Change now</span></a>
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
    <div class="popup-align mode-ms mode-mb_full">
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
                            <p class="">Password change guide</p>
                            <p class="title_sub">Please change your password to protect<br> your valuable personal information!</p>
                        </div>
                    </div>
                    <div class="pop-body">
                        <div class="info_box">
                            <ul class="tb1 mark_dot-list change_txt">
                                <li>If you are using the same login information as other sites, be sure to change your password.</li>
                                <li>Passwords must be 8 to 16 characters long using a combination of at least two of uppercase and lowercase letters, numbers, and special characters.</li>
                                <li>Please change your password periodically</li>
                            </ul>
                        </div>
                        <article class="confirm_btn change_btn">
                            <div class="btn_set-float tac">
                                <a class="btn btn_gray_line" onclick="reAlarm();" href="javascript:void(0);" role="button"><span>Remider after 30 days</span></a>
                                <a class="btn btn_point" onclick="goModPassword();" href="javascript:void(0);" role="button"><span>Change now</span></a>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/js/main/main.js" type="text/javascript"></script>
<script src="/js/main/auction.js" type="text/javascript"></script>
<script src="/js/main/newsletter.js" type="text/javascript"></script>

</html>