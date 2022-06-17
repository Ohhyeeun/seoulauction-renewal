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
    }

    //옥션 데이터 가져오기!
    function auctionDataInit(){

        axios.get('/api/footer/notices')
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){

                    let data = response.data;

                    console.log(data);

                    //TODO 인클루드 작업.
                    $.each(auctionData , function(idx , el){

                        let html = `<tr>
                                        <td class="bbs-division">경매</td>
                                        <td class="bbs-subject">
                                            <!-- [0613]제목에 링크 : span을 a태그로 변경 -->
                                            <a href="#" class="tit">3월 e BID 프리미엄 온라인 경매</a>
                                            <!-- //[0613]제목에 링크 : span을 a태그로 변경 -->
                                            <i class="icon_down"></i>
                                        </td>
                                        <td class="bbs-date">2022.04.05</td>
                                   </tr>`;

                    });
                }
            })
            .catch(function(error) {
                console.log(error);
            });
    }


});