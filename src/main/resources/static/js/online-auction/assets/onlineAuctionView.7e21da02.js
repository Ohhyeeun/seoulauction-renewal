import{y as x,w as X,c as P,r as J,g as E,s as D,d as O,e as F,a as d,n as k,G as j,H as U,o as W,h as K,j as z,u as w,b,I as V,J as Z,k as L,l as h,K as q,L as Q,M as tt,N as et,O as at,f as st,x as it,z as nt,v as N,D as ot,P as lt,E as rt,m as ct,F as dt}from"./index.982877ae.js";async function H(e){const t=window.localStorage.getItem(`recent-lot-${e}`);return t?JSON.parse(t):[]}async function pt(e,t){const s=Number(t);let a=(await H(e)).filter(n=>n!==s);a.unshift(s),a=a.slice(0,5),window.localStorage.setItem(`recent-lot-${e}`,JSON.stringify(a))}async function ut(e){const t=x(),s=document.getElementById("recent-view-list");s.querySelector("ul").remove();const a=await H(e);if(a.length<1)return;const n=document.createElement("ul");n.classList.add("product-list");const{rows:l,totalCount:p}=await X({saleNo:e,lotList:a},!0);if(p===0)return;let o=a.map(u=>{const r=l.find(c=>c.LOT_NO===u);if(!r||r.STAT_CD==="reentry")return"";const C=JSON.parse(r.TITLE_JSON)[t],v=r.ARTIST_NAME_JSON?JSON.parse(r.ARTIST_NAME_JSON)[t]:"&nbsp;",T=(r==null?void 0:r.isFavorite)||!1;let g="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in r&&"LOT_IMG_NAME"in r&&(g=P(r.LOT_IMG_PATH,r.LOT_IMG_NAME,"thum")),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${e}/${u}" class="img-align">
                  ${J(g,`${v} - ${C}`)}
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${u} </span>
                  </a>
                  <a class="${T?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${T?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${v}</span></a>
                  </div>
                  <div class="desc"><a href="#"><span>${C}</span></a></div>
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
    `});n.insertAdjacentHTML("beforeend",o.join(`
`)),s.appendChild(n)}function ft(){const e=E("data-artist-info-container");D(()=>{const{lang:t,artist:s,lotDetail:i}=O();if(!i||!s){e.style.display="none";return}const a=s;let n="";const l=JSON.parse(a.PROFILE_JSON);t!=="ko"&&!l[t]?n=l.ko:n=l[t];let p="";const o=JSON.parse(a.ARTICLES_JSON);o&&o.articles.length>0&&(p+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,o.articles.forEach(c=>{const _=t==="en"?c.titleEn:c.titleKo;p+=`<a href="${c.url}" target="_blank" class="sub-links">\u201C${_}\u201D</a>`}));const u=a.imageList,r=JSON.parse(a.MEDIA_JSON),C=r.youtube.reduce((c,_,S)=>{if(_){const f=`youtube${S}`;if(c[f]={url:_},u.length>0){const m=u.find(I=>I.tag===f);m&&(c[f].thumbnail=m.cdn_url)}}return c},{}),v=r.instagram.reduce((c,_,S)=>{if(_){const f=`youtube${S}`;if(c[f]={url:_},u.length>0){const m=u.find(I=>I.tag===f);m&&(c[f].thumbnail=m.cdn_url)}}return c},{}),T={...C,...v},g=Object.keys(T).map(c=>`
      <a href="${T[c].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${T[c].thumbnail}" alt="" />
      </a>
    `).join(`
`);E("data-artist-profile").innerHTML=n,E("data-artist-articles").innerHTML=p,E("data-media-video").innerHTML=g,e.style.display="block",F('#data-artist-info-container a[target="_blank"]',"click",c=>{c.preventDefault();const _=c.currentTarget;window.open(_.href,"_blank")})})}function _t(){let e=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),t=$("header.header").height()||0,s=$("footer.footer").height()||0,i=$(".type_panel-product_view > .panel-footer").height()||0,a=110+i+120+s;e.setTopStart(t+56),e.setBottomStop(a)}function Et(e){const t=d(".js-work_heart");e?t.classList.add("on"):t.classList.remove("on")}async function Tt(e){e.preventDefault(),e.stopPropagation();const t=e.currentTarget;t.classList.contains("on")?(t.classList.remove("on"),d(".sns_layer-area").style.display="none"):(t.classList.add("on"),d(".sns_layer-area").style.display="block")}async function vt(){}async function Nt(){}async function gt(e){e.preventDefault();const t=k("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${t==null?void 0:t.saleNo}/${t==null?void 0:t.lotNo}`}async function Ct(e){e.preventDefault();const t=await j({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",closeBtnSelector:[".js-closepop"],beforeClose:n=>{d(".popupfixed-wrap",n).style.display="none",d(".pop-panel",n).classList.remove("open")}});if(!t)return;const{root:s,init:i,open:a}=t;await i(),d(".popupfixed-wrap",s).style.display="block",d(".pop-panel",s).classList.add("open"),await a()}async function mt(e){e.preventDefault();const t=await j({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",closeBtnSelector:[".js-closepop"],beforeClose:n=>{d(".popupfixed-wrap",n).style.display="none",d(".pop-panel",n).classList.remove("open")}});if(!t)return;const{root:s,init:i,open:a}=t;await i(),d(".popupfixed-wrap",s).style.display="block",d(".pop-panel",s).classList.add("open"),await a()}async function Lt(e){if(e.preventDefault(),e.stopPropagation(),!U()){await W();return}const{saleNo:t,lotNo:s}=k("/auction/online/{saleNo}/{lotNo}"),i=e.currentTarget;i.classList.contains("on")?(await K(t,s),i.classList.add("on")):(await z(t,s),i.classList.remove("on"))}async function ht(e){var a;e.preventDefault(),e.stopPropagation();const t=e.currentTarget,s="online-direct-lot-select";if(!document.getElementById(s)){const n=document.getElementById(`${s}-template`),l=document.importNode(n.content,!0);(a=t.parentNode)==null||a.appendChild(l)}const i=document.getElementById("online-direct-lot-select");t.classList.contains("active")?(t.classList.remove("active"),i.classList.remove("open"),i.style.display="none"):(t.classList.add("active"),i.classList.add("open"),i.style.display="block")}async function Ot(e){var s,i;(s=d(".sns_share"))!=null&&s.classList.contains("on")&&e.target.closest(".sns_layer-area")===null&&(d(".sns_share").classList.remove("on"),d(".sns_layer-area").style.display="none"),(i=document.getElementById("online-direct-lot-select"))!=null&&i.classList.contains("open")&&e.target.closest("#online-direct-lot-select")===null&&(E("toggle-direct-lot-popup").classList.remove("active"),E("online-direct-lot-select").classList.remove("on"),E("online-direct-lot-select").style.display="none");const t=d(".js-dropdown-btn.active");t&&!e.target.closest(".trp-dropdown_list-box")&&(t.classList.remove("active"),d(".trp-dropdown_list-box").style.display="none",d('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function St(){D(()=>{const{lang:e,lotNo:t,sale:s,lotDetail:i}=O();if(!s||!i)return;const a=i,l=JSON.parse(a.TITLE_JSON)[e]||"";let p=a.imageList,o=[],u=[];p&&p.length>0&&p.forEach((y,M)=>{const Y=P(y.FILE_PATH,y.FILE_NAME,"detail");o.push(`
          <div class="slide images" data-index="${M}">
            <figure class="img-ratio">
              <div class="img-align">
                ${J(Y)}
              </div>
            </figure>
            <div class="line"></div>
          </div>
        `);const G=P(y.FILE_PATH,y.FILE_NAME,"detail");u.push(`
          <div class="swiper-slide" data-index="${M}">
            <div class="image-area">
              <figure class="img-ratio">
                <div class="img-align">
                  ${J(G)}
                </div>
              </figure>
            </div>
          </div>
        `)});let r="";a.ARTIST_NAME_JSON&&(r=JSON.parse(a.ARTIST_NAME_JSON)[e]||"&nbsp;");const C=!!r.match(/(김환기|박수근|(Kim WhanKi)|(Park SooKeun)|金煥基|朴壽根)/gi);let v="";a.BORN_YEAR&&a.DIE_YEAR?v=`${a.BORN_YEAR} ~ ${a.DIE_YEAR}`:a.BORN_YEAR&&(v=`b.${a.BORN_YEAR}`);let T;switch(e){case"ko":T=a.TITLE_KO_TXT||"&nbsp;";break;case"en":T=a.TITLE_EN_TXT||"&nbsp;";break;case"zh":T=a.TITLE_EN_TXT||"&nbsp;";break;default:T="&nbsp;";break}let g=[],c="&nbsp;";e==="ko"?c=a.MATE_NM:(e==="en"||e==="zh")&&(c=a.MATE_NM_EN),g.push(c);let _="";a.LOT_SIZE_STRING?_=a.LOT_SIZE_STRING:a.LOT_SIZE_JSON&&(_=js_size_text_cm(JSON.parse(a.LOT_SIZE_JSON))),g.push(_);const S=JSON.parse(a.SIGN_INFO_JSON);S[e]&&g.push(S[e]);let f=[];const m=JSON.parse(a.COND_RPT_JSON)[e];m&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">CONDITION</div>
          <div class="desc">${m}</div>
        </div>
      `);const I=JSON.parse(a.PROV_INFO_JSON)[e];I&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">PROVENANCE</div>
          <div class="desc">${I}</div>
        </div>
      `);const R=JSON.parse(a.LITE_INFO_JSON)[e];R&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">LITERATURE</div>
          <div class="desc">${R}</div>
        </div>
      `),JSON.parse(a.EXHI_INFO_JSON)[e]&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">EXHIBITED</div>
          <div class="desc">${R}</div>
        </div>
      `);let A="";const B=JSON.parse(a.CMMT_JSON);B[e]&&(A=B[e]),E("data-sale-title").textContent=l,w("data-lot-image",`<div class="swiper-wrapper">${u.join(`
`)}</div>`),w("data-lot-thumbnail",`<div class="swiper-wrapper">${o.join(`
`)}</div>`),E("data-lot-no").textContent=`${t}`,E("data-artist-name").textContent=r,E("data-artist-born-year").textContent=v,E("data-lot-title").textContent=T,w("data-lot-basic-desc",g.filter(Boolean).join("<br/>")),C&&d(".view_scale-area").remove(),A&&(E("data-lot-description").textContent=A),f.length>0&&w("data-lot-additional-info",f.join(`
`)),a.isFavorite&&Et(a.isFavorite)})}function It(){D(()=>{const{lotDetail:e}=O();if(!e)return;const t=e,s=t.CURR_CD||"KRW",i=t.EXPE_PRICE_INQ_YN==="Y";let a="";t.EXPE_PRICE_FROM_JSON&&(a=`${b(JSON.parse(t.EXPE_PRICE_FROM_JSON)[s])||0}`);let n="";t.EXPE_PRICE_TO_JSON&&(n=`${b(JSON.parse(t.EXPE_PRICE_TO_JSON)[s])||0}`);let l=`${s} 0`;t.STAT_CD!=="reentry"&&t.START_PRICE&&(l=`${s} ${b(t.START_PRICE)}`);const o=t.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",u=t.LAST_PRICE||0,r=t.BID_CNT&&t.BID_CNT>0?t.BID_CNT:0,C=window.moment(t.TO_DT).format("M/D(ddd) HH:mm"),v=t.LAST_PRICE?V(t.LAST_PRICE*.18):0;w("lot-detail-price-area",`
      <dl class="price-list">
        <dt>\uCD94\uC815\uAC00</dt>
        <dd id="data-expect-price">
          ${i?'<span id="data-expe-no-price">\uCD94\uC815\uAC00 \uBCC4\uB3C4\uBB38\uC758</span>':""}
          ${!i&&(a||n)?`<span id="data-expe-currency">${s}</span>`:""}
          ${!i&&a?`<span id="data-expe-from">${a}</span>`:""}
          ${i?"":"<span> ~ </span>"}
          ${!i&&n?`<span id="data-expe-to">${n}</span>`:""}  
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uC2DC\uC791\uAC00</dt>
        <dd id="data-start-price">${l}</dd>
      </dl>
      <dl class="price-list">
        <dt id="data-last-price-title">${o}</dt>
        <dd>
          <strong id="data-last-price">${s} ${b(u)}</strong>
          <em id="data-bid-count">(\uC751\uCC30 ${b(r)})</em>
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uB9C8\uAC10\uC77C</dt>
        <dd id="data-to-date">${C}</dd>
      </dl>
    `),d(".current-fee").textContent=b(v)})}function bt(e){const t=new Worker("/js/worker/view-fetcher.js");return t.onmessage=s=>{e(s)},t}async function wt(){const{saleNo:e,lotNo:t}=O();if(!e||!t)return;const s=await Z();if(s&&s.IS_LOGIN==="Y"){const o=s.IS_EMPLOYEE==="Y",u=s.IS_MEMBERSHIP==="Y",r=s.CUST_NO;L(h.update({isLogin:!0,isEmployee:o,isMembership:u,custNo:r}))}const i=await q(e);i&&L(h.update({isAuthorized:i.CNT>0,phoneNo:i.HP}));const a=await Q(e);if(a){let o={...a};a.PREVIEW_JSON&&(o.previewInfo=JSON.parse(a.PREVIEW_JSON)),a.TITLE_JSON&&(o.titleInfo=JSON.parse(a.TITLE_JSON));const u=a.END_DT,r=window.moment(u).isBefore(window.moment());L(h.update({sale:o,isEnd:r}))}a&&a.CURR_CD&&L(h.update({currency:a.CURR_CD}));const l=(await tt(e)).find(o=>o.LOT_NO===t&&o.INTE_LOT==="Y"&&o.INTE_LOT_DEL==="N"),p=await et(e,t);if(p){const o={...p,isFavorite:!!l};L(h.update({lotDetail:o}))}if(p!=null&&p.ARTIST_NO){const o=await at(p.ARTIST_NO);L(h.update({artist:o}))}}function yt(){D(()=>{const{lotDetail:e}=O();if(!e)return;const t=d(".go-bid-btn"),s=d(".go-bid-btn span");e.END_YN==="Y"||e.TO_DT&&!st(e.TO_DT).isAfter?(t.classList.replace("btn_point","btn_gray"),s.textContent="\uACBD\uB9E4 \uACB0\uACFC\uBCF4\uAE30"):(t.classList.replace("btn_gray","btn_point"),s.textContent="\uC751\uCC30\uD558\uAE30")})}window.addEventListener("DOMContentLoaded",it);window.onload=async()=>{const e=k("/auction/online/{saleNo}/{lotNo}"),t=e.saleNo?Number(e.saleNo):null,s=e.lotNo?Number(e.lotNo):null,i=x();if(!t||!s){await nt({html:"<div>\uC811\uADFC\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4</div>"});return}await L(h.update({viewPolling:!0,saleNo:t,lotNo:s,lang:i})),St(),It(),yt(),ft(),await wt(),await pt(t,s),await ut(t),d(".js-dropdown-btn span").textContent=`LOT ${s}`;const a=bt(n=>{if(!n.data)return;const l=n.data,{lotDetail:p}=O();!p||ot({lotDetail:lt(p,o=>{o.BID_CNT=l.BID_CNT,o.END_YN=l.END_YN,o.EXPE_PRICE_FROM_JSON=l.EXPE_PRICE_FROM_JSON,o.EXPE_PRICE_TO_JSON=l.EXPE_PRICE_TO_JSON,o.GROW_PRICE=l.GROW_PRICE,o.LAST_PRICE=l.LAST_PRICE,o.START_PRICE=l.START_PRICE,o.STAT_CD=l.STAT_CD,o.FROM_DT=l.FROM_DT,o.TO_DT=l.TO_DT})})});setInterval(()=>{const{viewPolling:n,isEnd:l}=O();l||!n||a.postMessage({saleNo:t,lotNo:s})},2e3),N(".js-dropdown-btn","click",async n=>{n.preventDefault(),n.stopPropagation();const l=n.currentTarget;await rt(l)}),N(".sns_share","click",Tt),N(".js-share_kakao","click",vt),N(".js-share_url","click",Nt),N(".print-btn","click",gt),N(".go-bid-btn","click",async n=>{n.preventDefault(),await ct()}),F(".bid-fee-btn","click",Ct),N(".bid-grow-price-btn","click",mt),N(".js-work_heart","click",Lt),N("toggle-direct-lot-popup","click",ht),N(".js-lotbox-btn","click",async n=>{n.preventDefault(),await dt()}),window.addEventListener("click",Ot)};$(window).on("scroll resize",function(){_t()});
