 /*공지사항*/
$(document).ready(function(){

    let current_page = 1;
    let data_size = 15;
    let page_size = 5;
    let total_count = 0;
    let locale = document.documentElement.lang;
    let search_text = '';


    $(document).keyup(function (e) {
        // focus 되고 enter눌렀을 경우
        if ((e.key == "Enter")) {
            $("#search_btn").click();
        }
    });

    init();

    //초기작업.
    function init(){

        let url = '/api/footer/recruits?page='+current_page+"&size="+data_size;
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
                            html += `<div class="mem-icon icon-senior">경력</div>`;
                        }else if ( el.recruit_type === 'all'){
                            html += `<div class="mem-icon icon-new">신입</div>`;
                            html += `<div class="mem-icon icon-senior">경력</div>`;
                        }

                        //날짜가 안지낫을 경우 OR 상시모집 이거나 진행중 마감 인경우.
                        if(el.is_over === 'N' || ( el.period_type === 'current' || el.period_type === 'immediate')){
                            html += `<div class="mem-icon icon-recruiting">진행중</div>`;
                        }

                        html +='</div>';

                        if ( el.period_type === 'period'){

                            let endDate = el.end_date !== undefined ? ' ~ ' + el.end_date : '';
                            html += `<a id="re_${el.is_over}" class="re_detail_btn" href="/footer/recruit/${el.id}"  class="tit">${el.title}</a></td>`;
                            html += `<td class="bbs-date long">${el.start_date} ${endDate} </td></tr>`;

                        } else if ( el.period_type === 'current'){

                            html +=  `<a href="/footer/recruit/${el.id}" class="tit">${el.title}</a></td>`;

                            html += `<td class="bbs-date long">상시 모집</td></tr>`;

                        }  else if ( el.period_type === 'immediate'){

                            html +=  `<a href="/footer/recruit/${el.id}" class="tit">${el.title}</a></td>`;

                            html += `<td class="bbs-date long">채용 시 마감</td></tr>`;
                        }


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

                    $('.re_detail_btn').on('click',function (){

                        console.log($(this).attr('id'));

                        let is_over = $(this).attr('id').split('_')[1];

                        if(is_over ==='Y'){
                            alert('이미 지난 채용 공고 입니다.');
                            return false;
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