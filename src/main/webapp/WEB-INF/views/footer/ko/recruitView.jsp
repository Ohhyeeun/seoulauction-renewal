<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../../include/ko/header.jsp"%>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <%@include file="../../include/ko/nav.jsp"%>
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
                                            <a id="recruid_apply_btn" style="display: none" class="btn btn_point" href="/footer/recruit/${id}/form" role="button"><span>지원</span></a>
                                        </div>
                                    </article>
                                </div>
                                <div class="panel-body">
                                    <article class="incruit_view-area view-body">
                                        <div class="area-inner">
                                            <div id="recruit_content" class="view_editor-wrap">
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
                                location.href='/error/404';
                            }

                            if (data.is_over === 'Y') {
                                alert('이미 지난 채용 공고 입니다.');
                                location.href='/footer/recruit'
                                return;
                            }


                            let endDate =  data.end_date !== null   ? ' ~ ' + data.end_date : '';

                            $("#recruit_title").html(data.title);
                            $("#recruit_content").html(data.content);



                            if(data.period_type === 'period'){
                                $("#recruit_date").html(data.start_date + endDate);
                            } else if (data.period_type === 'current'){
                                $("#recruit_date").html('상시 모집');
                            } else if (data.period_type === 'immediate'){
                                $("#recruit_date").html('채용 시 마감');
                            }

                            //입사 지원서 없을 경우 하이드!
                            //$("#recruit_file_down").hide();


                            if(data.images.length !==0){
                                let images = data.images;

                                $("#recruit_file_down").show();
                                $("#recruit_file_down").attr('href' , '/fileDownload?fileKey=' + images.path + '&downloadFileName=' + images.name);

                                if(images.length !== 0){

                                    $.each(images , function(idx , el){

                                        //입사 지원서 파일 다운 작업.
                                        if (el.tag === 'applyForm'){

                                            $("#recruit_file_down").attr('href' , '/fileDownload?fileKey=' + el.path + '&downloadFileName=' + el.name);
                                        } else {
                                            //그 외 그냥 이미지 ㅇㅇ;
                                            let img = '<img src="' + el.cdn_url + '" />'
                                            $("#recruit_content").append(img);
                                        }

                                    });

                                }
                            }
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }


            //화면에 따른 입사 지원 버튼 처리.
            //모바일이 아닐때만 .
            if (matchMedia("all and (min-width: 1024px)").matches) {

                $('#recruid_apply_btn').show();
            } else {
                $('#recruid_apply_btn').hide();
            }
            $(window).resize(function(){
                //모바일이 아닐때만 .
                if (matchMedia("all and (min-width: 1024px)").matches) {

                    $('#recruid_apply_btn').show();
                } else {
                    $('#recruid_apply_btn').hide();
                }
            });

        });
    </script>

</body>

</html>