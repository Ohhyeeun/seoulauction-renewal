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
                                <h2 class="page_title"><span class="th1">Press</span></h2>
                            </div>
                        </div>
                    </section>



                    <section class="basis-section bbs-section bbs-media-section">
                        <div class="section-inner">
                            <div class="content-panel">
                                <div class="panel-header">

                                    <div class="tab-wrap">
                                        <div class="tab-area type-left_lg">
                                            <ul class="tab-list js-list_tab_left_lg">
                                                <li><a id="media_tab1" href="#tab-cont-1"><span>South Korea</span></a></li>
                                                <li class="active"><a id="media_tab2" href="#tab-cont-2"><span>Overseas</span></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="panel-body">
                                    <div class="bbs-top">
                                        <div class="bbs_count-area">
                                            Result for <span id="media_count" class="bbs_count-num point">201</span>
                                        </div>
                                        <div class="bbs_search-area">
                                            <div class="bbs_search-box">
                                                <input id="search_text" type="text" class="bbs_search-text" placeholder="Enter a search term">
                                                <button id="search_btn" type="submit" class="bbs_search-btn">search</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-wrap">
                                        <table class="table_base data-table bbs-table bbs-table1">
                                            <thead>
                                                <tr>
                                                    <th>subject</th>
                                                    <th>date</th>
                                                </tr>
                                            </thead>
                                            <tbody id="media_tbody"></tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="panel-footer">
                                        <div id="media_paging" class="paging-area"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <div class="content-panel">
                                <div class="panel-header"></div>
                                <div class="panel-body">

                                </div>
                                <div class="panel-footer">
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
                                                    <div class="manager-box"> <span>PR Marketing Team</span> <em>S.Y Kim</em> </div>
                                                    <div class="contact-box">
                                                        <ul>
                                                            <li><span>T.</span> <a href="tel:82-2-2075-4434"><em>+82(0)2-2075-4434</em></a></li>
                                                            <li><span>E.</span> <a href="mailto:kmj714@seoulauction.com"><em>kmj714@seoulauction.com</em></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn-area">
                                                <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 inquiry</span></a>
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
    <script src="/js/common/paging.js" type="text/javascript"></script>
    <script src="/js/footer/media.js" type="text/javascript"></script>
</body>

</html>