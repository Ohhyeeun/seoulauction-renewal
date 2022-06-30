<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">채용공고</span></h2>
                            </div>
                        </div>
                    </section>



                    <section class="basis-section bbs-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-incruit_view">
                                <div class="panel-header">
                                    <article class="incruit_view-header view-header">
                                        <div class="title-area">
                                            <div class="title">
                                                <span id="recruit_title">미술품경매사업부 신규직원 모집</span>
                                            </div>
                                            <!-- [0516] 텍스트수정 -->
                                            <div class="desc">
                                                <span id="recruit_date">YYYY.MM.DD ~ YYYY.MM.DD</span>
                                            </div>
                                            <!-- //[0516] 텍스트수정 -->
                                        </div>
                                        <div class="button-area">
                                            <a id="recruit_file_down" class="btn btn_default" href="#" role="button"><span>입사지원서</span><i class="icon-file_down"></i></a>
                                            <a class="btn btn_point" href="/footer/recruit/${id}/form" role="button"><span>지원</span></a>
                                        </div>
                                    </article>
                                </div>
                                <div class="panel-body">
                                    <article class="incruit_view-area view-body">
                                        <div class="area-inner">
                                            <div id="recruit_content" class="view_editor-wrap">
<%--                                                ◆ 직원 유형<br>--%>
<%--                                                어시스턴트<br>--%>
<%--                                                <br>--%>
<%--                                                ◆ 영입인원<br>--%>
<%--                                                0 명<br>--%>
<%--                                                <br>--%>
<%--                                                ◆ 조직소개<br>--%>
<%--                                                <br>--%>
<%--                                                커머스에 특화된 UX 고민을 통해 카카오만의 특별한 쇼핑 경험을 제공하며,<br>--%>
<%--                                                선물하기, 쇼핑하기, 쇼핑하우, 카카오쇼핑라이브 등의 디자인을 담당합니다.<br>--%>
<%--                                                <br>--%>
<%--                                                <br>--%>
<%--                                                ◆ 업무내용<br>--%>
<%--                                                <br>--%>
<%--                                                카카오쇼핑라이브 서비스는 실시간 모바일 라이브 방송을 통한 고객 참여형 쇼핑서비스로,--%>
<%--                                                방송 CG 제작 및 마케팅 운영 디자인 작업을 수행하게 됩니다.<br>--%>
<%--                                                <br>--%>
<%--                                                라이브커머스 방송 CG 이미지 제작<br>--%>
<%--                                                라이브커머스관련 마케팅 운영 이미지 제작<br>--%>
<%--                                                <br>--%>
<%--                                                ◆ 지원자격<br>--%>
<%--                                                <br>--%>
<%--                                                Adobe Photoshop /Sketch 프로그램을 능숙하게 다룰 수 있으신 분<br>--%>
<%--                                                사진 보정 및 상품 이미지 작업 가능하신 분<br>--%>
<%--                                                유관 부서 담당자들과의 협업을 위한 원할한 커뮤니케이션 능력을 보유하신 분<br>--%>
<%--                                                라이브 방송 CG 작업 경험이 있으신 분 (우대)<br>--%>
<%--                                                <br>--%>
<%--                                                ◆ 근로제도<br>--%>
<%--                                                해당 포지션은 월 단위로 정해진 총 근로시간 범위 내에서 본인이 스스로 근로시간을 유연하게 설정하여 근무하는 "완전선택적근로제도"를 적용 받습니다.<br>--%>
<%--                                                이 경우 본인이 스스로 업무의 시작 및 종료시각을 일 단위로 등록하여 공유하며, 월 소정 근로시간을 채우면 됩니다.<br>--%>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="panel-footer">
                                    <div class="view-footer">
                                        <div class="button-area">
                                            <div class="btn_set-float tac">
                                                <a class="btn btn_default btn_lg" href="/footer/recruit" role="button"><span>목록</span></a>
                                            </div>
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
                                <div class="panel-body"></div>
                                <div class="panel-footer"></div>
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

    <script>
        $(function(){

            init();
            function init(){
                axios.get('/api/footer/recruits/${id}')
                    .then(function(response) {
                        const data = response.data;
                        let success = data.success;
                        if(success){
                            let data = response.data.data;

                            if(!data){
                                alert('잘못된 경로입니다.');
                                history.back();
                            }
                            $("#recruit_title").html(data.title);
                            $("#recruit_content").html(data.content);
                            $("#recruit_date").html(data.start_date +' ~ ' + data.end_date);

                            //입사 지원서 없을 경우 하이드!
                            //$("#recruit_file_down").hide();

                            if(data.images.length !==0){
                                let images = data.images;

                                $("#recruit_file_down").show();
                                $("#recruit_file_down").attr('href' , '/fileDownload?fileKey=' + images.path + '&downloadFileName=' + images.name);

                                //입사 지원서 파일 다운 작업.
                                // // let html = `<a href=/fileDownload?fileKey=` + images.path + `&downloadFileName=` + images.name  + `>`
                                // //     + `<i class="icon_down"></i> <span>` + images.name + `</span></a>`;
                                // $("#notice_file_list").html(html);
                            }
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
        });
    </script>

</body>

</html>