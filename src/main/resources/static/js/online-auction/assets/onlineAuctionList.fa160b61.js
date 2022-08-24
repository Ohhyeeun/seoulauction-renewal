import{g as w,j as x,f as _,a as D,b as m,c as b,d as I,e as L,h as R,i as k,k as q,l as B,m as j,n as E,o as T,p as H,q as F,r as J,s as z,t as V}from"./bid.e759d7e2.js";function G(){let e=document.createElement("style");e.textContent=`
    .wrapper.online-auction .sticky-tab-menu { position: sticky; top: 6.36rem; z-index: 4; margin-top: 1rem; padding: 0 3rem; background-color: #fff; }
    .view-more-area { display: flex; justify-content: center; }
    @media screen and (max-width: 1023px) {
      .wrapper.online-auction .sticky-tab-menu { padding: 0; top: 3.55rem; }
    }
    
    .select2-container.select2-container--open {
      z-index: 10;
    }
  `,document.head.appendChild(e)}function X(){return new IntersectionObserver(e=>{e.forEach(o=>{var t,n;if(o.isIntersecting){const a=(t=o.target.dataset)==null?void 0:t.lotNo;a&&window.visibleLots.add(a)}else{const a=(n=o.target.dataset)==null?void 0:n.lotNo;a&&window.visibleLots.delete(a)}})},{threshold:.5})}function Y({worker:e,saleNo:o}){if(!window.usePolling||!navigator.onLine)return;const n=[...window.visibleLots].sort((a,s)=>a<s?-1:a>s?1:a===s?0:-1).join(",");e.postMessage({saleNo:o,lots:n})}function U(){const e=new Worker("/js/online-auction/list-fetcher.worker.js");return e.onmessage=o=>{o.data.length>0&&o.data.forEach(t=>{w(`data-lot-${t.lotNo}-expect-price`).innerHTML=t.expectPrice,w(`data-lot-${t.lotNo}-expect-price`).innerHTML=t.expectPrice,w(`data-lot-${t.lotNo}-start-price`).innerHTML=t.startPrice,w(`data-lot-${t.lotNo}-current-price`).innerHTML=t.currentPrice,w(`data-lot-${t.lotNo}-hammer-price`).innerHTML=t.hammerPrice,w(`data-lot-${t.lotNo}-remain-time`).innerHTML=t.remainTimeValues})},e}function W(e,o){const t=o.saleNo,n=o.lang||"ko",a=o.currency||"KRW",s=e.LOT_NO,u=e.STAT_CD==="reentry",d=JSON.parse(e.TITLE_JSON)[n],l=e.ARTIST_NAME_JSON?JSON.parse(e.ARTIST_NAME_JSON)[n]:"&nbsp;",r=JSON.parse(e.MAKE_YEAR_JSON)[n]||"&nbsp;",i=n==="en"?e.MATE_NM_EN:e.MATE_NM;let g="";e.LOT_SIZE_JSON&&(g=x(JSON.parse(e.LOT_SIZE_JSON)));let p="/images/bg/no_image.jpg";"LOT_IMG_PATH"in e&&"LOT_IMG_NAME"in e&&(p=`https://www.seoulauction.com/nas_img/${e.LOT_IMG_PATH}/${e.LOT_IMG_NAME}`);const v=JSON.parse(e.EXPE_PRICE_FROM_JSON)[a],y=JSON.parse(e.EXPE_PRICE_TO_JSON)[a],h=!v&&!y,c=e.START_PRICE||0,f=e.BID_CNT||0,C=e.LAST_PRICE>=0&&e.END_YN==="N"?_(e.LAST_PRICE):"-",N=D(e==null?void 0:e.TO_DT),M=e.LAST_PRICE>=0&&e.BID_CNT>0&&e.END_YN==="Y",P=e.LAST_PRICE;let S="";M&&(S=`<strong>${a} ${_(P)}</strong><em>(\uC751\uCC30${_(f)})</em>`);const O=e!=null&&e.isFavorite?"on":"";return u?`
      <li>
        <div class="li-inner">
          <article class="item-article">
            <div class="product_cancle-area" style="display:block;">
              <div class="area-inner">
                <i class="icon-cancle_box"></i>
                <div class="typo">
                  <div class="name"><span class="ng-binding">LOT ${s}</span></div>
                  <div class="msg"><span>\uCD9C\uD488\uC774 \uCDE8\uC18C\uB418\uC5C8\uC2B5\uB2C8\uB2E4.</span></div>
                </div>
              </div>
            </div>
          </article>
        </div>
      </li>
    `:`
    <li data-lot-no="${s}">
      <div class="li-inner">
        <article class="item-article">
          <div class="image-area">
            <figure class="img-ratio">
              <a href="/auction/online/${t}/${s}" class="img-align">
                <img src="${p}" alt="${d}">
              </a>
            </figure>
          </div>

          <div class="typo-area">
            <div class="product_info">
              <div class="num_heart-box">
                <a href="/auction/online/${t}/${s}">
                  <span class="num">${s}</span>
                </a>
                <button class="heart js-work_heart favorite-btn ${O}" data-sale-no="${t}" data-lot-no="${s}">
                  <i class="icon-heart_off"></i>
                </button>
              </div>
              <div class="info-box">
                <div class="title">
                  <a href="#">
                    <span>${l}</span>
                  </a>
                </div>
                <div class="desc">
                  <a href="#">
                    <span>${d}</span>
                  </a>
                </div>
                <div class="standard">
                  <a href="#">
                    <span style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;">${i}</span>
                  </a>
                  <div class="size_year">
                    <a href="#" style="white-space: nowrap;">
                      ${g?`<span>${g}</span>`:"&nbsp;"} 
                      ${r?`<span>${r}</span>`:""}
                    </a>
                  </div>
                </div>
              </div>
              <div class="price-box">
                <a href="#">
                  <dl class="price-list" id="data-lot-${s}-expect-price">
                    <dt>\uCD94\uC815\uAC00</dt>
                    <dd>${h?"\uBCC4\uB3C4\uBB38\uC758":a+" "+_(v)}</dd>
                    <dd>${h?"":"~ "+_(y)}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${s}-start-price">
                    <dt>\uC2DC\uC791\uAC00</dt>
                    <dd>${a} ${c>0?_(c):"-"}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${s}-current-price">
                    <dt>\uD604\uC7AC\uAC00</dt>
                    <dd>${C}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${s}-hammer-price">
                    <dt>\uB099\uCC30\uAC00</dt>
                    <dd>${S}</dd>
                  </dl>
                </a>
              </div>
              <div class="bidding-box">
                <div class="deadline_set">
                  <a href="#" id="data-lot-${s}-remain-time">
                    <span>${N?N.format:""}</span>
                  </a>
                </div>
                <div class="btn_set">
                  <a href="#" role="button" class="btn btn_point go-bid-btn" data-sale-no="${t}" data-lot-no="${s}">
                    <span>\uC751\uCC30</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </li>
  `}async function A(e){const o=m("/auction/online/{saleNo}"),t=document.getElementById("lot-list"),n=b(),a=j(),s=o==null?void 0:o.saleNo;let u=I({},(d,l,r,i)=>{if(l==="data"){if(!t)return;const g=r.map(p=>W(p,{saleNo:s,lang:n,currency:a}));e.append?t.insertAdjacentHTML("beforeend",g.join(`
`)):t.innerHTML=g.join(`
`),t.querySelectorAll("li .favorite-btn").forEach(p=>{const v=p.dataset.lotNo;L(p,"click",y=>{K(y,s,Number(v))})}),t.querySelectorAll(".go-bid-btn").forEach(p=>{const v=p.dataset.lotNo;L(p,"click",async y=>{y.preventDefault(),await R(s,v||0)})})}l==="totalCount"&&(w("lot-total-count").innerHTML=r)});u.data=e.data,u.totalCount=e.totalCount||0}async function K(e,o,t){if(e.preventDefault(),!k()){window.alert("\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4");return}const n=e.currentTarget;n.classList.contains("on")?(await q(o,t),n.classList.remove("on")):(await B(o,t),n.classList.add("on"))}function Z(e){const o=document.querySelector(".view-more-area");let t=2,n=20;return new IntersectionObserver(a=>{a.forEach(async s=>{if(s.isIntersecting){const u=m("/auction/online/{saleNo}");u.page=t,u.size=n;const{rows:d,totalCount:l}=await E(u);if(!o)return;o.style.display="none",l>t*n&&(await A({data:d,totalCount:l,append:t>1}),document.querySelectorAll("#lot-list li").forEach(i=>{e.eachCallback&&e.eachCallback(i)}),t+=1,o.style.display="block")}})})}async function Q(e=1,o=0,t=20,n=10){const a=document.querySelector(".paging"),s=Math.ceil(o/t),u=Math.ceil(s/n),d=Math.ceil(e/n),l=d*n-(n-1),r=d*n>s?s:d*n,i=(d-1)*n,g=d*n+1,p=async c=>{c.preventDefault();const f=c.currentTarget;if(f.classList.contains("disabled"))return;let C=m("/auction/online/{saleNo}");C.page=f.dataset.page||1,window.location.href=T(C)},v=Array.from({length:r-l+1}).map((c,f)=>({title:l+f,page:l+f,active:l+f===e})),h=[i>0?{title:"FIRST",page:1,active:!1}:null,d>1?{title:"PREV",page:i,active:!1}:null,...v,d<=u-1&&{title:"NEXT",page:g,active:!1},e!==s?{title:"END",page:s,active:!1}:null].filter(Boolean).map(c=>{if(!!c)return c.title==="FIRST"?'<a href="#" class="prev_end icon-page_prevprev" data-page="1">FIRST</a>':c.title==="PREV"?`<a href="#" class="prev icon-page_prev" data-page="${c.page}">PREV</a>`:c.title==="NEXT"?`<a href="#" class="next icon-page_next" data-page="${c.page}"><em>NEXT</em></a>`:c.title==="END"?`<a href="#" class="next_end icon-page_nextnext" data-page="${c.page}">END</a>`:c.active?`<a href="#" class="on"><strong>${c.page}</strong></a>`:`<a href="#" data-page="${c.page}"><em>${c.title}</em></a>`}).join(`
`);a.innerHTML=h,a.querySelectorAll("a").forEach(c=>{c.addEventListener("click",p)})}async function ee(e){const o=m("/auction/online/{saleNo}"),t=document.querySelector("#contents"),n=b(),a=JSON.parse(e.TITLE_JSON)[n],s=[window.moment(e.PREV_FROM_DT).format("MM.DD(ddd)")," ~ ",window.moment(e.PREV_TO_DT).format("MM.DD(ddd)")],u=window.moment(e.FROM_DT).format("MM.DD(ddd) HH:mm"),l=[{type:"category",title:"\uC804\uCCB4",value:"ALL"},...e.categoryList.map(i=>{const g=n==="ko"?i.CD_NM:i.CD_NM_EN;return{type:"category",title:g,value:i.CD_ID}}),...e.lotTagList.map(i=>({type:"tag",title:i.LOT_TAG,value:i.LOT_TAG}))].filter(Boolean).map(i=>i.type==="category"&&i.value==="ALL"?`
        <li class="${!(o!=null&&o.category)&&!(o!=null&&o.tag)?"active":""}">
          <a href="#" data-category-type="${i.type}" data-category-value="${i.value}">
            <span>${i.title}</span>
          </a>
        </li>
      `:`
      <li class="${i.value===o.category||i.value===o.tag?"active":""}">
        <a href="#" data-category-type="${i.type}" data-category-value="${i.value}">
          <span>${i.title}</span>
        </a>
      </li>
    `);t.querySelector("#data-sale-name").textContent=a,t.querySelector("#data-preview-date").textContent=s.join(`
`),t.querySelector("#data-to-dt").textContent=u;const r=t.querySelector("#data-sale-category");if(r.hasChildNodes()&&r.children.length>0)for(let i=0;i<r.children.length;i++)r.removeChild(r.children[i]);r.insertAdjacentHTML("beforeend",l.join(`
`)),t.querySelectorAll(".sticky-tab-menu .tab-list li a").forEach(i=>{L(i,"click",te)})}async function te(e){e.preventDefault();const o=e.currentTarget,{categoryType:t,categoryValue:n}=o.dataset,a=m("/auction/online/{saleNo}");a.page=1,t==="category"&&n==="ALL"?(a.category="",a.tag=""):t==="category"?(a.category=n,a.tag=""):t==="tag"&&(a.category="",a.tag=n),window.location.href=T(a)}async function oe(){window.visibleLots=new Set,window.usePolling=!0,await ne(),document.addEventListener("visibilitychange",()=>{window.usePolling=document.visibilityState==="visible"}),$("#sort-order").select2({minimumResultsForSearch:-1}).on("select2:select",e=>{const o=e.target.value;let t=m("/auction/online/{saleNo}");t.page=1,t.sort=o,window.location.href=T(t)}),$("#view-type").select2({minimumResultsForSearch:-1}).on("select2:select",e=>{const o=e.target.value;window.viewType=o,window.location.href=T({view:o})}),L(document.querySelector(".js-dropdown-btn"),"click",async e=>{e.preventDefault(),e.stopPropagation();const o=e.currentTarget;await H(o)}),L(document.querySelector(".js-lotbox-btn"),"click",async e=>{e.preventDefault();const o=await F({selector:"#online-auction-list-popup",onCloseSelector:".fixed-panel",beforeClose:async t=>{var n;(n=t.querySelector(".allview_fixed-wrap.lot"))==null||n.classList.remove("active")}});!o||(await o.init(),await J(),await o.open(async t=>{var n;(n=t.querySelector(".allview_fixed-wrap.lot"))==null||n.classList.add("active")}),L(o.root.querySelector(".js-fixed_total"),"click",()=>{o.close(null)}))}),window.addEventListener("click",e=>{const o=e.target,t=document.querySelector(".js-dropdown-btn");if(t&&!o.closest(".trp-dropdown_list-box")){t.classList.remove("active");const n=document.querySelector(".trp-dropdown_list-box");n&&(n.style.display="none");const a=document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]');a&&(a.value="")}})}async function ne(){const e=m("/auction/online/{saleNo}"),{saleNo:o}=e;if(!e)return;if($("#sort-order").val((e==null?void 0:e.sort)||"LOTAS").select2(),(e==null?void 0:e.view)==="more"){$("#view-type").val("more").select2();const r=document.querySelector(".paging-area");r&&(r.style.display="none");const i=document.querySelector(".view-more-area");i&&(i.style.display="flex")}else{$("#view-type").val("page").select2();const r=document.querySelector(".paging-area");r&&(r.style.display="block");const i=document.querySelector(".view-more-area");i&&(i.style.display="none")}const t=await z(o);t!=null&&t.CURR_CD&&V(t.CURR_CD);const{totalCount:n,rows:a}=await E(e,!0);await Promise.all([ee(t),A({data:a,totalCount:n,append:!1}),Q(e==null?void 0:e.page,n,e==null?void 0:e.size)]);const s=U(),u=X();document.getElementById("lot-list").querySelectorAll("li").forEach(r=>{u.observe(r)}),setInterval(()=>Y({worker:s,saleNo:o}),1e3);const d=Z({eachCallback:r=>{u.observe(r)}}),l=document.querySelector(".view-more-area");!(e!=null&&e.view)||(e==null?void 0:e.view)==="page"?l&&d.unobserve(l):l&&d.observe(l)}window.addEventListener("DOMContentLoaded",G);window.onload=oe;
