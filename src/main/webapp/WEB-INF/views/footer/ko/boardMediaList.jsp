<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>언론보도 | Seoul Auction</title>
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
                                                <li class="active"><a href="#tab-cont-1"><span>국내</span></a></li>
                                                <li><a href="#tab-cont-2"><span>해외</span></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="panel-body">
                                    <div class="bbs-top">
                                        <div class="bbs_count-area">
                                            총 <span class="bbs_count-num point">000</span>건
                                        </div>
                                        <div class="bbs_search-area">
                                            <div class="bbs_search-box">
                                                <!-- [0516]placeholder삭제// -->
                                                <input type="text" class="bbs_search-text" placeholder="">
                                                <button type="submit" class="bbs_search-btn">검색</button>
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
                                            <tbody>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">연합뉴스</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">서울옥션 "신세계와 미술품·NFT·메타버스 공동 사업"</a>
                                                    </td>
                                                    <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매일경제</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">"평범한 그림인 줄 알았는데"…디올 옷에 등장 흑인 얼굴, 8억짜리 아모아코 보아포 그림이었다</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">비즈니스 포스트</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">서울옥션 올해 미술품경매 총 낙찰금액 1670억, 최고가 54억 낙찰</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다. 언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다. 언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다. 언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다. 언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-subject">
                                                        <span class="bbs-media">매체사</span>
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">언론보도 게시글 타이틀을 최대 2줄 까지 노출합니다.</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                            </tbody>
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
                                                <a class="btn btn_gray_line" href="#" role="button"><span>1:1 문의</span></a>
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



    <script>
        $('.js-list_tab_left_lg a').on('click', function(e) {
            e.preventDefault();
            var tar = $(this).position().left;
            var scrollX = tar - ($(".js-list_tab_left_lg").parents(".tab-area").width() / 2) + $(this).width() / 2;

            if ($(this).parents('li').hasClass('active')) {
                return false;
            } else {
                $(".js-list_tab_left_lg li").removeClass('active');
                $(this).parents('li').addClass('active');

                $(".js-list_tab_left_lg").parents(".tab-area").scrollLeft(scrollX);
            }
        });
    </script>
</body>

</html>