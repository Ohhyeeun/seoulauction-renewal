<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>경매결과 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="auctionCtl" data-ng-init="init()">
            <div id="contents" class="contents">

                <!-- page title -->
                <section class="page_title-section">
                    <div class="section-inner full_size">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">경매결과</span></h2>
                        </div>
                    </div>
                </section>

                <section class="basis-section tab-auction_result-section">
                    <div class="section-inner">
                        <!-- 텝메뉴 -->
                        <div class="content-panel type_panel-result_tab">
                            <div class="panel-header">
                                <div class="tab-wrap">
                                    <div class="tab-area type-left_mm">
                                        <ul class="tab-list js-left_mm">
                                            <li class="active"><a href="#" ng-click="loadSubPage('');"><span>전체</span></a></li>
                                            <li class=""><a href="#" ng-click="loadSubPage('live');"><span>라이브</span></a></li>
                                            <li class=""><a href="#" ng-click="loadSubPage('online');"><span>온라인</span></a></li>
                                            <li class=""><a href="#" ng-click="loadSubPage('hongkong');"><span>홍콩</span></a></li>
                                            <li class=""><a href="#" ng-click="loadSubPage('etc');"><span>기타</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <article class="search_tab-article">
                                    <div class="article-body">
                                        <div class="col_item col2">
                                            <div class="search-box">
                                                <form name="pageForm" method="get" ng-submit="loadSaleList(1, sale_kind_cd);">
                                                    <input type="search" placeholder="경매명 검색" id="" class="h42" ng-model="find_word">
                                                    <i class="form-search_md" ng-click="loadSaleList(1, sale_kind_cd);"></i>
                                                </form>
                                            </div>
                                        </div>

                                        <div class="col_item col1">
                                            <div class="count-box">
                                                <span>총</span> <em>{{totalCount}}</em><span>건</span>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="basis-section auction_result_list-section last-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-product_result_list">
                            <div class="panel-body">
                                <ul class="product-list">
                                    <li ng-repeat="auction in auctionList">
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img ng-src="<spring:eval expression="@environment.getProperty('image.root.path')" />{{auction.SALE_IMG_NAME ? (auction.SALE_IMG_PATH + '/' + auction.SALE_IMG_NAME)  : (auction.LOT_IMG_NAME | imagePath : auction.LOT_IMG_PATH : true)}}" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="title-box">
                                                            <span class="title">{{auction.TITLE_JSON['ko']}}</span>
                                                        </div>
                                                        <div class="info-box">
                                                            <!-- [0523] 날짜수정 -->
                                                            <dl>
                                                                <dt>경매일</dt>
                                                                <dd>{{auction.TO_DT | date:'yyyy.MM.dd'+'('+getWeek(auction.TO_DT)+')'}} {{auction.TO_DT | date:'H'}}:{{auction.TO_DT | date:'mm'}}</dd>
                                                            </dl>
                                                            <!-- //[0523] 날짜수정 -->
                                                            <dl>
                                                                <dt>전시장</dt>
                                                                <dd>
                                                                    <ng:template ng-repeat="prev in auction.PREVIEW_JSON">
                                                                        {{prev.PLACE_JSON['ko']}}<ng:template ng-if="!$last">,</ng:template>
                                                                    </ng:template>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                        <div class="btn-box">
                                                            <div class="btn_set"><a class="btn btn_default" role="button" ng-click="goSale(auction.SALE_KIND_CD, auction.SALE_NO);"><span>결과보기</span></a>
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
                                    <div class="only-pc">
                                        <div class="paging-area" id="paging_search">
                                        </div>
                                    </div>
                                    <div class="only-mb">
                                        <button class="btn btn_gray_line" type="button" ng-click="more();"><span>더보기</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/ko/footer.jsp" />
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
<script type="text/javascript" src="/js/common/paging.js"></script>
<script>
<!-- angular js -->
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('auctionCtl', function($scope, consts, common, locale) {
    $scope.reqRowCnt = 8;
    $scope.currentPage = 1;
    $scope.totalCount = 0;

    $scope.init = function(){
        $scope.loadSaleList(1, '');
    }

    $scope.loadSaleList = function (page, sale_kind_cd) {
        $scope.currentPage = page;
        $scope.sale_kind_cd = sale_kind_cd;

        let data = {};
        data['from'] = (($scope.currentPage - 1) * parseInt($scope.reqRowCnt));
        data['rows'] = parseInt($scope.reqRowCnt);
        data['sale_kind_cd'] = $scope.sale_kind_cd;
        data['find_word'] = $scope.find_word;
        axios.post('/api/auction/results', data).then(function (response) {
            const success = response.data.success;
            if (success) {
                $scope.tmpList = response.data.data.list;
                $scope.tmpList.map(item => {
                    item.TITLE_JSON = JSON.parse(item.TITLE_JSON);
                    item.PREVIEW_JSON = JSON.parse(item.PREVIEW_JSON);
                });

                if($scope.is_more) {
                    $scope.auctionList.push.apply($scope.auctionList, $scope.tmpList);
                } else {
                    $scope.auctionList = $scope.tmpList;
                }

                $scope.totalCount = response.data.data.cnt;
                //paging이 선택된 경우 paging 계산
                paging({
                    id: "paging_search",
                    className:"paging",
                    totalCount:$scope.totalCount,
                    itemSize:$scope.reqRowCnt,
                    pageSize:10,
                    page:$scope.currentPage,
                    callBackFunc:function(i) {
                        $scope.is_more = false;
                        $scope.loadSaleList(i, sale_kind_cd);
                    }
                });

                if( $scope.currentPage*$scope.reqRowCnt >= $scope.totalCount ) {
                    $("#moreBtn").hide();
                }
                $scope.$apply();
            }
        }).catch(function (error) {
            console.log(error);
        });
    }

    $scope.loadSubPage = function(sale_kind_cd){
        $scope.loadSaleList(1, sale_kind_cd);
    }

    $scope.goSale = function(sale_kind_cd, sale_no) {
        if(['online','online_zb'].indexOf(sale_kind_cd) > -1) {
            location.href = "/auction/list/"+sale_no;
        } else {
            location.href = "/auction/live/list/"+sale_no;
        }
    }

    $scope.more = function(){
        $scope.is_more = true;
        $scope.currentPage++;
        $scope.loadSaleList($scope.currentPage, $scope.subPage);
    }
});

$('.js-left_mm a').on('click', function(e) {
    e.preventDefault();
    var tar = $(this).position().left;
    var scrollX = tar - ($(".js-left_mm").parents(".tab-area").width() / 2) + $(this).width() / 2;

    if ($(this).parents('li').hasClass('active')) {
        return false;
    } else {
        $(".js-left_mm li").removeClass('active');
        $(this).parents('li').addClass('active');

        $(".js-left_mm").parents(".tab-area").scrollLeft(scrollX);
    }
});
</script>

</body>

</html>