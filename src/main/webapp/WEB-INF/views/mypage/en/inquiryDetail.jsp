<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
	<div class="wrapper" ng-app="myApp">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/inquiry.js"></script>
            <!-- container -->
            <div id="container" class="inquiry" ng-controller="inquiryViewCtl" data-ng-init="init()" style="opacity: 0" opacity=1>
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_inquiry">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />
                                        
                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">1:1 Inquiry</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <article class="view-header">
                                                    <div class="title-area">
                                                        <div class="title tt4">
                                                            <span>{{inquiry.TITLE}}</span>
                                                        </div>
                                                    </div>
                                                    <div class="sub-area tb1">
                                                        <dl>
                                                            <dt><span>Type : </span></dt>
                                                            <dd><span>{{inquiry.CATE_NM_EN}}{{inquiry.CATE_NM_EN != '' ? ' > '+ inquiry.P_CATE_NM_EN: inquiry.P_CATE_NM_EN}}</span></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt><span>Status  : </span></dt>
                                                            <dd><span>{{inquiry.REPLY_YN == 'Y' ? 'Complete' : 'Waiting'}}</span></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt><span>Manager : </span></dt>
                                                            <dd><span>{{inquiry.EMP_NAME}}</span></dd>
                                                        </dl>
                                                        <dl ng-if="inquiry.REPLY_YN == 'Y'">
                                                            <dt><span>Reply Date : </span></dt>
                                                            <dd><span>{{inquiry.LAST_REPLY_DT | date:'yyyy.MM.dd'}}</span></dd>
                                                        </dl>
                                                    </div>
                                                </article>
                                                <article class="view-body inquiry-view-wrap">
                                                    <div>
                                                        <dl class="inquiry-view">
                                                            <dt class="tit tt5"><span>Contents</span></dt>
                                                            <dd class="tb1">
                                                                <div class="con-area" ng-bind-html="inquiry.CONTENT"></div>
                                                                <div class="file-area" ng-if="fileList != ''">
                                                                    <div class="file-area-inner" ng-repeat="file in fileList">
                                                                        <!-- <a href="{{file.cdn_url}}"> -->
                                                                         <!-- <a href="https://public.seoulauction.xyz/resources/images/main_popup/1/91489f49-81f7-4e42-91d6-39de4ecc2971.jpg" download="file.name" target="_blank"> -->
                                                                          <a href="/fileDownload?fileKey={{file.path}}&downloadFileName={{file.name}}.{{file.ext}}">  
                                                                        <div class="file-item">
                                                                            <i class="icon_down"></i> <span>{{file.name}}.{{file.ext}}</span>
                                                                        </div>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                            
                                                            <dl class="reply" ng-if="inquiry.REPLY_YN == 'Y'">
                                                                <dt class="tit tt5">
                                                                    <i class="icon-reply"></i>
                                                                    <span> Reply</span>
                                                                </dt>
                                                                <dd class="tb1">
                                                                    <div class="con-area" ><pre>{{reply.CONTENT}}</pre></div>
                                                                </dd>
                                                            </dl>
                                                        </dl>
                                                    </div>
                                                </article>
                                                <article class="view-footer">
                                                    <div class="button-area">
                                                        <div class="btn_set-float tac">
                                                        <a href="/mypage/inquiryList?page={{page}}">
                                                            <button class="btn btn_default"><span>List</span></button>
                                                        </a>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-footer"></div>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/en/footer.jsp" flush="false" />
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
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


    <script>
        $(".js-history_back").click(function() {
        	window.location.href="/mypage/main";
        })
    </script>
    
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>
  
    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>

</body>

</html>