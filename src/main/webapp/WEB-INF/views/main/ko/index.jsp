<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../../include/ko/header.jsp" flush="false">
    <jsp:param name="main" value="true"/>
</jsp:include>
<%--<script>--%>
<%--window.addEventListener('DOMContentLoaded', () => {--%>
<%--    // console.log("theme ", localStorage.getItem('theme'));--%>

<%--    $('*').toggleClass(localStorage.getItem('theme'));--%>

<%--    $('.auctionTab-btn').click(function () {--%>
<%--        const darkIngTab = $(this).index();--%>
<%--        $('.auctionTab-btn').removeClass('dark');--%>
<%--        $('.auctionTab-contents').removeClass('dark');--%>

<%--        $(this).addClass('dark');--%>
<%--        $(".auctionTab-contents").eq(darkIngTab).addClass('dark');--%>
<%--    });--%>

<%--    $('.darktxt').text('다크모드로 보기');--%>
<%--    $('.darktxt.dark').text('라이트모드로 보기');--%>
<%--    $('.darktxt-en').text('Dark Mode');--%>
<%--    $('.darktxt-en.dark').text('Ligth Mode');--%>

<%--    $('.mode-toggle>input').addClass(localStorage.getItem('theme'));--%>
<%--});--%>
<%--</script>--%>
<body>
<%--<jsp:include page="../../main/include/topNotice.jsp" />--%>
<jsp:include page="../../include/ko/nav.jsp" flush="false"/>
<section class="main-contents footer-bottom footer-bottom50">
    <jsp:include page="../include/bigBanner.jsp" />

    <%--auction--%>
    <div class="wrap">
        <section class="container wrap_padding">
            <section class="auction-contents">
                <div class="auction-tit">
                    <h1 class="main-sectiontit main-sectiontit-auction">Auction</h1>
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
                    <img src="/images/pc/banner/PC_buy.png" alt="buy img" class="pc-ver">
                    <img src="/images/mobile/banner/M_buy.png" alt="buy img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Buy</h2>
                        <p>회원가입부터 응찰까지<br>
                            누구나 쉽게 경매에 참여 할 수 있습니다.</p>
                        <a href="/auction/info" >경매안내</a>
                    </figcaption>
                </figure>
                <figure class="sale-box">
                    <img src="/images/pc/banner/sell.jpg" alt="sell img" class="pc-ver">
                    <img src="/images/mobile/banner/sell.jpg" alt="sell img" class="m-ver">
                    <figcaption class="sale-boxinfo">
                        <h2 class="main-sectiontit sale-tit">Sell</h2>
                        <p>고객님의 소중한 작품을 기다립니다.<br>
                            서울옥션에 문의하세요</p>
                        <a href="/sell/consignment" >위탁안내</a>
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
                                <a href="https://www.auctionblue.com" target="_blank">
                                    <img src="/images/pc/banner/FamilyBanner_SaBlue_383x150.png" alt="서울옥션 블루" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_SaBlue_520x204.png" alt="서울옥션 블루" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">SOTWO</p>
                                <p class="family-infotxt tit-size16">미술품 공동구매 플랫폼</p>
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
                                <p class="family-infotit">프린트 베이커리</p>
                                <p class="family-infotxt tit-size16">일상의 예술을 맛보다.</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://printbakery.com" target="_blank">
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
                            <input id ="newsEmail" type="email" placeholder="이메일 주소">
                            <input id ="newsName" type="text" placeholder="이름">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span id="news_sub_label" class="terms-checktxt"><span class="terms-checktxt-line">개인정보 수집 및 이용</span>에 동의해주세요.</span>
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
<div class="blackBg main-popupBg"></div>
<div class="main-popupwrap"></div>
<div class="main-popupbox">
    <a href="" id="main_popup_a_link" title="메인 팝업 이미지">
        <div class="main-popup-img"> <!-- 이미지 레이어팝업 -->
            <img id="main_popup_img" <%--src="/images/pc/main/pop_event.jpg"--%> alt="레이어팝업 이미지">
        </div>
    </a>

    <!-- 텍스트 레이어팝업 on-->
    <a href="javascript:void(0);" id="main_popup_text_a_link" title="메인 팝업 텍스트">
        <div class="main-popup-txt">
            <div class="main-popup-caption">
                <h2 id="main_popup_title"></h2>
                <p id="main_popup_content"></p>
