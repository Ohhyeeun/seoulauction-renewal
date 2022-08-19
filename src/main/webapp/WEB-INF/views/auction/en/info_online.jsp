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
                                        <li><a href="/auction/info"><span>Live auction information</span></a></li>
                                        <li class="active"><a><span>Online auction information</span></a></li>
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
                                                    <p class="tb1_1">Seoul Auction, the first art auction house in Korea to launch an online bidding system, offers artworks by a broad range of artists at reasonable prices.</p>
                                                    <p class="tb1_1">In addition to artworks, our auctions also feature various types of lifestyle items (luxury goods, jewelry, designer furniture, figurines, etc.), offering something for everyone.</p>
                                                </div>
                                                <nav class="tab_move-bar js-tab_move online_tab">
                                                    <ul>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step1_online">
                                                                    <div class="teb_txt">STEP 01</div>
                                                                    <div class="teb_title tb1">Sign Up</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step2_online">
                                                                    <div class="teb_txt">STEP 02</div>
                                                                    <div class="teb_title tb1">Preview</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step3_online">
                                                                    <div class="teb_txt">STEP 03</div>
                                                                    <div class="teb_title tb1">Bidding Method</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step4_online">
                                                                    <div class="teb_txt">STEP 04</div>
                                                                    <div class="teb_title tb1">Bidding Results and Payment</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="li-inner">
                                                                <a href="#view-step5_online">
                                                                    <div class="teb_txt">STEP 05</div>
                                                                    <div class="teb_title tb1">Settlement</div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                            <div class="article-body">
                                                <div class="step-area">
                                                    <div class="step_stage" id="view-step1_online">
                                                        <div class="step_title">
                                                            <div class="teb_txt tb2">STEP 01</div>
                                                            <div class="teb_title tt3">Sign Up</div>
                                                        </div>
                                                        <div class="step_con">
                                                            <div class="con_header">
                                                                <div>
                                                                    <p class="tb1_1">Seoul Auction’s online auctions can be participated in by anyone without having to pay a membership fee. All one must do is register for membership on the Seoul Auction website and complete a simple self-authentication procedure before the auction begins.</p>
                                                                    <p class="tb1_1">Bidding for offline art auctions can only be done by regular (paying) members.</p>
                                                                </div>
                                                                <div class="inquiry_txt">
                                                                    <i class="icon-inquiry"></i>
                                                                    <span class="tb1">To apply for membership, an email certification process must be completed. Therefore, please provide a valid email address when applying
                                                                        for membership.</span>
                                                                </div>
                                                            </div>
                                                            <div class="con_body">
                                                                <div class="join_box">
                                                                    <ul class="join_box_online">
                                                                        <li>
                                                                            <div class="box_header">
                                                                                <img src="/images/mobile/footer/icon_live_01.png">
                                                                                <p class="tt4">Register on the website</p>
                                                                            </div>
                                                                            <div class="box_body box_body_online">
                                                                                <div class="txt_area">
                                                                                    <dl class="list_box_wrap">
                                                                                        <dt class="tt5">Please check the Fill the Bidding registration -> YES</dt>
                                                                                        <dd>
                                                                                            <ul class="mark_dot-list tb1 info_dot_list step2_2">
                                                                                                <li>To be able to participate in online auctions, you must check “Yes” under “Bidding Registration” when applying for membership.</li>
                                                                                                <li>The bidding button will become available for use one or two weekdays after selecting “Yes.”</li>
                                                                                                <li>If the bidding button does not become available, please send an email inquiry to info@seoulauction.com</li>
                                                                                                <li>If you register for membership near the closing time of an auction and make an email or phone inquiry related to bidding, Seoul Auction will provide all necessary assistance.</li>
                                                                                                <li>If you require the assistance of an employee regarding a bidding-related matter, please do not hesitate to contact us at any time.</li>
                                                                                            </ul>
                                                                                        </dd>
                                                                                    </dl>
                                                                                </div>
                                                                                <div class="txt_area">
                                                                                    <div class="btn_set">
                                                                                        <div class="btn_box">
                                                                                            <a class="btn btn_default" href="/join" id="join">
                                                                                                <span>Register</span>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="step_stage" id="view-step2_online">
                                                        <div class="step_title">
                                                            <div class="teb_txt tb2">STEP 02</div>
                                                            <div class="teb_title tt3">Preview</div>
                                                        </div>
                                                        <div class="step_con">
                                                            <div class="con_header">
                                                                <p class="tb1">Preview is a simple and small exhibition for check the condition of objects and art works before the auction begins. Anyone can enter the preview show and get a detail service regarding the objects and art works. The dates of preview exhibition and current auction will be notice through the invitation or website.</p>
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
                                                    <div class="step_stage" id="view-step3_online">
                                                        <div class="step_title">
                                                            <div class="teb_txt tb2">STEP 03</div>
                                                            <div class="teb_title tt3">Bidding Method</div>
                                                        </div>
                                                        <div class="step_con">
                                                            <div class="con_header">
                                                                <ul class="mark_dot-list tb1_1 info_dot_list step2">
                                                                    <li>Bidding can be done on the Seoul Auction website during the preview exhibition. Lots will be opened and closed by numerical sequence from the closing time of the auction.</li>
                                                                    <li>If a bid is made less than 30 seconds before closing time, the auction will be automatically extended for 30 seconds.</li>
                                                                    <li>The closing time may vary depending on the online auction number.</li>
                                                                    <li>Bidders may participate in online bidding after completing a procedure to confirm consent.</li>
                                                                </ul>
                                                                <div class="means_txt_wrap_online">
                                                                    <div class="inner">
                                                                        <div class="inquiry_txt">
                                                                            <i class="icon-inquiry"></i>
                                                                            <span class="tb1">If you use Internet Explorer, please verify your settings before the online auction begins.</span>
                                                                        </div>
                                                                        <div class="btn_box">
                                                                            <a class="btn btn_gray_line" href="https://www.seoulauction.com/images/img/online_ie_en.jpg" target="ie">
                                                                                <span>How to enable the automatic refresh on the online auction page</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="con_body">
                                                                <div class="join_box">
                                                                    <ul>
                                                                        <li>
                                                                            <div class="box_header">
                                                                                <img src="/images/mobile/footer/icon_live_04.png">
                                                                                <p class="tt4 onlime_item">Single bid</p>
                                                                            </div>
                                                                            <div class="box_body box_body_online">
                                                                                <div class="txt_area">
                                                                                    <p class="tb1">Manual bidding is made once at a time as given amount of the money.</p>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="box_header">
                                                                                <img src="/images/mobile/footer/icon_live_07.png">
                                                                                <p class="tt4 onlime_item">Automatic bid</p>
                                                                            </div>
                                                                            <div class="box_body box_body_online">
                                                                                <div class="txt_area">
                                                                                    <p class="tb1">Automatic bidding after establishing bid limit in advance</p>
                                                                                    <p class="tb1"><em>For automatic bidding, if there is no other bidder, the lowest bid will be designated as the successful bid.</em></p>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <dl class="online_table_box">
                                                                    <dt>
                                                                        <p class="tb1_1">The asking price unit for each bid amount in the online auction is automatically changed as follows.</p>
                                                                        <p class="tb1_1">This applies to all auctions held online as of November 1, 2019.</p>
                                                                    </dt>
                                                                    <dd>
                                                                        <table class="table_base data-table name-bid_commission">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>From(￦)</th>
                                                                                    <th>To(￦)</th>
                                                                                    <th>By(￦)</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>~</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>1million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>50,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>1million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>3million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>100,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>3million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>5million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>200,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>5million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>10million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>300,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>10million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>30million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>500,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>30million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>50million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>1,000,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>50million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>100million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>2,000,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>100million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>200million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>3,000,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span>200million won</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>~</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <span>5,000,000 won</span>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </dd>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="step_stage" id="view-step4_online">
                                                        <div class="step_title">
                                                            <div class="teb_txt tb2">STEP 04</div>
                                                            <div class="teb_title tt3">Bidding Results and Payment</div>
                                                        </div>
                                                        <div class="step_con">
                                                            <div class="con_body">
                                                                <div class="identify_box">
                                                                    <ol>
                                                                        <li>
                                                                            <dl>
                                                                                <dt class="tt4">1. Successful bid and bid priority</dt>
                                                                                <dd class="tb1">
                                                                                    <p class="tb1"> A successful auction bid is granted to the bidder with the highest bid price. Opportunities for successful bids are granted with priority given to automatic bids, followed by manual bids.</p>
                                                                                    <p class="tb1">If two identical bids are made, priority will be given to the individual who entered his or her bid price first (based on the time indicated by the server).</p>
                                                                                    <p class="tb1">When a bid is made, the auction bid increases based on the bid increment.</p>
                                                                                </dd>
                                                                            </dl>
                                                                        </li>
                                                                        <li>
                                                                            <dl>
                                                                                <dt class="tt4">2. Confirmation of successful bid</dt>
                                                                                <dd class="tb1">Once a successful bid has been determined, an email confirmation of the successful bid is sent. The bidder may also confirm the successful bid price and commission fees on the Seoul Auction website (Log in > Account > Auction Transaction Information > Purchase List).
                                                                                    <div class="inquiry_txt">
                                                                                        <i class="icon-inquiry"></i>
                                                                                        <span class="tb1">The bidder cannot cancel his or her bid without incurring a penalty. In the event a bid must be cancelled, the bidder’s intention to cancel must be expressed in writing within seven days of the successful bid being made. A penalty corresponding to 30 percent of the successful bid price must be paid within seven days for breach of contract.</span>
                                                                                    </div>
                                                                                </dd>
                                                                            </dl>
                                                                        </li>
                                                                        <li>
                                                                            <dl>
                                                                                <dt class="tt4">3. Purchase commission</dt>
                                                                                <dd class="tb1">
                                                                                    <ul>
                                                                                        <li>The bid commission for successful bids is generally imposed in accordance with the relevant regulations, which are listed below.</li>
                                                                                        <li>The commission rates may be applied differently, in accordance with internal policy.</li>
                                                                                        <li><span><em>Online auction</em>: 18% (VAT not included)</span></li>
                                                                                    </ul>
                                                                                    <ul class="txt_box">
                                                                                        <li><span><em>Hammer Price</em> : price announced by the auctioneer upon banging the gavel</span></li>
                                                                                        <li><span><em>Purchase Price</em> : sum of the hammer price, bid commission, and VAT</span></li>
                                                                                    </ul>
                                                                                </dd>
                                                                            </dl>
                                                                        </li>
                                                                        <li>
                                                                            <dl>
                                                                                <dt class="tt4">4. Payment guidelines</dt>
                                                                                <dd class="tb1">Methods of paying the full price of the artwork successfully bid upon are listed below.
                                                                                    <div class="txt_box_last">
