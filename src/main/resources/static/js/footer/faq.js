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

    $(document).keyup(function (e) {
        // focus 되고 enter눌렀을 경우
        if ((e.key == "Enter")) {
            $("#search_btn").click();
        }
    });

    //초기작업.
    function init(){

        let url = '/api/footer/faqs?faq_type=' + faq_type + "&lang=" + locale;
        if(search_text){
            url +="&search="+encodeURIComponent(search_text);
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
                        let localeContent = locale === 'ko' ? content.ko : content.en;
                        let localeSellInfo = locale === 'ko' ? '위탁안내 바로가기' : 'How to Sell';


                        //둘다 값이 있어야 나오도록 수정.
                        if(localeTitle !== '' && localeContent !== '' ) {

                            let html = `<li class="trp_acitem">

                                                <div class="header-area">
                                                    <div class="accordion_name tt4">
                                                        <a href="#" class="">
                                                            <span class="faq">Q.</span>
                                                            ${localeTitle}
                                                            <i class="icon-accordion_arrow_down"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="con-area">
                                                    <span class="faq">A.</span>
                                                    <div class="faq_cont tb1">
                                                        ${localeContent}
                                                        <!--0809 추가 --> 
                                                        <div class="btn_wrap">
                                                            <a class="btn btn_gray_line tb2" href="/sell/consignment" role="button"><span>${localeSellInfo}</span></a>
                                                        </div> 
                                                        <!--//0809 추가 -->
                                                    </div>  
                                                </div>
                                      </li>`;

                            $("#faq_content").append(html);
                        }
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

                            let fy = $(this).children('span').attr('id');

                            search_text = null;
                            $("#search_text").val('');

                            if(fy === 'faq_a'){
                                faq_type = 'customer';
                            }else if(fy === 'faq_b'){
                                faq_type = 'live_auction';
                            }else if(fy === 'faq_c'){
                                faq_type = 'online_auction';
                            }else if(fy === 'faq_d'){
                                faq_type = 'consignment';
                            }else if(fy === 'faq_e'){
                                faq_type = 'pay_delivery';
                            }else if(fy === 'faq_f'){
                                faq_type = 'etc';
                            }
                            init();
                        }
                    });
                    $(".js-accordion_faq").trpAccordionMenu(".accordion_name", ".con-area", "on");

                }
            }).catch(function(error) {
                console.log(error);
            });
    }

    $("#search_btn").on('click',function (){
        search_text = $("#search_text").val();
        init();
    });


});