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

        let url = '/api/footer/recruits?page='+current_page+"&size="+data_size;
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
                    $("#recurit_paging").empty();
                    $("#recurit_tbody").empty();

                    if(total_count == 0) {
                        let empty_html = `<div class="data-empty">
                                             <p class="txt_empty">검색된 채용공고가 없습니다.</p>
                                         </div>`;
                        $("#recurit_tbody").append(empty_html);
                    }
                    //TODO 인클루드 작업.
                    $.each(data , function(idx , el){

                        let html =  `<tr>
                                        <td class="bbs-subject">
                                            <div class="icon-wrap">`;

                        //신입 / 경력 확인.
                        if ( el.recruit_type === 'fresh'){
                            html +=  `<div class="mem-icon icon-new">신입</div>`;
                        }else if ( el.recruit_type === 'experience'){
                            html +=  `<div class="mem-icon icon-senior">경력</div>`;
                        }

                        if ( el.period_type === 'period'){
                            html +=   `<div class="mem-icon icon-recruiting">진행중</div>
                                     </div>`;
                        } else if ( el.period_type === 'current'){
                            html +=   `<div class="mem-icon icon-recruiting">상시</div>
                                     </div>`;
                        }  else if ( el.period_type === 'immediate'){
                            html +=   `<div class="mem-icon icon-recruiting">채용시 마감</div>
                                     </div>`;
                        }
                            html +=
                                `<a href="/footer/recruit/${el.id}" class="tit">${el.title}</a>
                                </td>
                                <td class="bbs-date long">${el.start_date} ~ ${el.end_date}</td>
                                </tr>`;

                        $("#recurit_tbody").append(html);
                    });
                    $("#recurit_data_count").html(total_count);


                    paging({
                        id: "recurit_paging",
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