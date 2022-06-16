<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>공지사항 | Seoul Auction</title>
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
                                <h2 class="page_title"><span class="th1">공지사항</span></h2>
                            </div>
                        </div>
                    </section>



                    <section class="basis-section bbs-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-notice">
                                <div class="panel-body">
                                    <div class="bbs-top">
                                        <div class="bbs_count-area">
                                            총 <span class="bbs_count-num point">000</span>건
                                        </div>
                                        <div class="bbs_search-area">
                                            <!-- <div class="bbs_search-slctbox">
												<div class="select-box"> 
													<select class="select2Basic42"  id="">
														<option value="제목">제목</option>
														<option value="분류">분류</option>
														<option value="내용">내용</option>
														<option value="제목+내용">제목+내용</option>
													</select>
												</div>
											</div> -->
                                            <div class="bbs_search-box">
                                                <input type="text" class="bbs_search-text" placeholder="">
                                                <button type="submit" class="bbs_search-btn">검색</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-wrap">
                                        <table class="table_base data-table bbs-table bbs-table3">
                                            <thead>
                                                <tr>
                                                    <th>분류</th>
                                                    <th>제목</th>
                                                    <th>날짜</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="bbs-division">경매</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">4월 e BID 프리미엄 온라인 경매
                                                            4월 e BID 프리미엄 온라인 경매 4월 e BID 프리미엄 온라인 경매 4월 e BID 프리미엄 온라인 경매 4월 e BID txt123456789</a> <i class="icon_down"></i>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">안내</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">ZEROBASE: The Edit</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <i class="icon_down"></i>
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">공고</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">3월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">경매</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2022 Contemporary Art Sale</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">안내</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">3월 e BID 퍼블릭 온라인 경매 Ⅰ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">공고</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">ZEROBASE x DKNY, CLUB MONACO</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <i class="icon_down"></i>
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">경매</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">3월 e BID 프리미엄 온라인 경매</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <i class="icon_down"></i>
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">안내</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">공고</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">경매</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">안내</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">공고</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">경매</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">안내</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
                                                        <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                                    </td>
                                                    <td class="bbs-date">2022.04.05</td>
                                                </tr>
                                                <tr>
                                                    <td class="bbs-division">공고</td>
                                                    <td class="bbs-subject">
                                                        <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                                        <a href="#" class="tit">2월 e BID 퍼블릭 온라인 경매 Ⅱ</a>
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
                                                <!-- [0523]paging 끝번호 수정 -->
                                                <a href="#"><em>10</em></a>
                                                <!-- //[0523]paging 끝번호 수정 -->
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
                                    <!-- 고객센터 -->





                                    <!-- [0523]클래스명 수정 //-->
                                    <article class="inquiry-article type-customer">
                                        <div class="inquiry-box">
                                            <div class="typo-area">
                                                <div class="icon-box">
                                                    <i class="icon-customer"></i>
                                                </div>
                                                <div class="title-box">
                                                    <strong>고객센터</strong>
                                                </div>
                                                <div class="info-guide">
                                                    <div class="contact-box">
                                                        <ul>
                                                            <li><span>T.</span> <em>02-395-0330</em></li>
                                                            <li><span>E.</span> <a href="mailto:sos@seoulauction.com"><em>sos@seoulauction.com</em></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="message-box tb2"> 운영 09:00 ~18:00 (주말, 공휴일 휴무) 운영시간 이후에는 1:1 문의 또는 이메일 문의를 이용해 주세요. </div>
                                                </div>
                                            </div>
                                            <div class="btn-area">
                                                <a class="btn btn_gray_line" href="#" role="button"><span>1:1 문의</span></a>
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


    <script src="/js/footer/notice.js" type="text/javascript"></script>



</body>

</html>