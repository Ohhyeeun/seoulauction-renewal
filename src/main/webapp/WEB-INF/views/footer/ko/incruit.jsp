<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>채용공고 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_ko.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
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
                                            총 <span class="bbs_count-num point">000</span>건
                                        </div>
                                        <div class="bbs_search-area">
                                            <div class="bbs_search-box">
                                                <!-- [0516]placeholder삭제 // -->
                                                <input type="text" class="bbs_search-text" placeholder="">
                                                <button type="submit" class="bbs_search-btn">검색</button>
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
                                            <!-- [0613] 구조변경, 제목(.tit) span을 a로 변경 -->
                                            <tbody>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <div class="icon-wrap">
                                                            <div class="mem-icon icon-new">신입</div>
                                                            <div class="mem-icon icon-senior">경력</div>
                                                            <div class="mem-icon icon-recruiting">진행중</div>
                                                        </div>
                                                        <a href="#" class="tit">기술개선팀 신규직원 모집</a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <div class="icon-wrap">
                                                            <div class="mem-icon icon-senior">경력</div>
                                                            <div class="mem-icon icon-recruiting">진행중</div>
                                                        </div>
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <div class="icon-wrap">
                                                            <div class="mem-icon icon-senior">경력</div>
                                                            <div class="mem-icon icon-recruiting">진행중</div>
                                                        </div>
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.
                                                            채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다. 채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.
                                                        </a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.
                                                            채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다. 채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.
                                                        </a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <a href="#" class="tit">채용공고 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                    </td>
                                                    <td class="bbs-date long">2022.04.05 ~ 2022.04.05</td>
                                                </tr>
                                            </tbody>
                                            <!-- //[0613] 구조변경 -->
                                        </table>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="paging-area">
                                        <div class="paging">
                                            <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#" class="prev icon-page_prev">PREV</a>
                                            <strong class="on">1</strong>
                                            <a href="#"><em>2</em></a>
                                            <a href="#"><em>3</em></a>
                                            <a href="#"><em>4</em></a>
                                            <a href="#"><em>5</em></a>
                                            <span class="pc-ver">
                                                <a href="#"><em>6</em></a>
                                                <a href="#"><em>7</em></a>
                                                <a href="#"><em>8</em></a>
                                                <a href="#"><em>9</em></a>
                                                <!-- [0516] 숫자변경// -->
                                                <a href="#"><em>10</em></a>
                                            </span>
                                            <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a>
                                        </div>
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
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>




</body>

</html>