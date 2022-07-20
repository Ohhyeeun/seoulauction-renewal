 /*공지사항*/
$(document).ready(function(){

    let current_page = 1;
    let data_size = 15;
    let page_size = 5;
    let total_count = 0;
    let locale = document.documentElement.lang;
    let search_text = '';


    init();

    //초기작업.
    function init(){

        let url = '/api/footer/notices?page=' + current_page + "&size=" + data_size + '&lang=' + locale;
        if(search_text){
            url +="&search="+encodeURIComponent(search_text);
        }

        axios.get(url)
            .then(function(response) {
                const data = response.data;
                let success = data.success;
                if(success){

                    let data = response.data.data.list;
                    total_count = response.data.data.count;

                    $("#notice_paging").empty();
                    $("#notice_tbody").empty();
                    //TODO 인클루드 작업.
                    $.each(data , function(idx , el){

                        let title = JSON.parse(el.title);

                        let localeTitle = locale === 'ko' ? title.ko : title.en;

                        let noticeType;


                        if(locale === 'ko') {

                            noticeType = el.notice_type === 'auction' ? '경매' :
                                             el.notice_type === 'info' ? '안내' :
                                             el.notice_type === 'notice' ? '공고' : 'null';

                        } else {

                            noticeType = el.notice_type === 'auction' ? 'Auction' :
                                             el.notice_type === 'info' ? 'Guide' :
                                             el.notice_type === 'notice' ? 'Announcement' : 'null';

                        }
                        let html = `<tr>
                                        <td class="bbs-division">${noticeType}</td>
                                        <td class="bbs-subject">
                                        <a href="/footer/notice/${el.id}" class="tit">${localeTitle}</a>
                                    `;
                        //이미지가 1개라도 있으면
                        if(el.images.length !==0){
                            html += `<i class="icon_down"></i>`;
                        }
                        html +=     `
                                    </td>
                                    <td class="bbs-date">${el.dt_date}</td>
                                    </tr>
                                    `;

                        $("#notice_tbody").append(html);
                    });
                    $("#notice_data_count").html(total_count);


                    paging({
                        id: "notice_paging",
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

});