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
                                            총 <span id="notice_data_count" class="bbs_count-num point">000</span>건
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
                                                <input id="search_text" type="text" class="bbs_search-text" placeholder="">
                                                <button id="search_btn" type="submit" class="bbs_search-btn">검색</button>
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
                                            <tbody id="notice_tbody"></tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div id="notice_paging" class="paging-area"></div>
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
                                                <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 문의</span></a>
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
    <%--angular 관련은 미리 로딩--%>
    <%@include file="../../common/angular.jsp"%>
    <%@include file="../../common/commonJs.jsp"%>
    <%@include file="../../common/commonJSNotMain.jsp"%>

</body>

</html>