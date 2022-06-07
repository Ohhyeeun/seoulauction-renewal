<%--
  Created by IntelliJ IDEA.
  User: sjk
  Date: 2022/05/03
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>뉴스레터 | Seoul Auction</title>
</head>
<body>
<div class="wrapper footer-bottom footer-bottom30">
    <div class="sub-wrap pageclass type-pagemain">

        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->

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

                <section class="basis-section edit_view-section last-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-edit_view">
                            <div class="panel-header">

                                <article class="edit_view-header_notice-area" ng-model="newsletter">
                                    <div class="area-inner" id="title_area">

                                    </div>
                                </article>

                            </div>
                            <div class="panel-body">

                                <article class="edit_view-area">
                                    <div class="area-inner">
                                        <div class="view_editor-warp">

                                            <div class="imgmap_original-area scroll-type">

                                                <div class="" id="loadHtml">

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </article>

                            </div>
                            <div class="panel-footer">
                                <article class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_default btn_lg" href="/newsletter" role="button"><span>목록</span></a>
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
        <jsp:include page="../../include/en/footer.jsp" flush="false"/> 
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
<script>
app.value('locale', 'ko');
app.controller('newsLetterCtl', function($scope, consts, common, locale) {
    $scope.loadNewsletter = function() {

        axios.get('/api/main/newsletters/${id}').then(function(response) {

                console.log(response);
                const success = response.data.success;
                if (success) {

                    $scope.newsletter = response.data.data;
                    $scope.newsletter.content = JSON.parse(response.data.data.content);
                    const date = response.data.data.publish_at.replace(/(\d+)\-(\d+)\-(\d+)/, '$1$2');

                    let iframeHtml = '<iframe id="iframe-id" src="'+ $scope.newsletter.content[locale].link_url +'" frameborder="0" width="100%" height="900"></iframe>'
                    $("#loadHtml").append(iframeHtml);

                    let newDom = '';
                    if($scope.newsletter.isnew == 'Y'){
                        newDom = '<i class="new">N</i>';
                    }

                    let returnDom = '<div class="title">'
                        + '<span>' + $scope.newsletter.content[locale].newsletter_title +  newDom + '</span>'
                        + '</div>'
                        + '<div class="desc">'
                        + '<span class="">' + $scope.newsletter.content[locale].newsletter_memo  + '</span>'
                        + '</div>';

                    $('#title_area').append(returnDom);

                }
        });

        $("#iframe-id").on('load', function(){
        });
    }
});
</script>
</html>
