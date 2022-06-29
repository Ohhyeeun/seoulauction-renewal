<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="auctionCtl" data-ng-init="loadAuction()">
            <div id="contents" class="contents">
                <section class="basis-section tab-auction_other-section">
                    <div class="section-inner">
                        <!-- 텝메뉴 -->
                        <div class="content-panel type_panel-search_tab ">
                            <div class="panel-header">
                                <div class="tab-wrap">
                                    <div class="tab-area type-left">
                                        <ul class="tab-list js-list_tab">
                                            <li class="active"><a href="#"><span>진행경매</span></a></li>
                                            <li><a href="/auction/upcoming"><span>예정경매</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="basis-section last-section auction_other_list-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-auction_list">
                            <div class="panel-body">
                                <ul class="auction-list">
                                    <li ng-repeat="auction in auctionList">
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <a href="javascript:void(0);" class="img-align" ng-click="goProgressAuction(auction.SALE_KIND_CD, auction.SALE_NO);">
                                                            <img ng-src="<spring:eval expression="@environment.getProperty('image.root.path')" />{{auction.SALE_IMG_NAME ? (auction.SALE_IMG_PATH + '/' + auction.SALE_IMG_NAME)  : (auction.LOT_IMG_NAME | imagePath : auction.LOT_IMG_PATH : true)}}" alt="예정경매 이미지">
                                                        </a>
                                                    </figure>
                                                </div>

                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <!-- type-online, type-live, type-d_day -->
                                                        <div class="state-box">
                                                            <span class="type-online" ng-if="['online','online_zb'].indexOf(auction.SALE_KIND_CD) > -1">ONLINE</span>
                                                            <span class="type-live" ng-if="['online','online_zb'].indexOf(auction.SALE_KIND_CD) <= -1">LIVE</span>
                                                        </div>
                                                        <div class="title-box"><span>{{auction.TITLE_JSON['ko']}}</span></div>
                                                        <div class="info-box">
                                                            <dl>
                                                                <dt>오픈일</dt>
                                                                <dd>{{auction.FROM_DT | date:'M/d'+'('+getWeek(auction.FROM_DT)+')'}}</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>프리뷰</dt>
                                                                <dd>{{auction.PREV_FROM_DT | date:'M/d'+'('+getWeek(auction.PREV_FROM_DT)+')'}} ~ {{auction.PREV_TO_DT | date:'M/d'+'('+getWeek(auction.PREV_TO_DT)+')'}}</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>경매일</dt>
                                                                <dd>
                                                                    {{auction.TO_DT | date:'M/d'+'('+getWeek(auction.TO_DT)+')'}} {{auction.TO_DT | date:'H'}}시<ng:template ng-if="(auction.TO_DT | date:'m') > 0"> {{auction.TO_DT | date:'m'}}분</ng:template>
                                                                    <ng:template ng-if="['online','online_zb'].indexOf(auction.SALE_KIND_CD) > -1">순차마감</ng:template>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn btn_default" ng-click="goProgressAuction(auction.SALE_KIND_CD, auction.SALE_NO);"><span>진행경매보기</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
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
<!-- angular js -->
<script>
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('auctionCtl', function($scope, consts, common, locale) {
    $scope.loadAuction = function() {
        axios.get('/api/auction/progress').then(function(response) {
            console.log(response);
            const success = response.data.success;
            if (success) {
                $scope.auctionList = response.data.data;
                $scope.auctionList.map(item => {
                    item.TITLE_JSON = JSON.parse(item.TITLE_JSON);
                });
                $scope.$apply();
            }
        }).
        catch(function(error){
            console.log(error);
        });
    }

    $scope.goProgressAuction = function(sale_kind_cd, sale_no) {
        if(['online','online_zb'].indexOf(sale_kind_cd) > -1) {
            location.href = "/auction/list/"+sale_no;
        } else {
            location.href = "/auction/live/list/"+sale_no;
        }
    }
});
</script>
</body>
</html>