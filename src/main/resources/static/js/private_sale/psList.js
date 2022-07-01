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
    $(window).on("resize", function($e) {
        select_resize_change();
    });

    function select_resize_change() {
        if ($("body").hasClass("is_mb")) {
            $(".js-select_page").val("2");
        } else {
            $(".js-select_page").val("1");
        }
        $(".js-select_page").trigger('change');
    }
    select_resize_change();
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

    $scope.modelViewType = [{
        name: "페이징 방식", value: 1
    }, {
        name: "더보기 방식", value: 2
    }];

    $scope.selectSortType = 1;
    $scope.selectViewType = 1;
    $scope.searchValue = "";
    $scope.searchSaleInfoAll = [];
    $scope.selectLotTag = "전체";

    $scope.searchArtist = function (event) {
        if (event.keyCode === 13 || $scope.searchValue.length <= 0) {
            $scope.searchArtist2();
        }
    }

    $scope.searchArtist2 = function () {
        let pp = [];
        for (let i = 0; i < $scope.saleInfoAll.length; i++) {
            if ($scope.saleInfoAll[i].ARTIST_NAME_BLOB_KO.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1 || $scope.saleInfoAll[i].TITLE_BLOB_KO.toLowerCase().indexOf($scope.searchValue.toLowerCase()) > -1) {
                pp.push($scope.saleInfoAll[i]);
            }
        }
        $scope.searchSaleInfoAll = pp;
        $scope.pageing(1);

    }

    $scope.goLot = function (saleAsNo) {

        window.location.href = '/privatesale/psView/' + saleAsNo ;
    }

    // 호출 부
    const getSaleInfo = ( ) => {
        try {
            return axios.get('/api/privatesale/list');
        } catch (error) {
            console.error(error);
        }
    };

    // 호출 부
    $scope.load = function () {
        let run = async function () {

            //초반 영역 안보이게 세팅
            $("#havePrivateSale").hide();
            $("#emptyPrivateSale").hide();

            let [r1, r2] = await Promise.all([getSaleInfo()]);

            $scope.saleInfoAll = r1.data.data;

            if($scope.saleInfoAll.length < 1){
                $("#emptyPrivateSale").show();
                $("#havePrivateSale").hide();
            }else{
                $("#havePrivateSale").show();
                $("#emptyPrivateSale").hide();
                $scope.saleInfo = $scope.saleInfoAll.slice(0, $scope.itemsize);

                let p = [];
                let endVal = 0;
                let page = 1;

                let etc = ($scope.saleInfoAll.length % $scope.itemsize > 0) ? 1 : 0;
                let end = parseInt($scope.saleInfoAll.length / $scope.itemsize) + etc;

                if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
                    endVal = end;
                } else {
                    endVal = $scope.pagesize + (parseInt(page / $scope.pagesize) + 1);
                }

                for (let i = 1; i <= endVal; i++) {
                    p.push(i);
                }

                $scope.pageingdata = p;
                $scope.$apply();

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
                $("#page_layer").removeClass('only-mb');
                $("#page_layer").addClass('only-pc');
                $("#add_layer").removeClass('only-pc');
                $("#add_layer").addClass('only-mb');

                $scope.pageing($scope.curpage)
                break;
            case 2:
                $("#page_layer").removeClass('only-pc');
                $("#page_layer").addClass('only-mb');
                $("#add_layer").removeClass('only-mb');
                $("#add_layer").addClass('only-pc');

                $scope.addpage($scope.curpage);
                break;
        }
        $scope.selectViewType = sst;
    }
    // 더보기 페이징
    $scope.addpage = function (page) {
        let v = $scope.saleInfoAll;

        if ($scope.searchValue.length > 0) {
            v = $scope.searchSaleInfoAll;
        } else {
            if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
                v = $scope.searchSaleInfoAll;
            }
        }
        $scope.saleInfo = v.slice(0, $scope.itemsize * (page));
        $scope.curpage = page;
    }
    //페이징
    $scope.pageing = function (page) {
        let v = $scope.saleInfoAll;
        if ($scope.searchValue.length > 0) {
            v = $scope.searchSaleInfoAll;
        } else {
            if ($scope.searchSaleInfoAll != null && $scope.searchSaleInfoAll.length > 0) {
                v = $scope.searchSaleInfoAll;
            }
        }
        $scope.saleInfo = v.slice(($scope.itemsize * (page - 1)), $scope.itemsize * page);

        let pp = $scope.makePageing(v, page);
        $scope.pageingdata = pp;
        $scope.curpage = page;
    }
    //페이징 리스트 생성
    $scope.makePageing = function (v, page) {
        let p = [];
        let endVal = 0;
        let etc = (v.length % $scope.itemsize > 0) ? 1 : 0;
        let end = parseInt(v.length / $scope.itemsize) + etc;


        $scope.pagefirst = 1;
        $scope.pageprev = (page < $scope.pagesize)? - 1: ($scope.pagesize * parseInt((page - 1) / $scope.pagesize));

        if (end < (parseInt(page / $scope.pagesize) + 1) + $scope.pagesize) {
            endVal = end;
            $scope.pagelast = -1;
            $scope.pagenext = -1;
        } else {
            endVal = $scope.pagesize + (parseInt(page / $scope.pagesize) + 1);
            $scope.pagelast = end;
            $scope.pagenext = endVal + 1;
        }
        for (let i = ($scope.pagesize * parseInt((page - 1) / $scope.pagesize)) + 1; i <= endVal; i++) {
            p.push(i);
        }
        return p;
    }
});