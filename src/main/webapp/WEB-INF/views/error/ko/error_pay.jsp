<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

                    <section class="error">
                        <div class="error-inner">

                            <article class="etc_page-article">

                                <div class="article-header">
                                </div>
                                <div class="article-body">
                                    <p class="title">결제승인에 실패했습니다.</p>
                                    <p class="desc">
                                        이용에 불편을 드려 죄송합니다
                                    </p>
                                    <div class="alert-box">
                                        <p>
                                            <em>실패 사유</em> <span> : 결제카드 한도 초과</span>
                                        </p>
                                        <p>
                                            <em>실패 코드</em> <span> : 123213</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="article-footer">
                                    <div class="tac">
                                        <a class="btn btn_point" href="#" role="button"><span>다시 결제하기</span></a>
                                    </div>
                                </div>
                            </article>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" />
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