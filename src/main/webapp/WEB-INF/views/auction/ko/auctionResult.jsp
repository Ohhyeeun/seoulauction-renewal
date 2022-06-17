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
        <div id="container" ng-controller="auctionCtl" data-ng-init="loadAuction()">
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
                                            <li class="active"><a href="#tab-cont-1"><span>전체</span></a></li>
                                            <li class=""><a href="#tab-cont-2"><span>라이브</span></a></li>
                                            <li class=""><a href="#tab-cont-3"><span>온라인</span></a></li>
                                            <li class=""><a href="#tab-cont-4"><span>홍콩</span></a></li>
                                            <li class=""><a href="#tab-cont-5"><span>기타</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <article class="search_tab-article">
                                    <div class="article-body">
                                        <div class="col_item col2">
                                            <div class="search-box">
                                                <input type="search" placeholder="경매명 또는 전시장소 검색" id="" class="h42">
                                                <i class="form-search_md"></i>
                                            </div>
                                        </div>

                                        <div class="col_item col1">
                                            <div class="count-box">
                                                <span>총</span> <em>{{totalCnt}}</em><span>건</span>
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
                                    <li ng-repeat="auction in auctionList | limitTo:totalDisplayed">
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
                                                            <span class="title">Contemporary Art Sale</span>
                                                        </div>
                                                        <div class="info-box">
                                                            <!-- [0523] 날짜수정 -->
                                                            <dl>
                                                                <dt>경매일</dt>
                                                                <dd>2022.03.22(화) 16:00</dd>
                                                            </dl>
                                                            <!-- //[0523] 날짜수정 -->
                                                            <dl>
                                                                <dt>전시장</dt>
                                                                <dd>서울 옥션 강남센터</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="btn-box">
                                                            <div class="btn_set"><a class="btn btn_default" href="#" role="button"><span>결과보기</span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <paging page="currentPage"
                                    page-size="pageRows"
                                    total="totalCount"
                                    paging-action="loadAuction(page)"
                                    scroll-top="true"
                                    hide-if-empty="true"
                                    show-prev-next="true"
                                    show-first-last="true"
                                    ul-class="page_ul"
                                    active-class="page_active"
                                    disabled-class="page_disable"
                                    text-next-class="page_btn sp_btn btn_next02"
                                    text-prev-class="page_btn sp_btn btn_prev02"
                                    text-first-class="page_btn sp_btn btn_prev"
                                    text-last-class="page_btn sp_btn btn_next"
                            >
                            </paging>

                            <div class="panel-footer">
                                <div class="set-pc_mb">
                                    <div class="only-pc">
                                        <div class="paging-area" id="paging_search">
                                            <div class="paging">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="only-mb">
                                        <button class="btn btn_gray_line" type="button"><span>더보기</span></button>
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
    $scope.pageRows = 20;
    $scope.reqRowCnt = 20;
    $scope.currentPage = 1;
    $scope.totalCount = 0;
    $scope.rowPerPages = 4;
    $scope.totalDisplayed = $scope.rowPerPages;

    $scope.loadAuction = function ($page) {
        axios.get('/api/auction/results').then(function (response) {
            console.log(response);
            const success = response.data.success;
            if (success) {
                $scope.auctionList = response.data.data;
                $scope.auctionList.map(item => {
                    item.TITLE_JSON = JSON.parse(item.TITLE_JSON);
                });

                $scope.totalCnt = $scope.auctionList.length;
                //paging이 선택된 경우 paging 계산
                paging({
                    id: "paging_search",
                    className:"paging",
                    totalCount:$scope.totalCount,
                    itemSize:$scope.reqRowCnt,
                    pageSize:10,
                    page:$scope.currentPage,
                    callBackFunc:function(i) {
                        $scope.loadAuction(i);
                    }
                });

                if( ($scope.currentPage+1)*$scope.rowPerPages >= $scope.totalCnt ) {
                    //$("#moreBtn").hide();
                }
                $scope.$apply();
            }
        }).catch(function (error) {
            console.log(error);
        });
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