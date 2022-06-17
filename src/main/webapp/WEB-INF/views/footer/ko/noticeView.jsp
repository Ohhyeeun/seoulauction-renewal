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
                                                [Online Auction]<br>
                                                2022. 4. 6 (水)<br>
                                                2시 순차마감<br>
                                                www.seoulauction.com<br>
                                                <br>
                                                [Opening on Online]<br>
                                                2022. 3. 31 (木) - 4. 6 (水)<br>
                                                <br>
                                                [Exhibition Preview]<br>
                                                2022. 4. 1 (金) - 4. 5 (火)<br>
                                                10am - 7pm<br>
                                                서울옥션 강남센터 B1<br>
                                                (강남구 언주로 864)<br>
                                                <br>
                                                <br>
                                                [Notice]<br>
                                                * lithograph 는 Offset lithograph 의 의미를 포함합니다.<br>
                                                * 구매수수료: 18%(부가세 별도)입니다. 구매수수료에 한하여 세금계산서 발행이 가능합니다.<br>
                                                * 응찰은 작품 컨디션 확인 후 진행 되는 것을 전제로 하며, 작품 컨디션에 액자 상태는 포함되지 않습니다.<br>
                                                * 작품의 크기 및 운송지역(도서산간, 제주, 해외 등)에 따라 추가 운송비가 발생할 수 있습니다.<br>
                                                * 낙찰자가①지정된 기일에 낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을 낙찰철회비(위약금)로 납부하여야 합니다.<br>
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
                axios.get('/api/footer/notice/${id}')
                    .then(function(response) {
                        const data = response.data;
                        let success = data.success;
                        if(success){
                            let data = response.data.data;

                            if(!data){
                                alert('잘못된 경로입니다.');
                                history.back();
                            }
                            $("#notice_content").html(JSON.parse(data.content).ko);
                            $("#notice_title").html(JSON.parse(data.title).ko);
                            $("#notice_date").html(data.dt_date);

                            if(data.images.length !==0){
                                let images = data.images;
                                $.each(images , function(idx , el){

                                    let html = `<a href=/fileDownload?fileKey=` + el.path + `&downloadFileName=` + el.name  + `>`
                                                + `<i class="icon_down"></i> <span>` + el.name + `</span></a>`;
                                    $("#notice_file_list").html(html);
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