<%--                                                                                        <div class="article">--%>
<%--                                                                                            <div class="inquiry_txt">--%>
<%--                                                                                                <i class="icon-inquiry"></i>--%>
<%--                                                                                                <span class="tb1">Wire transfer</span>--%>
<%--                                                                                            </div>--%>
<%--                                                                                            <ul>--%>
<%--                                                                                                <li><em>Bank : Woori Bank (Pyeongchangdong Branch)</em></li>--%>
<%--                                                                                                <li><em>(Online Auction) Account :1005-500-700549</em></li>--%>
<%--                                                                                                <li><em>(Zero Base Auction) Account :1005-403-971518</em></li>--%>
<%--                                                                                                <li>Account Name : SEOUL AUCTION</li>--%>
<%--                                                                                                <li>Swift code : HVBKKRSEXXX</li>--%>
<%--                                                                                                <li><em>Inquiries</em> : (Phone) <a href="tel:82-2-2075-4422">+82 (0)2-2075-4422</a> (Email) <a href="mailto:info@seoulauction.com">info@seoulauction.com</a></li>--%>
<%--                                                                                                <li>Business hours: (KST) 9:00-18:00</li>--%>
<%--                                                                                            </ul>--%>
<%--                                                                                            <p>When making an account transfer, please write the name of the successful bidder in the deposit memo section. If the name of the account holder and name of the bidder are not the same, the deposit confirmation may be delayed. Seoul Auction assumes no responsibility for any inconvenience that may arise from a discrepancy between the name of the account holder and the name of the bidder.</p>--%>
<%--                                                                                        </div>--%>
                                                                                        <div class="article">
                                                                                            <div class="inquiry_txt">
                                                                                                <i class="icon-inquiry"></i>
                                                                                                <span class="tb1">Website payment</span>
                                                                                            </div>
                                                                                            <ul>
                                                                                                <li>For an artwork bid upon via online auction and payment with a credit card that is accepted in Korea, credit card payments may be made on the Seoul Auction website. For a high-value item, there is a chance that credit card payment may not be accepted, in accordance with the policy of the relevant credit card company. The successful bidder should make the payment after logging in to the Seoul Auction website and confirming the hammer price.</li>
                                                                                            </ul>
                                                                                        </div>