<%--                        <p class="main-popup-green">변경 전 -15%(부가세 별도)</p>--%>
            </div>
        </div>
    </a>
    <div class="main-popup-close">
        <span id="main_popup_today_stop_btn">오늘 그만보기</span>
        <span class="main-popup-closebtn closebtn closebtn-w"></span>
    </div>
</div>
<%-- main 레이어 팝업 ---%>


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
                            <span class="title_tac">회원님과 동일한 아이디로 다른 PC나 모바일 환경에서 동시 접속하여  자동으로 로그아웃 되었습니다.<br>
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

<!-- 앱 강제 업데이트 팝업 -->
<div id="app-update-popup" class="app-update-popup">
    <div class="app-update-popup-content">
        <div class="app-update-popup-icons">

            <svg id="sa-update-alarm-bell" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="144" height="144" viewBox="0 0 144 144">
                <defs>
                    <filter id="타원_3" x="0" y="0" width="144" height="144" filterUnits="userSpaceOnUse">
                        <feOffset dy="2" input="SourceAlpha"/>
                        <feGaussianBlur stdDeviation="4" result="blur"/>
                        <feFlood flood-opacity="0.161"/>
                        <feComposite operator="in" in2="blur"/>
                        <feComposite in="SourceGraphic"/>
                    </filter>
                </defs>
                <g id="alarm" transform="translate(-462 -469)">
                    <g transform="matrix(1, 0, 0, 1, 462, 469)" filter="url(#타원_3)">
                        <circle id="타원_3-2" data-name="타원 3" cx="60" cy="60" r="60" transform="translate(12 10)" fill="#fff"/>
                    </g>
                    <g id="bell_dot" data-name="bell dot" transform="translate(506 511)">
                        <path id="패스_48" data-name="패스 48" d="M43.654,29.74a35.077,35.077,0,0,0,1.369,5.754l2.054,5.754-1.712,2.369H33.385a6.646,6.646,0,0,1-2.054,4.739,6.8,6.8,0,0,1-4.792,2.031,6.248,6.248,0,0,1-4.792-2.031,6.646,6.646,0,0,1-2.054-4.739H7.712L6,41.248l2.054-5.754A33.632,33.632,0,0,0,9.423,27.37V19.924a15.008,15.008,0,0,1,1.369-6.77A17.7,17.7,0,0,1,14.9,7.4a13.734,13.734,0,0,1,6.162-3.385A15.659,15.659,0,0,1,26.539,3a36.8,36.8,0,0,0-2.054,3.723,3.722,3.722,0,0,0-2.4.677A9.787,9.787,0,0,0,17.3,10.108a11.013,11.013,0,0,0-3.423,4.4,13.894,13.894,0,0,0-1.027,5.416V27.37a42.166,42.166,0,0,1-1.369,9.139l-1.369,3.723H42.97L41.6,36.509a37.188,37.188,0,0,1-1.244-5.664l-.126-.767A10.667,10.667,0,0,0,43.654,29.74ZM26.539,47a3.719,3.719,0,0,0,2.4-1.015,3.057,3.057,0,0,0,1.027-2.369H23.116a3.057,3.057,0,0,0,1.027,2.369A3.719,3.719,0,0,0,26.539,47ZM50.5,13.154A10.27,10.27,0,1,1,40.231,3,10.213,10.213,0,0,1,50.5,13.154Z" transform="translate(1.193 1.307)" fill="#21a099" fill-rule="evenodd"/>
                        <path id="패스_49" data-name="패스 49" d="M0,0H56V56H0Z" fill="none"/>
                    </g>
                </g>
            </svg>


            <svg id="sa-update-alarm-logo" xmlns="http://www.w3.org/2000/svg" width="240" height="240" viewBox="0 0 240 240">
                <g id="appicon-sa" transform="translate(-0.327 -0.327)">
                    <rect width="240" height="240" rx="60" transform="translate(0.327 0.327)" fill="#4dada7"/>
                    <path d="M35.438,119.845q1.889,0,3.04-.111a4.772,4.772,0,0,0,1.771-.45,2.012,2.012,0,0,0,.915-1.04,7.854,7.854,0,0,0,.413-1.827h1.092v8.236H41.577a7.492,7.492,0,0,0-.472-1.8,2.013,2.013,0,0,0-.944-1.012,4.3,4.3,0,0,0-1.771-.45q-1.092-.112-2.952-.113v5.791a4.274,4.274,0,0,0,.236,1.518,2.287,2.287,0,0,0,.856,1.012,4.4,4.4,0,0,0,1.564.533,16.888,16.888,0,0,0,2.391.141,15.021,15.021,0,0,0,2.833-.225,4.757,4.757,0,0,0,1.948-.787,4.127,4.127,0,0,0,1.24-1.489,10.871,10.871,0,0,0,.8-2.389h1.181l-.472,6.436H28V130.7a8.58,8.58,0,0,0,1.594-.168,1.612,1.612,0,0,0,1.387-1.434,8.841,8.841,0,0,0,.118-1.6V114.505a8.359,8.359,0,0,0-.118-1.573,1.816,1.816,0,0,0-.384-.956,1.414,1.414,0,0,0-.856-.477,7.707,7.707,0,0,0-1.417-.2v-1.124H46.979l.207,5.51H45.916a6.443,6.443,0,0,0-.561-1.94,3.049,3.049,0,0,0-1.063-1.237,4.122,4.122,0,0,0-1.771-.646,14.691,14.691,0,0,0-2.627-.2H36.56q-.767,0-.945.2a1.28,1.28,0,0,0-.177.842Z" transform="translate(16.929 66.833)" fill="#fff"/>
                    <path d="M42.565,124.756h1.151a6.627,6.627,0,0,0,2.243,4.216,6.838,6.838,0,0,0,4.516,1.518,7.473,7.473,0,0,0,2.007-.254,5.113,5.113,0,0,0,1.564-.7,3.548,3.548,0,0,0,1-1.1,2.929,2.929,0,0,0,.354-1.432,2.582,2.582,0,0,0-.236-1.153,2.309,2.309,0,0,0-.826-.956,8.361,8.361,0,0,0-1.712-.955q-1.062-.478-2.774-1.1a13.984,13.984,0,0,1-5.106-2.923,5.643,5.643,0,0,1-1.122-6.381,5.6,5.6,0,0,1,1.476-1.883,6.97,6.97,0,0,1,2.3-1.209,9.436,9.436,0,0,1,2.981-.45,8.779,8.779,0,0,1,2.833.45,10.585,10.585,0,0,1,2.627,1.348l.531-1.405h.708l.325,6.071H56.261a6.982,6.982,0,0,0-2.214-3.513,5.325,5.325,0,0,0-3.483-1.237,4.808,4.808,0,0,0-2.981.871,2.624,2.624,0,0,0-1.122,2.193,2.661,2.661,0,0,0,.207,1.067,2.382,2.382,0,0,0,.767.871,8.518,8.518,0,0,0,1.535.872q.974.421,2.509.955a26.589,26.589,0,0,1,3.512,1.546,9.744,9.744,0,0,1,2.391,1.659A5.768,5.768,0,0,1,58.77,123.6a5.22,5.22,0,0,1,.443,2.165,5.333,5.333,0,0,1-.649,2.614,6.087,6.087,0,0,1-1.83,2.024,8.93,8.93,0,0,1-2.774,1.321,12.3,12.3,0,0,1-3.542.477,10.516,10.516,0,0,1-3.188-.45,11.769,11.769,0,0,1-2.922-1.518l-.59,1.688h-.708Z" transform="translate(25.756 66.731)" fill="#fff"/>
                    <path d="M77.679,116.361H76.41a7.615,7.615,0,0,0-.443-2.276,3.328,3.328,0,0,0-.944-1.462,3.234,3.234,0,0,0-1.505-.758,8.413,8.413,0,0,0-2.066-.225q-1.151,0-1.859.055a4.666,4.666,0,0,0-1.062.141.773.773,0,0,0-.472.252.72.72,0,0,0-.118.422v14.728a8.751,8.751,0,0,0,.118,1.546,2.176,2.176,0,0,0,.561,1.067,2.838,2.838,0,0,0,1.21.619,9.926,9.926,0,0,0,2.1.225v1.124H59.557V130.7a10.082,10.082,0,0,0,2.125-.225,2.839,2.839,0,0,0,1.21-.619,1.9,1.9,0,0,0,.561-1.067,7.046,7.046,0,0,0,.147-1.546V112.51a.72.72,0,0,0-.118-.422.608.608,0,0,0-.413-.252,3.558,3.558,0,0,0-.944-.141q-.59-.055-1.564-.055a17.5,17.5,0,0,0-2.037.113,3.67,3.67,0,0,0-1.712.561,3.291,3.291,0,0,0-1.21,1.405,6.563,6.563,0,0,0-.472,2.642H53.978l.3-6.184H77.384Z" transform="translate(32.718 66.833)" fill="#fff"/>
                    <path d="M69.063,123.489a2.062,2.062,0,0,1,.62-1.518,2.171,2.171,0,0,1,1.594-.647,2.207,2.207,0,0,1,1.623.647,2.015,2.015,0,0,1,.649,1.518,1.983,1.983,0,0,1-.649,1.489,2.324,2.324,0,0,1-1.623.59,2.283,2.283,0,0,1-1.594-.59A2.028,2.028,0,0,1,69.063,123.489Z" transform="translate(41.759 73.915)" fill="#fff"/>
                    <path d="M86.422,127.313a14.2,14.2,0,0,0,.088,1.772,2.24,2.24,0,0,0,.443,1.04,1.91,1.91,0,0,0,.974.506,9.641,9.641,0,0,0,1.712.168v1.124h-11.1V130.8a10.773,10.773,0,0,0,1.83-.168,2.3,2.3,0,0,0,1.063-.506,1.781,1.781,0,0,0,.5-.985,7.491,7.491,0,0,0,.147-1.629v-10.2q0-1.632-.03-2.7a5.23,5.23,0,0,0-.118-1.405,1.132,1.132,0,0,0-1.033-.758,16.322,16.322,0,0,0-2.509-.141V111.18q.8-.029,1.83-.113,1.062-.112,2.155-.252,1.122-.169,2.184-.365a15.765,15.765,0,0,0,1.86-.45Z" transform="translate(47.456 66.728)" fill="#fff"/>
                    <path d="M86.778,117.561a6.835,6.835,0,0,1,.649-2.952,7.647,7.647,0,0,1,1.83-2.389,8.533,8.533,0,0,1,2.686-1.63,9.372,9.372,0,0,1,3.335-.59,8.332,8.332,0,0,1,3.512.731,7.614,7.614,0,0,1,2.715,2,8.988,8.988,0,0,1,1.771,3.091,11.511,11.511,0,0,1,.649,3.935,14.05,14.05,0,0,1-.826,4.834,13.414,13.414,0,0,1-2.243,3.964,10.821,10.821,0,0,1-3.306,2.671,8.638,8.638,0,0,1-4.044.983,9.315,9.315,0,0,1-2.214-.252,6.714,6.714,0,0,1-1.8-.647,4.007,4.007,0,0,1-1.181-.983,2.069,2.069,0,0,1-.443-1.266,1.566,1.566,0,0,1,.531-1.264,2.038,2.038,0,0,1,1.417-.479,1.6,1.6,0,0,1,.944.254,2.093,2.093,0,0,1,.62.619,4.73,4.73,0,0,1,.472.815,4.2,4.2,0,0,0,.5.787,2.867,2.867,0,0,0,.8.619,2.705,2.705,0,0,0,1.269.252,3.21,3.21,0,0,0,1.859-.59,5.445,5.445,0,0,0,1.476-1.657,8.893,8.893,0,0,0,1-2.5,12.988,12.988,0,0,0,.354-3.12l-.089-.056a6.209,6.209,0,0,1-2.037,1.489,6.362,6.362,0,0,1-2.568.477,8.564,8.564,0,0,1-3.04-.533,7.93,7.93,0,0,1-2.42-1.518,7.219,7.219,0,0,1-1.594-2.249A6.876,6.876,0,0,1,86.778,117.561Zm12.249.815a10.336,10.336,0,0,0-1-5.115,3.11,3.11,0,0,0-2.863-1.715,3,3,0,0,0-2.745,1.432,8.746,8.746,0,0,0-.885,4.469,8.535,8.535,0,0,0,.826,4.189,2.739,2.739,0,0,0,2.479,1.405,3.515,3.515,0,0,0,2.273-.787,8.423,8.423,0,0,0,1.919-2.5Z" transform="translate(52.586 66.731)" fill="#fff"/>
                    <path d="M99.318,117.561a6.835,6.835,0,0,1,.649-2.952,7.656,7.656,0,0,1,1.83-2.389,8.522,8.522,0,0,1,2.687-1.63,9.363,9.363,0,0,1,3.334-.59,8.332,8.332,0,0,1,3.513.731,7.605,7.605,0,0,1,2.715,2,8.995,8.995,0,0,1,1.772,3.091,11.507,11.507,0,0,1,.649,3.935,14.065,14.065,0,0,1-.826,4.834,13.415,13.415,0,0,1-2.243,3.964,10.835,10.835,0,0,1-3.307,2.671,8.632,8.632,0,0,1-4.043.983,9.319,9.319,0,0,1-2.214-.252,6.7,6.7,0,0,1-1.8-.647,4.006,4.006,0,0,1-1.18-.983,2.062,2.062,0,0,1-.444-1.266,1.568,1.568,0,0,1,.531-1.264,2.041,2.041,0,0,1,1.418-.479,1.6,1.6,0,0,1,.944.254,2.1,2.1,0,0,1,.62.619,4.71,4.71,0,0,1,.473.815,4.213,4.213,0,0,0,.5.787,2.871,2.871,0,0,0,.8.619,2.7,2.7,0,0,0,1.269.252,3.209,3.209,0,0,0,1.859-.59,5.453,5.453,0,0,0,1.477-1.657,8.85,8.85,0,0,0,1-2.5,12.97,12.97,0,0,0,.355-3.12l-.089-.056a6.209,6.209,0,0,1-2.036,1.489,6.363,6.363,0,0,1-2.568.477,8.558,8.558,0,0,1-3.04-.533,7.928,7.928,0,0,1-2.42-1.518,7.215,7.215,0,0,1-1.594-2.249A6.878,6.878,0,0,1,99.318,117.561Zm12.249.815a10.332,10.332,0,0,0-1-5.115,3.109,3.109,0,0,0-2.863-1.715,3,3,0,0,0-2.745,1.432,8.75,8.75,0,0,0-.885,4.469,8.541,8.541,0,0,0,.826,4.189,2.739,2.739,0,0,0,2.479,1.405,3.514,3.514,0,0,0,2.273-.787,8.408,8.408,0,0,0,1.919-2.5Z" transform="translate(60.196 66.731)" fill="#fff"/>
                    <path d="M118.149,122.086A5.584,5.584,0,0,0,116.26,124a5.035,5.035,0,0,0-.62,2.474,3.873,3.873,0,0,0,4.162,4.16,5.623,5.623,0,0,0,1.83-.282,4.554,4.554,0,0,0,1.416-.758,3.435,3.435,0,0,0,.944-1.18,3.329,3.329,0,0,0,.355-1.518,2.83,2.83,0,0,0-.915-2.081,9.179,9.179,0,0,0-2.863-1.715Zm5.667-2.753a8.95,8.95,0,0,1,3.01,2.866,6.444,6.444,0,0,1,1.063,3.542,5.634,5.634,0,0,1-.62,2.614,6.1,6.1,0,0,1-1.683,2.052,7.962,7.962,0,0,1-2.568,1.321,10.761,10.761,0,0,1-3.275.477,11.788,11.788,0,0,1-3.1-.393,9.262,9.262,0,0,1-2.481-1.124,5.672,5.672,0,0,1-1.623-1.715,4.075,4.075,0,0,1-.59-2.136,4.867,4.867,0,0,1,1.033-2.979,8.333,8.333,0,0,1,2.982-2.362,8,8,0,0,1-2.6-2.558,6.112,6.112,0,0,1-.885-3.175,5.183,5.183,0,0,1,1.978-4.189,6.324,6.324,0,0,1,2.271-1.18,10.714,10.714,0,0,1,2.982-.393,11.32,11.32,0,0,1,2.687.309,8.517,8.517,0,0,1,2.243.871,4.664,4.664,0,0,1,1.535,1.659,4.426,4.426,0,0,1,.531,2.136,4.045,4.045,0,0,1-.679,2.3A8.146,8.146,0,0,1,123.816,119.332Zm-2.184-.592a4.659,4.659,0,0,0,1.3-1.545,3.743,3.743,0,0,0,.471-1.8,3.877,3.877,0,0,0-.295-1.518,3.526,3.526,0,0,0-.826-1.209,3.3,3.3,0,0,0-1.21-.815,3.588,3.588,0,0,0-1.505-.309,4.2,4.2,0,0,0-1.475.252,3.629,3.629,0,0,0-1.151.647,2.931,2.931,0,0,0-.8.955,2.815,2.815,0,0,0-.265,1.209q0,2,3.748,3.373Z" transform="translate(67.849 66.731)" fill="#fff"/>
                    <path d="M89.623,95.093a3.691,3.691,0,0,1-1.473-.26c-.777-.519-1.035-1.5-.179-3.514l-.2.419L103.58,49.964l16.943,45.13Zm82.285,47.086h-9.237a8.526,8.526,0,0,1-7.346-5.831L113.515,29.276C112.181,25.841,110.17,26,110.17,26h-1.314a1.435,1.435,0,0,0-1.274,1.118l-44.3,116.858.239.339H67.5l.358-.279L85.582,97.35h35.837l15.091,39.938.677,1.8c1.413,3.475,2.568,4.932,6.53,5.271H171.85c.317,0,.836-.239.836-1.178a.892.892,0,0,0-.2-.686.89.89,0,0,0-.287-.225.872.872,0,0,0-.352-.088" transform="translate(39.901 16.162)" fill="#fff"/>
                    <path d="M86.3,78.824l-19.551-6.15A56.721,56.721,0,0,1,51.642,65.9c-9.039-4.932-13.16-22.784,0-32.19a32.167,32.167,0,0,1,17.5-5.491c16.624.359,25.882,12.64,29.108,26.678a3.785,3.785,0,0,0,4.2,3.255V41.463l-.239-.918c-3.046-4.812-13.937-14.238-32.174-14.517H68.365A34.481,34.481,0,0,0,49.909,30.54C31.115,42.4,30.159,57.557,33.982,68.48S44.534,83.437,59.466,88.449l18.6,5.671c9.079,2.756,21.681,8.906,21.681,23.963,0,10.483-5.794,26.2-28.451,26.259-5.734,0-12.961-.319-19.71-4.313-9.178-4.493-15.669-17.972-17.739-27.7a3.647,3.647,0,0,0-3.066-2.736h-.458l-.318.26v21.307c2.967,7.029,17.361,12.321,21.323,13.379,7.426,2,10.791,2,19.909,2h1.652c25.5,0,41.013-17.972,41.013-38.14,0-22.245-19.531-27.118-27.594-29.674" transform="translate(18.403 16.181)" fill="#fff"/>
                </g>
            </svg>
        </div>
        <div class="app-update-popup-notice">
            <h3>서울옥션 업데이트 알림</h3>
            <p>
                원활한 서비스 이용을 위해 새로운<br />
                버전으로 업데이트 해주세요
            </p>
        </div>
        <div class="app-update-popup-button">
            <button class="app-update-popup-link">업데이트 하기</button>
        </div>
    </div>
</div>
<!-- 앱 강제 업데이트 팝업 //-->

</body>

<script>
    var resetPassword = '${sessionScope.PASSWD_RESET_YN}';
    var modPassword = '${sessionScope.PASSWD_MOD_NECESSARY_YN}';
</script>

<script src="/js/main/main.js" type="text/javascript"></script>
<script src="/js/main/auction.js" type="text/javascript"></script>
<script src="/js/main/newsletter.js" type="text/javascript"></script>

</html>