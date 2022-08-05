var dropdown = $(".js-dropdown-btn").trpDropdown({
    list: ".trp-dropdown_list-box",
    area: ".trp-dropdown-area"
});
$(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
    $e.preventDefault();
    var _this = $(this);
    _this.closest("ul").find("li").removeClass("on");
    _this.closest("li").addClass("on");
    _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
    dropdown.getClose();
});

$('.js-maintab_list a').on('click', function(e) {
    e.preventDefault();
    var tar = $(this).position().left;
    var scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;

    if ($(this).parents('li').hasClass('active')) return false;
    var id = $(this).attr('href');
    if ($(id).length > 0) {
        $('.tab-cont').removeClass('active');
        $(id).addClass('active');
        $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');

        $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
    }

    return false;
});

$(function() {
    // $(window).on("resize", function($e) {
    //     select_resize_change();
    // });
    //
    // function select_resize_change() {
    //     if ($("body").hasClass("is_mb")) {
    //         $(".js-select_page").val("2");
    //     } else {
    //         $(".js-select_page").val("1");
    //     }
    //     $(".js-select_page").trigger('change');
    // }
    // select_resize_change();
});

function goPsGuide(){
    window.location.href = '/privatesale/psGuide/';
}

function goPrivateSale(){
    window.location.href = '/privatesale/psList';
}

app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);

app.controller('ctl', function ($scope, consts, common, is_login, locale) {
    $scope.is_login = is_login;
    $scope.locale = locale;

    $scope.pagesize = 10;
    $scope.itemsize = 20;
    $scope.curpage = 1;


    $scope.reqRowCnt = 8;
    $scope.currentPage = 1;
    $scope.totalCount = 0;
    $scope.isMore = false;

    $scope.init = function(){
        //초반 영역 안보이게 세팅
        $("#havePrivateSale").hide();
        $("#emptyPrivateSale").hide();

        $scope.load(1);
    }

    $scope.more = function(){

        $scope.currentPage++;
        $scope.load($scope.currentPage);
    }

    let pagingName = '';
    let moreName = '';

    if(locale === 'ko') {
        pagingName = '페이지 방식';
        moreName = '더보기 방식';
    }
    else{
        pagingName = 'PAGE';
        moreName = 'MORE';
    }

    $scope.modelViewType = [{
        name: pagingName, value: 1
    }, {
        name: moreName, value: 2
    }];

    $scope.selectSortType = 1;
    $scope.selectViewType = 1;
    $scope.searchValue = "";
    $scope.searchSaleInfoAll = [];
    $scope.saleInfoOriginAll = [];
    $scope.selectLotTag = "전체";
    $scope.isMore = false;
    $scope.totalCount = 0;

    $scope.searchArtist = function (event) {
        if (event.keyCode === 13 || $scope.searchValue.length <= 0) {
            $scope.searchArtist2();
        }
    }

    $scope.searchArtist2 = function () {

        if($scope.searchValue === ''){
            $scope.load(1);
            return;
        } else {
            $scope.saleInfoAll = [];
        }

        let pp = [];
        for (let i = 0; i < $scope.saleInfoOriginAll.length; i++) {
            if(locale == 'ko'){

                if ($scope.saleInfoOriginAll[i].ARTIST_NAME_BLOB_KO.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 || $scope.saleInfoOriginAll[i].TITLE_BLOB_KO.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                    pp.push(JSON.parse(JSON.stringify($scope.saleInfoOriginAll[i])));
                }
            }else{
                if ($scope.saleInfoOriginAll[i].ARTIST_NAME_BLOB_EN.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 || $scope.saleInfoOriginAll[i].TITLE_BLOB_EN.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                    pp.push(JSON.parse(JSON.stringify($scope.saleInfoOriginAll[i])));
                }
            }
        }

        $scope.saleInfoAll = pp;

        setPagenation();
    }

    $scope.goLot = function (saleAsNo) {

        window.location.href = '/privatesale/psView/' + saleAsNo ;
    }

    // 호출 부
    const getSaleInfo = () => {
        try {
            return axios.get('/api/privatesale/list');
        } catch (error) {
            console.error(error);
        }
    };

    const setPagenation = function (){

        //페이지가 변경되면 데이터도 변경 시킴.
        $scope.saleInfoAll = $scope.saleInfoAll.slice(($scope.reqRowCnt * ($scope.currentPage - 1)), $scope.reqRowCnt * $scope.currentPage);

        $scope.totalCount = $scope.saleInfoAll.length;

        //$scope.isMore =  (!($scope.totalCount <= $scope.reqRowCnt && ($scope.totalCount / $scope.reqRowCnt) < 2));

        paging({
            id: "paging_search",
            className:"paging",
            totalCount:$scope.totalCount,
            itemSize:$scope.reqRowCnt,
            pageSize: 10,
            page:$scope.currentPage,
            callBackFunc:function(i) {
                $scope.currentPage = i;
                $scope.load();
            }
        });
        if ($scope.$$phase !== '$apply' && $scope.$$phase !== '$digest') {
            $scope.$apply();
        }

    };

    // 호출 부
    $scope.load = function () {
        let run = async function () {


            let [r1, r2] = await Promise.all([getSaleInfo()]);

            $scope.saleInfoAll = r1.data.data;

            //오리진 데이터 복사.
            $scope.saleInfoOriginAll = JSON.parse(JSON.stringify($scope.saleInfoAll));

            if($scope.saleInfoAll.length < 1){
                $("#emptyPrivateSale").show();
                $("#havePrivateSale").hide();
            }else{
                $("#havePrivateSale").show();
                $("#emptyPrivateSale").hide();
                $scope.saleInfo = $scope.saleInfoAll.slice(0, $scope.reqRowCnt);

                setPagenation();

                // lot
                $("#search_lot").on("keyup", function () {
                    window.event.preventDefault();
                    let v = $("#search_lot").val();
                    if (v.length == 0) {
                        $("#sale_lot_list li").each(function (i, item) {
                            $(item).css("display", "");
                        })
                        return;
                    } else {
                        $("#sale_lot_list li").each(function (i, item) {
                            if ($(item).attr('data-index').toString() != v) {
                                $(item).css("display", "none");
                            } else {
                                $(item).css("display", "");
                            }
                        })
                    }
                });
            }
        }
        run();
    }
    //페이지방식, 더보기방식 변경
    $scope.chgViewType = function () {

        let sst = parseInt($("#viewType option:selected").val())
        switch (sst) {
            case 1:
                // $("#page_layer").removeClass('only-mb');
                // $("#page_layer").addClass('only-pc');
                // $("#add_layer").removeClass('only-pc');
                // $("#add_layer").addClass('only-mb');

                $scope.isMore = false;

                break;
            case 2:
                $scope.isMore = true;
                break;
        }
        $scope.$apply();
        $scope.selectViewType = sst;
    }
});