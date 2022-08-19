<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Exhibition</span></h2>
                            <div class="page_desc"><span class="tb1"></span></div>
                        </div>
                    </div>
                </section>


                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">

                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#" onclick="goExhibit();"><span>Introduce</span></a></li>
                                    <li class=""><a href="#" onclick="goExhibitFirst();"><span>Exhibition 1</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- 전시 -->
                <section class="basis-section last-section ">
                    <div class="section-inner">
                        <div class="content-panel type_panel-exhibition_info">
                            <div class="panel-body">

                                <div class="img-area">
                                    <figure class="">
                                        <img class="only-pc" src="/images/pc/private_sale/exhibition-info.jpg" alt="소개">
                                        <img class="only-mb" src="/images/mobile/private_sale/exhibition-info.jpg" alt="소개">
                                    </figure>
                                </div>


                                <article class="exhibition_info-article">
                                    <div class="article-body">

                                        <p class="tb1">
                                            A space for art in everyday life, a landmark representing Gangnam, Seoul Auction Gangnam Center hosts various exhibitions.
                                        </p>

                                        <p class="tb1">
                                            You can appreciate and own works of rich composition such as original paintings, sculptures, objects, prints, and furniture. Experience another joy that art has to offer through the exhibition.
                                        </p>
                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">
                                <!-- 문의하기 -->


                                <article class="inquiry-article ">
                                    <div class="inquiry-box">
                                        <div class="typo-area">
                                            <div class="icon-box">
                                                <i class="icon-academy_inquiry"></i>
                                            </div>
                                            <div class="title-box">
                                                <strong>Contact</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>Head of Sale, Exhibition Marketing </span> <em>Yoon Ga-ram</em> </div> 
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:02-2075-4422"><em>02-2075-4422</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:kyoon@seoulauctionl.com"><em>kyoon@seoulauctionl.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryList" role="button"><span>1:1 Inquiry</span></a>
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
        <jsp:include page="../../include/en/footer.jsp" flush="false"/>
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
    app.value('locale', 'en');
</script>

<script type="text/javascript" src="/js/private_sale/exhibit.js" type="text/javascript"></script>
</body>

</html>