<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">

        <!-- header -->
        <jsp:include page="../../include/en/nav.jsp" flush="false"/>
        <!-- //header -->
        <script>
            app.value('locale', 'en');
        </script>

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Private Sale</span></h2>
                            <div class="page_desc"><span class="tb1"></span></div>
                        </div>
                    </div>
                </section>



                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">

                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#" onclick="goPsGuide();"><span>Private Sale Guide</span></a></li>
                                    <li class=""><a href="#" onclick="goPrivateSale();"><span>Private Sale</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <section class="basis-section last-section ps_guide-section">
                    <div class="section-inner">

                        <div class="content-panel last-section  type_panel-ps_guide">
                            <div class="panel-body">

                                <article class="row_2 guide-article">
                                    <div class="col_item image">
                                        <div class="img-box">
                                            <img src="/images/pc/private_sale/ps_guide-1.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="col_item typo">
                                        <div class="typo-header">
                                            <span class="tt2">Featuring </span>
                                            <em class="tt2">your artwork </em>
                                            <span class="tt2">in the most elegant, globally oriented way</span>
                                        </div>
                                        <div class="typo-body">
                                                <span class="tb1">
                                                    Founded in 1998 as Korea’s first art auction house, Seoul Auction now has several state-of-the-art facilities (Pyeongchang-dong , Gangnam offices,and Busan exhibition space where various types of artworks can be appreciated.
                                                    In addition to operating the headquarters and Gangnam center for a variety of customers, the Busan branch is also actively operating with a number of exhibitions and auction previews, making Seoul Auction more widely accessible to customers. It not only features artworks of Korean artists, such as Kim WhanKi , Lee UFan, and Park Seo-bo, but also holds exhibitions of famous foreign artists. Feature your artwork in Seoul Auction’s diverse exhibition spaces, where they can be enjoyed by collectors from all over the world.
                                                </span>
                                        </div>
                                    </div>
                                </article>
                                <article class="row_2 guide-article">
                                    <div class="col_item typo">
                                        <div class="typo-header">
                                            <span class="tt2">The professionalism of Seoul Auction’s </span>
                                            <em class="tt2">Private Sales</em>
                                        </div>
                                        <div class="typo-body">
                                                <span class="tb1">
                                                    As Korea’s first art auction house, Seoul Auction has consistently created new standards for art appreciation through its many auctions. It operates a customer-centric art appreciation service that assesses the value of artworks, including single pieces, large-scale collections, and ancient and foreign artworks. Seoul Auction’s Private Sales, in particular, conveys the value of prominent works of art to a diverse client based on its global platform, expertise, and extensive successful bid records. Seoul Auction guarantees that the value of your artwork will be recognized through methods you can depend on.
                                                </span>
                                        </div>
                                    </div>
                                    <div class="col_item image">
                                        <div class="img-box">
                                            <img src="/images/pc/private_sale/ps_guide-2.jpg" alt="" />
                                        </div>
                                    </div>
                                </article>

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
                                                <div class="manager-box"> <span>Seoul Auction Partner Group</span> <em>Kim seungyeob</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:02-2075-4426"><em>02-2075-4426, </em></a> <a href="tel:010-9045-0315"><em>010-9045-0315</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:sky@seoulauctionl.com"><em>sky@seoulauctionl.com</em></a></li>
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
                            <!-- [0516] 삭제
            <div class="panel-footer">
              <div class="img-box">
                <img src="/images/pc/private_sale/ps_guide.jpg" alt="" />
              </div>
            </div> -->

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


<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/private_sale/psGuide.js" type="text/javascript"></script>

</body>

</html>