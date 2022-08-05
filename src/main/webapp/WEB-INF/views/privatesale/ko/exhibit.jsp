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

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Exhibition</span></h2>
                            <div class="page_desc"><span class="tb1">전시</span></div>
                        </div>
                    </div>
                </section>


                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">

                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#" onclick="goExhibit();"><span>소개</span></a></li>
                                    <li class=""><a href="#" onclick="goExhibitFirst();"><span>전시명 1</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- 전시 -->
                <section class="basis-section last-section ">
                    <div class="section-inner">
                        <div class="content-panel type_panel-exhibition_info">
                            <div class="panel-body">

                                <div class="img-area">
                                    <figure class="">
                                        <img class="only-pc" src="/images/pc/private_sale/exhibition-info.jpg" alt="소개">
                                        <img class="only-mb" src="/images/mobile/private_sale/exhibition-info.jpg" alt="소개">
                                    </figure>
                                </div>


                                <article class="exhibition_info-article">
                                    <div class="article-body">

                                        <p class="tb1">
                                            일상 속 예술을 위한공간, 강남을 대표하는 랜드마크 서울옥션 강남센터에서는 다양한 전시를 진행합니다.
                                        </p>

                                        <p class="tb1">
                                            원화, 조각, 오브제, 판화, 가구 등 풍성한 구성의 작품을 감상하고 소장할 수 있습니다. <br />
                                            예술이 선사하는 또다른 기쁨을 전시를 통해 작접 만나보세요.
                                        </p>

                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">
                                <!-- 문의하기 -->


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
                                                <div class="manager-box"> <span>서울옥션 전시마케팅</span> <em>윤가람 선임</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:02-2075-4422"><em>02-2075-4422</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:kyoon@seoulauction.com"><em>kyoon@seoulauction.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryList" role="button"><span>1:1 문의</span></a>
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

<script>
    app.value('locale', 'ko');
</script>

<script type="text/javascript" src="/js/private_sale/exhibit.js" type="text/javascript"></script>
<!-- tab menu -->
</body>

</html>