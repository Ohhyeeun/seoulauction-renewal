import{c as j,n as F,j as q,f as h,u as Y,b as I,v as G,w as X,x as z,e as d,p as V,h as K,q as k,i as U,l as Z,k as Q}from"./bid.e759d7e2.js";function R(){let e=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),t=$("header.header").height()||0,n=$("footer.footer").height()||0,i=$(".type_panel-product_view > .panel-footer").height()||0,o=110+i+120+n;e.setTopStart(t+56),e.setBottomStop(o)}function W(){let e=document.createElement("style");e.textContent=`    
    .select2-container.select2-container--open {
      z-index: 10;
    }
  `,document.head.appendChild(e)}async function J(e){const t=window.localStorage.getItem(`recent-lot-${e}`);return t?JSON.parse(t):[]}async function ee(e,t){const n=Number(t);let o=(await J(e)).filter(c=>c!==n);o.unshift(n),o=o.slice(0,5),window.localStorage.setItem(`recent-lot-${e}`,JSON.stringify(o))}async function te(e){const t=j(),n=document.getElementById("recent-view-list");n.querySelector("ul").remove();const o=await J(e);if(o.length<1)return;const c=document.createElement("ul");c.classList.add("product-list");const{rows:u,totalCount:r}=await F({saleNo:e,lotList:o},!0);if(r===0)return;let y=o.map(m=>{const a=u.find(p=>p.LOT_NO===m);if(!a)return"";const g=JSON.parse(a.TITLE_JSON)[t],E=a.ARTIST_NAME_JSON?JSON.parse(a.ARTIST_NAME_JSON)[t]:"&nbsp;",s=(a==null?void 0:a.isFavorite)||!1;let l="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in a&&"LOT_IMG_NAME"in a&&(l=`https://www.seoulauction.com/nas_img/${a.LOT_IMG_PATH}/${a.LOT_IMG_NAME}`),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${e}/${m}" class="img-align">
                  <img src="${l}" alt="${E} - ${g}">
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${m} </span>
                  </a>
                  <a class="${s?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${s?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${E}</span></a>
                  </div>
                  <div class="desc"><a href="#"><span>${g}</span></a></div>
                </div>
              </div>
            </div>
            <div class="product_cancle-area">
              <div class="area-inner">
                <i class="icon-cancle_box"></i>
                <div class="typo">
                  <div class="name"><span>LOT 5</span></div>
                  <div class="msg"><span>\uCD9C\uD488\uC774 \uCDE8\uC18C\uB418\uC5C8\uC2B5\uB2C8\uB2E4.</span></div>
                </div>
              </div>
            </div>
          </article>
         </div>
      </li>
    `});c.insertAdjacentHTML("beforeend",y.join(`
`)),n.appendChild(c)}function ne(e){const t=document.documentElement.lang||"ko",n=document.getElementById("data-artist-info-container");if(!e){n.style.display="none";return}let i="";const o=JSON.parse(e.profile);t!=="ko"&&!o[t]?i=o.ko:i=o[t];let c="";const u=JSON.parse(e.articles);u&&u.articles.length>0&&(c+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,u.articles.forEach(s=>{const l=t==="en"?s.titleEn:s.titleKo;c+=`<a href="${s.url}" target="_blank" class="sub-links">\u201C${l}\u201D</a>`}));const r=e.imageList,y=JSON.parse(e.media),m=y.youtube.reduce((s,l,p)=>{if(l){const f=`youtube${p}`;if(s[f]={url:l},r.length>0){const _=r.find(T=>T.tag===f);_&&(s[f].thumbnail=_.cdn_url)}}return s},{}),a=y.instagram.reduce((s,l,p)=>{if(l){const f=`youtube${p}`;if(s[f]={url:l},r.length>0){const _=r.find(T=>T.tag===f);_&&(s[f].thumbnail=_.cdn_url)}}return s},{}),g={...m,...a},E=Object.keys(g).map(s=>`
      <a href="${g[s].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${g[s].thumbnail}" alt="" />
      </a>
    `).join(`
`);document.getElementById("data-artist-profile").innerHTML=i,document.getElementById("data-artist-articles").innerHTML=c,document.getElementById("data-media-video").innerHTML=E,document.querySelectorAll('#data-artist-info-container a[target="_blank"]').forEach(s=>{s.addEventListener("click",l=>{l.preventDefault();const p=l.currentTarget;window.open(p.href,"_blank")})})}function oe(e){const t=document.documentElement.lang||"ko",n=e.CURR_CD||"KRW",i=e.LOT_NO,o=e.STAT_CD,c=e.END_YN==="Y",u=e.CLOSE_YN==="Y",y=JSON.parse(e.TITLE_JSON)[t]||"",m=e.imageList;let a=[],g=[];m.length>0&&(m.sort((v,N)=>v.DISP_ORD-N.DISP_ORD),m.forEach((v,N)=>{const D=`${v.IMAGE_URL}${v.FILE_PATH}/${v.FILE_NAME}`;a.push(`
        <div class="slide images" data-index="${N}">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${D}" alt="${v.FILE_NAME}" />
            </div>
          </figure>
          <div class="line"></div>
        </div>
      `),g.push(`
        <div class="swiper-slide" data-index="${N}">
          <div class="image-area">
            <figure class="img-ratio">
              <div class="img-align">
                <img src="${D}" alt="${v.FILE_NAME}" />
              </div>
            </figure>
           </div>
        </div>
      `)}));const E=JSON.parse(e.ARTIST_NAME_JSON)[t]||"&nbsp;";let s="&nbsp;";e.BORN_YEAR&&e.DIE_YEAR?s=`${e.BORN_YEAR} ~ ${e.DIE_YEAR}`:e.BORN_YEAR&&(s=`b.${e.BORN_YEAR}`);let l;switch(t){case"ko":l=e.TITLE_KO_TXT||"&nbsp;";break;case"en":l=e.TITLE_EN_TXT||"&nbsp;";break;default:l="&nbsp;";break}let p=[],f="&nbsp;";t==="ko"?f=e.MATE_NM:t==="en"?f=e.MATE_NM_EN:t==="zh"&&(f=e.MATE_NM_CN),p.push(f);let _="&nbsp;";e.LOT_SIZE_STRING?_=e.LOT_SIZE_STRING:e.LOT_SIZE_JSON&&(_=q(JSON.parse(e.LOT_SIZE_JSON))),p.push(_);const T=JSON.parse(e.SIGN_INFO_JSON);T[t]&&p.push(T[t]);let L=[];const w=JSON.parse(e.COND_RPT_JSON)[t];w&&L.push(`
      <div class="info-sub-box">
        <div class="tit tt5">CONDITION</div>
        <div class="desc">${w}</div>
      </div>
    `);const C=JSON.parse(e.PROV_INFO_JSON)[t];C&&L.push(`
      <div class="info-sub-box">
        <div class="tit tt5">PROVENANCE</div>
        <div class="desc">${C}</div>
      </div>
    `);const S=JSON.parse(e.LITE_INFO_JSON)[t];S&&L.push(`
      <div class="info-sub-box">
        <div class="tit tt5">LITERATURE</div>
        <div class="desc">${S}</div>
      </div>
    `),JSON.parse(e.EXHI_INFO_JSON)[t]&&L.push(`
      <div class="info-sub-box">
        <div class="tit tt5">EXHIBITED</div>
        <div class="desc">${S}</div>
      </div>
    `);let b="";const B=JSON.parse(e.CMMT_JSON);B[t]&&(b=B[t]);let O="0";if(e.EXPE_PRICE_INQ_YN==="Y")O="\uCD94\uC815\uAC00 \uBCC4\uB3C4\uBB38\uC758";else if(e.EXPE_PRICE_FROM_JSON&&e.EXPE_PRICE_TO_JSON){const v=JSON.parse(e.EXPE_PRICE_FROM_JSON),N=JSON.parse(e.EXPE_PRICE_TO_JSON);O=`${n} ${h(v[n])} ~ ${h(N[n])}`}let A=`${n} 0`;o!=="reentry"&&(A=`${n} ${h(e.START_PRICE)}`);let P=c&&u?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",M=`<strong>${n} ${h(e.LAST_PRICE)}</strong>`;e.BID_CNT>0&&(M+=`<em>(\uC751\uCC30 ${h(e.BID_CNT)})</em>`);let H=window.moment(e.TO_DT).format("M/D(ddd) HH:mm");const x=Y(e.LAST_PRICE*.18);document.getElementById("data-sale-title").innerHTML=y,document.getElementById("data-lot-thumbnail").children[0].innerHTML=a.join(`
`),document.getElementById("data-lot-image").children[0].innerHTML=g.join(`
`),document.getElementById("data-lot-no").innerHTML=i,document.getElementById("data-artist-name").innerHTML=E,document.getElementById("data-artist-born-year").innerHTML=s,document.getElementById("data-lot-title").innerHTML=l,document.getElementById("data-lot-basic-desc").innerHTML=p.filter(Boolean).join("<br/>"),b||(document.getElementById("data-lot-description-title").innerHTML=""),document.getElementById("data-lot-description").innerHTML=b,document.getElementById("data-expect-price").innerHTML=O,document.getElementById("data-start-price").innerHTML=A,document.getElementById("data-last-price-title").innerHTML=P,document.getElementById("data-last-price").innerHTML=M,document.getElementById("data-to-date").innerHTML=H,L.length>0&&(document.getElementById("data-lot-additional-info").innerHTML=L.join(`
`)),document.querySelector(".current-fee").innerHTML=h(x)}async function ie(){const e=I("/auction/online/{saleNo}/{lotNo}");if(!e)return;R();const{saleNo:t,lotNo:n}=e,i=await G(t,n),o=await X(i.ARTIST_NO),c=await z(t);await _e(t,n,c),await oe(i),await ne(o),await te(t),await ee(t,n);const u=document.querySelector(".js-dropdown-btn span");u&&(u.textContent=`LOT ${n}`),d(".js-dropdown-btn","click",async r=>{r.preventDefault(),r.stopPropagation();const y=r.currentTarget;await V(y)}),d(".sns_share","click",se),d(".js-share_kakao","click",le),d(".js-share_url","click",ae),d(".print-btn","click",ce),d(".go-bid-btn","click",re),document.querySelectorAll(".bid-fee-btn").forEach(r=>{d(r,"click",de)}),d(".bid-grow-price-btn","click",ue),d(".js-work_heart","click",pe),d("toggle-direct-lot-popup","click",fe),d(".js-lotbox-btn","click",me),window.addEventListener("click",ge)}async function se(e){e.preventDefault(),e.stopPropagation();const t=e.currentTarget;t.classList.contains("on")?(t.classList.remove("on"),document.querySelector(".sns_layer-area").style.display="none"):(t.classList.add("on"),document.querySelector(".sns_layer-area").style.display="block")}async function le(){}async function ae(){}async function ce(e){e.preventDefault();const t=I("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${t==null?void 0:t.saleNo}/${t==null?void 0:t.lotNo}`}async function re(e){e.preventDefault();const{saleNo:t,lotNo:n}=I("/auction/online/{saleNo}/{lotNo}");await K(t,n)}async function de(e){e.preventDefault();const t=await k({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",beforeClose:n=>{n.querySelector(".popupfixed-wrap").style.display="none"}});!t||(await t.init(),await t.open(n=>{n.querySelector(".popupfixed-wrap").style.display="block"}),d(t.root.querySelector(".btn_close"),"click",n=>{n.preventDefault(),t.close(null)}))}async function ue(e){e.preventDefault();const t=await k({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",beforeClose:n=>{n.querySelector(".popupfixed-wrap").style.display="none"}});!t||(await t.init(),await t.open(n=>{n.querySelector(".popupfixed-wrap").style.display="block"}),d(t.root.querySelector(".btn_close"),"click",n=>{n.preventDefault(),t.close(null)}))}async function pe(e){if(e.preventDefault(),e.stopPropagation(),!U()){window.alert("\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4");return}const{saleNo:t,lotNo:n}=I("/auction/online/{saleNo}/{lotNo}"),i=e.currentTarget;i.classList.contains("on")?(await Z(t,n),i.classList.add("on")):(await Q(t,n),i.classList.remove("on"))}async function fe(e){var o;e.preventDefault(),e.stopPropagation();const t=e.currentTarget,n="online-direct-lot-select";if(!document.getElementById(n)){const c=document.getElementById(`${n}-template`),u=document.importNode(c.content,!0);(o=t.parentNode)==null||o.appendChild(u)}const i=document.getElementById("online-direct-lot-select");t.classList.contains("active")?(console.log("is active"),t.classList.remove("active"),i.classList.remove("open"),i.style.display="none"):(console.log("is not active"),t.classList.add("active"),i.classList.add("open"),i.style.display="block")}async function me(e){e.preventDefault()}async function ge(e){var n,i;(n=document.querySelector(".sns_share"))!=null&&n.classList.contains("on")&&e.target.closest(".sns_layer-area")===null&&(document.querySelector(".sns_share").classList.remove("on"),document.querySelector(".sns_layer-area").style.display="none"),(i=document.getElementById("online-direct-lot-select"))!=null&&i.classList.contains("open")&&e.target.closest("#online-direct-lot-select")===null&&(document.getElementById("toggle-direct-lot-popup").classList.remove("active"),document.getElementById("online-direct-lot-select").classList.remove("on"),document.getElementById("online-direct-lot-select").style.display="none");const t=document.querySelector(".js-dropdown-btn.active");t&&!e.target.closest(".trp-dropdown_list-box")&&(t.classList.remove("active"),document.querySelector(".trp-dropdown_list-box").style.display="none",document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function _e(e,t,n){if(!n)return;n.findIndex(o=>Number(e)===o.SALE_NO&&Number(t)===o.LOT_NO&&o.INTE_LOT==="Y")>-1&&document.querySelector(".js-work_heart").classList.add("on")}window.addEventListener("DOMContentLoaded",W);window.onload=ie;$(window).on("scroll resize",function(){R()});
