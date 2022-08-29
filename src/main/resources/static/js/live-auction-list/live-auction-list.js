app.value('locale', 'ko');
app.value('is_login', true);
app.requires.push.apply(app.requires, ["ngAnimate", "ngDialog"]);
app.controller('ctl', function ($scope, consts, common, is_login, locale, $filter) {
    let pageData = loadPageData();
    console.log('angular', pageData)
    console.log(isRegular);
    $scope.is_login = is_login;
    $scope.locale = locale;
    $scope.sale_no = "saleNo";
    $scope.base_currency = 'KRW';
    $scope.sub_currency = 'USD';

    $scope.searchKeyword = pageData.search;
    $scope.selectedType = pageData.type;
    $scope.selectedCategory = pageData.category || pageData.tag;
    $scope.sortBy = pageData.sort || 'LOTAS'; //LOTAS | ESTDE | ESTAS
    $scope.veiwType = pageData.view; //LOTAS | ESTDE | ESTAS
    $scope.currentPage = pageData.size;
    $scope.pageSize = pageData.size;

    $scope.modelSortType = [{
        name: "LOT 번호순",
        value: 'LOTAS'
    }, {
        name: "추정가 높은순",
        value: "ESTDE"
    }, {
        name: "추정가 낮은순",
        value: "ESTAS"
    }];

    $scope.modelViewType = [{
        name: "페이지 방식",
        value: 'page'
    }, {
        name: "더보기 방식",
        value: 'more'
    }];

    $scope.searchInit = function () {
        $scope.searchKeyword = '';
        $scope.getSearchLotList();
    }

    $scope.getSearchLotList = async function () {
        await $scope.loadLotList();
    }

    $scope.goLot = function (saleNo, lotNo) {
        window.location.href = '/auction/live/view/' + saleNo + '/' + lotNo;
    }

    $scope.favorite = function(item , $e) {
        if(!checkLogin()){
            return;
        }

        let url = item.FAVORITE_YN ==='N' ? "/api/auction/delCustInteLot" : "/api/auction/addCustInteLot";

        try {
            axios.post(url, {
                sale_no: item.SALE_NO,
                lot_no: item.LOT_NO
            }).then(function(response) {
                if(response.data.success){
                    item.FAVORITE_YN = item.FAVORITE_YN ==='N' ? 'Y' : 'N';
                    $scope.$apply();
                }
            });

        } catch (error) {
            console.error(error);
        }

        if($e !==undefined) {
            $e.stopPropagation();
        }
    }

    $scope.moveToBidding = function(item) {

        //로그인 했는지 여부.
        if(!checkLogin()) {
            return;
        }

        //정회원 여부.
        let isRegular = isRegular;
        if(!isRegular){
            alert('정회원만 서면/전화 응찰 신청이 가능합니다.')
            return;
        }

        //필수 값 있는지 여부. ( 생년월일 , 성별 )
        let isCustRequired = isCustRequired;
        if(!isCustRequired){
            if(confirm('서면/전화 응찰 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')){
                location.href = '/mypage/custModify';
            }
            return;
        }

        location.href = '/auction/live/sale/' + $scope.sale_no + '/lot/' + item.LOT_NO + '/biding';
    }

    $scope.goLiveBid = function() {
        const saleStatus = $scope.sale_status;
        const paddleNo = $scope.paddNo;
        const isLogin = sessionStorage.getItem("is_login") === 'true';
        console.log(!isLogin)
        if(saleStatus === 'READY' && !isLogin){
            //로그인 페이지 이동
            if(!checkLogin()) return;
        }else if(saleStatus === 'READY' && isRegular && paddleNo < 1){
            //패들 발급 신청
            let isCustRequired = isCustRequired;
            if(!isCustRequired){
                if(confirm('패들 신청에 필요한 필수회원정보가 있습니다.\n회원정보를 수정하시겠습니까?')){
                    location.href = '/mypage/custModify';
                }
                return;
            }

            if($scope.paddNo <= 0) {
                terms_required.open(this); // or false
                popup_fixation("#terms_required-wrap");

                $("body").on("click", "#terms_required-wrap .js-closepop, #terms_required-wrap .popup-dim", function($e) {
                    $e.preventDefault();
                    terms_required.close();
                });
            }
        }else if(saleStatus === 'LIVE_ING' && !isLogin){
            //player only 페이지 이동
            window.open("/auction/live/bid/player","bidder", "resizable=no, status=no, menubar=no, toolbar=no, location=no, directories=no");
            return;
        }else if(saleStatus === 'LIVE_ING' && isLogin){
            //응찰페이지 이동
            window.open("/auction/live/bidder/"+$scope.sale_no, "bidder", "resizable=no, status=no, menubar=no, toolbar=no, location=no, directories=no");
            return;
        }
    }

    $scope.goLiveBidAgree = function() {
        if($(".js_all-terms #checkbox_all").is(":checked")) {
            axios.post('/api/auction/paddle', { sale_no : saleNo})
                .then(function (response) {
                    if (response.data.success) {
                        $scope.paddNo = response.data.data;
                        setPaddleButtonMsg($scope.sale_status, $scope.paddNo);
                    }
                });

            terms_required.close();
            paddle_number.open(this); // or false
            popup_fixation("#paddle_number-wrap");
            $(".js_all-terms input[type='checkbox']").prop("checked", false);
        } else {
            alert("약관에 동의해주세요.");
        }

        $("body").on("click", "#paddle_number-wrap .js-closepop, #paddle_number-wrap .popup-dim, #paddle_number-wrap #btn-paddle-number", function($e) {
            $e.preventDefault();
            paddle_number.close();
        });
    }

    const setSaleData = function(saleData) {
        //contents
        $scope.base_currency = $scope.saleInfoData.CURR_CD;

        $scope.bid_close_date =  moment($scope.saleInfoData.TO_DT).add('days', -1);
        $scope.displayBidCloseDate = $scope.bid_close_date.format('MM/DD(ddd) 24:00');

        saleData.displayBidDate = moment(saleData.TO_DT).format('MM.DD(ddd) HH:ss');
        saleData.displayPreviewFromDate = moment(saleData.PREV_FROM_DT).format('MM.DD(ddd)');
        saleData.displayPreviewToDate = moment(saleData.PREV_TO_DT).format('MM.DD(ddd)');

        saleData.TITLE_JSON = JSON.parse(saleData.TITLE_JSON);
        saleData.buttonList.map(item => {
            item.content = JSON.parse(item.content);
        });

        //status
        let saleStatus = 'READY';
        const TO_DT_MMDD = moment(saleData.TO_DT).format('YYYYMMDD');
        const LIVE_BID_DT = moment(saleData.LIVE_BID_DT);
        const NOW_DATETIME = moment();
        const NOW_DATE = moment().format('YYYYMMDD');

        if(NOW_DATE < TO_DT_MMDD) {
            saleStatus = 'READY';
        }else if((NOW_DATE >= TO_DT_MMDD) && (NOW_DATETIME < LIVE_BID_DT)) {
            saleStatus = 'BID_END';
        }else if((NOW_DATE >= TO_DT_MMDD) && (NOW_DATETIME >= LIVE_BID_DT)) {
            saleStatus = 'LIVE_ING';
        }else if((NOW_DATETIME > LIVE_BID_DT) && saleData.CLOSE_YN){
            saleStatus = "END";
            if (!isEmployee && sessionStorage.getItem("is_login") === 'false') {
                alert("권한이 없거나 허용되지 않은 접근입니다.");
            }
        }

        $scope.sale_status = saleStatus;

        $scope.$apply();
    }

    const setPaddleButtonMsg = (saleStatus, paddNo) =>{
        let paddNoteMsg = "라이브 응찰 신청";
        let paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";
        $("article.proceeding-article a.js-terms_required").css("cursor", "pointer");
        $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "");

        $scope.btnPaddleNo = '';

        const isLogin = sessionStorage.getItem("is_login");
        const isRegular = 'isRegular';
        const paddleNo = paddNo;
        const sale_status = saleStatus;

        if(sale_status === 'READY') {
            /* 로그인 & 준회원 & 정회원(패들x) */
            if (!isLogin || !isRegular || (isRegular && paddleNo < 1)) {
                paddNoteMsg = "라이브 응찰 신청";
                paddNoteEtc = "정회원만 응찰 신청이 가능합니다.";
                $("article.proceeding-article a.js-terms_required").css("cursor", "pointer");
                $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "");
            }else if(isRegular && paddleNo > 0) {
                paddNoteMsg = "라이브 응찰 신청완료";
                paddNoteEtc = "나의 패들번호 : ";
                $scope.btnPaddleNo = paddleNo;
                $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
            }
        }else if(sale_status === 'BID_END'){
            if(isRegular && paddleNo > 0) {
                paddNoteMsg = "라이브 응찰 신청완료";
                paddNoteEtc = "나의 패들번호 : ";
                $scope.btnPaddleNo = paddleNo;
                $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
            }else{
                const live_start_time_txt = moment($scope.saleInfoData.TO_DT).format('M/DD(ddd) HH');
                paddNoteMsg = "라이브 경매 준비 중";
                paddNoteEtc = live_start_time_txt + "시에 시작합니다.";
                $("article.proceeding-article a.js-terms_required").css("cursor", "default");
                $("article.proceeding-article div.article-inner i.icon-link_arrow").css("display", "none");
            }
        }else if(sale_status === 'LIVE_ING'){
            if(!isLogin){
                paddNoteMsg = "라이브 경매 참가";
                paddNoteEtc = "나의 패들번호 ";
            }else if(isLogin && paddleNo < 1){
                paddNoteMsg = "라이브 경매 보기";
                paddNoteEtc = "사전 신청한 회원만 응찰 가능합니다.";
            }else if(isRegular && paddleNo > 0){
                paddNoteMsg = "라이브 경매 참가";
                paddNoteEtc = "나의 패들번호 : ";
                $scope.btnPaddleNo = paddleNo;
            }
        }

        $scope.paddNoteMsg = paddNoteMsg;
        $scope.paddNoteEtc = paddNoteEtc;
        $scope.$apply();
    }

    // 호출 부
    const getSaleInfo = (saleNo) => {
        try {
            return axios.get('/api/auction/live/sales/'+saleNo+'/one');
        } catch (error) {
            console.error(error);
        }
    };

    const getLotList = () => {
        try {
            /* const pagingParam = '?page='+$scope.currentPage+'&size='+$scope.pageSize;
             const categoryParam = $scope.selectedCategory !== 'all'? '&'+$scope.selectedType+'='+encodeURI($scope.selectedCategory) : '';
             const searchParam = $scope.searchKeyword ? '&search='+encodeURI($scope.searchKeyword) : '';
             const sortParam = '&sortBy='+$scope.sortBy;

             const paramQuery = pagingParam + categoryParam + searchParam + sortParam;
             */

            let params = {
                page: $scope.currentPage,
                size: $scope.pageSize,
                sortBy: $scope.sortBy || 'LOTAS',
            }

            if ($scope.searchKeyword) {
                params.searchText = encodeURI($scope.searchKeyword);
            }

            if ($scope.selectedCategory !== 'all') {
                params[$scope.selectedType] = encodeURI($scope.selectedCategory);
            }
            console.log(params)
            const paramString = "?" + window.Qs.stringify(params);
            return axios.get('/api/auction/live/list/'+ saleNo + paramString);
        } catch (error) {
            console.error(error);
        }
    };

    const getSaleImages = (saleNo) => {
        try {
            return axios.get('/api/auction/sale_images/'+saleNo);
        } catch (error) {
            console.error(error);
        }
    }

    const getCategories = (saleNo) => {
        try {
            return axios.get('/api/auction/live/sales/'+saleNo+'/types');
        } catch (error) {
            console.error(error);
        }
    }

    const getPaddleNumber = async (saleNo) =>{
        try {
            return axios.get('/api/auction/paddles/'+saleNo);
        } catch (error) {
            console.error(error);
        }
    }

    const setLotListData = async (dataList) => {
        let baseCurrency = $scope.base_currency;
        let subCurrency = $scope.sub_currency;

        dataList.forEach(item => {
            item.LOT_SIZE_ARRAY = JSON.parse(item.LOT_SIZE_ARRAY)[0];

            item.EXPE_PRICE_FROM_JSON[baseCurrency] = numberWithCommas(item.EXPE_PRICE_FROM_JSON[baseCurrency]);
            item.EXPE_PRICE_TO_JSON[baseCurrency] = numberWithCommas(item.EXPE_PRICE_TO_JSON[baseCurrency]);
            item.EXPE_PRICE_FROM_JSON[subCurrency] = numberWithCommas(item.EXPE_PRICE_FROM_JSON[subCurrency]);
            item.EXPE_PRICE_TO_JSON[subCurrency] = numberWithCommas(item.EXPE_PRICE_TO_JSON[subCurrency]);
            item.MAX_BID_PRICE = item.MAX_BID_PRICE !== null? numberWithCommas(parseInt(item.MAX_BID_PRICE)) : null;

            if ($scope.sale_status === 'LIVE_ING' && item.CLOSE_YN && item.MAX_BID_PRICE !== null && isRegular) {
                item.isShowBidPrice = true;
            } else {
                item.isShowBidPrice = false;
            }

        } );

    }


    $scope.changeCategory = async function (type, category){
        $scope.selectedType = type;
        $scope.selectedCategory = category;

        let pageData = loadPageData();
        pageData[type] = category;
        console.log(pageData);
        window.location.href = makeUrl(pageData);
        // await $scope.loadLotList();
    }

    // 호출 부
    $scope.load = function () {
        let run = async function () {
            let [saleInfoData, lotListData, lotNaviData, categories, paddleInfoData] = await Promise.all([
                getSaleInfo($scope.sale_no),
                getLotList(),
                getSaleImages($scope.sale_no),
                getCategories($scope.sale_no),
                getPaddleNumber($scope.sale_no),
            ]);

            $scope.saleInfoData = saleInfoData.data.data;
            $scope.lotList = lotListData.data.data.list;
            $scope.lotTotalCount = lotListData.data.data.count;
            $scope.saleImages = lotNaviData.data.data;
            $scope.categories = categories.data.data;
            $scope.categories.unshift({CD_ID : 'all', CD_NM : '전체', CD_NM_EN: 'All'});
            $scope.paddNo = paddleInfoData.data.data;

            await setSaleData($scope.saleInfoData);
            await setLotListData($scope.lotList);
            await setPaddleButtonMsg($scope.sale_status, $scope.paddNo);

            $scope.saleInfo = $scope.lotList.slice(0, $scope.itemsize);

            await renderPaginationSection($scope.currentPage, $scope.lotTotalCount, $scope.pageSize);


            $scope.$apply();


            // lot
            $("#search_lot").on("keyup", function () {
                window.event.preventDefault();
                let v = $("#search_lot").val();
                if (v.length == 0) {
                    $("#sale_lot_list li").each(function (i, item) {
                        $(item).css("display", "");
                    })
                    return
                } else {
                    $("#sale_lot_list li").each(function (i, item) {
                        if ($(item).attr('data-index').toString() != v) {
                            $(item).css("display", "none");
                        } else {
                            $(item).css("display", "");
                        }
                    })
                }
            })

            //년도가 아래로 가야하는지 체크!!
            $scope.change_size = matchMedia("(max-width: 1280px) and (min-width: 1023px)").matches;
            $scope.$apply();

            $(window).resize(function(){
                $scope.change_size = matchMedia("(max-width: 1280px) and (min-width: 1023px)").matches;
                $scope.$apply();
            });

        }
        run();

    }

    $scope.chgViewType = function () {
        let sst = parseInt($("#viewType option:selected").val())
        switch (sst) {
            case 'page':
                $scope.pageing($scope.curpage)
                break;
            case 'more':
                $scope.addpage($scope.curpage);
                break;
        }
        $scope.selectViewType = sst;
    }

    $scope.changeSortByList = async function (value) {
        $scope.sortBy = value;
        await $scope.loadLotList();
    }

    $scope.goBrochure = function (id, url) {
        axios.post('/api/auction/brochure/read', {id: id});
        window.open(url);
    }

    $scope.loadLotList = async () =>{
        const lotListData = await getLotList();
        $scope.lotList = lotListData.data.data.list;
        $scope.lotTotalCount = lotListData.data.data.count;

        await setLotListData($scope.lotList);
        await renderPaginationSection($scope.currentPage, $scope.lotTotalCount, $scope.pageSize);

        $scope.$apply();
    }
});