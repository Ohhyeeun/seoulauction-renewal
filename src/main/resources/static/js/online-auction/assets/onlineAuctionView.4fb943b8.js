import{c as x,n as J,y as M,z as B,A as j,g as f,p as F,j as H,B as w,f as L,C as G,q as p,b as O,e as g,s as Y,h as X,t as k,i as z,l as V,k as q}from"./bid.18b14d53.js";function R(){let t=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),e=$("header.header").height()||0,n=$("footer.footer").height()||0,s=$(".type_panel-product_view > .panel-footer").height()||0,i=110+s+120+n;t.setTopStart(e+56),t.setBottomStop(i)}function K(){let t=document.createElement("style");t.textContent=`    
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
  `,document.head.appendChild(t),document.head.insertAdjacentHTML("beforeend",'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />')}async function P(t){const e=window.localStorage.getItem(`recent-lot-${t}`);return e?JSON.parse(e):[]}async function U(t,e){const n=Number(e);let i=(await P(t)).filter(o=>o!==n);i.unshift(n),i=i.slice(0,5),window.localStorage.setItem(`recent-lot-${t}`,JSON.stringify(i))}async function W(t){const e=x(),n=document.getElementById("recent-view-list");n.querySelector("ul").remove();const i=await P(t);if(i.length<1)return;const o=document.createElement("ul");o.classList.add("product-list");const{rows:l,totalCount:c}=await J({saleNo:t,lotList:i},!0);if(c===0)return;let u=i.map(m=>{const r=l.find(v=>v.LOT_NO===m);if(!r)return"";const _=JSON.parse(r.TITLE_JSON)[e],h=r.ARTIST_NAME_JSON?JSON.parse(r.ARTIST_NAME_JSON)[e]:"&nbsp;",a=(r==null?void 0:r.isFavorite)||!1;let d="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in r&&"LOT_IMG_NAME"in r&&(d=`https://www.seoulauction.com/nas_img/${r.LOT_IMG_PATH}/${r.LOT_IMG_NAME}`),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${t}/${m}" class="img-align">
                  <img src="${d}" alt="${h} - ${_}">
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${m} </span>
                  </a>
                  <a class="${a?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${a?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${h}</span></a>
                  </div>
                  <div class="desc"><a href="#"><span>${_}</span></a></div>
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
    `});o.insertAdjacentHTML("beforeend",u.join(`
`)),n.appendChild(o)}function Z(t){const e=new Worker("/js/worker/view-fetcher.js");return e.onmessage=n=>{t(n)},e}async function Q({saleNo:t,lotNo:e,useArtist:n=!0,useFavorite:s=!0}){let i=await M(t,e);if(!i)return null;const o={...i,artist:null,isFavorite:!1};if(n&&i.ARTIST_NO){const l=await B(i.ARTIST_NO);o.artist=l}if(s){const c=(await j(t)).find(u=>u.LOT_NO===o.LOT_NO&&u.INTE_LOT==="Y"&&u.INTE_LOT_DEL==="N");o.isFavorite=!!c}return o}function tt(t){const e=document.documentElement.lang||"ko",n=f("data-artist-info-container");if(!t){n.style.display="none";return}let s="";const i=JSON.parse(t.profile);e!=="ko"&&!i[e]?s=i.ko:s=i[e];let o="";const l=JSON.parse(t.articles);l&&l.articles.length>0&&(o+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,l.articles.forEach(a=>{const d=e==="en"?a.titleEn:a.titleKo;o+=`<a href="${a.url}" target="_blank" class="sub-links">\u201C${d}\u201D</a>`}));const c=t.imageList,u=JSON.parse(t.media),m=u.youtube.reduce((a,d,v)=>{if(d){const T=`youtube${v}`;if(a[T]={url:d},c.length>0){const N=c.find(C=>C.tag===T);N&&(a[T].thumbnail=N.cdn_url)}}return a},{}),r=u.instagram.reduce((a,d,v)=>{if(d){const T=`youtube${v}`;if(a[T]={url:d},c.length>0){const N=c.find(C=>C.tag===T);N&&(a[T].thumbnail=N.cdn_url)}}return a},{}),_={...m,...r},h=Object.keys(_).map(a=>`
      <a href="${_[a].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${_[a].thumbnail}" alt="" />
      </a>
    `).join(`
`);f("data-artist-profile").innerHTML=s,f("data-artist-articles").innerHTML=o,f("data-media-video").innerHTML=h,F('#data-artist-info-container a[target="_blank"]',"click",a=>{a.preventDefault();const d=a.currentTarget;window.open(d.href,"_blank")})}function et(t){var S;const e=document.documentElement.lang||"ko",n=t.LOT_NO,i=JSON.parse(t.TITLE_JSON)[e]||"",o=t.imageList;let l=[],c=[];o.length>0&&(o.sort((E,b)=>E.DISP_ORD-b.DISP_ORD),o.forEach((E,b)=>{const A=`${E.IMAGE_URL}${E.FILE_PATH}/${E.FILE_NAME}`;l.push(`
        <div class="slide images" data-index="${b}">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${A}" alt="${E.FILE_NAME}" />
            </div>
          </figure>
          <div class="line"></div>
        </div>
      `),c.push(`
        <div class="swiper-slide" data-index="${b}">
          <div class="image-area">
            <figure class="img-ratio">
              <div class="img-align">
                <img src="${A}" alt="${E.FILE_NAME}" />
              </div>
            </figure>
           </div>
        </div>
      `)}));const u=JSON.parse(t.ARTIST_NAME_JSON)[e]||"&nbsp;";let m="&nbsp;";t.BORN_YEAR&&t.DIE_YEAR?m=`${t.BORN_YEAR} ~ ${t.DIE_YEAR}`:t.BORN_YEAR&&(m=`b.${t.BORN_YEAR}`);let r;switch(e){case"ko":r=t.TITLE_KO_TXT||"&nbsp;";break;case"en":r=t.TITLE_EN_TXT||"&nbsp;";break;default:r="&nbsp;";break}let _=[],h="&nbsp;";e==="ko"?h=t.MATE_NM:e==="en"?h=t.MATE_NM_EN:e==="zh"&&(h=t.MATE_NM_CN),_.push(h);let a="&nbsp;";t.LOT_SIZE_STRING?a=t.LOT_SIZE_STRING:t.LOT_SIZE_JSON&&(a=H(JSON.parse(t.LOT_SIZE_JSON))),_.push(a);const d=JSON.parse(t.SIGN_INFO_JSON);d[e]&&_.push(d[e]);let v=[];const T=JSON.parse(t.COND_RPT_JSON)[e];T&&v.push(`
      <div class="info-sub-box">
        <div class="tit tt5">CONDITION</div>
        <div class="desc">${T}</div>
      </div>
    `);const N=JSON.parse(t.PROV_INFO_JSON)[e];N&&v.push(`
      <div class="info-sub-box">
        <div class="tit tt5">PROVENANCE</div>
        <div class="desc">${N}</div>
      </div>
    `);const C=JSON.parse(t.LITE_INFO_JSON)[e];C&&v.push(`
      <div class="info-sub-box">
        <div class="tit tt5">LITERATURE</div>
        <div class="desc">${C}</div>
      </div>
    `),JSON.parse(t.EXHI_INFO_JSON)[e]&&v.push(`
      <div class="info-sub-box">
        <div class="tit tt5">EXHIBITED</div>
        <div class="desc">${C}</div>
      </div>
    `);let y="";const I=JSON.parse(t.CMMT_JSON);I[e]&&(y=I[e]),f("data-sale-title").textContent=i,w("data-lot-image",`<div class="swiper-wrapper">${c.join(`
`)}</div>`),w("data-lot-thumbnail",`<div class="swiper-wrapper">${l.join(`
`)}</div>`),f("data-lot-no").textContent=n,f("data-artist-name").textContent=u,f("data-artist-born-year").textContent=m,f("data-lot-title").textContent=r,w("data-lot-basic-desc",_.filter(Boolean).join("<br/>")),y?f("data-lot-description").textContent=y:(S=f("data-lot-description-title").parentElement)==null||S.remove(),v.length>0&&(document.getElementById("data-lot-additional-info").innerHTML=v.join(`
`))}function D(t){const e=t.CURR_CD||"KRW",n=t.EXPE_PRICE_INQ_YN==="Y";let s="";t.EXPE_PRICE_FROM_JSON&&(s=`${L(JSON.parse(t.EXPE_PRICE_FROM_JSON)[e])||0}`);let i="";t.EXPE_PRICE_TO_JSON&&(i=`${L(JSON.parse(t.EXPE_PRICE_TO_JSON)[e])||0}`);let o=`${e} 0`;t.STAT_CD!=="reentry"&&t.START_PRICE&&(o=`${e} ${L(t.START_PRICE)}`);const c=t.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",u=t.LAST_PRICE||0,m=t.BID_CNT&&t.BID_CNT>0?t.BID_CNT:0,r=window.moment(t.TO_DT).format("M/D(ddd) HH:mm"),_=t.LAST_PRICE?G(t.LAST_PRICE*.18):0;w("lot-detail-price-area",`
      <dl class="price-list">
        <dt>\uCD94\uC815\uAC00</dt>
        <dd id="data-expect-price">
          ${n?'<span id="data-expe-no-price">\uCD94\uC815\uAC00 \uBCC4\uB3C4\uBB38\uC758</span>':""}
          ${!n&&(s||i)?`<span id="data-expe-currency">${e}</span>`:""}
          ${!n&&s?`<span id="data-expe-from">${s}</span>`:""}
          ${n?"":"<span> ~ </span>"}
          ${!n&&i?`<span id="data-expe-to">${i}</span>`:""}  
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uC2DC\uC791\uAC00</dt>
        <dd id="data-start-price">${o}</dd>
      </dl>
      <dl class="price-list">
        <dt id="data-last-price-title">${c}</dt>
        <dd>
          <strong id="data-last-price">${e} ${L(u)}</strong>
          <em id="data-bid-count">(\uC751\uCC30 ${L(m)})</em>
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uB9C8\uAC10\uC77C</dt>
        <dd id="data-to-date">${r}</dd>
      </dl>
    `),p(".current-fee").textContent=L(_)}async function nt(){const t=O("/auction/online/{saleNo}/{lotNo}");if(!t)return;R();const{saleNo:e,lotNo:n}=t,s=await Q({saleNo:e,lotNo:n});if(!s)return;const i=p(".js-work_heart");s!=null&&s.isFavorite?i.classList.add("on"):i.classList.remove("on"),await U(e,n),et(s),D(s),tt(s.artist),await W(e),p(".js-dropdown-btn span").textContent=`LOT ${n}`;const o=Z(l=>{if(!l.data)return;const c=l.data,u={...s,...c};D(u)});setInterval(()=>{o.postMessage({saleNo:e,lotNo:n})},2e3),g(".js-dropdown-btn","click",async l=>{l.preventDefault(),l.stopPropagation();const c=l.currentTarget;await Y(c)}),g(".sns_share","click",st),g(".js-share_kakao","click",it),g(".js-share_url","click",ot),g(".print-btn","click",at),g(".go-bid-btn","click",lt),g(".bid-fee-btn","click",rt),g(".bid-grow-price-btn","click",ct),g(".js-work_heart","click",dt),g("toggle-direct-lot-popup","click",pt),g(".js-lotbox-btn","click",ut),window.addEventListener("click",ft)}async function st(t){t.preventDefault(),t.stopPropagation();const e=t.currentTarget;e.classList.contains("on")?(e.classList.remove("on"),p(".sns_layer-area").style.display="none"):(e.classList.add("on"),p(".sns_layer-area").style.display="block")}async function it(){}async function ot(){}async function at(t){t.preventDefault();const e=O("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${e==null?void 0:e.saleNo}/${e==null?void 0:e.lotNo}`}async function lt(t){t.preventDefault();const{saleNo:e,lotNo:n}=O("/auction/online/{saleNo}/{lotNo}");await X(e,n)}async function rt(){const t=await k({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",beforeClose:e=>{p(".popupfixed-wrap",e).style.display="none"}});!t||(await t.init(),await t.open(e=>{p(".popupfixed-wrap",e).style.display="block"}),g(p(".btn_close",t.root),"click",e=>{e.preventDefault(),t.close(null)}))}async function ct(t){t.preventDefault();const e=await k({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",beforeClose:n=>{n.querySelector(".popupfixed-wrap").style.display="none"}});!e||(await e.init(),await e.open(n=>{n.querySelector(".popupfixed-wrap").style.display="block"}),g(p(".btn_close",e.root),"click",n=>{n.preventDefault(),e.close(null)}))}async function dt(t){if(t.preventDefault(),t.stopPropagation(),!z()){window.alert("\uB85C\uADF8\uC778\uC774 \uD544\uC694\uD569\uB2C8\uB2E4");return}const{saleNo:e,lotNo:n}=O("/auction/online/{saleNo}/{lotNo}"),s=t.currentTarget;s.classList.contains("on")?(await V(e,n),s.classList.add("on")):(await q(e,n),s.classList.remove("on"))}async function pt(t){var i;t.preventDefault(),t.stopPropagation();const e=t.currentTarget,n="online-direct-lot-select";if(!document.getElementById(n)){const o=document.getElementById(`${n}-template`),l=document.importNode(o.content,!0);(i=e.parentNode)==null||i.appendChild(l)}const s=document.getElementById("online-direct-lot-select");e.classList.contains("active")?(console.log("is active"),e.classList.remove("active"),s.classList.remove("open"),s.style.display="none"):(console.log("is not active"),e.classList.add("active"),s.classList.add("open"),s.style.display="block")}async function ut(t){t.preventDefault()}async function ft(t){var n,s;(n=p(".sns_share"))!=null&&n.classList.contains("on")&&t.target.closest(".sns_layer-area")===null&&(p(".sns_share").classList.remove("on"),p(".sns_layer-area").style.display="none"),(s=document.getElementById("online-direct-lot-select"))!=null&&s.classList.contains("open")&&t.target.closest("#online-direct-lot-select")===null&&(f("toggle-direct-lot-popup").classList.remove("active"),f("online-direct-lot-select").classList.remove("on"),f("online-direct-lot-select").style.display="none");const e=p(".js-dropdown-btn.active");e&&!t.target.closest(".trp-dropdown_list-box")&&(e.classList.remove("active"),p(".trp-dropdown_list-box").style.display="none",p('.trp-dropdown_list-box .search-box input[type="search"]').value="")}window.addEventListener("DOMContentLoaded",K);window.onload=nt;$(window).on("scroll resize",function(){R()});
