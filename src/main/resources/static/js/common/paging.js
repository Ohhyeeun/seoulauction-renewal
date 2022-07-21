function paging(config){

    //화면에 뿌리는 페이지 최대 갯수.
    let paging_div = document.createElement("div");
    // paging class 추가
    paging_div.setAttribute("class", config.className);
    $("#"+config.id).empty();

    // 전체 페이징 카운트
    let all_paging_cnt = Math.ceil(config.totalCount / config.itemSize);//parseInt(config.totalCount / config.itemSize);

    let start_page = parseInt((config.page - 1) / config.pageSize) * config.pageSize + 1;

    //현재 페이지부터 몇개를 그려야할지 여부 정함.
    let paging_end = function(all_paging_cnt, start_page){
        if (all_paging_cnt < start_page + config.pageSize) {
            return all_paging_cnt
        } else {
            return start_page + config.pageSize - 1;
        }
    }
    (all_paging_cnt, start_page)

    //1페이지 가기 버튼 그리기
    let first_arrow = document.createElement("a");
    first_arrow.setAttribute("href", "javascript:void(0);");
    first_arrow.addEventListener("click", function (){

        if(config.page === 1){
            return;
        }

        config.callBackFunc(1);
    });
    first_arrow.setAttribute("class", "prev_end icon-page_prevprev");
    first_arrow.innerHTML = "FIRST";
    paging_div.appendChild(first_arrow);


    //prev 그리기
    if (start_page >= 1) {

        let start_arrow = document.createElement("a");
        start_arrow.setAttribute("href", "javascript:void(0);");
        start_arrow.addEventListener("click", function (){

            if(config.page === 1){
                return;
            }

            config.callBackFunc(config.page - 1);
        });
        start_arrow.setAttribute("class", "prev icon-page_prev");
        start_arrow.innerText = "PREV";
        paging_div.appendChild(start_arrow);
    }

    //페이지 그리기
    for (let i = start_page; i <= paging_end; i++) {
        let pp = document.createElement("a");
        let et = document.createElement("em");
        let st = document.createElement("strong");
        pp.setAttribute("href", "javascript:void(0);");
        pp.addEventListener("click", function (){
            config.callBackFunc(i);
        });

        if  (i == config.page) {
            st.innerText = i.toString();
            st.setAttribute("class", "on");
            pp.appendChild(st);
            paging_div.appendChild(pp);
        }else{
            et.innerText = i.toString();
            pp.appendChild(et);
            paging_div.appendChild(pp);
        }
    }

    //next 버튼 그리기. 1페이지만있어도 일단 그린다.
    let next_arrow = document.createElement("a");
    next_arrow.setAttribute("href", "javascript:void(0);");
    next_arrow.addEventListener("click", function (){

        if(config.page === all_paging_cnt){
            return;
        }

        config.callBackFunc(config.page + 1);
    })
    next_arrow.setAttribute("class", "prev_end icon-page_next");
    next_arrow.innerText = "NEXT";
    paging_div.appendChild(next_arrow);

    //마지막 버튼 next 그리기.
    let last_arrow = document.createElement("a");
    last_arrow.setAttribute("href", "javascript:void(0);");
    last_arrow.addEventListener("click", function (){

        if(config.page === all_paging_cnt){
            return;
        }

        config.callBackFunc(all_paging_cnt);
    });
    last_arrow.setAttribute("class", "prev_end icon-page_nextnext");
    last_arrow.innerHTML = "END";
    paging_div.appendChild(last_arrow);
    document.getElementById(config.id).appendChild(paging_div);
}