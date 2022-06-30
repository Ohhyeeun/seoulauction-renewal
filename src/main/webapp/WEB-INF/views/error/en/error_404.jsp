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

                    <section class="error">
                        <div class="error-inner">

                            <article class="etc_page-article">

                                <div class="article-header">
                                </div>
                                <div class="article-body">
                                    <p class="title">Page not found.</p>
                                    <p class="desc">
                                        It may have been renamed or temporarily unavailable. Please make sure you entered the URL correctly.<br />
                                    </p>
                                </div>
                                <div class="article-footer">
                                    <div class="tac">
                                        <a class="btn btn_point" href="#" onclick="window.history.back()" role="button"><span>Go Previous page</span></a>
                                    </div>
                                </div>
                            </article>

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
</body>
</html>