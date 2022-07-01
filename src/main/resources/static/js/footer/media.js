 /*언론보도*/
$(document).ready(function(){

    let current_page = 1;
    let data_size = 15;
    let page_size = 5;
    let total_count = 0;
    let locale = document.documentElement.lang;
    let langs = (locale === null || locale === 'ko') ? 'KO' : 'EN';
    let search_text = '';

    init();

    //초기작업.
    function init(){

        let url = '/api/footer/medias?page='+current_page+"&size="+data_size+"&langs="+langs;
        if(search_text){
            url +="&search="+search_text;
        }
        axios.get(url)
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){

                    let data = response.data.data.list;
                    total_count = response.data.data.count;

                    $("#media_paging").empty();
                    $("#media_tbody").empty();
                    //TODO 인클루드 작업.
                    $.each(data , function(idx , el){

                        let title = el.title;

                        let html = `<tr>
                                        <td class="bbs-subject">
                                            <span class="bbs-media">${el.corp}</span>
                                            <a id="${el.id}_id" href="${el.url}" class="tit media_click_cl">${el.title}</a>
                                        </td>
                                        <td class="bbs-date">${el.dt_date}</td>
                                    </tr>`;
                        $("#media_tbody").append(html);
                    });

                    $('.media_click_cl').on('click' , function (){
                        addReadCount($(this).attr('id').split('_')[0] , 'content_press')
                    });


                    $("#media_count").html(total_count);

                    paging({
                        id: "media_paging",
                        className:"paging",
                        totalCount:total_count,
                        itemSize: data_size,
                        pageSize: page_size,
                        page: current_page,
                        callBackFunc:function(i) {
                            current_page = i;
                            init();
                        }
                    });
                }
            })
            .catch(function(error) {
                console.log(error);
        });
    }
    $("#search_btn").on('click',function (){
        search_text = $("#search_text").val();
        current_page = 1;
        init();

    });

    $('.js-list_tab_left_lg a').on('click', function(e) {
        e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-list_tab_left_lg").parents(".tab-area").width() / 2) + $(this).width() / 2;

        if ($(this).parents('li').hasClass('active')) {
            return false;
        } else {
            $(".js-list_tab_left_lg li").removeClass('active');
            $(this).parents('li').addClass('active');
            if($(this).attr('id') === 'media_tab1'){
                langs = 'KO';
            } else {
                langs = 'EN';
            }
            search_text = null;
            $("#search_text").val('');
            current_page = 1;
            init();

            $(".js-list_tab_left_lg").parents(".tab-area").scrollLeft(scrollX);
        }
    });


});