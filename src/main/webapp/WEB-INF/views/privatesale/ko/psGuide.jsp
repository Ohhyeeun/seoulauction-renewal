<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">

        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <!-- //header -->
        <script>
            app.value('locale', 'ko');
        </script>

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Private Sale</span></h2>
                            <div class="page_desc"><span class="tb1">프라이빗 세일</span></div>
                        </div>
                    </div>
                </section>

                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">

                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#" onclick="goPsGuide();"><span>프라이빗세일 가이드</span></a></li>
                                    <li class=""><a href="#" onclick="goPrivateSale();"><span>프라이빗세일</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <section class="basis-section last-section ps_guide-section">
                    <div class="section-inner">

                        <div class="content-panel last-section  type_panel-ps_guide">
                            <div class="panel-body">

                                <article class="row_2 guide-article">
                                    <div class="col_item image">
                                        <div class="img-box">
                                            <img src="/images/pc/private_sale/ps_guide-1.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="col_item typo">
                                        <div class="typo-header">
                                            <em class="tt2">당신의 작품을</em>
                                            <span class="tt2">가장 글로벌하고 <br class="only-pc" />가치 있게 보여드립니다.</span>
                                        </div>
                                        <div class="typo-body">
                                                <span class="tb1">
                                                    1998년 설립한 국내 최초의 미술품 경매 회사 서울옥션은 서울의 평창동과 강남 사옥과
                                                    새로 리모델링을 거친 부산전시장까지, 다양한 작품을 감상할 수 있는 최상의 전시장을
                                                    보유하고 있습니다. 다양한 고객층을 위해 본사와 강남 사옥을 운영하는 것은 물론,
                                                    거리적 접근성이 어려운 고객들을 위해 부산지점 또한, 다수의 전시 및 경매 프리뷰
                                                    진행으로 활발히 운영중에 있습니다. 김환기, 이우환, 박서보 등의 한국 작가뿐 아니라
                                                    해외 유명 작가의 전시를 관람할 수 있습니다. 전세계 컬렉터와 호흡하는 서울옥션이
                                                    보유한 다양한 공간에서 당신 작품의 가치를 보여 드립니다.
                                                </span>
                                        </div>
                                    </div>
                                </article>
                                <article class="row_2 guide-article">
                                    <div class="col_item typo">
                                        <div class="typo-header">
                                            <span class="tt2">서울옥션</span>
                                            <em class="tt2">프라이빗 세일</em>
                                            <span class="tt2">의 전문성</span>
                                        </div>
                                        <div class="typo-body">
                                                <span class="tb1">
                                                    서울옥션은 한국 최초의 미술품 경매 회사로 꾸준히 경매를 이어오며 미술품 가치의
                                                    새로운 기준을 제시해왔습니다. 단 한 점의 소장품부터 대규모 컬렉션,
                                                    고미술품부터 해외 미술에 이르기까지 미술품의 가치를 평가하는
                                                    고객 밀착형 서비스를 시행합니다. 특히, 서울옥션의 프리이빗 세일 노하우는
                                                    글로벌 플랫폼과 전문성 그리고 낙찰 기록을 바탕으로 다양한 고객들에게
                                                    작품의 가치를 전달합니다. 당신 작품의 가치를 가장 만족스럽게 보장해 드립니다.
                                                </span>
                                        </div>
                                    </div>
                                    <div class="col_item image">
                                        <div class="img-box">
                                            <img src="/images/pc/private_sale/ps_guide-2.jpg" alt="" />
                                        </div>
                                    </div>
                                </article>

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
                                                <div class="manager-box"> <span>파트너그룹</span> <em>김승엽 선임</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:02-2075-4426"><em>02-2075-4426, </em></a> <a href="tel:010-9045-0315"><em>010-9045-0315</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:sky@seoulauctionl.com"><em>sky@seoulauctionl.com</em></a></li>
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
                            <!-- [0516] 삭제
            <div class="panel-footer">
              <div class="img-box">
                <img src="/images/pc/private_sale/ps_guide.jpg" alt="" />
              </div>
            </div> -->

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
<script type="text/javascript" src="/js/private_sale/psGuide.js" type="text/javascript"></script>




</body>

</html>