<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>경매안내 | Seoul Auction</title>
    <!-- //header -->
</head>

<body>
    <div class="wrapper">
        <div class="sub-wrap pageclass">
            <!-- header -->
            <header class="win_header">
                <div class="header-inner">
                    <a href="/" class="header_logo"><span class="blind-text">logo</span></a>
                </div>
            </header>

            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <section class="basis-section last-section infoaction-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-infoaction_popup">
                                <div class="content-body">
                                    <p>자동 새로고침 해결 방법</p>
                                    <ul>
                                        <li>
                                            <div class="">
                                                <ol class="tb1">
                                                    <li>1. 익스플로러 설정 클릭 (보통 톱니바퀴 모양)</li>
                                                    <li>2. 인터넷 옵션 클릭</li>
                                                    <li>3. 일반 -> 검색기록 -> 설정 클릭</li>
                                                    <li>4. 웹 페이지를 열 때 마다 클릭</li>
                                                    <li>5. 확인(저장)</li>
                                                    <li>5. 확인(저장)</li>
                                                </ol>
                                                <div class="img_01">
                                                    <img src="/images/mobile/footer/popup_img_01.png">
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="img_02">
                                                <img src="/images/mobile/footer/popup_img_02.png">
                                            </div>
                                        </li>
                                        <li>
                                            <div class="img_03">
                                                <img src="/images/mobile/footer/popup_img_03.png">
                                            </div>
                                        </li>
                                    </ul>

                                </div>

                            </div>
                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->


            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>

        <%--angular 관련은 미리 로딩--%>
        <%@include file="../../common/angular.jsp"%>
        <%@include file="../../common/commonJs.jsp"%>
        <%@include file="../../common/commonJSNotMain.jsp"%>
</body>

</html>