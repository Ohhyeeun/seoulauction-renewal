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
                                    <p class="title">Payment authorization failed.</p>
                                    <p class="desc">
                                        We apologize for the inconvenience.
                                    </p>
                                    <div class="alert-box">
                                        <p>
                                            <em>Reason for failure</em> <span> : Exceeded payment card limit</span>
                                        </p>
                                        <p>
                                            <em>Failure code</em> <span> : 123123</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="article-footer">
                                    <div class="tac">
                                        <a class="btn btn_point" href="#" role="button"><span>repayment</span></a>
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

    <!-- [0728]비디오 세로사이즈 -->
    <script>
        var _videoAnchor = $(".video_img-box a");
        var _videoAnchorImg = $(".video_img-box a img");
        _videoAnchorImg.each(function() {
            _videoAnchor = $(this).parent(_videoAnchor);

            if ($(this).width() < $(this).height()) {
                _videoAnchor.addClass("vertical");
            } else {
                _videoAnchor.removeClass("vertical");
            }
        })
    </script>
    <!-- //[0728]비디오 세로사이즈 -->

</body>

</html>