 /*Auction*/
$(document).ready(function(){

    let auctionData = [];
    let currentLotData = [];
    let currentLotCounts = [];
    let curruentTab = 0;
    let initCount = 12;
    let currentSaleNo;
    let locale = document.documentElement.lang;
    let saleKind;
    let intervalTime = 3000; // 3초에 1번씩 새로고침.
    let isInterval = true;
    init();

    //초기작업.
    function init(){
        console.log('!!!![참고] 메인 - 옥션 3초에 한번씩 데이터 갱신 중!!!!')
        auctionDataInit();
        auctionEvent();

        //3초에 경매 데이터 재 갱신.
        if(isInterval) {
            setInterval(function () {
                auctionDataInit();
            }, intervalTime);
        }
    }

    //옥션 데이터 가져오기!
    function auctionDataInit(){

        axios.get('/api/main/auctions')
            .then(function(response) {
                const data = response.data;

                let success = data.success;
                if(success){
                    $(".auctionTab").empty();
                    
                    $("#auction_contents").empty();

                    auctionData = data.data.list;
                    //TODO 인클루드 작업.
                    //초기 sale_kind 설정.
                    saleKind = auctionData[0].SALE_KIND;

                    $.each(auctionData , function(idx , el){

                        const titleBlob = el.SHORT_TITLE? el.SHORT_TITLE : el.TITLE_BLOB;
                        const title = JSON.parse(titleBlob);
                        let name = locale === 'ko' ? title.ko : title.en;

                        //sale html
                        let saleHtml = idx === curruentTab ? `<span class="auctionTab-btn on"><span class="text-over">${name}</span></span>`
                                                : `<span class="auctionTab-btn"><span class="text-over">${name}</span></span>`;

                        $(".auctionTab").append(saleHtml);
                        $("#auction_contents").append(idx === curruentTab ? `<div class="flex_wrap auctionTab-contents on"></div>` : `<div class="flex_wrap auctionTab-contents"></div>`);

                        if(!currentLotCounts[idx]) {
                            currentLotCounts[idx] = {
                                'start': 0,
                                'end': initCount
                            };
                        }

                        let CuCountObjs = currentLotCounts[idx];

                        //lot data
                        currentLotData[idx] = el.lots;
                        // 처음은 0부터 12
                        addLot(el.SALE_KIND , idx , currentLotData[idx].slice(CuCountObjs.start , CuCountObjs.end));
                    });
                    //초기 sale_NO 설정.
                    currentSaleNo = currentLotData[curruentTab][0].SALE_NO;
                }
            })
            .catch(function(error) {
                console.log(error);
            });
    }

    function addLot( kind , idx , data){

        let starting = locale === 'ko' ? '추정가' : 'Starting KRW  ';

        if (kind === "ONLINE") {
            starting = locale === 'ko' ? "시작가" : 'Starting KRW  ';
        }

        let img_pre_fix = 'https://www.seoulauction.com';

        $.each(data , function(lotIdx , el){

            let imgPath = el.IMAGE_URL + el.FILE_PATH + '/' + el.FILE_NAME;
            let lotTitle = JSON.parse(el.EXPE_PRICE_TITLE);
            let lotName = locale === 'ko' ? lotTitle.ko : lotTitle.en;
            let priceToJson =  JSON.parse(el.EXPE_PRICE_TO_JSON);
            let priceFromJson =  JSON.parse(el.EXPE_PRICE_FROM_JSON);
            let currentStarting = starting;
            let price = "";
            if (kind === "ONLINE") {

                price = el.MAX_BID_PRICE != null ? numberWithCommas(el.MAX_BID_PRICE) : numberWithCommas(el.START_PRICE);

                //낙찰이 되었다면.
                if(el.SB_YN === 'Y') {
                    currentStarting = locale === 'ko' ? '낙찰가' : 'Hanmmer';
                } else {
                    if(el.MAX_BID_PRICE != null){

                        currentStarting = locale === 'ko' ? '현재가' : 'Current';

                        let count = locale === 'ko' ? '회' : 'bid';

                        if( el.BID_COUNT !==0 ){
                            currentStarting += '(' + el.BID_COUNT + count + ')';
                        }
                    }
                }

            } else {

                if (locale === 'ko') {
                    if(priceFromJson.KRW) {

                        price = numberWithCommas(priceFromJson.KRW) + '~' + numberWithCommas(priceToJson.KRW);
                    }
                } else {
                    if(priceFromJson.USD) {
                        price = numberWithCommas(priceFromJson.USD) + '~' + numberWithCommas(priceToJson.USD);
                    }
                }

                //오프라인 전용 현재가 측정 ( 오프라인 경매 중 일경우 )
                if(el.LAST_PRICE){
                    currentStarting = locale === 'ko' ? '현재가' : 'Current';
                    price = numberWithCommas(el.LAST_PRICE);

                    let count = locale === 'ko' ? '회' : 'bid';

                    if( el.BID_COUNT !==0 ){
                        currentStarting += '(' + el.BID_COUNT + count + ')';
                    }
                }

                //낙찰이 된경우 !
                if(el.SB_YN === 'Y') {
                    currentStarting = locale === 'ko' ? '낙찰가' : 'Hanmmer';
                    price = numberWithCommas(el.MAX_BID_PRICE);
                }
            }

            let saleNo = el.SALE_NO;
            let lotNo = el.LOT_NO;
            let like = el.FAVORITE_YN === 'N' ? 'on' : '';
            //lot html
            let html =
                `<figure class="auction-thumbbox" sale-no="${saleNo}" lot-no="${lotNo}">
                            <img src='${imgPath}' alt="" class="pc-ver">
                                <img src='${imgPath}' alt="" class="m-ver">
                                    <figcaption class="auction-thumb" lot-no="${lotNo}">
                                        <button id='id_${lotNo}' class="wish_heart ${like}" ></button>
                                        <a>
                                            <p class="auction-thumb-txt">
                                                <span>${lotName}</span>
                                                <span>${currentStarting} ${price}</span>
                                            </p>
                                        </a>
                                    </figcaption>
                </figure>`;
            $('.auctionTab-contents').eq(idx).append(html);
        });

        $(".auctionTab-contents.on").css('height','100%')
        dynamicEvent();
    }

    //동적 이벤트
    function dynamicEvent(){

        //중복 이벤트 제거!!!
        $('.auctionTab-btn').off('click');
        $('.auction-thumbbox').off('mouseenter');
        $('.auction-thumb').off('mouseleave');
        $('.wish_heart').off('click');
        $('.auction-thumb').off('click');
        $('.auction-thumbbox').off('click');
        /*auction Tab 버튼*/
        $('.auctionTab-btn').on('click',function () {

            //현재탭을 또눌렀을 경우 무시.
            if(curruentTab === $(this).index()){
                return;
            }


            curruentTab = $(this).index();
            currentSaleNo = currentLotData[curruentTab][0].SALE_NO;
            saleKind = auctionData[curruentTab].SALE_KIND;

            let countObj = currentLotCounts[curruentTab];

            if ( countObj.end === initCount ) {
                $('#AllAuction').hide();
                $('#MoreAuction').show();
            } else {
                $('#AllAuction').show();
                $('#MoreAuction').hide();
            }

            //기존 데이터 초기화.
            $('.auctionTab-btn').removeClass('on');
            $('.auctionTab-contents').removeClass('on');

            $(this).addClass('on');
            $(".auctionTab-contents").eq(curruentTab).addClass('on');
            $(".auctionTab-contents.on").css('height', '100%');

        });

        //모바일이 아닐때만 .
        if (matchMedia("all and (min-width: 1024px)").matches) {

            $('.auction-thumbbox').on('mouseenter', function () {

                $('.auction-thumbbox>.auction-thumb').removeClass('on');
                $(this).children('.auction-thumb').addClass('on');

            });
            $('.auction-thumb').on('mouseleave', function () {
                $(this).removeClass('on');
            });
        } else {
            //모바일일땐 클릭이벤트로
            $('.auction-thumbbox').on('click', function (event) {

                //let saleKind = 'online';
                //
                // if(kind){
                //     saleKind = kind.toLowerCase();
                // }
                let lotSaleKind = saleKind.toLowerCase();
                location.href = '/auction/'+lotSaleKind+'/view/'+currentSaleNo + '/' +$(this).attr('lot-no');
            });
        }


        /* 반응형 resize 추가 */
        $(window).resize(function(){

            $('.auction-thumbbox').off('mouseenter');
            $('.auction-thumb').off('mouseleave');
            $('.auction-thumbbox').off('click');

            //모바일이 아닐때만 .
            if (matchMedia("all and (min-width: 1024px)").matches) {

                $('.auction-thumbbox').on('mouseenter', function () {
                    $('.auction-thumbbox>.auction-thumb').removeClass('on');
                    $(this).children('.auction-thumb').addClass('on');

                });
                $('.auction-thumb').on('mouseleave', function () {
                    $(this).removeClass('on');
                });
            } else {
                //모바일일땐 클릭이벤트로
                $('.auction-thumbbox').on('click', function (event) {
                    //let saleKind = 'online';
                    //
                    // if(kind){
                    //     saleKind = kind.toLowerCase();
                    // }
                    let lotSaleKind = saleKind.toLowerCase();
                    location.href = '/auction/'+lotSaleKind+'/view/'+currentSaleNo + '/' +$(this).attr('lot-no');
                });
            }
        });


        //클릭시
        $('.auction-thumb').on('click', function (event) {
            //let saleKind = 'online';
            // if(kind){
            //     saleKind = kind.toLowerCase();
            // }
            let lotSaleKind = saleKind.toLowerCase();
            location.href = '/auction/'+lotSaleKind+'/view/'+currentSaleNo + '/' +$(this).attr('lot-no');
        });

        //auction haert 버튼
        $('.wish_heart').on('click', function () {

            if(!checkLogin()){
                return false;
            }

            let data = {};

            let element = $(this);
            let url = 'api/auction' + ( element.hasClass("on") ? '/delCustInteLot' : '/addCustInteLot' ) ;

            data['sale_no'] = currentSaleNo;
            data['lot_no'] = $(this).attr('id').split('id_')[1];
            axios.post(url , data)
                .then(function(response) {
                    const result = response.data;
                    let success = result.success;
                    if(success){
                        element.toggleClass('on');
                    }
                })
                .catch(function(error){
                    console.log(error);
                });

            return false;
        });
    }

    //이벤트
    function auctionEvent() {

        //auction 더보기 버튼
        $('#MoreAuction').click(function () {

            $('#AllAuction').show();
            $('#MoreAuction').hide();

            let countObj = currentLotCounts[curruentTab];
            countObj.end = countObj.end + initCount;
            currentLotCounts[curruentTab] = countObj;
            //$(".auctionTab-contents.on").css('height', '100%');

            addLot(saleKind , curruentTab , currentLotData[curruentTab].slice(countObj.start + initCount , countObj.end ));
            //bidstart();
            //auctionDataInit();
        });
        //auction 전체 보기 버튼
        $('#AllAuction').click(function () {
           //TODO 옥션 랏 상세페이지로 이동.
            location.href = '/auction/live/list/'+ currentSaleNo;
        })
    }
});