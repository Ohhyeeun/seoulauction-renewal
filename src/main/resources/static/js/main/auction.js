 /*Auction*/
$(document).ready(function(){

    let auctionData = [];
    let currentLotData = [];
    let curruentTab = 0;
    let initCount = 12;
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

                        const titleBlob = el.SHORT_TITLE? el.SHORT_TITLE : el.TITLE_BLOB;
                        const title = JSON.parse(titleBlob);
                        let name = locale === 'ko' ? title.ko : title.en;

                        //sale html
                        let saleHtml = idx === 0 ? `<span class="auctionTab-btn on"><span class="">${name}</span></span>`
                                                : `<span class="auctionTab-btn"><span class="">${name}</span></span>`;

                        $(".auctionTab").append(saleHtml);
                        $("#auction_contents").append(idx === 0 ? `<div class="flex_wrap auctionTab-contents on"></div>` : `<div class="flex_wrap auctionTab-contents"></div>`);

                        //lot data
                        currentLotData[idx] = el.lots;
                        // 처음은 0부터 10
                        addLot(idx , currentLotData[idx].slice(0 , initCount) , el.SALE_KIND);
                    });

                    //초기 sale_NO 설정.
                    currentSaleNo = currentLotData[curruentTab][0].SALE_NO;
                    bidstart();
                }
            })
            .catch(function(error) {
                console.log(error);
            });
    }

    function addLot(idx , data , kind){

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

            let price = "";
            if (kind === "ONLINE") {
                if (locale === 'ko') {
                    price = numberWithCommas(el.START_PRICE);
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
            }

            let saleNo = el.SALE_NO;
            let saleKind = kind.toLowerCase();
            let lotNo = el.LOT_NO;
            let like = el.FAVORITE_YN === 'N' ? 'on' : '';
            //lot html
            let html =
                `<figure class="auction-thumbbox" sale-kind="${saleKind}" sale-no="${saleNo}" lot-no="${lotNo}">
                            <img src='${imgPath}' alt="" class="pc-ver">
                                <img src='${imgPath}' alt="" class="m-ver">
                                    <figcaption class="auction-thumb"  sale-kind="${saleKind}">
                                        <button id='id_${lotNo}' class="wish_heart ${like}" ></button>
                                        <a>
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

        dynamicEvent(kind);
    }

    //동적 이벤트
    function dynamicEvent(kind){

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

            curruentTab = $(this).index()
            currentSaleNo = currentLotData[curruentTab][0].SALE_NO;

            bidstart();

            //기존 데이터 초기화.
            $('.auctionTab-btn').removeClass('on');
            $('.auctionTab-contents').removeClass('on');

            $('#AllAuction').hide();
            $('#MoreAuction').show();

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

                let saleKind = 'online';
                //
                // if(kind){
                //     saleKind = kind.toLowerCase();
                // }
                 saleKind = event.target.getAttribute("sale-kind");

                location.href = '/auction/'+saleKind+'/view/'+currentSaleNo + '/' +$(this).attr('lot-no');
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
                    let saleKind = 'online';
                    //
                    // if(kind){
                    //     saleKind = kind.toLowerCase();
                    // }
                    saleKind = event.target.getAttribute("sale-kind");
                    location.href ='/auction/'+saleKind+'/view/'+currentSaleNo + '/' +$(this).attr('lot-no');
                });
            }
        });


        //클릭시
        $('.auction-thumb').on('click', function (event) {
            let saleKind = 'online';
            // if(kind){
            //     saleKind = kind.toLowerCase();
            // }
            saleKind = event.target.getAttribute("sale-kind");

            location.href ='/auction/'+saleKind+'/view/'+currentSaleNo + '/' +$(this).children('button').attr('id').split('id_')[1];
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
            //$(".auctionTab-contents.on").css('height', '100%');

            addLot(curruentTab , currentLotData[curruentTab].slice(initCount , initCount * 2 )  );
            bidstart();
            //auctionDataInit();
        });
        //auction 전체 보기 버튼
        $('#AllAuction').click(function () {
           //TODO 옥션 랏 상세페이지로 이동.
            location.href = '/auction/progress';
        })
    }

    /***** 웹 소켓 *****/
    let w;
    let websocketTimeout;
    let con_try_cnt = 0;
    let token = '';
    let is_end_bid = false;

    // bidstart
    function bidstart() {
        if (w === null || w === undefined) {
            retry(currentSaleNo, 0, 1, '', 0);
        } else {
            w.close();
        }
    }

    // websocket connection retry
    function retry(saleNo, lotNo, saleType, userId, custNo) {
        window.clearTimeout(websocketTimeout);
        if (w != null) {
            w = null;
        }
        if (con_try_cnt > 5) {
            con_try_cnt = 0
            return
        }

        if (window.location.protocol !== "https:") {
            w = new WebSocket("ws://dev-bid.seoulauction.xyz/ws?sale_no=" +
                saleNo + "&lot_no=" + lotNo + "&cust_no=" + custNo +
                "&user_id=" + userId + "&paddle=0&sale_type=1&bid_type=11");
        } else {
            w = new WebSocket("wss://dev-bid.seoulauction.xyz/ws?sale_no=" +
                saleNo + "&lot_no=" + lotNo + "&cust_no=" + custNo +
                "&user_id=" + userId + "&paddle=0&sale_type=1&bid_type=11");
        }
        w.onopen = function () {
            // console.log("open");
        }
        w.onerror = function () {
            w.close();
            // console.log('error');
        }
        w.onclose = function () {
            if (w.readyState === w.CLOSED) {
                if (!is_end_bid) {
                    con_try_cnt++;
                    websocketTimeout = window.setTimeout(function () {
                        retry(currentSaleNo, lotNo, saleType, userId, custNo);
                    }, 1000);
                }
            }
        }
        w.onmessage = function (evt) {
            proc(evt, saleNo, lotNo, saleType, userId, custNo);
        }
        con_try_cnt = 0;
    }
    // bid protocols
    function proc (evt, saleNo, lotNo, saleType, userId, custNo) {
        const packet_enum = {
            init: 1, bid_info: 2, time_sync: 3, bid_info_init: 4, end_time_sync: 5, winner: 6,
        }
        let d = JSON.parse(evt.data);
        if (d.msg_type === packet_enum.init) {
            // 현재 토큰정보
            token = d.message.token;

        } else if (d.msg_type === packet_enum.bid_info) {
            if (d.message.bid != null && d.message.bid.length > 0) {
                let len = d.message.bid.length;


                let curCostValue = (d.message.bid[len - 1].bid_cost === 0) ?
                    "현재가 " + d.message.bid[len - 1].open_bid_cost.toLocaleString('ko-KR') :
                    "현재가 " + d.message.bid[len - 1].bid_cost.toLocaleString('ko-KR');

                //TODO 인클루드 작업.
                $(".auctionTab-contents figure").each(function (idx, el) {
                    if (parseInt($(el).attr("sale-no")) === d.message.bid[len - 1].customer.sale_no &&
                        parseInt($(el).attr("lot-no")) === d.message.bid[len - 1].customer.lot_no) {
                        //console.log(, curCostValue)
                        $(el).find(".auction-thumb-txt span:eq(1)").html(curCostValue)
                    }
                });
            }
        } else if (d.msg_type === packet_enum.time_sync) {
            /*health check*/
        } else if (d.msg_type === packet_enum.bid_info_init) {
            if (d.message.bids != null && d.message.bids.length > 0) {
                let matching = new Map();
                // 정보를 처음 가져왔을 때, 인덱스 매핑
                for (let i = 0; i < d.message.bids.length; i++) {
                    matching.set(d.message.bids[i].customer.sale_no + "-" +
                        d.message.bids[i].customer.lot_no, i);
                }
                //TODO 인클루드 작업.
                $(".auctionTab-contents figure").each(function (idx, el) {
                    let mapIndex = matching.get($(el).attr("sale-no") + "-" + $(el).attr("lot-no"));
                    if (mapIndex !== undefined) {
                        let auction_txt = "";
                        let curCostValue = "";
                        if (d.message.bids[mapIndex].customer.sale_type === 1){
                            if (d.message.bids[mapIndex].bid_count > 0) {
                                auction_txt = "현재가 ";
                                curCostValue = auction_txt +
                                    d.message.bids[mapIndex].bid_cost.toLocaleString('ko-KR');
                                $(el).find(".auction-thumb-txt span:eq(1)").html(curCostValue)
                            }
                        } else {
                            if (d.message.bids[mapIndex].bid_count === 0) {
                                auction_txt = "시작가 ";
                            } else {
                                auction_txt = "현재가 ";
                            }
                            curCostValue = (d.message.bids[mapIndex].bid_cost === 0) ? auction_txt +
                                d.message.bids[mapIndex].open_bid_cost.toLocaleString('ko-KR') :
                                auction_txt + d.message.bids[mapIndex].bid_cost.toLocaleString('ko-KR');
                            $(el).find(".auction-thumb-txt span:eq(1)").html(curCostValue)
                        }
                    }
                });
                let isCanClose = true;
                for (let j = 0; j < d.message.bids.length; j++) {
                    if (d.message.bids[j].is_winner) {
                        isCanClose = false;
                        break;
                    }
                }
                if (!isCanClose) {
                    w.close();
                }
            }
        } else if (d.msg_type === packet_enum.end_time_sync) {

        } else if (d.msg_type === packet_enum.winner) {
            if (d.message != null) {
                //TODO 인클루드 작업.
                $(".auctionTab-contents figure").each(function (idx, el) {
                    if ($(el).attr("sale-no") === d.message.sale_no && $(el).attr("lot-no") === d.message.lot_no) {
                        $(el).find(".auction-thumb-txt span:eq(1)").html(curCostValue)
                    }
                });
            }
        }
    }
});