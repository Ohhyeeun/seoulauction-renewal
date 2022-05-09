/*Auction*/
$(document).ready(function(){

    let auctionData = [];
    let curruentTab = 0;
    init();

    //초기작업.
    function init(){
        auctionDataInit();
        auctionEvent();
    }

    //옥션 데이터 가져오기!
    function auctionDataInit(){

        fetch('/api/main/auctions', {
            method: 'GET', //
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then((response) => response.json())
            .then((result) => {
                let success = result.success;
                if(success){
                    auctionData = result.data;

                    //TODO 인클루드 작업.

                    $(".auctionTab-contents.on").css('height','100%');
                    let locale = document.documentElement.lang;
                    let starting = locale === 'ko' ? '시작가' : 'Starting KRW  ';

                    $.each(auctionData , function(idx , el){

                        let name = locale === 'ko' ? el.koName : el.enName;

                        let html =
                        `<figure class="auction-thumbbox">
                        <img src='${el.pcImgPath}' alt="/images/pc/thumbnail/AuctionBanner_05_280x280.png" class="pc-ver">
                            <img src='${el.moImgPath}' alt="/images/pc/thumbnail/AuctionBanner_05_280x280.png" class="m-ver">
                                <figcaption class="auction-thumb">
                                    <button class="wish_heart"></button>
                                    <a href="#">
                                        <p class="auction-thumb-txt">
                                            <span>${name}</span>
                                            <span>${starting} ${el.price}</span>
                                        </p>
                                    </a>
                                </figcaption>
                        </figure>`;

                        $(".auctionTab-contents.on").append(html);
                    });
                    dynamicEvent();
                }
            })
            .catch((error) => {
                alert(error);
            });
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

            curruentTab = $(this).index();

            //기존 데이터 초기화.
            $('.auctionTab-contents').eq(curruentTab).empty();
            $('.auctionTab-btn').removeClass('on');
            $('.auctionTab-contents').removeClass('on');

            $('#AllAuction').hide();
            $('#MoreAuction').show();

            $(this).addClass('on');
            $(".auctionTab-contents").eq(curruentTab).addClass('on');
            $(".auctionTab-contents.on").css('height', '100%');

            auctionDataInit();
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
            $(this).toggleClass('on');
        });
    }

    //이벤트
    function auctionEvent() {

        //auction 더보기 버튼
        $('#MoreAuction').click(function () {
            $('#AllAuction').show();
            $('#MoreAuction').hide();
            $(".auctionTab-contents.on").css('height', '100%');

            auctionDataInit();
        });
        //auction 전체 보기 버튼
        $('#AllAuction').click(function () {
           //TODO 옥션 랏 상세페이지로 이동.
        })
    }

});