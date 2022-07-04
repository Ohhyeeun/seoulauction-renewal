function paging(config){
    let paging_div = document.createElement("div");
    // paging class 추가
    paging_div.setAttribute("class", config.className);
    $("#"+config.id).empty();


    // 전체 페이징 카운트
    let all_paging_cnt = parseInt(config.totalCount / config.itemSize);
    // 나머지 여부
    let is_mod = (config.totalCount % config.itemSize > 0)? true:false;

    let start_page = parseInt((config.page - 1) / config.pageSize) * config.pageSize + 1;

    console.log("config.page ::: " ,  config.page);

    let paging_end = function(all_paging_cnt, is_mod, start_page){
        switch (is_mod) {
            case true:
                all_paging_cnt++;
                break
        }
        if (all_paging_cnt < start_page + config.pageSize) {
            return all_paging_cnt
        } else {
            return start_page + config.pageSize - 1;
        }
    }(all_paging_cnt, is_mod, start_page)

    let first_arrow = document.createElement("a");
    first_arrow.setAttribute("href", "javascript:void(0);");
    first_arrow.addEventListener("click", function (){
        config.callBackFunc(1);
    });
    first_arrow.setAttribute("class", "prev_end icon-page_prevprev");
    first_arrow.innerHTML = "FIRST";
    paging_div.appendChild(first_arrow);


    if (start_page >= 1) {
        let start_arrow = document.createElement("a");
        start_arrow.setAttribute("href", "javascript:void(0);");
        start_arrow.addEventListener("click", function (){
            if(config.page == 1) {
                config.callBackFunc(1);
            }else{
                config.callBackFunc(config.page - 1);
            }
        });
        start_arrow.setAttribute("class", "prev icon-page_prev");
        start_arrow.innerText = "PREV";
        paging_div.appendChild(start_arrow);
    }

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

    if (start_page + config.pageSize - 1 <= paging_end) {
        let next_arrow = document.createElement("a");
        next_arrow.setAttribute("href", "javascript:void(0);");
        next_arrow.addEventListener("click", function (){
            config.callBackFunc(config.page + 1);
        })
        next_arrow.setAttribute("class", "prev_end icon-page_next");
        next_arrow.innerText = "NEXT";
        paging_div.appendChild(next_arrow);
    }
    let last_arrow = document.createElement("a");
    last_arrow.setAttribute("href", "javascript:void(0);");
    last_arrow.addEventListener("click", function (){
        config.callBackFunc(all_paging_cnt + 1);
    });
    last_arrow.setAttribute("class", "prev_end icon-page_nextnext");
    last_arrow.innerHTML = "END";
    paging_div.appendChild(last_arrow);
    document.getElementById(config.id).appendChild(paging_div);
}