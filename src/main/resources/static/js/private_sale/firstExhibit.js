function size_text_cm(src, $filter){
    var returnValue = "";
    var cmSize = "";

    cmSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1, 1) : "";
    cmSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2, 1) : "";
    cmSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3, 1) +
        "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
    cmSize += cmSize != "" ? src.UNIT_CD : "";
    cmSize += cmSize != "" &&  src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

    returnValue = src.PREFIX;
    returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
    returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "");

    return returnValue;
}

function size_text(src, $filter){
    var returnValue = "";
    var cmSize = "";
    var inchSize = "";

    cmSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1, 1) : "";
    cmSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2, 1) : "";
    cmSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3, 1) +
        "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
    cmSize += cmSize != "" ? src.UNIT_CD : "";
    cmSize += cmSize != "" &&  src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

    inchSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1 * 0.393701, 1) : "";
    inchSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2 * 0.393701, 1) : "";
    inchSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3 * 0.393701, 1) + "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
    inchSize += inchSize != "" ? "in" : "";

    returnValue = src.PREFIX;
    returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
    returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "") + (inchSize != "" ?  ", " + inchSize : "");

    return returnValue;
}


app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["ngDialog", "checklist-model"]);
app.controller("exhibitCtl", function($scope, consts, common, locale, $filter) {
    $scope.locale = locale;
    $scope.$size = 20;

    $scope. loadExhibitList = function($page){

        $scope.currentPage = $page;
        $page = $scope.currentPage;

        $api = '/api/privatesale/selectExhibitSale?page=' + $scope.currentPage + "&size=" + $scope.$size;

        //현재 전시중인 작품을 뿌린다.
        axios.get($api, null).then(function(response) {
            console.log(response);
            const success = response.data.success;
            if (success) {
                const data = response.data.data;
                $(".product-list").empty();

                if(data.length != 0){

                    if(data.length < parseInt($scope.currentPage) * parseInt($scope.$size)){
                        $("#more_search").hide();
                    }

                    data.map(item =>{
                        const titleJSON = JSON.parse(item.TITLE_JSON);
                        const artistNameJSON = JSON.parse(item.ARTIST_NAME_JSON);
                        const makeYearJSON = JSON.parse(item.MAKE_YEAR_JSON);
                        const lotSizeJSON = JSON.parse(item.LOT_SIZE_JSON);

                        let size = '';

                        if(locale === 'ko'){
                            $.each(lotSizeJSON , function(idx , el){
                                size += size_text_cm(el, $filter) + '</br>';
                            });
                        }else{
                            $.each(lotSizeJSON , function(idx , el){
                                size += size_text(el, $filter) + '</br>';
                            });
                        }

                        let html = '<li class="">'
                            + '<div class="li-inner">'
                            + '<article class="item-article" onclick="goExhibitView(\''+item.SALE_NO + '\', \'' +item.LOT_NO +'\');">'
                            + '<div class="image-area">'
                            + '<figure class="img-ratio">'
                            + '<a class="img-align" href="#">'
                            + '<img src="https://www.seoulauction.com/nas_img/' + item.LOT_IMG_PATH + '/' + item.LOT_IMG_NAME + '" alt="">'
                            + '</a>'
                            + '</figure>'
                            + '</div>'
                            + '</article>'
                            + '<article class="item-article">'
                            + '<div class="typo-area">'
                            + '<div class="product_info">'
                            + '<div class="num_heart-box">'
                            + '<span class="num">'+item.LOT_NO+'</span>'
                            + '</div>'
                            + '<div class="info-box">'
                            + '<div class="title">'
                            + '<span title="'+ artistNameJSON[locale] + '">' + artistNameJSON[locale] + '</span>'
                            + '</div>'
                            + '<div class="desc">'
                            + '<span title="'+ titleJSON[locale] + '" >' + titleJSON[locale] + '</span>'
                            + '</div>'
                            + '<div class="standard">'
                            + '<span class="text-over span_block">'+ item.MATE_NM +'</span>'
                            + '<div class="size_year">'
                            + '<span>'+ size + '</span>'
                            + '<span>' +makeYearJSON[locale]+ '</span>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</article>'
                            + '</div>'
                            + '</li>';

                        $(".product-list").append(html);
                    });
                }else{
                    $("#content_more").hide();
                    $("#exhibit_content").hide();
                }
            }else{
                alert("데이터 로딩 실패");
            }
        })
            .catch(function(error){
                console.log(error);
            });
    }

    $scope.moreSearch = function(){
        //더보기가 선택된 경우 더보기 계산
        $scope.$size = parseInt($scope.$size) + 10;
        $scope.loadExhibitList($scope.currentPage);
    }

});

function goExhibitView(saleNo, lotNo){
    window.location.href = '/privatesale/exhibitView/' + saleNo + '/' + lotNo;
}

function goExhibit(){
    window.location.href = '/privatesale/exhibit/';
}

function goExhibitFirst(){
    window.location.href = '/privatesale/exhibit/first';
}

