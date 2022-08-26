import{g as y,j as D,f as C,a as I,b as m,c as A,d as k,e as L,h as R,i as B,k as j,l as H,m as F,q as d,n as S,o as J,p as q,r as b,s as z,t as V,u as G,v as X,w as Y,x as U}from"./bid.18b14d53.js";function W(){let e=document.createElement("style");e.textContent=`
    .wrapper.online-auction .sticky-tab-menu { position: sticky; top: 6.36rem; z-index: 4; margin-top: 1rem; padding: 0 3rem; background-color: #fff; }
    .view-more-area { display: flex; justify-content: center; }
    @media screen and (max-width: 1023px) {
      .wrapper.online-auction .sticky-tab-menu { padding: 0; top: 3.55rem; }
    }
    
    .select2-container.select2-container--open {
      z-index: 10;
    }

    .swal2-styled.swal2-confirm {
      background-color: #21a099;
      border-radius: 2px;
      font-size: 14px;
    }
    .swal2-styled.swal2-confirm:focus {
      box-shadow: 0 0 1px 2px rgba(33, 160, 153, 0.2) !important;
    }
  `,document.head.appendChild(e),document.head.insertAdjacentHTML("beforeend",'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />')}function K(){return new IntersectionObserver(e=>{e.forEach(a=>{var t,n;if(a.isIntersecting){const o=(t=a.target.dataset)==null?void 0:t.lotNo;o&&window.visibleLots.add(o)}else{const o=(n=a.target.dataset)==null?void 0:n.lotNo;o&&window.visibleLots.delete(o)}})},{threshold:.5})}function Z({worker:e,saleNo:a}){if(!window.usePolling||!navigator.onLine)return;const n=[...window.visibleLots].sort((o,s)=>o<s?-1:o>s?1:o===s?0:-1).join(",");e.postMessage({saleNo:a,lots:n})}function Q(){const e=new Worker("/js/worker/list-fetcher.js");return e.onmessage=a=>{a.data.length>0&&a.data.forEach(t=>{y(`data-lot-${t.lotNo}-expect-price`).innerHTML=t.expectPrice,y(`data-lot-${t.lotNo}-expect-price`).innerHTML=t.expectPrice,y(`data-lot-${t.lotNo}-start-price`).innerHTML=t.startPrice,y(`data-lot-${t.lotNo}-current-price`).innerHTML=t.currentPrice,y(`data-lot-${t.lotNo}-hammer-price`).innerHTML=t.hammerPrice,y(`data-lot-${t.lotNo}-remain-time`).innerHTML=t.remainTimeValues})},e}function ee(e,a){const t=a.saleNo,n=a.lang||"ko",o=a.currency||"KRW",s=e.LOT_NO,l=e.STAT_CD==="reentry",g=JSON.parse(e.TITLE_JSON)[n],c=e.ARTIST_NAME_JSON?JSON.parse(e.ARTIST_NAME_JSON)[n]:"&nbsp;",r=JSON.parse(e.MAKE_YEAR_JSON)[n]||"&nbsp;",i=n==="en"?e.MATE_NM_EN:e.MATE_NM;let v="";e.LOT_SIZE_JSON&&(v=D(JSON.parse(e.LOT_SIZE_JSON)));let u="/images/bg/no_image.jpg";"LOT_IMG_PATH"in e&&"LOT_IMG_NAME"in e&&(u=`https://www.seoulauction.com/nas_img/${e.LOT_IMG_PATH}/${e.LOT_IMG_NAME}`);const f=JSON.parse(e.EXPE_PRICE_FROM_JSON)[o],w=JSON.parse(e.EXPE_PRICE_TO_JSON)[o],_=!f&&!w,p=e.START_PRICE||0,h=e.BID_CNT||0,M=e.LAST_PRICE>=0&&e.END_YN==="N"?C(e.LAST_PRICE):"-",N=I(e==null?void 0:e.TO_DT),T=e.LAST_PRICE>=0&&e.BID_CNT>0&&e.END_YN==="Y",O=e.LAST_PRICE;let E="";T&&(E=`<strong>${o} ${C(O)}</strong><em>(\uC751\uCC30${C(h)})</em>`);const P=e!=null&&e.isFavorite?"on":"";return l?`
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
                <img src="${u}" alt="${g}">
              </a>
            </figure>
          </div>

          <div class="typo-area">
            <div class="product_info">
              <div class="num_heart-box">
                <a href="/auction/online/${t}/${s}">
                  <span class="num">${s}</span>
                </a>
                <button class="heart js-work_heart favorite-btn ${P}" data-sale-no="${t}" data-lot-no="${s}">
                  <i class="icon-heart_off"></i>
                </button>
              </div>
              <div class="info-box">
                <div class="title">
                  <a href="#">
                    <span>${c}</span>
                  </a>
                </div>
                <div class="desc">
                  <a href="#">
                    <span>${g}</span>
                  </a>
                </div>
                <div class="standard">
                  <a href="#">
                    <span style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;">${i}</span>
                  </a>
                  <div class="size_year">
                    <a href="#" style="white-space: nowrap;">
                      ${v?`<span>${v}</span>`:"&nbsp;"} 
                      ${r?`<span>${r}</span>`:""}
                    </a>
                  </div>
                </div>
              </div>
              <div class="price-box">
                <a href="#">
                  <dl class="price-list" id="data-lot-${s}-expect-price">
                    <dt>\uCD94\uC815\uAC00</dt>
                    <dd>${_?"\uBCC4\uB3C4\uBB38\uC758":o+" "+C(f)}</dd>
                    <dd>${_?"":"~ "+C(w)}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${s}-start-price">
                    <dt>\uC2DC\uC791\uAC00</dt>
                    <dd>${o} ${p>0?C(p):"-"}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${s}-current-price" style="display: ${T?"none":"block"};">
                    <dt>\uD604\uC7AC\uAC00</dt>
                    <dd>${M}</dd>
                  </dl>
                  <dl class="price-list" id="data-lot-${s}-hammer-price" style="display: ${T?"block":"none"};">
                    <dt>\uB099\uCC30\uAC00</dt>
                    <dd>${E}</dd>
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
  `}async function x(e){const a=m("/auction/online/{saleNo}"),t=y("lot-list"),n=A(),o=F(),s=a==null?void 0:a.saleNo;let l=k({},(g,c,r,i)=>{if(c==="data"){if(!t)return;const v=r.map(u=>ee(u,{saleNo:s,lang:n,currency:o}));e.append?t.insertAdjacentHTML("beforeend",v.join(`
`)):t.innerHTML=v.join(`
`),t.querySelectorAll("li .favorite-btn").forEach(u=>{const f=u.dataset.lotNo;L(u,"click",w=>{te(w,s,Number(f))})}),t.querySelectorAll(".go-bid-btn").forEach(u=>{const f=u.dataset.lotNo;L(u,"click",async w=>{w.preventDefault(),await R(s,f||0)})})}c==="totalCount"&&(y("lot-total-count").innerHTML=r)});l.data=e.data,l.totalCount=e.totalCount||0}async function te(e,a,t){if(e.preventDefault(),!B()){window.alert("\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4");return}const n=e.currentTarget;n.classList.contains("on")?(await j(a,t),n.classList.remove("on")):(await H(a,t),n.classList.add("on"))}function ae(e){const a=d(".view-more-area");let t=2,n=20;return new IntersectionObserver(o=>{o.forEach(async s=>{if(s.isIntersecting){const l=m("/auction/online/{saleNo}");l.page=t,l.size=n;const{rows:g,totalCount:c}=await S(l);if(!a)return;a.style.display="none",c>t*n&&(await x({data:g,totalCount:c,append:t>1}),J("#lot-list li").forEach(i=>{e.eachCallback&&e.eachCallback(i)}),t+=1,a.style.display="block")}})})}async function ne(e=1,a=0,t=20,n=10){var _;if(a<=t)return;const o=Math.ceil(a/t),s=Math.ceil(e/n),l=s*n-(n-1),g=s*n>o?o:s*n,c=(s-1)*n,r=s*n+1,i=Array.from({length:g-l+1}).map((p,h)=>({title:`${l+h}`,page:l+h,active:l+h===Number(e),disabled:!1})),u=[{title:"FIRST",page:1,active:!1,disabled:c<1||s===1},{title:"PREV",page:c,active:!1,disabled:c<1},...i,{title:"NEXT",page:r,active:!1,disabled:r>o},{title:"END",page:o,active:!1,disabled:r>o||o<n}].map(p=>{if(!p.disabled)return p.title==="FIRST"?'<a href="#" class="prev_end icon-page_prevprev" data-page="1">FIRST</a>':p.title==="PREV"?`<a href="#" class="prev icon-page_prev" data-page="${p.page}">PREV</a>`:p.title==="NEXT"?`<a href="#" class="next icon-page_next" data-page="${p.page}"><em>NEXT</em></a>`:p.title==="END"?`<a href="#" class="next_end icon-page_nextnext" data-page="${p.page}">END</a>`:p.active?`<a href="#" class="on"><strong>${p.page}</strong></a>`:`<a href="#" data-page="${p.page}"><em>${p.title}</em></a>`}).join(`
`),f=document.createElement("div");f.classList.add("paging"),f.insertAdjacentHTML("beforeend",u);const w=d(".paging-area");(_=w.querySelector(".paging"))==null||_.remove(),w.appendChild(f),q(".paging-area a[data-page]","click",oe)}async function oe(e){e.preventDefault();const a=e.currentTarget;if(a.classList.contains("disabled"))return;let t=m("/auction/online/{saleNo}");t.page=a.dataset.page||1,window.location.href=b(t)}async function se(e){const a=m("/auction/online/{saleNo}"),t=A(),n=d("#contents"),o=JSON.parse(e.TITLE_JSON)[t],s=[window.moment(e.PREV_FROM_DT).format("MM.DD(ddd)")," ~ ",window.moment(e.PREV_TO_DT).format("MM.DD(ddd)")],l=window.moment(e.FROM_DT).format("MM.DD(ddd) HH:mm"),c=[{type:"category",title:"\uC804\uCCB4",value:"ALL"},...e.categoryList.map(i=>{const v=t==="ko"?i.CD_NM:i.CD_NM_EN;return{type:"category",title:v,value:i.CD_ID}}),...e.lotTagList.map(i=>({type:"tag",title:i.LOT_TAG,value:i.LOT_TAG}))].filter(Boolean).map(i=>i.type==="category"&&i.value==="ALL"?`
        <li class="${!(a!=null&&a.category)&&!(a!=null&&a.tag)?"active":""}">
          <a href="#" data-category-type="${i.type}" data-category-value="${i.value}">
            <span>${i.title}</span>
          </a>
        </li>
      `:`
      <li class="${i.value===a.category||i.value===a.tag?"active":""}">
        <a href="#" data-category-type="${i.type}" data-category-value="${i.value}">
          <span>${i.title}</span>
        </a>
      </li>
    `);d("#data-sale-name",n).textContent=o,d("#data-preview-date",n).textContent=s.join(`
`),d("#data-to-dt",n).textContent=l;const r=d("#data-sale-category",n);if(r.hasChildNodes()&&r.children.length>0)for(let i=0;i<r.children.length;i++)r.removeChild(r.children[i]);r.insertAdjacentHTML("beforeend",c.join(`
`)),n.querySelectorAll(".sticky-tab-menu .tab-list li a").forEach(i=>{L(i,"click",ie)})}async function ie(e){e.preventDefault();const a=e.currentTarget,{categoryType:t,categoryValue:n}=a.dataset,o=m("/auction/online/{saleNo}");o.page=1,t==="category"&&n==="ALL"?(o.category="",o.tag=""):t==="category"?(o.category=n,o.tag=""):t==="tag"&&(o.category="",o.tag=n),window.location.href=b(o)}async function re(){window.visibleLots=new Set,window.usePolling=!0,await le(),document.addEventListener("visibilitychange",()=>{window.usePolling=document.visibilityState==="visible"}),$("#sort-order").select2({minimumResultsForSearch:-1}).on("select2:select",e=>{const a=e.target.value;let t=m("/auction/online/{saleNo}");t.page=1,t.sort=a,window.location.href=b(t)}),$("#view-type").select2({minimumResultsForSearch:-1}).on("select2:select",e=>{const a=e.target.value;window.viewType=a,window.location.href=b({view:a})}),L(d(".js-dropdown-btn"),"click",async e=>{e.preventDefault(),e.stopPropagation();const a=e.currentTarget;await z(a)}),L(d(".js-lotbox-btn"),"click",async e=>{e.preventDefault();const a=await V({selector:"#online-auction-list-popup",onCloseSelector:".fixed-panel",beforeClose:async t=>{var n;(n=t.querySelector(".allview_fixed-wrap.lot"))==null||n.classList.remove("active")}});!a||(await a.init(),await G(),await a.open(async t=>{var n;(n=t.querySelector(".allview_fixed-wrap.lot"))==null||n.classList.add("active")}),L(d(".js-fixed_total",a.root),"click",()=>{a.close(null)}))}),window.addEventListener("click",e=>{const a=e.target,t=d(".js-dropdown-btn");if(t&&!a.closest(".trp-dropdown_list-box")){t.classList.remove("active");const n=d(".trp-dropdown_list-box");n&&(n.style.display="none");const o=d('.trp-dropdown_list-box .search-box input[type="search"]');o&&(o.value="")}})}async function le(){const e=m("/auction/online/{saleNo}"),{saleNo:a}=e;if(!e.saleNo){await X({html:"<div>\uC811\uADFC\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4</div>"});return}$("#sort-order").val((e==null?void 0:e.sort)||"LOTAS").select2(),(e==null?void 0:e.view)==="more"?($("#view-type").val("more").select2(),d(".paging-area").style.display="none",d(".view-more-area").style.display="flex"):($("#view-type").val("page").select2(),d(".paging-area").style.display="block",d(".view-more-area").style.display="none");const t=await Y(a);t!=null&&t.CURR_CD&&U(t.CURR_CD);const{totalCount:n,rows:o}=await S(e,!0);await Promise.all([se(t),x({data:o,totalCount:n,append:!1}),ne(e==null?void 0:e.page,n,e==null?void 0:e.size)]);const s=Q(),l=K();document.getElementById("lot-list").querySelectorAll("li").forEach(r=>{l.observe(r)}),setInterval(()=>Z({worker:s,saleNo:a}),1e3);const g=ae({eachCallback:r=>{l.observe(r)}}),c=document.querySelector(".view-more-area");!(e!=null&&e.view)||(e==null?void 0:e.view)==="page"?c&&g.unobserve(c):c&&g.observe(c)}window.addEventListener("DOMContentLoaded",W);window.onload=re;
