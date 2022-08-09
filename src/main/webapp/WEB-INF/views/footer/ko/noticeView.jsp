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
                                <h2 class="page_title"><span class="th1">공지사항</span></h2>
                            </div>
                        </div>
                    </section>
                    <section class="basis-section bbs-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-notice_view">
                                <div class="panel-header">
                                    <article class="view-header">
                                        <div class="title-area">
                                            <div id="notice_title" class="title">
                                                <span>4월 e BID 프리미엄 온라인 경매</span>
                                            </div>
                                        </div>
                                        <div id="notice_date" class="date-area">
                                            <span>2022.03.08 ~ 2022.05.10</span>
                                        </div>
                                    </article>
                                    <div class="file-area">
                                        <!-- [0613] -->
                                        <div id="notice_file_list" class="file-item">
                                        </div>
                                        <!-- //[0613] -->
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <article class="view-body">
                                        <div class="area-inner">
                                            <div id="notice_content" class="view_editor-wrap">
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="panel-footer">
                                    <div class="view-footer">
                                        <div class="button-area">
                                            <div class="btn_set-float tac">
                                                <a class="btn btn_default btn_lg" href="/footer/notice" role="button"><span>목록</span></a>
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
            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
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
                axios.get('/api/footer/notices/${id}')
                    .then(function(response) {
                        const data = response.data;
                        let success = data.success;

                        if(success){
                            let data = response.data.data;

                            if(!data){
                                alert('Wrong Path.');
                                history.back();
                            }

                            $("#notice_content").html(JSON.parse(data.content).ko);
                            $("#notice_title").html(JSON.parse(data.title).ko);
                            $("#notice_date").html(data.dt_date);

                            if(data.images.length !==0){
                                let images = data.images;

                                $.each(images , function(idx , el){

                                    let html = `<a href=/fileDownload?fileKey=` + el.path + `&downloadFileName=` + el.name  + `>`
                                                + `<i class="icon_down"></i> <span>` + el.name + `</span></a><br>`;

                                    $("#notice_file_list").append(html);
                                });
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