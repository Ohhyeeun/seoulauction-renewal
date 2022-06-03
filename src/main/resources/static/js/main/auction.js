 /*Auction*/
$(document).ready(function(){

    let auctionData = [];
    let currentLotData = [];
    let curruentTab = 0;
    let initCount = 10;
    let currentSaleNo;
    let locale = document.documentElement.lang;
    init();

    //초기작업.
    function init(){
        auctionDataInit();
        auctionEvent();
    }

    //옥션 데이터 가져오기!
    function auctionDataInit(){

        axios.get('/api/main/auctions')
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){

                    auctionData = data.data.list;

                    //TODO 인클루드 작업.
                    $.each(auctionData , function(idx , el){

                        let title = JSON.parse(el.TITLE_BLOB);
                        let name = locale === 'ko' ? title.ko : title.en;

                        //sale html
                        let saleHtml = idx === 0 ? `<span class="auctionTab-btn on"><span class="text-over">${name}</span></span>`
                                                : `<span class="auctionTab-btn"><span class="text-over">${name}</span></span>`;

                        $(".auctionTab").append(saleHtml);
                        $("#auction_contents").append(idx === 0 ? `<div class="flex_wrap auctionTab-contents on"></div>` : `<div class="flex_wrap auctionTab-contents"></div>`);

                        //lot data
                        currentLotData[idx] = el.lots;

                        // 처음은 0부터 10
                        addLot(idx , currentLotData[curruentTab].slice(0 , initCount));
                    });

                    //초기 sale_NO 설정.
                    currentSaleNo = currentLotData[curruentTab][0].SALE_NO;

                    dynamicEvent();
                }
            })
            .catch(function(error) {
                console.log(error);
            });
    }

    function addLot(idx , data){

        let starting = locale === 'ko' ? '시작가' : 'Starting KRW  ';

        $.each(data , function(lotIdx , el){
            let imgPath = 'https://www.seoulauction.com/nas_img' + el.FILE_PATH + '/' + el.FILE_NAME;
            let lotTitle = JSON.parse(el.EXPE_PRICE_TITLE);
            let lotName = locale === 'ko' ? lotTitle.ko : lotTitle.en;
            let price = numberWithCommas(el.START_PRICE);
            let lotNo = el.LOT_NO;
            //lot html
            let html =
                `<figure class="auction-thumbbox">
                            <img src='${imgPath}' alt="/images/pc/thumbnail/AuctionBanner_05_280x280.png" class="pc-ver">
                                <img src='${imgPath}' alt="/images/pc/thumbnail/AuctionBanner_05_280x280.png" class="m-ver">
                                    <figcaption class="auction-thumb">
                                        <button id='id_${lotNo}' class="wish_heart"></button>
                                        <a href="#">
                                            <p class="auction-thumb-txt">
                                                <span>${lotName}</span>
                                                <span>${starting} ${price}</span>
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

        /*auction Tab 버튼*/
        $('.auctionTab-btn').on('click',function () {

            //현재탭을 또눌렀을 경우 무시.
            if(curruentTab === $(this).index()){
                return;
            }

            curruentTab = $(this).index()

            currentSaleNo = currentLotData[curruentTab][0].SALE_NO;

            //기존 데이터 초기화.
            $('.auctionTab-btn').removeClass('on');
            $('.auctionTab-contents').removeClass('on');

            $('#AllAuction').hide();
            $('#MoreAuction').show();

            $(this).addClass('on');
            $(".auctionTab-contents").eq(curruentTab).addClass('on');
            $(".auctionTab-contents.on").css('height', '100%');

        });

        $('.auction-thumbbox').on('mouseenter', function () {
            $('.auction-thumbbox>.auction-thumb').removeClass('on');
            $(this).children('.auction-thumb').addClass('on');
        });
        $('.auction-thumb').on('mouseleave', function () {
            $(this).removeClass('on');
        });
        //auction haert 버튼
        $('.wish_heart').on('click', function () {

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
        });
    }

    //이벤트
    function auctionEvent() {

        //auction 더보기 버튼
        $('#MoreAuction').click(function () {

            $('#AllAuction').show();
            $('#MoreAuction').hide();
            //$(".auctionTab-contents.on").css('height', '100%');

            // 10부터 최대 20
            addLot(curruentTab , currentLotData[curruentTab].slice(initCount , currentLotData[curruentTab].length )  );
            //auctionDataInit();
        });
        //auction 전체 보기 버튼
        $('#AllAuction').click(function () {
           //TODO 옥션 랏 상세페이지로 이동.
        })
    }

});