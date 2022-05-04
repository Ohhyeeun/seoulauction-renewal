<%--
  Created by IntelliJ IDEA.
  User: sjk
  Date: 2022/05/03
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>뉴스레터 | Seoul Auction</title>
</head>
<body>
<div class="wrapper footer-bottom footer-bottom30">
    <div class="sub-wrap pageclass type-pagemain">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">

                <!-- page title -->
                <section class="page_title-section">
                    <div class="section-inner full_size">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">뉴스레터</span></h2>
                        </div>
                    </div>
                </section>



                <section class="basis-section last-section news_letter-section">
                    <div class="section-inner" ng-controller="newsLetterCtl"  data-ng-init="loadNewsletter(1)">

                        <div class="content-panel type_panel-news_list">

                            <div class="panel-body">
                                <ul class="news-list">
                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_55.jpg" alt="newsletter. Jan. Vol.55">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2022년 3월호(Vol. 55)</span><i class="new">N</i></div>
                                                <div class="desc"><span>Contemporary Art Sale</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_54.jpg" alt="newsletter. Jan. Vol.54">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2022년 2월호(Vol. 54)</span><i class="new">N</i></div>
                                                <div class="desc"><span>165회 미술품 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_53.jpg" alt="newsletter. Jan. Vol.53">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>022년 1월호(Vol. 53)</span><i class="new">N</i></div>
                                                <div class="desc"><span>2022 1월 라이브 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_52.jpg" alt="newsletter. Jan. Vol.52">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 12월호(Vol. 52)</span><i class="new">N</i></div>
                                                <div class="desc"><span>164회 미술품 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_51.jpg" alt="newsletter. Jan. Vol.51">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 11월호(Vol. 51)</span><i class="new">N</i></div>
                                                <div class="desc"><span>Winter Sale</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_49.jpg" alt="newsletter. Jan. Vol.49">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 9월호(Vol. 49)</span><i class="new">N</i></div>
                                                <div class="desc"><span>Autumn Sale</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_48.jpg" alt="newsletter. Jan. Vol.48">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 8월호(Vol. 48)</span><i class="new">N</i></div>
                                                <div class="desc"><span>162회 미술품 경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="li-inner">
                                            <div class="image-area">
                                                <figure class="img-ratio">
                                                    <div class="img-align">
                                                        <img src="/images/mobile/main/newsletter_47.jpg" alt="newsletter. Jan. Vol.47">
                                                    </div>
                                                </figure>
                                            </div>
                                            <div class="typo-area">
                                                <div class="title"><span>2021년 7월호(Vol. 47)</span><i class="new">N</i></div>
                                                <div class="desc"><span>서울옥션 대구경매</span></div>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="panel-footer">
                                <div class="page-set">
                                    <button class="btn btn_gray_line" type="button"><span>더보기</span></button>
                                </div>
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
app.requires.push("bw.paging");
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('newsLetterCtl', function($scope, consts, common, locale) {
    $scope.pageRows = 20;
    $scope.reqRowCnt = 20;
    $scope.currentPage = 1;
    $scope.totalCount = 0;
    $scope.locale = locale;
    $scope.date = 202003;

    $scope.loadNewsletter = function($page) {
        $scope.currentPage = $page;
        alert("1");
    }

    var $s = function(data, status) {
        $scope.newletterList = data["tables"]["NEWLETTER_LIST"]["rows"];
        console.log($scope.newletterList);
        $scope.totalCount = data["tables"]["NEWLETTER_CNT"]["rows"][0]["CNT"];
    };


});
    //const data = { username: 'example' };
    fetch('/api/main/newsletters', {
        method: 'GET', // 또는 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
        //body: JSON.stringify(data),
    })
    .then((response) => response.json())
    .then((data) => {
        alert('성공:'+ data);
    })
    .catch((error) => {
        alert('실패:'+ error);
    });
</script>
<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>
<script src="https://code.angularjs.org/1.5.8/angular.js"></script>
<script src="/js/angular/app.js"></script>
</body>
</html>