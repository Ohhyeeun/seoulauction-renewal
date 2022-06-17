 /*faq*/
$(document).ready(function(){

    let current_page = 1;
    let data_size = 15;
    let page_size = 5;
    let total_count = 0;
    let locale = document.documentElement.lang;
    let search_text = '';
    let faq_type = 'customer';

    init();

    //초기작업.
    function init(){

        let url = '/api/footer/faqs?faq_type=' + faq_type;
        if(search_text){
            url +="&search="+search_text;
        }

        axios.get(url)
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){

                    let data = response.data.data;

                    $("#faq_content").empty();

                    //TODO 인클루드 작업.
                    $.each(data , function(idx , el){

                        let title = JSON.parse(el.title);
                        let content = JSON.parse(el.content);

                        let localeTitle = locale === 'ko' ? title.ko : title.en;

                        let html = `<li className="trp_acitem">
                                                <div class="header-area">
                                                    <div class="accordion_name tt4">
                                                        <a href="#" class="">
                                                            <span class="faq">Q.</span>
                                                            ${title.ko}
                                                            <i class="icon-accordion_arrow_down"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="con-area">
                                                    <span class="faq">A.</span>
                                                    <div class="faq_cont tb1">
                                                        ${content.ko}
                                                    </div>
                                                </div>
                                            </li>`;

                        $("#faq_content").append(html);
                    });

                    //===아코디언FAQ===//
                    $(".js-accordion_faq").off('click');
                    $('.js-list_tab a').off('click');
                    //===텝메뉴===//
                    $('.js-list_tab a').on('click', function($e) {
                        $e.preventDefault();
                        var tar = $(this).position().left;
                        var scrollX = tar - ($(".js-list_tab").parents(".tab-area").width() / 2) + $(this).width() / 2;

                        if ($(this).parents('li').hasClass('active')) {
                            return false;
                        } else {
                            $(".js-list_tab li").removeClass('active');
                            $(this).parents('li').addClass('active');

                            $(".js-list_tab").parents(".tab-area").scrollLeft(scrollX);

                            let fy = $(this).children('span').html();

                            search_text = null
                            $("#search_text").val('');

                            if(fy === '회원정보'){
                                faq_type = 'customer';
                            }else if(fy === '라이브경매'){
                                faq_type = 'live_auction';
                            }else if(fy === '온라인경매'){
                                faq_type = 'online_auction';
                            }else if(fy === '위탁'){
                                faq_type = 'consignment';
                            }else if(fy === '결제/배송'){
                                faq_type = 'pay_delivery';
                            }else if(fy === '기타'){
                                faq_type = 'etc';
                            }
                            init();
                        }
                    });
                    $(".js-accordion_faq").trpAccordionMenu(".accordion_name", ".con-area", "on");

                }
            })
            .catch(function(error) {
                console.log(error);
        });
    }

    $("#search_btn").on('click',function (){
        search_text = $("#search_text").val();
        init();
    });


});