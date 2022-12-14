<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../../include/ko/header.jsp"%>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <%@include file="../../include/ko/nav.jsp"%>
            <!-- //header -->
            <script>
                app.value('locale', 'ko');
            </script>

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title -->
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">채용공고</span></h2>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section bbs-section">
                        <div class="section-inner">
                            <div class="content-panel">
                                <div class="panel-body">
                                    <div class="bbs-top">
                                        <div class="bbs_count-area">
                                            총 <span id="recurit_data_count" class="bbs_count-num point">000</span>건
                                        </div>
                                        <div class="bbs_search-area">
                                            <div class="bbs_search-box">
                                                <!-- [0516]placeholder삭제 // -->
                                                <input id="search_text" type="text" class="bbs_search-text" placeholder="">
                                                <button id="search_btn" type="submit" class="bbs_search-btn">검색</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-wrap">
                                        <table class="table_base data-table bbs-table bbs-table2">
                                            <thead>
                                                <tr>
                                                    <th>제목</th>
                                                    <th>날짜</th>
                                                </tr>
                                            </thead>
                                            <tbody id="recurit_tbody"></tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div id="recurit_paging" class="paging-area"></div>
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
                                </div>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
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
    <script src="/js/footer/recruit.js" type="text/javascript"></script>

</body>

</html>