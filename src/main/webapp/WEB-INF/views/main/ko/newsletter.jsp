<%--
  Created by IntelliJ IDEA.
  User: sjk
  Date: 2022/05/03
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/pages_common_ko.css">

<body>
<div class="wrapper footer-bottom footer-bottom30">
    <div class="sub-wrap pageclass type-pagemain">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>

        <!-- container -->
        <div id="container" ng-controller="newsLetterCtl" data-ng-init="loadNewsletter(1)">
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
                    <div class="section-inner">

                        <div class="content-panel type_panel-news_list">

                            <div class="panel-body">
                                <ul class="news-list">
                                    <li ng-repeat="newsletter in newsletterList | limitTo:totalDisplayed">
                                        <div class="li-inner">
                                            <a href="/newsletter/{{newsletter.id}}">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="/images/mobile/main/newsletter_55.jpg" alt="newsletter. Jan. Vol.55">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="title"><span>{{newsletter.content['ko'].newsletter_title}}</span><i class="new" ng-if="newsletter.is_new == 'Y'">N</i></div>
                                                    <div class="desc"><span>{{newsletter.content['ko'].newsletter_memo}}</span></div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="panel-footer">
                                <div class="page-set">
                                    <button class="btn btn_gray_line" type="button" ng-click="loadMore()" id="moreBtn"><span>더보기</span></button>
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
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('newsLetterCtl', function($scope, consts, common, locale) {
    $scope.currentPage = 1;
    $scope.rowPerPages = 4;
    $scope.locale = locale;
    $scope.totalDisplayed = $scope.rowPerPages;

    $scope.loadNewsletter = function() {
        common.callGetAPI('/api/main/newsletters', {}, function(data, status) {
            $scope.newsletterList = data.data;
            console.log( $scope.newsletterList);
            $scope.newsletterList.map(item => {
                item.content = JSON.parse(item.content);
            });
            $scope.totalCnt = $scope.newsletterList.length;
            if( ($scope.currentPage+1)*$scope.rowPerPages >= $scope.totalCnt ) {
                //$("#moreBtn").hide();
            }
        });

        $scope.loadMore = function () {
            $scope.totalDisplayed += 4;
        };
    }


});
</script>
</body>
</html>