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
<section class="main-contents footer-bottom footer-bottom40">

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
                                    <img src="/images/pc/banner/FamilyBanner_01_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_01_520x204.png" alt="action blue" class="m-ver">
                                </a>
                            </figure>
                        </div>
                        <div class="article-box">
                            <div class="family-infobox">
                                <p class="family-infotit">SOTWO</p>
                                <p class="family-infotxt tit-size16">Platform for joint purchase of artworks</p>
                            </div>
                            <figure class="family-infoimg">
                                <a href="https://sotwo.com"  target="_blank">
                                    <img src="/images/pc/banner/FamilyBanner_02_383x150.png" alt="action blue" class="pc-ver">
                                    <img src="/images/mobile/banner/FamilyBanner_02_520x204.png" alt="action blue" class="m-ver">
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
                            <input id ="newsEmail" type="email" placeholder="Email address">
                            <input id ="newsName" type="text"  placeholder="NAME">
                        </fieldset>
                        <fieldset class="newsletter-checkbox">
                            <input type="checkbox" id="subscript_check" class="common_checkbox" value='subscript_check' name='subscript_check'>
                            <label for="subscript_check">
                                <span class="terms-checktxt">I agree to the collection and use of personal information.</span>
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
<div class="blackBg main-popupBg">
    <div class="main-popupwrap">
        <div class="main-popupbox">
            <a href="#" title="메인 팝업 이미지" id="main_popup_a_link">
                <div class="main-popup-img"> <!-- 이미지 레이어팝업 -->
                    <img id="main_popup_img" <%--src="/images/pc/main/pop_event.jpg"--%> alt="레이어팝업 이미지">
                </div>
                <!-- 텍스트 레이어팝업 --> 
            </a>


            <!-- 텍스트 레이어팝업 on-->
            <a href="#" title="메인 팝업 텍스트" id="main_popup_text_a_link">
                <div class="main-popup-txt">
                    <div class="main-popup-caption">
                        <h2 id="main_popup_title">국내 오프라인 경매 구매수수료율 인상 및 약관 개정 안내</h2>
                        <p id="main_popup_content">항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                            항상 서울옥션을 이용해 주시는 고객 여러분들께<br> 진심으로 감사의 말씀을 드리며,<br>다음과 같이 국내 오프라인 경매 구매수수료율을<br>인상함을 알려드립니다.<br>
                    </div>
                </div>
            </a>
            <div class="main-popup-close">
                <span id="main_popup_today_stop_btn">stop watching today</span>
                <span class="main-popup-closebtn closebtn closebtn-w"></span>
            </div>
        </div>
    </div>
</div>

<!-- 뉴스레터 팝업 -->
<jsp:include page="popup/newsletter.jsp" flush="false"/>

<!-- video 팝업 -->
<div class="blackBg video-blackBg">
    <div class="video-playbox">
        <div class="video-play">

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