<%--                                                                                        <div class="article">--%>
<%--                                                                                            <div class="inquiry_txt">--%>
<%--                                                                                                <i class="icon-inquiry"></i>--%>
<%--                                                                                                <span class="tb1">In-person payment</span>--%>
<%--                                                                                            </div>--%>
<%--                                                                                            <ul>--%>
<%--                                                                                                <li>If the bidder would like to make the payment with a credit card that cannot be used online, he or she may make the payment in person at the Pyeongchang-dong office of Seoul Auction.</li>--%>
<%--                                                                                                <li>If a payment inquiry is made in advance, the employee in charge will provide the relevant guidelines.</li>--%>
<%--                                                                                            </ul>--%>
<%--                                                                                        </div>--%>


<%--                                                                                        <div class="txt_area">--%>
<%--                                                                                            <ul class="mark_dot-list tb1 info_dot_list">--%>
<%--                                                                                                <li>The bidder must make the payment for the artwork (including purchase commission) within seven days of the auction (or 21 days, for hammer prices of KRW 300 million or higher) and take possession of the relevant artwork.</li>--%>
<%--                                                                                                <li>The bidder may make the payment for an artwork via installment based on negotiation with Seoul Auction prior to the auction.</li>--%>
<%--                                                                                                <li>The bidder may pay the full price for the artwork via cashier’s check, cash, or wire transfer to Seoul Auction’s designated bank account.</li>--%>
<%--                                                                                            </ul>--%>
<%--                                                                                        </div>--%> 
                                                                                    </div>
                                                                                </dd>
                                                                            </dl>
                                                                        </li>
                                                                    </ol>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="step_stage" id="view-step5_online">
                                                        <div class="step_title">
                                                            <div class="teb_txt tb2">STEP 05</div>
                                                            <div class="teb_title tt3">Settlement</div>
                                                        </div>
                                                        <div class="step_con">
                                                            <div class="con_body">
                                                                <div class="ship_box">
                                                                    <div class="txt_box">
                                                                        <p class="tt4">Ways for the bidder to receive the artwork</p>
                                                                        <ol class="tb1 mark-list">
                                                                            <li>1. Artworks bid upon in an auction <em>must be received directly by the bidder.</em></li>
                                                                            <li>2. Pick-up location : <em>Seoul Auction House (B1, Storage), 24 (Pyeongchang-dong 98), Pyeongchang 30-gil, Jongro-gu, Seoul,</em> or the Hong Kong office (SA+) for artworks held in Hong Kong</li>
                                                                            <li>3. Please <em>make a reservation</em> with a sales employee <em>for the date and time you wish to pick up</em> artwork <em>by the day before pick-up.</em><br />
                                                                                <p>Pick-up is conducted based entirely on an advance reservation system.<br>
                                                                                    <em>If you arrive at the office without a reservation, you will not be able to pick up the artwork.</em>
                                                                                </p>
                                                                            </li>
                                                                            <li>4. Pick-up days and times : <em>Monday to Friday</em> (excluding national holidays) / Seoul Auction business hours: 9 a.m. to 6 p.m.<br>
                                                                                (excluding lunch hour (12 p.m. to 1 p.m.)
                                                                                <p>For pick-up by car: artworks up to <em>90 &#215; 118cm</em> in size can be loaded into a car (up to No. 50 canvas)</p>
                                                                            </li>
                                                                            <li>5. If the bidder is unable to pick up the artwork directly, Seoul Auction can recommend the services of an art shipment company. In this case,
                                                                                the shipment of the artwork shall be <em>the responsibility of (and paid for by) the bidder.</em>
                                                                                <p><em>Regular delivery companies are not recommended</em> due to the risk of damage to or loss of the artwork.</p>
                                                                            </li>
                                                                        </ol>
                                                                    </div>
                                                                    <div class="txt_area">
                                                                        <p class="tb1_1">Basic shipping fee (One Way)</p>
                                                                        <ul class="mark_dot-list tb1_1 info_dot_list step5">
                                                                            <li>Shipping fee is free of charge for Seoul and Gyeonggi-do. For other provinces, it will be shipped twice a month on the designated day for free of charge. (Including weekend)</li>
                                                                            <li>Additional fee is charged for individual shipping, mountainous, remotes areas, Jeju Island and overseas.</li>
                                                                            <li>Additional fee is paid to the on-site employee who does the installation and artworks that require additional personnel for installation.<br>
                                                                                (Quotation will be provided in advance)</li>
                                                                            <li>Inquiry: <a href="tel:82-2-2075-4404">+82 (0)2-2075-4404</a></li>
                                                                            <li>Overseas: Estimated on request</li>
                                                                        </ul>
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