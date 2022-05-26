<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<body class="">
    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->

    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>

    <!-- 팝업 : 정회원 결제 이력 -->
    <div id="popup_memlv2_record-wrap" class="trp popupfixed-wrap memlv2_record-popup" data-ng-init="init();">
        <div class="popup-dim"></div>
        <div class="popup-align mode-md mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" ng-click="closeThisDialog(this);" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">결제 이력</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <article class="article-area">
                                    <div class="memlv2_record_list-wrap">
                                        <dl class="memlv2_record-list memlv2">
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>2022.1.5 ~ 2022.2.5</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">정회원</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">결제일</div>
                                                    <div class="txt">1.5(금) 13:26:15</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">무료</div>
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="memlv2_record-list expiry">
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>2022.1.5 ~ 2022.2.5</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">기간만료</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">결제일</div>
                                                    <div class="txt">1.5(금) 13:26:15</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">무료</div>
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="memlv2_record-list expiry">
                                            <dt>
                                                <div class="title">
                                                    <div class="tb1"><span>2022.1.5 ~ 2022.2.5</span></div>
                                                </div>
                                                <div class="state icon-wrap">
                                                    <div class="state-icon">기간만료</div>
                                                </div>
                                            </dt>
                                            <dd>
                                                <div class="info-li">
                                                    <div class="tit">결제일</div>
                                                    <div class="txt">1.5(금) 13:26:15</div>
                                                </div>
                                                <div class="info-li">
                                                    <div class="tit">결제방법</div>
                                                    <div class="txt">무료</div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                </article>
                                <div class="button-area">
                                    <div class="btn_set-float tac">
                                        <a class="btn btn_gray_line js-closepop" href="#" role="button"><span>닫기</span></a>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        (function() {
            var popup_marketing1 = $(".js-popup_memlv2_record").trpLayerFixedPopup("#popup_memlv2_record-wrap");
            $(popup_marketing1.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_marketing1.open(this); // or false   
                popup_fixation("#popup_memlv2_record-wrap"); // pc 스크롤
                popup_motion_open("#popup_memlv2_record-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_memlv2_record-wrap .js-closepop, #popup_memlv2_record-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_marketing1.close();
                popup_motion_close("#popup_memlv2_record-wrap");
            });
        })();
    </script>



</body>