import{c as q,n as Y,g as I,o as G,j as X,f as h,w as z,b,x as V,y as K,z as U,e as r,r as Z,h as Q,s as R,q as J,i as W,l as ee,k as te}from"./bid.52aada9f.js";function P(){let e=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),t=$("header.header").height()||0,n=$("footer.footer").height()||0,i=$(".type_panel-product_view > .panel-footer").height()||0,o=110+i+120+n;e.setTopStart(t+56),e.setBottomStop(o)}function ne(){let e=document.createElement("style");e.textContent=`    
    .select2-container.select2-container--open {
      z-index: 10;
    }
  `,document.head.appendChild(e),document.head.insertAdjacentHTML("beforeend",'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />')}async function H(e){const t=window.localStorage.getItem(`recent-lot-${e}`);return t?JSON.parse(t):[]}async function oe(e,t){const n=Number(t);let o=(await H(e)).filter(c=>c!==n);o.unshift(n),o=o.slice(0,5),window.localStorage.setItem(`recent-lot-${e}`,JSON.stringify(o))}async function ie(e){const t=q(),n=document.getElementById("recent-view-list");n.querySelector("ul").remove();const o=await H(e);if(o.length<1)return;const c=document.createElement("ul");c.classList.add("product-list");const{rows:d,totalCount:p}=await Y({saleNo:e,lotList:o},!0);if(p===0)return;let y=o.map(m=>{const l=d.find(f=>f.LOT_NO===m);if(!l)return"";const g=JSON.parse(l.TITLE_JSON)[t],T=l.ARTIST_NAME_JSON?JSON.parse(l.ARTIST_NAME_JSON)[t]:"&nbsp;",s=(l==null?void 0:l.isFavorite)||!1;let a="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in l&&"LOT_IMG_NAME"in l&&(a=`https://www.seoulauction.com/nas_img/${l.LOT_IMG_PATH}/${l.LOT_IMG_NAME}`),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${e}/${m}" class="img-align">
                  <img src="${a}" alt="${T} - ${g}">
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
                  <div class="title"><a href="#"><span>${T}</span></a>
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
`)),n.appendChild(c)}function se(e){const t=document.documentElement.lang||"ko",n=I("data-artist-info-container");if(!e){n.style.display="none";return}let i="";const o=JSON.parse(e.profile);t!=="ko"&&!o[t]?i=o.ko:i=o[t];let c="";const d=JSON.parse(e.articles);d&&d.articles.length>0&&(c+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,d.articles.forEach(s=>{const a=t==="en"?s.titleEn:s.titleKo;c+=`<a href="${s.url}" target="_blank" class="sub-links">\u201C${a}\u201D</a>`}));const p=e.imageList,y=JSON.parse(e.media),m=y.youtube.reduce((s,a,f)=>{if(a){const u=`youtube${f}`;if(s[u]={url:a},p.length>0){const _=p.find(E=>E.tag===u);_&&(s[u].thumbnail=_.cdn_url)}}return s},{}),l=y.instagram.reduce((s,a,f)=>{if(a){const u=`youtube${f}`;if(s[u]={url:a},p.length>0){const _=p.find(E=>E.tag===u);_&&(s[u].thumbnail=_.cdn_url)}}return s},{}),g={...m,...l},T=Object.keys(g).map(s=>`
      <a href="${g[s].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${g[s].thumbnail}" alt="" />
      </a>
    `).join(`
`);I("data-artist-profile").innerHTML=i,I("data-artist-articles").innerHTML=c,I("data-media-video").innerHTML=T,G('#data-artist-info-container a[target="_blank"]',"click",s=>{s.preventDefault();const a=s.currentTarget;window.open(a.href,"_blank")})}function ae(e){const t=document.documentElement.lang||"ko",n=e.CURR_CD||"KRW",i=e.LOT_NO,o=e.STAT_CD,c=e.END_YN==="Y",d=e.CLOSE_YN==="Y",y=JSON.parse(e.TITLE_JSON)[t]||"",m=e.imageList;let l=[],g=[];m.length>0&&(m.sort((v,N)=>v.DISP_ORD-N.DISP_ORD),m.forEach((v,N)=>{const k=`${v.IMAGE_URL}${v.FILE_PATH}/${v.FILE_NAME}`;l.push(`
        <div class="slide images" data-index="${N}">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${k}" alt="${v.FILE_NAME}" />
            </div>
          </figure>
          <div class="line"></div>
        </div>
      `),g.push(`
        <div class="swiper-slide" data-index="${N}">
          <div class="image-area">
            <figure class="img-ratio">
              <div class="img-align">
                <img src="${k}" alt="${v.FILE_NAME}" />
              </div>
            </figure>
           </div>
        </div>
      `)}));const T=JSON.parse(e.ARTIST_NAME_JSON)[t]||"&nbsp;";let s="&nbsp;";e.BORN_YEAR&&e.DIE_YEAR?s=`${e.BORN_YEAR} ~ ${e.DIE_YEAR}`:e.BORN_YEAR&&(s=`b.${e.BORN_YEAR}`);let a;switch(t){case"ko":a=e.TITLE_KO_TXT||"&nbsp;";break;case"en":a=e.TITLE_EN_TXT||"&nbsp;";break;default:a="&nbsp;";break}let f=[],u="&nbsp;";t==="ko"?u=e.MATE_NM:t==="en"?u=e.MATE_NM_EN:t==="zh"&&(u=e.MATE_NM_CN),f.push(u);let _="&nbsp;";e.LOT_SIZE_STRING?_=e.LOT_SIZE_STRING:e.LOT_SIZE_JSON&&(_=X(JSON.parse(e.LOT_SIZE_JSON))),f.push(_);const E=JSON.parse(e.SIGN_INFO_JSON);E[t]&&f.push(E[t]);let L=[];const C=JSON.parse(e.COND_RPT_JSON)[t];C&&L.push(`
      <div class="info-sub-box">
        <div class="tit tt5">CONDITION</div>
        <div class="desc">${C}</div>
      </div>
    `);const M=JSON.parse(e.PROV_INFO_JSON)[t];M&&L.push(`
      <div class="info-sub-box">
        <div class="tit tt5">PROVENANCE</div>
        <div class="desc">${M}</div>
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
    `);let O="";const A=JSON.parse(e.CMMT_JSON);A[t]&&(O=A[t]);let w="0";if(e.EXPE_PRICE_INQ_YN==="Y")w="\uCD94\uC815\uAC00 \uBCC4\uB3C4\uBB38\uC758";else if(e.EXPE_PRICE_FROM_JSON&&e.EXPE_PRICE_TO_JSON){const v=JSON.parse(e.EXPE_PRICE_FROM_JSON),N=JSON.parse(e.EXPE_PRICE_TO_JSON);w=`${n} ${h(v[n])} ~ ${h(N[n])}`}let B=`${n} 0`;o!=="reentry"&&(B=`${n} ${h(e.START_PRICE)}`);let x=c&&d?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",D=`<strong>${n} ${h(e.LAST_PRICE)}</strong>`;e.BID_CNT>0&&(D+=`<em>(\uC751\uCC30 ${h(e.BID_CNT)})</em>`);let j=window.moment(e.TO_DT).format("M/D(ddd) HH:mm");const F=z(e.LAST_PRICE*.18);document.getElementById("data-sale-title").innerHTML=y,document.getElementById("data-lot-thumbnail").children[0].innerHTML=l.join(`
`),document.getElementById("data-lot-image").children[0].innerHTML=g.join(`
`),document.getElementById("data-lot-no").innerHTML=i,document.getElementById("data-artist-name").innerHTML=T,document.getElementById("data-artist-born-year").innerHTML=s,document.getElementById("data-lot-title").innerHTML=a,document.getElementById("data-lot-basic-desc").innerHTML=f.filter(Boolean).join("<br/>"),O||(document.getElementById("data-lot-description-title").innerHTML=""),document.getElementById("data-lot-description").innerHTML=O,document.getElementById("data-expect-price").innerHTML=w,document.getElementById("data-start-price").innerHTML=B,document.getElementById("data-last-price-title").innerHTML=x,document.getElementById("data-last-price").innerHTML=D,document.getElementById("data-to-date").innerHTML=j,L.length>0&&(document.getElementById("data-lot-additional-info").innerHTML=L.join(`
`)),document.querySelector(".current-fee").innerHTML=h(F)}async function le(){const e=b("/auction/online/{saleNo}/{lotNo}");if(!e)return;P();const{saleNo:t,lotNo:n}=e,i=await V(t,n),o=await K(i.ARTIST_NO),c=await U(t);await Te(t,n,c),await ae(i),await se(o),await ie(t),await oe(t,n);const d=document.querySelector(".js-dropdown-btn span");d&&(d.textContent=`LOT ${n}`),r(".js-dropdown-btn","click",async p=>{p.preventDefault(),p.stopPropagation();const y=p.currentTarget;await Z(y)}),r(".sns_share","click",ce),r(".js-share_kakao","click",re),r(".js-share_url","click",de),r(".print-btn","click",ue),r(".go-bid-btn","click",pe),r(".bid-fee-btn","click",fe),r(".bid-grow-price-btn","click",me),r(".js-work_heart","click",ge),r("toggle-direct-lot-popup","click",_e),r(".js-lotbox-btn","click",ve),window.addEventListener("click",ye)}async function ce(e){e.preventDefault(),e.stopPropagation();const t=e.currentTarget;t.classList.contains("on")?(t.classList.remove("on"),document.querySelector(".sns_layer-area").style.display="none"):(t.classList.add("on"),document.querySelector(".sns_layer-area").style.display="block")}async function re(){}async function de(){}async function ue(e){e.preventDefault();const t=b("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${t==null?void 0:t.saleNo}/${t==null?void 0:t.lotNo}`}async function pe(e){e.preventDefault();const{saleNo:t,lotNo:n}=b("/auction/online/{saleNo}/{lotNo}");await Q(t,n)}async function fe(){const e=await R({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",beforeClose:t=>{t.querySelector(".popupfixed-wrap").style.display="none"}});!e||(await e.init(),await e.open(t=>{t.querySelector(".popupfixed-wrap").style.display="block"}),r(J(".btn_close",e.root),"click",t=>{t.preventDefault(),e.close(null)}))}async function me(e){e.preventDefault();const t=await R({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",beforeClose:n=>{n.querySelector(".popupfixed-wrap").style.display="none"}});!t||(await t.init(),await t.open(n=>{n.querySelector(".popupfixed-wrap").style.display="block"}),r(J(".btn_close",t.root),"click",n=>{n.preventDefault(),t.close(null)}))}async function ge(e){if(e.preventDefault(),e.stopPropagation(),!W()){window.alert("\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4");return}const{saleNo:t,lotNo:n}=b("/auction/online/{saleNo}/{lotNo}"),i=e.currentTarget;i.classList.contains("on")?(await ee(t,n),i.classList.add("on")):(await te(t,n),i.classList.remove("on"))}async function _e(e){var o;e.preventDefault(),e.stopPropagation();const t=e.currentTarget,n="online-direct-lot-select";if(!document.getElementById(n)){const c=document.getElementById(`${n}-template`),d=document.importNode(c.content,!0);(o=t.parentNode)==null||o.appendChild(d)}const i=document.getElementById("online-direct-lot-select");t.classList.contains("active")?(console.log("is active"),t.classList.remove("active"),i.classList.remove("open"),i.style.display="none"):(console.log("is not active"),t.classList.add("active"),i.classList.add("open"),i.style.display="block")}async function ve(e){e.preventDefault()}async function ye(e){var n,i;(n=document.querySelector(".sns_share"))!=null&&n.classList.contains("on")&&e.target.closest(".sns_layer-area")===null&&(document.querySelector(".sns_share").classList.remove("on"),document.querySelector(".sns_layer-area").style.display="none"),(i=document.getElementById("online-direct-lot-select"))!=null&&i.classList.contains("open")&&e.target.closest("#online-direct-lot-select")===null&&(document.getElementById("toggle-direct-lot-popup").classList.remove("active"),document.getElementById("online-direct-lot-select").classList.remove("on"),document.getElementById("online-direct-lot-select").style.display="none");const t=document.querySelector(".js-dropdown-btn.active");t&&!e.target.closest(".trp-dropdown_list-box")&&(t.classList.remove("active"),document.querySelector(".trp-dropdown_list-box").style.display="none",document.querySelector('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function Te(e,t,n){if(!n)return;n.findIndex(o=>Number(e)===o.SALE_NO&&Number(t)===o.LOT_NO&&o.INTE_LOT==="Y")>-1&&document.querySelector(".js-work_heart").classList.add("on")}window.addEventListener("DOMContentLoaded",ne);window.onload=le;$(window).on("scroll resize",function(){P()});
