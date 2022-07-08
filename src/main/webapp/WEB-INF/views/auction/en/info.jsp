<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../include/en/header.jsp" flush="false"/>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">
            <!-- header -->
            <jsp:include page="../../include/en/nav.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">
                    <!-- page title -->
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">Auction Information</span></h2>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section tab-menu-section">
                        <div class="section-inner">
                            <div class="tab-wrap">
                                <div class="tab-area type-left_lg">
                                    <ul class="tab-list js-maintab_list">
                                        <li class="active"><a><span>Live auction information</span></a></li>
                                        <li><a href="/auction/info/online"><span>Online auction information</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="basis-section last-section infoaction-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-infoaction">
                                <div class="panel-body">
                                    <div class="tab-cont active">
                                        <article class="infoaction-area">
                                            <div class="article-header">
                                                <div>
                                                    <p class="tb1_1">You need to bid in the auction to get art works that you want. Please follow the instruction, how to bid.</p>
                                                    <p class="tb1_1">contact : <a href="mailto:info@seoulauction.com">info@seoulauction.com</a></p>
                                                </div>
                                                <nav class="tab_move-bar js-tab_move">
                                                    <ul>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step1">
                                                                    <div class="teb_txt">STEP 01</div>
                                                                    <div class="teb_title tb1">Sign Up</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step2">
                                                                    <div class="teb_txt">STEP 02</div>
                                                                    <div class="teb_title tb1">Preview</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step3">
                                                                    <div class="teb_txt">STEP 03</div>
                                                                    <div class="teb_title tb1">Bidding Method</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step4">
                                                                    <div class="teb_txt">STEP 04</div>
                                                                    <div class="teb_title tb1">How to reserve Auction</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step5">
                                                                    <div class="teb_txt">STEP 05</div>
                                                                    <div class="teb_title tb1">Bidding Results and Payment</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step6">
                                                                    <div class="teb_txt">STEP 06</div>
                                                                    <div class="teb_title tb1">Settlement</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                            <div class="article-body">
                                                <div class="step-area">
                                                    <div class="step_stage" id="view-step1">
                                                        <div class="step_title">
                                                            <div class="teb_txt tb2">STEP 01</div>
                                                            <div class="teb_title tt3">Sign Up</div>
                                                        </div>
                                                        <div class="step_con">
                                                            <div class="con_header">
                                                                <ul class="tb1">
                                                                    <li>All of the auction bidders should register for a membership of Seoul Auction.</li>
                                                                    <li>Please create the membership at website (homepage), exhibition, or Seoul auction office.</li>
                                                                </ul>
                                                                <div class="inquiry_txt">
                                                                    <i class="icon-inquiry"></i>
                                                                    <p class="tt5 mb10">Subscription Member(Full Member)</p>
                                                                    <p class="tb1">A regular member requires a membership fee(yearly USD 500) and have diversity of advantages with free receipt of periodicals issued by Seoul Auction(unique catalogues, preview exhibition guide book, etc.). You can Bid the all auctions(Art auction, Hong Kong Auction, Special Auction).</p>
                                                                </div>
                                                                <div class="inquiry_txt">
                                                                    <i class="icon-inquiry"></i>
                                                                    <p class="tt5 mb10">Associate Member</p>
                                                                    <p class="tb1">Can receive the auction-related information service in Homepage.</p>
                                                                </div>
                                                                <div class="con_body">
                                                                    <div class="join_box">
                                                                        <ul>
                                                                            <li>
                                                                                <div class="box_header">
                                                                                    <img src="/images/mobile/footer/icon_live_01.png">
                                                                                    <p class="tt4">Register on the website</p>
                                                                                </div>
                                                                                <div class="box_body">
                                                                                    <div class="txt_area">
                                                                                        <p class="tb1">When registering as a member of the Seoul Auction website, please complete the form according to the membership registration procedure.</p>
                                                                                        <div class="btn_box">
                                                                                            <a class="btn btn_default" href="/join" id="join">
                                                                                                <span>Register</span>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="txt_area">
                                                                                        <p class="tb1">If you already registered Associate member, you are able to pay yearly membership fee at Customer Type Career after log in. You would have a qualification of the Full Member.</p>
                                                                                        <div class="btn_box">
                                                                                            <a class="btn btn_default" href="/mypage/liveBidReqList">
                                                                                                <span>My Seoul Auction – Customer Type</span>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="box_header">
                                                                                    <img src="/images/mobile/footer/icon_live_02.png">
                                                                                    <p class="tt4">Register at Exhibition/Office</p>
                                                                                </div>
                                                                                <div class="box_body">
                                                                                    <div class="txt_area">
                                                                                        <p class="tb1">If you visit SeoulAuction Head Office or each Branch and register a regular member, you can join a regular membership.</p>
                                                                                    </div>
                                                                                    <div class="explanation_area">
                                                                                        <dl>
                                                                                            <dt>
                                                                                                <i class="icon-inquiry only-pc"></i>
                                                                                                <span class="tb1">The customer who just registered for the Associate member wants to upgrade to Full member.</span>
                                                                                            </dt>
                                                                                            <dd class="tb1">After Admission Team will confirm, you will be upgrade to Full member.</dd>
                                                                                        </dl>
                                                                                        <dl>
                                                                                            <dt>
                                                                                                <i class="icon-inquiry only-pc"></i>
                                                                                                <span class="tb1">Question regarding to Full Membership</span>
                                                                                            </dt>
                                                                                            <dd class="tb1">Tell <a href="tel:82-2-2075-4422">+82-2-2075-4422</a></dd>
                                                                                            <dd class="tb1"><span>E-mail</span> <a href="mailto:info@seoulauction.com"> info@seoulauction.com</a></dd>
                                                                                        </dl>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="step_stage" id="view-step2">
                                                            <div class="step_title">
                                                                <div class="teb_txt tb2">STEP 02</div>
                                                                <div class="teb_title tt3">Preview</div>
                                                            </div>
                                                            <div class="step_con">
                                                                <div class="con_header">
                                                                    <p class="tb1_1">
                                                                        Preview is a simple and small exhibition for check the condition of objects and art works before the auction begins. Anyone can enter the preview show and get a detail service regarding the objects and art works. The dates of preview exhibition and current auction will be notice through the invitation or website.
                                                                    </p>
                                                                </div>
                                                                <div class="con_body">
                                                                    <div class="preview_box">
                                                                        <div class="inner">
                                                                            <div class="img_box">
                                                                                <img src="/images/mobile/footer/icon_live_03.png">
                                                                            </div>
                                                                            <ul class="mark_dot-list tb1 info_dot_list step2_2">
                                                                                <li>We submit the auction art works/objects as they are at the preview show.</li>
                                                                                <li>We ensure the conditions of the items from the point we presented items on the auction.</li>
                                                                                <li>The auction proceed with based on check the real objects through the preview show. Thus, we recommend that please fully check the condition of qualities of art woks/ objects.</li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="step_stage" id="view-step3">
                                                            <div class="step_title">
                                                                <div class="teb_txt tb2">STEP 03</div>
                                                                <div class="teb_title tt3">Bidding Method</div>
                                                            </div>
                                                            <div class="step_con">

                                                                <div class="con_header">
                                                                    <div class="means_txt_wrap_online">
                                                                        <div class="inner">
                                                                            <div class="txt_box">
                                                                                <p class="tb1_1">Please follow the instructions: Off-line auction and Online Auction.</p>
                                                                                <p class="tb1_1">It is unchangeable or cannot cancel after the bidding so please carefully when you submit the bid.</p>
                                                                            </div>
                                                                            <div class="btn_box">
                                                                                <a class="btn btn_gray_line" href="https://www.seoulauction.com/nas_img/front/homepage/202009_Absentee_Telephone BIDDING FORM.pdf" target="bidform">
                                                                                    <span>Absentee(Telephone/Written) Bidding Form</span>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="con_body">
                                                                    <div class="means_box_wrap">
                                                                        <div class="means_box">
                                                                            <ul>
                                                                                <li>
                                                                                    <div class="inner">
                                                                                        <div class="img_box">
                                                                                            <img src="/images/mobile/footer/icon_live_04.png">
                                                                                        </div>
                                                                                        <dl>
                                                                                            <dt class="tt4">Bidding in Person</dt>
                                                                                            <dd class="tb1">Bidders can make a bid by using one of the bid paddles provided at the auction.</dd>
                                                                                        </dl>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="inner">
                                                                                        <div class="img_box">
                                                                                            <img src="/images/mobile/footer/icon_live_05.png">
                                                                                        </div>
                                                                                        <dl>
                                                                                            <dt class="tt4">Absentee(Telephone) Bidding</dt>
                                                                                            <dd class="tb1">You can apply for a telephone bid in advance, and on the day of the auction, you can make a real-time proxy bid through a phone call with the staff in charge.</dd>
                                                                                        </dl>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="inner">
                                                                                        <div class="img_box">
                                                                                            <img src="/images/mobile/footer/icon_live_06.png">
                                                                                        </div>
                                                                                        <dl>
                                                                                            <dt class="tt4">Absentee(Written) Bidding</dt>
                                                                                            <dd class="tb1">You should submit an absentee bid form specifying the highest amount that you are willing to pay for the art works/objects, at least a day prior to the auction.
                                                                                                Bid forms are accepted by e-mail only.</dd>
                                                                                            <dd class="tb1">Absentee bidding is done via SeoulAuction's assistant auctioneer.</dd>
                                                                                        </dl>
                                                                                    </div>
                                                                                </li>
                                                                                <li>
                                                                                    <div class="inner">
                                                                                        <div class="img_box">
                                                                                            <img src="/images/mobile/footer/icon_live_07.png">
                                                                                        </div>
                                                                                        <dl>
                                                                                            <dt class="tt4">Online Live-Bidding</dt>
                                                                                            <dd class="tb1">After applying for the online paddle number on the website in advance, you can monitor the auction progress on the online live auction page on the day of the auction and press the Bidding button to bid.</dd>
                                                                                        </dl>
                                                                                    </div>
                                                                                </li>

                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="step_stage" id="view-step4">
                                                            <div class="step_title">
                                                                <div class="teb_txt tb2">STEP 04</div>
                                                                <div class="teb_title tt3">How to reserve Auction</div>
                                                            </div>
                                                            <div class="step_con">
                                                                <div class="con_header">
                                                                    <p class="tb1">For participate auction, you can reserve the seat in advance.</p>
                                                                </div>
                                                                <div class="con_body">
                                                                    <div class="join_box reservation_box">
                                                                        <ul>
                                                                            <li class="full">
                                                                                <div class="box_header">
                                                                                    <img src="/images/mobile/footer/icon_live_08.png">
                                                                                    <p class="tt4">How to register the application form of bidding</p>
                                                                                </div>
                                                                                <div class="box_body">
                                                                                    <p class="tb1">The member who wants bidding through the written report or phone call, please fill the application form completely and submit at the website or the back of catalogue. The form of bidding registration is close on one day before.</p>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="step_stage" id="view-step5">
                                                            <div class="step_title">
                                                                <div class="teb_txt tb2">STEP 05</div>
                                                                <div class="teb_title tt3">Bidding Results and Payment</div>
                                                            </div>
                                                            <div class="step_con">
                                                                <div class="con_body">
                                                                    <div class="identify_box">
                                                                        <ol>
                                                                            <li>
                                                                                <dl>
                                                                                    <dt class="tt4">1. Successful Bid and Priority Order</dt>
                                                                                    <dd class="tb1">Auction works are auctioned off to a bidder who presented the highest price. If there are more than two bidders who get the same amount, the successful bid will determine to the following instructions.</dd>
                                                                                    <dd class="tb1">If the bidders who applied at the auction house, written report, or phone call have a competition with another bidder who has the same amount, the priority order will determine in the order of written > Auction house > Phone call.</dd>
                                                                                </dl>
                                                                            </li>
                                                                            <li>
                                                                                <dl>
                                                                                    <dt class="tt4">2. Confirmation of Successful Bidding</dt>
                                                                                    <dd class="tb1">When you get the bid successfully at Off-line auction, you should write the signature on the confirmation of successful bid at the auction place.</dd>
                                                                                    <dd class="tb1">When you inevitably need to withdraw the objects, the bidder should notify the intention of withdrawal with a document within 7 days from the day of successful bid.</dd>
                                                                                    <dd>
                                                                                        <div class="btn_box">
                                                                                            <a class="btn btn_default" href="/footer/terms" target="terms">
                                                                                                <span>Terms</span>
                                                                                            </a>
                                                                                        </div>
                                                                                    </dd>
                                                                                </dl>
                                                                            </li>
                                                                            <li>
                                                                                <dl>
                                                                                    <dt class="tt4">3. Commission</dt>
                                                                                    <dd class="tb1">
                                                                                        <ul>
                                                                                            <li><span><em>Seoul(Domestic) Auction Purchase Fee</em> : 18% of hammer price(tax excluded)</span></li>
                                                                                            <li><span><em>Hong Kong Auction Purchase Fee</em> : 18% of hammer price</span></li>
                                                                                        </ul>
                                                                                        <ul class="txt_box">
                                                                                            <li><span><em>Hammer Price</em> : The price of the highest bid, finalized by the fall of hammer and being called out his or her paddle number by the auctioneer.</span></li>
                                                                                            <li><span><em>Purchase Price</em> : The sum of hammer price + successful bid fee + VAT</span></li>
                                                                                        </ul>
                                                                                    </dd>
                                                                                </dl>
                                                                            </li>
                                                                        </ol>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="step_stage" id="view-step6">
                                                            <div class="step_title">
                                                                <div class="teb_txt tb2">STEP 06</div>
                                                                <div class="teb_title tt3">Settlement</div>
                                                            </div>
                                                            <div class="step_con">
                                                                <div class="con_body">
                                                                    <div class="ship_box">
                                                                        <div class="txt_box">
                                                                            <ol class="tb1">
                                                                                <li>After payment is confirmed, delivery is possible.
                                                                                    <p>You can pick it up directly at Head Office.</p>
                                                                                </li>
                                                                                <li><em>Inquiry</em> : <a href="tel:82-2-2075-4422">+82(0)2-2075-4422</a> (English), <a href="tel:82-2-2075-4391">+82(0)2-2075-4391</a> (中國語)(Head Office)<br>
                                                                                    Operation time : Mon~Fri 9:00-17:00 (lunch time 12:00-1:00)</li>
                                                                            </ol>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/en/footer.jsp" />
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

    <script>
        $(".js-tab_move a").on("click", function($e) {
            $e.preventDefault();
            var _goY = $(this).attr("href");
            trpScrollTop(_goY, 10);
        });

        $(function() {
            if (sessionStorage.getItem("is_login") === 'true') {
                $("#join").removeAttr("href");
                $("#join").css("cursor", "default");
            }
        });
    </script>
</body>
</html>