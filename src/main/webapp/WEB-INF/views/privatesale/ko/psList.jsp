<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>프라이빗 세일 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass ">

        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <link rel="stylesheet" href="/css/plugin/csslibrary.css">
        <!-- //header -->
        <!-- container -->
        <div id="container" ng-controller="ctl" data-ng-init="load();">
            <div id="contents" class="contents">
                <!-- page title -->
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Private Sale</span></h2>
                            <div class="page_desc"><span class="tb1">프라이빗 세일</span></div>
                        </div>
                    </div>
                </section>

                <section class="basis-section type_tab-private_sale">
                    <div class="section-inner">
                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class=""><a href="#" onclick="goPsGuide();"><span>프라이빗세일 가이드</span></a></li>
                                    <li class="active"><a href="#" onclick="goPrivateSale();"><span>프라이빗세일</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </section>

                <section class="basis-section last-section private_sale_list-section ">
                    <div class="section-inner">

                        <div class="content-panel type_panel-product_list type_panel-private_sale" id="havePrivateSale">
                            <div class="panel-header">
                                <article class="search_tab-article">
                                    <div class="article-body">
                                        <div class="col_item mb-col1">

                                            <!--
                                            <div class="select-box">
                                                <div class="trp-dropdown-area h42-line">
                                                    <button class="js-dropdown-btn"><em>{{saleInfoAll.length}}</em><span>LOT</span><i class="form-select_arrow_md"></i>
                                                    </button>
                                                    <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                        <div class="search-box">
                                                            <input type="search" placeholder="LOT 번호 입력" id="search_lot" class="">
                                                            <i class="form-search_md"></i>
                                                        </div>
                                                        <div class="list-box scroll-type">
                                                            <ul id="sale_lot_list">
                                                                <li ng-repeat="item in saleImages" data-index="{{item.AS_NO}}">
                                                                    <a href="#" ng-click="goLot(item.SALE_AS_NO, item.AS_NO);">
                                                                        <div class="image-area">
                                                                            <figure class="img-ratio">
                                                                                <div class="img-align">
                                                                                    <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}"  alt="">
                                                                                </div>
                                                                            </figure>
                                                                        </div>
                                                                        <div class="typo-area">
                                                                            <span>LOT {{::item.AS_NO}}</span>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            -->

                                            <div class="search-box">
                                                <input type="search" placeholder="작가/작품명" id="search_value"
                                                       ng-model="searchValue"
                                                       ng-keyup="searchArtist(event=$event)" class="h42">
                                                <i class="form-search_md" ng-click="searchArtist2()"></i>
                                            </div>
                                        </div>
                                        <div class="col_item mb-col2">
                                            <div class="select-box">
                                                <select id="viewType" class="select2Basic42 js-select_page select2-hidden-accessible"
                                                        onchange="angular.element(this).scope().chgViewType();">
                                                    <option ng-repeat="item in modelViewType" value="{{item.value}}">{{item.name}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="panel-body">
                                <ul class="product-list">
                                    <li class="" ng-repeat="item in saleInfo">
                                        <div class="li-inner">
                                            <article class="item-article" ng-click="goLot(item.SALE_AS_NO)">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="{{item.IMAGE_URL}}{{item.FILE_PATH}}/{{item.FILE_NAME}}" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="num_heart-box">
                                                            <span class="num">{{item.SALE_AS_NO}}</span>
                                                        </div>
                                                        <div class="info-box">
                                                            <div class="title"><span>{{item.ARTIST_NAME_BLOB_KO}}</span>
                                                                <!-- [0516]삭제	<span class="sub">(1965)</span> -->
                                                            </div>
                                                            <div class="desc"><span>{{item.TITLE_BLOB_KO}}</span></div>
                                                            <div class="standard">
                                                                <span>{{item.CD_NM}}</span>
                                                                <div class="size_year">
                                                                    <span>{{item.SIZE1}} X {{item.SIZE2}} X {{item.SIZE3}}</span>
                                                                    <span>{{item.MAKE_YEAR_BLOB}}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>

                                </ul>

                            </div>

                            <div class="panel-footer">
                                <div class="set-pc_mb">
                                    <div id="page_layer" class="only-pc">
                                        <div class="paging-area">
                                            <div class="paging">
                                                <a href="javascript:void(0);" class="prev_end icon-page_prevprev">FIRST</a><a href="javascript:void(0);"
                                                <a href="javascript:void(0);" ng-click="pageing(item);"
                                                   ng-repeat="item in pageingdata">
                                                    <strong ng-if="item === curpage" ng-class="{'on':item === curpage}"
                                                            ng-bind="item"></strong>
                                                    <span ng-if="item != curpage" ng-bind="item"></span></a>
                                                <a href="javascript:void(0);" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="add_layer" class="only-mb">
                                        <button class="btn btn_gray_line" type="button" ng-click="addpage(curpage + 1);"><span>더보기</span></button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!--작품 없을때 -->
                        <div class="content-panel type_panel-product_list" id="emptyPrivateSale">
                            <div class="panel-body">
                                <article class="comingsoon-article">
                                    <div class="article-inner">
                                        <div class="data-empty">
                                            <div class="txt_empty">
                                                <div class="title">작품을 준비중입니다.</div>
                                                <div class="desc">빠른시일 내에 다양한 작품을 준비하여 찾아 뵙겠습니다. <br />
                                                    감사합니다.
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </article>

                                <!-- 문의하기 -->
                                <article class="inquiry-article ">
                                    <div class="inquiry-box">
                                        <div class="typo-area">
                                            <div class="icon-box">
                                                <i class="icon-academy_inquiry"></i>
                                            </div>
                                            <div class="title-box">
                                                <strong>문의하기</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>서울옥션 브랜드 기획팀</span> <em>정은지 선임</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <em>02-2075-4442</em></li>
                                                        <li><span>E.</span> <a href="mailto:jej@seoulauctionl.com"><em>jej@seoulauctionl.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryList" role="button"><span>1:1 문의</span></a>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>

                    </div>
                </section>
                <input type="hidden" id="token" value="{{token}}"/>
                <input type="hidden" id="saleAsNo" value="{{saleAsNo}}"/>
                <input type="hidden" id="lot_no" value=""/>
                <input type="hidden" id="user_id" value="${member.loginId}"/>
                <input type="hidden" id="cust_no" value="${member.userNo}"/>
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

<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/private_sale/psList.js" type="text/javascript"></script>

</body>


<script>
    <!-- angular js -->
    app.value('locale', 'ko');
    app.value('is_login', false);

</script>

</html>