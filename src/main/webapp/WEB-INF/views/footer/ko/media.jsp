<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title -->
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">언론보도</span></h2>
                            </div>
                        </div>
                    </section>
                    <section class="basis-section bbs-section bbs-media-section">
                        <div class="section-inner">
                            <div class="content-panel">
                                <div class="panel-header">

                                    <div class="tab-wrap">
                                        <!-- <div class="tab-area type-left">
											<ul class="tab-list js-list_tab">
												<li class="active"><a href="#tab-cont-1"><span>국내</span></a></li>
												<li><a href="#tab-cont-2"><span>해외</span></a></li>
											</ul>
										</div> -->
                                        <div class="tab-area type-left_lg">
                                            <ul class="tab-list js-list_tab_left_lg">
                                                <li class="active"><a id="media_tab1" href="#tab-cont-1"><span>국내</span></a></li>
                                                <li><a id="media_tab2" href="#tab-cont-2"><span>해외</span></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="panel-body">
                                    <div class="bbs-top">
                                        <div class="bbs_count-area">
                                            총 <span id="media_count" class="bbs_count-num point">000</span>건
                                        </div>
                                        <div class="bbs_search-area">
                                            <div class="bbs_search-box">
                                                <!-- [0516]placeholder삭제// -->
                                                <input id="search_text" type="text" class="bbs_search-text" placeholder="">
                                                <button id="search_btn" type="submit" class="bbs_search-btn">검색</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-wrap">
                                        <table class="table_base data-table bbs-table bbs-table1">
                                            <thead>
                                                <tr>
                                                    <th>제목</th>
                                                    <th>날짜</th>
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
                                    <!-- 문의하기 -->
                                    <!-- [0613]텍스트수정 -->


                                    <article class="inquiry-article ">
                                        <div class="inquiry-box">
                                            <div class="typo-area">
                                                <div class="icon-box">
                                                    <i class="icon-academy_inquiry"></i>
                                                </div>
                                                <div class="title-box">
                                                    <strong>문의하기</strong>
                                                </div>
                                                <div class="info-guide">
                                                    <div class="manager-box"> <span>홍보마케팅팀</span> <em>김서영 선임</em> </div>
                                                    <div class="contact-box">
                                                        <ul>
                                                            <li><span>T.</span> <em>02-2075-4434</em></li>
                                                            <li><span>E.</span> <a href="mailto:kmj714@seoulauction.com"><em>kmj714@seoulauction.com</em></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn-area">
                                                <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 문의</span></a>
                                            </div>
                                        </div>
                                    </article>
                                    <!-- //[0613]텍스트수정 -->
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

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <script src="/js/common/paging.js" type="text/javascript"></script>
    <script src="/js/footer/media.js" type="text/javascript"></script>

</html>