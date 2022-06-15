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
        <div id="container" ng-controller="newsLetterCtl" data-ng-init="loadNewsletter()">
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

    $scope.rowPerPages = 8;
    $scope.locale = locale;
    $scope.totalDisplayed = $scope.rowPerPages;

    $scope.loadNewsletter = function() {

        axios.get('/api/main/newsletters').then(function(response) {

            console.log(response);
            const success = response.data.success;
            if (success) {
                const newsletterList = response.data.data;
                $('.news-list').empty();
                $.each(newsletterList , function(idx , el){
                    if($scope.totalDisplayed > idx){

                        const itemJSON = JSON.parse(el.content);
                        let newDom = '';
                        if(el.isnew == 'Y'){
                            newDom = '<i class="new">N</i>';
                        }

                        let returnDom = '<li><div class="li-inner"><a href="/newsletter/'+ el.id + '">'
                            + '<div class="image-area">'
                            +    '<figure class="img-ratio">'
                            +       '<div class="img-align">'
                            +            '<img src="' + itemJSON[$scope.locale].img_url + '" alt="newsletter. Jan. Vol.55">'
                            +        '</div>'
                            +    '</figure>'
                            + '</div>'
                            + '<div class="typo-area">'
                            +    '<div class="title"><span>' + itemJSON[$scope.locale].newsletter_title + '</span>' + newDom + '</div>'
                            +    '<div class="desc"><span>' + itemJSON[$scope.locale].newsletter_memo + ' </span></div>'
                            + '</div>'
                            + '</a>'
                            + '</div></li>';

                        $('.news-list').append(returnDom);
                    }
                });

                if(newsletterList.length < $scope.totalDisplayed) {
                    $("#moreBtn").hide();
                }
                $scope.totalCnt = newsletterList.length;

            }
        }).
        catch(function(error){
            console.log(error);
        });

        $scope.loadMore = function () {
            $scope.totalDisplayed += 8;
            $scope.loadNewsletter();
        };
    }


});
</script>
</body>
</html>