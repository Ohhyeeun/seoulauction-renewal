<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass type-pagemain">

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
                                <h2 class="page_title"><span class="th1">CUSTOMER CENTER</span></h2>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-faq">

                                <div class="panel-body">

                                    <!--검색필드//-->
                                    <div class="search-area">
                                        <div class="search-box">
                                            <div class="input_del">
                                                <input id="search_text" class="" type="text" placeholder="Enter a search term." value="">
                                                <button class="btn_del"><i class="form-search-del_lg"></i></button>
                                            </div>
                                            <button id="search_btn" class="btn_search"><i class="form-search_lg"></i></button>
                                        </div>
                                    </div>
                                    <!--//검색필드-->

                                    <div class="faq-area">

                                        <!--faq tab//-->
                                        <div class="tab-wrap">
                                            <div class="tab-area type-sorting">
                                                <ul class="tab-list js-list_tab">
                                                    <li class="active"><a href="#"><span id="faq_a">PROFILE</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_b">LIVE AUCTION</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_c">ONLINE AUCTION</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_d">CONSIGNMENT</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_e">PAYMENT/SHIPPING</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_f">OTHERS</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--//faq tab-->

                                        <!--faq cont//-->
                                        <ul id="faq_content" class="accordion-list faq js-accordion_faq">
                                            <li class="trp_acitem">
                                                <div class="header-area">
                                                    <div class="accordion_name tt4">
                                                        <a href="#" class="">
                                                            <span class="faq">Q.</span>
                                                            How to enable the automatic refresh function on the online auction page.

                                                            <i class="icon-accordion_arrow_down"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="con-area">
                                                    <span class="faq">A.</span>
                                                    <div class="faq_cont tb1">
                                                        1. Click on “Settings” in Internet Explorer (icon shaped like a sprocket)<br>
                                                        2. Click on “Internet Options”<br>
                                                        3. Go to General -> Browsing history -> Settings<br>
                                                        4. Click “Every time I visit the webpage” under Temporary Internet Files<br>
                                                        5. OK (Save)<br>
                                                        6. OK (Save)
                                                        <p class="faq_img">
                                                            <img src="/images/pc/footer/img_faq_pc.png" alt="" class="only-pc" />
                                                            <img src="/images/pc/footer/img_faq_mo.png" alt="" class="only-mb" />
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="trp_acitem">
                                                <div class="header-area">
                                                    <div class="accordion_name tt4">
                                                        <a href="#" class="">
                                                            <span class="faq">Q.</span>
                                                            How do you make a consignment?

                                                            <i class="icon-accordion_arrow_down"></i>
                                                        </a>
                                                    </div>

                                                </div>
                                                <div class="con-area">
                                                    <span class="faq">A.</span>
                                                    <div class="faq_cont tb1">
                                                        art@seoulauction.com<br>
                                                        <br>
                                                        Please send the types of information listed below to art@seoulauction.com. The information you provide will be conveyed to the respective specialist, who will provide you with the relevant details.<br>
                                                        1. Name 2. Phone number 3. Title of artwork 4. Size of artwork 5. Description of how the artwork came into your possession 6. Photos of artwork (full and partial views, showing the signature, important parts, etc.)<br>
                                                        Please refer to the consignment guidelines page for further information. <br>
                                                        Consignment (https://www.seoulauction.com/auctionGuide/page?view=commissionGuide&lang=en)
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <!--//faq cont-->
                                    </div>
                                    <!-- 고객센터 -->
                                    <!-- [0523]클래스명 수정 //-->
                                    <article class="inquiry-article type-customer">
                                        <div class="inquiry-box">
                                            <div class="typo-area">
                                                <div class="icon-box">
                                                    <i class="icon-customer"></i>
                                                </div>
                                                <div class="title-box">
                                                    <strong>Service center</strong>
                                                </div>
                                                <div class="info-guide">
                                                    <div class="contact-box">
                                                        <ul>
                                                            <li><span>T.</span> <em>82+(0)2-395-0330</em></li>
                                                            <li><span>E.</span> <a href="mailto:info@seoulauction.com"><em>info@seoulauction.com</em></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="message-box tb2">Operation 09:00 ~ 18:00 KST (Closed on weekends and holidays)<br> After business hours, please use 1:1 inquiry or e-mail inquiry.</div>
                                                </div>
                                            </div>
                                            <div class="btn-area">
                                                <a class="btn btn_gray_line" href=/mypage/inquiryForm role="button"><span>1:1 inquiry</span></a>
                                            </div>
                                        </div>
                                    </article>
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
    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <script src="/js/footer/faq.js" type="text/javascript"></script>
</body>
</html>