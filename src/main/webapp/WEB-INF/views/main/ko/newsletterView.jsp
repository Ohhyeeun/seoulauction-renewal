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
                                    <div class="area-inner">
                                        <div class="title">
                                            <span>{{newsletter.content['ko'].newsletter_title}}<i class="new" ng-if="newsletter.is_new == 'Y'">N</i></span>
                                        </div>
                                        <div class="desc">
                                            <span class="">{{newsletter.content['ko'].newsletter_memo}}</span>
                                        </div>
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
                                        <a class="btn btn_default btn_lg" href="#" role="button"><span>목록</span></a>
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
        common.callGetAPI('/api/main/newsletters/${id}', {}, function(data, status) {
            $scope.newsletter = data.data;
            $scope.newsletter.content = JSON.parse(data.data.content);
            const date = data.data.publish_at.replace(/(\d+)\-(\d+)\-(\d+)/, '$1$2');
            $("#loadHtml").load("/nas_img/front/homepage/newsletter/"+date+"/KOR/"+date+"_KOR.html");
        });
    }
});
</script>
</html>
