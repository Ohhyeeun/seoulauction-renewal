<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>접속장애 | Seoul Auction</title>
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
                                        <img src="/images/common/etc-server_error.png" alt="접속장애">
                                    </div>
                                </div>
                                <div class="article-body">
                                    <p class="title">서비스에 접속할 수 없습니다.</p>
                                    <p class="desc">
                                        동시 접속자 수가 많거나 네트워크 불안정으로 <br />
                                        일시적 서비스 접속이 불가합니다. <br />
                                        새로고침을 하거나,<br class="only-mb"> 잠시 후 다시 접속해 주시길 바랍니다. <br />
                                        이용에 불편을 드려 죄송합니다.
                                    </p>
                                </div>
                                <div class="article-footer">
                                    <div class="tac">
                                        <a class="btn btn_point" href="/" role="button"><span>메인으로 이동</span></a>
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