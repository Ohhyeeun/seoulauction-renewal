<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>404 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">
            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="error">
                        <div class="error-inner">

                            <article class="etc_page-article">

                                <div class="article-header">
                                    <div class="img-box">
                                        <img src="/images/common/etc-server_404.png" alt="404">
                                    </div>
                                </div>
                                <div class="article-body">
                                    <p class="title">페이지를 찾을 수 없습니다</p>
                                    <p class="desc">
                                        찾으려는 페이지가 제거 되었거나 이름이 변경되었거나<br />
                                        일시적으로 사용할 수 없는 것일 수 있습니다. <br />
                                        URL을 올바르게 입력했는지 확인하세요 <br />
                                    </p>
                                </div>
                                <div class="article-footer">
                                    <div class="tac">
                                        <a class="btn btn_point" href="#" onclick="window.history.back()" role="button"><span>이전 페이지로 돌아가기</span></a>
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
</body>

</html>