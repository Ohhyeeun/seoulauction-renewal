(function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const i of document.querySelectorAll('link[rel="modulepreload"]'))n(i);new MutationObserver(i=>{for(const r of i)if(r.type==="childList")for(const s of r.addedNodes)s.tagName==="LINK"&&s.rel==="modulepreload"&&n(s)}).observe(document,{childList:!0,subtree:!0});function o(i){const r={};return i.integrity&&(r.integrity=i.integrity),i.referrerpolicy&&(r.referrerPolicy=i.referrerpolicy),i.crossorigin==="use-credentials"?r.credentials="include":i.crossorigin==="anonymous"?r.credentials="omit":r.credentials="same-origin",r}function n(i){if(i.ep)return;i.ep=!0;const r=o(i);fetch(i.href,r)}})();async function q(e,t){try{const{data:o}=await window.axios.get(`/api/auction/online/sales/${e}/lots/${Number(t)}`),{success:n,data:i}=o;if(!n)throw new Error("Error");return i}catch{return null}}async function R(e,t=!1){const o={totalCount:0,rows:[]};if(!e.saleNo)return o;try{let n={page:e.page||1,size:e.size||20,sortBy:e.sort||"LOTAS"};"search"in e&&(n.searchText=e.search),e.category&&(n.cateCd=e.category),n.cateCd==="ALL"&&delete n.cateCd,e.tag&&(n.lotTag=encodeURI(e.tag),delete n.cateCd),e.lotList&&(n.lotList=encodeURI(e.lotList.join(",")));const i=window.Qs.stringify(n),r=`/api/auction/online/sales/${e.saleNo}/lots?${i}`,{data:s}=await window.axios.get(r);if(!s.success)throw new Error(s.data);const{cnt:a,list:u}=s.data;if(!t||a===0)return{totalCount:a,rows:u};let c=[...u];const{data:p}=await window.axios.get(`/api/auction/online/cust-inte-lot/sales/${e.saleNo}`);if(!p.success)throw new Error(p.data);const y=p.data;return y.length>0&&y.forEach(w=>{const{LOT_NO:L,INTE_LOT:b}=w,C=c.findIndex(h=>h.LOT_NO===L&&b==="Y");C>-1&&(c[C].isFavorite=!0)}),{totalCount:a,rows:c}}catch(n){return console.log(n),o}}async function de(e){try{const{data:t}=await window.axios.get(`/api/auction/online/sales/${e}`);return t.success?t.data:null}catch(t){return console.log(t),null}}async function fe(e){try{const{data:t}=await window.axios.get(`/api/auction/online/artists/${e}`),{success:o,data:n}=t;if(!o)throw new Error("Error");return n||null}catch{return null}}function S(){return document.documentElement.lang||"ko"}function T(e){return[{grow:5e4,from:0,to:1e6},{grow:1e5,from:1e6,to:3e6},{grow:2e5,from:3e6,to:5e6},{grow:3e5,from:5e6,to:1e7},{grow:5e5,from:1e7,to:3e7},{grow:1e6,from:3e7,to:5e7},{grow:2e6,from:5e7,to:1e8},{grow:3e6,from:1e8,to:2e8},{grow:5e6,from:2e8,to:1/0}].reduce((n,i)=>(i.from<=e&&e<i.to&&(n=i.grow),n),0)}function ye(){return Boolean(window.sessionStorage.getItem("is_login"))||!1}function we(e){const{page:t,size:o,search:n,sort:i,tag:r,category:s,view:a}=e,u=window.location.pathname;let c=window.Qs.parse(window.location.search,{ignoreQueryPrefix:!0});return t!==1?c.page=t:delete c.page,o!==20?c.size=o:delete c.size,n?c.search=n:delete c.search,i?c.sort=i:delete c.sort,r?c.tag=r:delete c.tag,s?c.category=s:delete c.category,a&&a==="more"?c.view="more":delete c.view,Object.keys(c).length<1?u:`${u}?${window.Qs.stringify(c)}`}function k(e){let t="",o="";const n=e[0];return n===void 0?n:(o=n.SIZE1!=0?parseFloat(n.SIZE1).toFixed(1):"",o+=n.SIZE2!=0?"\u2613"+parseFloat(n.SIZE2).toFixed(1):"",o+=n.SIZE3!=0?"\u2613"+parseFloat(n.SIZE3).toFixed(1)+"("+(n.MIX_CD=="depth"?"d":"h")+")":"",o+=o!=""?n.UNIT_CD:"",o+=o!=""&&n.CANVAS!=0?" ("+(n.CANVAS_EXT_YN=="Y"?"\uBCC0\uD615":"")+n.CANVAS+")":"",t=n.PREFIX,t+=(n.DIAMETER_YN=="Y"?"\u03A6 ":"")+o,t+=n.SUFFIX?" ("+n.SUFFIX+") ":"",t)}function _(e=1e3){return new Promise(t=>setTimeout(t,e))}function F(e=8,t="abcdefghijklmnopqrstuvwxyz0123456789"){return Array.from({length:e}).map(o=>t.charAt(~~(Math.random()*t.length))).join("")}function j(e,t=100){let o;return function(...n){clearTimeout(o),o=setTimeout(()=>{e(n)},t)}}function M(e=""){const t=window.location.pathname,o=window.Qs.parse(window.location.search,{ignoreQueryPrefix:!0});let n={};if(e){const i=t.split("/").filter(Boolean);e.split("/").filter(Boolean).forEach((s,a)=>{if(s.match(/{(.+)}/g)){const u=s.replace(/{(.+)}/g,"$1");i[a]&&(n[u]=i[a])}})}return{...n,...o}}function d(e,t,o){let n;typeof e=="string"?n=document.querySelector(e):n=e,n&&t&&n.getAttribute("listener")!=="true"&&(n.setAttribute("listener","true"),n.addEventListener(t,o))}function me(e={},t,o){return new Proxy(e,{set(n,i,r,s){return t&&t(n,i,r,s),Reflect.set(n,i,r,s)},get(n,i,r){return o&&o(n,i,r),Reflect.get(n,i,r)}})}let v="KRW";function ge(){return v}function be(e){v=e}async function Ce(){let e=M("/auction/online/{saleNo}");e.size=500}async function he(e){const t=document.querySelector(".trp-dropdown_list-box");e.classList.contains("active")?(e.classList.remove("active"),t.style.display="none",document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]').value=""):(await H(),e.classList.add("active"),t.style.display="block",d(document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]'),"keyup",j(o=>{const n=o.target,i=o.target.value.replace(/[^\d]/g,"");if(n.value=i,!i){t.querySelectorAll("li[data-lot-no]").forEach(r=>{r.style.display="block"});return}t.querySelectorAll("li[data-lot-no]").forEach(r=>{const s=r;s.dataset.lotNo===i?s.style.display="block":s.style.display="none"})},300)))}async function H(){const e=S();let t=M("/auction/online/{saleNo}");t.size=500;const{rows:o}=await R(t,!1);if(o.length>0){const n=o.map(i=>{const r=JSON.parse(i.TITLE_JSON)[e];let s="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in i&&"LOT_IMG_NAME"in i&&(s=`https://www.seoulauction.com/nas_img/${i.LOT_IMG_PATH}/${i.LOT_IMG_NAME}`),Y({saleNo:t==null?void 0:t.saleNo,lotNo:i.LOT_NO,imagePath:s,title:r})});document.querySelector(".trp-dropdown_list-box .list-box").innerHTML=n.join(`
`)}}function Y(e){return`
    <li data-lot-no="${e.lotNo}">
      <a href="/auction/online/${e.saleNo}/${e.lotNo}">
        <div class="image-area">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${e.imagePath}" alt="${e.title}">
            </div>
          </figure>
        </div>
        <div class="typo-area">
          <span>LOT ${e.lotNo}</span>
        </div>
      </a>
    </li>
  `}function l(e,t){return t?t.querySelector(e):document.querySelector(e)}function x(e){return document.getElementById(e)}async function E({selector:e,useBackdrop:t=!0,useBodyFix:o=!0,useDelay:n=150,onCloseSelector:i=null,beforeClose:r}){const s=l(e);if(!s)return null;const a="custom-template-modal",u=`${a}-${F(6)}`,c=document.importNode(s.content,!0);let p,y;if(t){const f=document.createElement("div");f.classList.add(u),f.appendChild(c),p=f;const N=document.createElement("style");N.textContent=`
      .${u} {
        background: rgba(0, 0, 0, 0.7);
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0;
        transition: all 120ms;
        
        display: none;
        opacity: 0;
      }
      .${u}.open {
        display: block;
        opacity: 1;
        z-index: 5;
      }
    `,y=N}else p=c,y=null;const w=p,L=async()=>{y&&await document.head.appendChild(y),await document.body.appendChild(p)},b=async()=>{await document.body.removeChild(p),y&&await document.head.removeChild(y)},C=async f=>{o&&(document.body.style.overflow="hidden",document.body.style.touchAction="none"),n&&await _(n),w.classList.add("open"),f&&await f(w)},h=async f=>{r&&await r(w),f&&await f(w),n&&await _(n),o&&document.querySelectorAll(`div[class^="${a}-"].open`).length<2&&(document.body.style.overflow="auto",document.body.style.touchAction="auto"),w.classList.remove("open"),await b()};return p.addEventListener("click",async f=>{if(f.preventDefault(),!i)return;f.target.closest(i)||await h(null)}),{root:w,init:L,destroy:b,open:C,close:h}}async function Ne(e){try{const{data:t}=await window.axios.get(`/api/auction/online/cust-inte-lot/sales/${e}`);return t.success?t.data:[]}catch(t){return console.log(t),[]}}async function _e(e,t){try{const{data:o}=await window.axios.post(`/api/auction/online/cust-inte-lot/sales/${e}/lots/${t}`,{});return o.success?o.data:null}catch(o){return console.log(o),null}}async function Ee(e,t){try{const{data:o}=await window.axios.delete(`/api/auction/online/cust-inte-lot/sales/${e}/lots/${t}`);return o.success?o.data:null}catch(o){return console.log(o),null}}async function O(){try{const{data:e}=await window.axios.get("/api/auction/online/me"),{success:t,data:o}=e;if(!t)throw new Error("Error");return o}catch{return null}}async function G(e){try{const{data:t}=await window.axios.get(`/api/auction/online/sale-cert/sales/${e}`),{success:o,data:n}=t;if(!o)throw new Error("Error");return n||null}catch{return null}}async function z(){try{const{data:e}=await window.axios.get("/api/auction/online/manager"),{success:t,data:o}=e;if(!t)throw new Error("Error");return o||null}catch{return null}}async function J(e,t,o=1,n=20){const i={totalCount:0,rows:[]};try{const{data:r}=await window.axios.get(`/api/auction/online/bid/sales/${e}/lots/${t}?page=${o}&size=${n}`);return r.success?{totalCount:r.data.cnt,rows:r.data.list}:i}catch(r){return console.log(r),i}}async function U(e,t){try{const{data:o}=await window.axios.get(`/api/auction/online/last-auto-bid-req/sales/${e}/lots/${t}`),{success:n,data:i}=o;if(!n)throw new Error("Error");return i||null}catch{return null}}async function K({saleNo:e,lotNo:t,custNo:o,price:n}){try{const{data:i}=await window.axios.post(`/api/auction/online/bid-auto/sales/${e}/lots/${t}`,{bid_price:Number(n),cust_no:o}),{success:r}=i;return r}catch{return null}}async function V({saleNo:e,lotNo:t,custNo:o,reqNo:n}){try{const{data:i}=await window.axios.delete(`/api/auction/online/bid-auto/sales/${e}/lots/${t}`,{data:{req_no:n,cust_no:o}}),{success:r}=i;return r}catch{return null}}async function Z({saleNo:e,lotNo:t,custNo:o,price:n}){try{const{data:i}=await window.axios.post(`/api/auction/online/bid/sales/${e}/lots/${t}`,{bid_price:Number(n),cust_no:o}),{success:r}=i;return r}catch(i){return console.log(i),!1}}function m(e,t){if(typeof e=="string"&&(e=Number(e)),t){const o=10**t;return new Intl.NumberFormat().format(Math.floor(e*o)/o)}return new Intl.NumberFormat().format(e)}function Le(e,t=0){const o=10**t;return Math.floor(e*o)/o}function A(e,t=2){return String(e).padStart(t,"0")}function Q(e){let r;e instanceof Date?r=e.getTime():typeof e=="string"?r=new Date(e).getTime():r=e;const s=r-Date.now();let a={isAfter:s>=0,day:Math.floor(s/864e5),hour:Math.floor(s%864e5/36e5),minute:Math.floor(s%36e5/6e4),second:Math.floor(s%6e4/1e3),format:""};return a.format="",a.isAfter&&(a.day>0&&(a.format+=`${a.day}\uC77C `),a.format+=[A(a.hour),A(a.minute),A(a.second)].join(":")),a}function B(e){const t=(e==null?void 0:e.CURR_CD)||"KRW",o=JSON.parse(e.EXPE_PRICE_FROM_JSON)[t]||0,n=e.START_PRICE||0,i=e.LAST_PRICE;let r=0;i!=null?r=i:n&&n>0?r=n:o&&o>0&&(r=o);const s=r*10;let a=T(s)+s;return{currency:t,minPrice:r,limitPrice:s,maxPrice:a}}async function W(e){await Z({saleNo:e.saleNo,lotNo:e.lotNo,custNo:e.custNo,price:Number(e.price)})?window.alert("\uC131\uACF5"):window.alert("\uC2E4\uD328"),await g(e.saleNo,e.lotNo)}async function X(e){if(e.type==="bid"){const t=await ee();if(!t)return;const o=t.root.querySelector(".confirm-btn");let n=!1;d(o,"click",async i=>{if(i.preventDefault(),n)return;n=!0,await _(300),await K({saleNo:e.saleNo,lotNo:e.lotNo,custNo:e.custNo,price:Number(e.price)})&&window.alert("\uC790\uB3D9\uC751\uCC30 \uC644\uB8CC"),await t.close(null),await g(e.saleNo,e.lotNo)})}if(e.type==="stop"){const t=await te();if(!t)return;const o=t.root.querySelector(".confirm-btn");let n=!1;d(o,"click",async i=>{i.preventDefault(),!n&&(n=!0,await _(300),console.log(e),e.reqNo&&(await V({saleNo:e.saleNo,lotNo:e.lotNo,custNo:e.custNo,reqNo:e.reqNo})&&window.alert("\uC790\uB3D9\uC751\uCC30 \uCDE8\uC18C \uC644\uB8CC"),await t.close(null),await g(e.saleNo,e.lotNo)))})}}async function ee(){const e=await E({selector:"#go-auto-bid-popup",onCloseSelector:".popup-layer",beforeClose:t=>{t.querySelector(".trp.popupfixed-wrap").style.display="none"}});if(!!e)return await e.init(),await e.open(t=>{t.querySelector(".trp.popupfixed-wrap").style.display="block"}),d(e.root.querySelector(".js-closepop"),"click",async t=>{t.preventDefault(),await e.close(null)}),d(e.root.querySelector(".cancel-btn"),"click",async t=>{t.preventDefault(),await e.close(null)}),e}async function te(){const e=await E({selector:"#stop-auto-bid-popup",onCloseSelector:".popup-layer",beforeClose:t=>{t.querySelector(".trp.popupfixed-wrap").style.display="none"}});if(!!e)return await e.init(),await e.open(t=>{t.querySelector(".trp.popupfixed-wrap").style.display="block"}),d(e.root.querySelector(".js-closepop"),"click",async t=>{t.preventDefault(),await e.close(null)}),d(e.root.querySelector(".cancel-btn"),"click",async t=>{t.preventDefault(),await e.close(null)}),e}async function D(e,t){window.usePolling=!0;const o=await E({selector:"#online-bid-popup",onCloseSelector:".popup-layer",beforeClose:n=>{l(".trp.popupfixed-wrap",n).style.display="none"}});!o||(await o.init(),await ue(e,t),await o.open(n=>{n.querySelector(".trp.popupfixed-wrap").style.display="block"}),d(o.root.querySelector(".js-closepop"),"click",async n=>{n.preventDefault(),await o.close(null)}))}async function Ae(e,t){if(!(await O()).IS_LOGIN){window.alert("\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4");return}if((await G(e)).CNT<1){await oe(e,t);return}await D(e,t)}async function oe(e,t){const o=await E({selector:"#online-auth-phone-popup",onCloseSelector:".popup-layer",beforeClose:s=>{s.querySelector(".online_confirm-popup").style.display="none"}});if(!o)return;const n=S(),i=await z();if(!i)return;const r=n==="ko"?i.EMP_NAME:i.EMP_NAME_EN;o.root.querySelector("#data-manager-contact").textContent=`${r} ${i.TEL}`,await o.init(),await o.open(s=>{s.querySelector(".online_confirm-popup").style.display="block"}),d(o.root.querySelector(".btn_close"),"click",s=>{s.preventDefault(),o.close(null)}),d(o.root.querySelector(".close-auth-modal-btn"),"click",s=>{s.preventDefault(),o.close(null)}),d(o.root.querySelector(".confirm-auth-modal-btn"),"click",async s=>{s.preventDefault(),await o.close(null),await D(e,t)}),d(o.root.querySelector("#checkbox_all"),"change",s=>{console.log(s.target)}),$(".js-accordion_policy").trpAccordionMenu(".acc_btn",".con-area","on")}async function g(e,t){const o=await q(e,t),n=await U(e,t),{rows:i}=await J(e,t);return await ae(o),await le(i),await se(o),await re(n),await ie(o),{lotData:o,lastAutoBid:n,bidListData:i}}function ne(e){const t=Q(e),o=document.querySelector(".bid-lot-remain-times");o&&(o.innerHTML=`\uB0A8\uC740\uC2DC\uAC04: ${t.format}`)}function P(e){const{currency:t,minPrice:o,limitPrice:n,maxPrice:i}=B(e);let r=[],s=o,a=0;for(r.push(s);s<=i;)a=T(s),s=s+a,r.push(s);return r=r.filter(c=>c<=n),r.map(c=>`
    <option value="${c}">${t} ${m(c)}</option>
  `).join(`
`)}async function ie(e){const{currency:t,minPrice:o}=B(e),n=T(o),i=o,r=o+n,s=e.LAST_PRICE?r:i,a=x("bid-once-btn-price");a.dataset.price=s+"",a.innerHTML=`${t} ${m(s)}`}async function re(e){const t=x("bid-auto-btn");e?(t.dataset.dataType="stop",t.innerHTML="<span>\uC790\uB3D9\uC751\uCC30 \uC911\uC9C0</span>"):(t.dataset.dataType="bid",t.innerHTML="<span>\uC751\uCC30 \uD558\uAE30</span>")}function I(e){var t,o,n,i;e==="once"&&(l('[data-bid-type-value="once"] .btn').className="btn btn_lg btn_default",l('[data-bid-type-value="auto"] .btn').className="btn btn_lg btn_gray",(t=l(".bid-type-once"))==null||t.classList.add("active"),(o=l(".bid-type-auto"))==null||o.classList.remove("active")),e==="auto"&&(l('[data-bid-type-value="once"] .btn').className="btn btn_lg btn_gray",l('[data-bid-type-value="auto"] .btn').className="btn btn_lg btn_default",(n=l(".bid-type-once"))==null||n.classList.remove("active"),(i=l(".bid-type-auto"))==null||i.classList.add("active"))}async function se(e){e.END_YN==="Y"?(l(".bid-end").style.display="flex",l(".bid-ongoing").style.display="none"):(l(".bid-end").style.display="none",l(".bid-ongoing").style.display="block")}async function ae(e){const t=S(),o=e.LOT_NO,n=e.TITLE_JSON?JSON.parse(e.TITLE_JSON)[t]:" ",i=e.ARTIST_NAME_JSON?JSON.parse(e.ARTIST_NAME_JSON)[t]:"&nbsp;",r=e.BORN_YEAR,s=t==="en"?e.MATE_NM_EN:e.MATE_NM;let a="";e.LOT_SIZE_JSON&&(a=k(JSON.parse(e.LOT_SIZE_JSON)));const u=JSON.parse(e.MAKE_YEAR_JSON)[t]||"&nbsp;";let c="/images/bg/no_image.jpg";if(e.imageList&&e.imageList.length>0){const p=e.imageList[0];"FILE_NAME"in p&&"IMAGE_URL"in p&&"FILE_PATH"in p&&(c=`${p.IMAGE_URL}/${p.FILE_PATH}/${p.FILE_NAME}`.replace(/\/\//g,"/"))}l(".bid-lot-no").textContent=`LOT ${o}`,l(".bid-lot-image").src=c,l(".bid-lot-artist").textContent=i,l(".bid-lot-artist-born").textContent=r?`b. ${r}`:"&nbsp;",l(".bid-lot-title").textContent=n,l(".bid-lot-material").textContent=s,l(".bid-lot-size").textContent=a,l(".bid-lot-year").textContent=u}async function ce(e){const t=e.END_YN==="Y",o=e.CURR_CD||"KRW",n=m(e.GROW_PRICE),i=m(e.LAST_PRICE),r=e.BID_CNT,s=e.LAST_PRICE>0&&e.BID_CNT>0&&e.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00";l(".bid-lot-grow-price").innerHTML=`${o} ${n}`,l(".bid-lot-price-title").innerHTML=s,l(".bid-lot-price-data").innerHTML=`<em>${o} ${i}</em> <span>(\uC751\uCC30${r})</span>`;let a=new Date(e.TO_DT).getTime(),u=setInterval(()=>{ne(a)},1e3);t&&(clearInterval(u),l(".bid-lot-remain-times").innerHTML="\uB0A8\uC740\uC2DC\uAC04 \uC885\uB8CC")}async function le(e){const t=l(".online-bid-list"),o=l(".online-bid-list-empty");if(e.length<1){t.style.display="none",o.style.display="block";return}const n=e.map(i=>{const r=i.CUST_ID,a=i.BID_KIND_CD==="online_auto"?'<em class="type-auto">\uC790\uB3D9</em>':"",u=m(i.BID_PRICE),c=window.moment(i.BID_DT).format("YYYY-MM-DD|HH:mm:ss").split("|");return`
      <li>
        <div class="product-user ">
          <span>${r}</span>
        </div>
        <div class="product-price ">
          <span>${u}</span>
        </div>
        <div class="product-day">
          ${a}<span>${c[0]}</span><span>${c[1]}</span>
        </div>
      </li>
    `});o.style.display="none",t.style.display="block",t.innerHTML=n.join(`
`)}async function ue(e,t){const o=await O(),{lotData:n,lastAutoBid:i}=await g(e,t);await ce(n),document.querySelector(".js-bidding_option").innerHTML=P(n),I("once");const r=new Worker("/js/online-auction/bid-fetcher.worker.js");setInterval(()=>{window.usePolling&&r.postMessage({currency:n.CURR_CD||"KRW",saleNo:e,lotNo:t})},2e3),r.onmessage=async s=>{s.data.growPrice,s.data.endTime,s.data.lastPrice,await g(e,t)},document.querySelectorAll(".select-bid-type-btn").forEach(s=>{d(s,"click",a=>{a.preventDefault();const c=a.currentTarget.dataset.bidTypeValue;c&&I(c)})}),$(".js-bidding_option").select2({minimumResultsForSearch:-1}).on("select2:opening",s=>{s.target.innerHTML=P(n)}),d(document.getElementById("bid-once-btn"),"click",async s=>{s.preventDefault();const a=document.getElementById("bid-once-btn-price"),u=Number(a.dataset.price)||0;await W({type:"bid",saleNo:n.SALE_NO,lotNo:n.LOT_NO,custNo:o.CUST_NO,price:u})}),d(document.getElementById("bid-auto-btn"),"click",async s=>{s.preventDefault(),await X({type:(i==null?void 0:i.BID_KIND_CD)==="online_auto"?"stop":"bid",saleNo:n.SALE_NO,lotNo:n.LOT_NO,custNo:o.CUST_NO,price:$(".js-bidding_option").val(),reqNo:(i==null?void 0:i.REQ_NO)||null})})}export{Q as a,M as b,S as c,me as d,d as e,m as f,x as g,Ae as h,ye as i,k as j,Ee as k,_e as l,ge as m,R as n,we as o,he as p,E as q,Ce as r,de as s,be as t,Le as u,q as v,fe as w,Ne as x};