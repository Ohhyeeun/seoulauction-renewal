<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%--<%@include file="../../include/ko/header.jsp"%>--%>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass type-pagemain">

            <!-- header -->
<%--            <%@include file="../../include/ko/nav.jsp"%>--%>
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
                                <h2 class="page_title"><span class="th1">FAQ (자주하는 질문)</span></h2>
                            </div>
                        </div>
                    </section>
                    <section class="basis-section last-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-faq">

                                <div class="panel-body">

                                    <!--검색필드//-->
                                    <div class="search-area">
                                        <div class="search-box">
                                            <div class="input_del">
                                                <input id="search_text" class="" type="text" placeholder="검색어를 입력하세요." value="">
                                                <button class="btn_del"><i class="form-search-del_lg"></i></button>
                                            </div>
                                            <button id="search_btn" class="btn_search"><i class="form-search_lg"></i></button>
                                        </div>
                                    </div>
                                    <!--//검색필드-->

                                    <div class="faq-area">

                                        <!--faq tab//-->
                                        <div class="tab-wrap">
                                            <div class="tab-area type-sorting">
                                                <ul class="tab-list js-list_tab">
                                                    <li class="active"><a href=""><span id="faq_a">회원정보</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_b">라이브경매</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_c">온라인경매</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_d">위탁</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_e">결제/배송</span></a></li>
                                                    <li class=""><a href="#"><span id="faq_f">기타</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--//faq tab-->

                                        <!--faq cont//-->
                                        <ul id="faq_content" class="accordion-list faq js-accordion_faq">
                                            <li class="trp_acitem">
                                                <div class="header-area">
                                                    <div class="accordion_name tt4">
                                                        <a href="#" class="">
                                                            <span class="faq">Q.</span>
                                                            온라인 경매 페이지 자동 새로고침 해결방법?

                                                            <i class="icon-accordion_arrow_down"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="con-area">
                                                    <span class="faq">A.</span>
                                                    <div class="faq_cont tb1">
                                                        1. 익스플로러 설정 클릭 (보통 톱니바퀴 모양)<br />
                                                        2. 인터넷 옵션 클릭<br />
                                                        3. 일반 -> 검색기록 -> 설정 클릭<br />
                                                        4. 웹 페이지를 열 때 마다 클릭<br />
                                                        5. 확인(저장)<br />

                                                        <p class="faq_img">
                                                            <img src="/images/pc/footer/img_faq_pc.png" alt="" class="only-pc" />
                                                            <img src="/images/pc/footer/img_faq_mo.png" alt="" class="only-mb" />
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="trp_acitem">
                                                <div class="header-area">
                                                    <div class="accordion_name tt4">
                                                        <a href="#" class="">
                                                            <span class="faq">Q.</span>
                                                            위탁은 어떻게 하나요?

                                                            <i class="icon-accordion_arrow_down"></i>
                                                        </a>
                                                    </div>

                                                </div>
                                                <div class="con-area">
                                                    <span class="faq">A.</span>
                                                    <div class="faq_cont tb1">
                                                        art@seoulauction.com<br />
                                                        1. 성함 2. 연락처 3. 작품제목 4. 사이즈 5. 소장경위 6. 작품사진<br />
                                                        - 전체컷, 싸인 등의 부분컷(중요부분) 을 보내주시면, <br />
                                                        작품별 스페셜리스트에게 전달되어 답변 드리겠습니다.<br />
                                                        자세한 내용은 위탁안내 페이지를 참고 해주시기 바랍니다.

                                                        <div class="btn_wrap">
                                                            <a class="btn btn_gray_line tb2" href="#" role="button"><span>위탁안내 바로가기</span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>

                                        <!--//faq cont-->

                                    </div>

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
<%--            <jsp:include page="../../include/ko/footer.jsp" flush="false"/>--%>
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