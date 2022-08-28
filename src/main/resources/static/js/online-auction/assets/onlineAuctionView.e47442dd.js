import{y as P,x as F,g as m,s as x,c as I,d as M,q as u,n as D,m as H,B,t as v,D as G,o as Y,e as z,h as X,j as U,r as O,f as L,E as V,u as q,k as T,l as b,v as W,w as K,F as Z,G as Q,H as tt,z as et,A as at}from"./sale.422de7f7.js";async function j(e){const t=window.localStorage.getItem(`recent-lot-${e}`);return t?JSON.parse(t):[]}async function st(e,t){const s=Number(t);let a=(await j(e)).filter(o=>o!==s);a.unshift(s),a=a.slice(0,5),window.localStorage.setItem(`recent-lot-${e}`,JSON.stringify(a))}async function it(e){const t=P(),s=document.getElementById("recent-view-list");s.querySelector("ul").remove();const a=await j(e);if(a.length<1)return;const o=document.createElement("ul");o.classList.add("product-list");const{rows:d,totalCount:c}=await F({saleNo:e,lotList:a},!0);if(c===0)return;let n=a.map(_=>{const r=d.find(p=>p.LOT_NO===_);if(!r)return"";const h=JSON.parse(r.TITLE_JSON)[t],f=r.ARTIST_NAME_JSON?JSON.parse(r.ARTIST_NAME_JSON)[t]:"&nbsp;",N=(r==null?void 0:r.isFavorite)||!1;let l="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in r&&"LOT_IMG_NAME"in r&&(l=`https://www.seoulauction.com/nas_img/${r.LOT_IMG_PATH}/${r.LOT_IMG_NAME}`),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${e}/${_}" class="img-align">
                  <img src="${l}" alt="${f} - ${h}">
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${_} </span>
                  </a>
                  <a class="${N?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${N?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${f}</span></a>
                  </div>
                  <div class="desc"><a href="#"><span>${h}</span></a></div>
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
    `});o.insertAdjacentHTML("beforeend",n.join(`
`)),s.appendChild(o)}function ot(){const e=m("data-artist-info-container");x(()=>{const{lang:t,artist:s}=I();if(!s){e.style.display="none";return}const i=s;let a="";const o=JSON.parse(i.profile);t!=="ko"&&!o[t]?a=o.ko:a=o[t];let d="";const c=JSON.parse(i.articles);c&&c.articles.length>0&&(d+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,c.articles.forEach(l=>{const p=t==="en"?l.titleEn:l.titleKo;d+=`<a href="${l.url}" target="_blank" class="sub-links">\u201C${p}\u201D</a>`}));const n=i.imageList,_=JSON.parse(i.media),r=_.youtube.reduce((l,p,C)=>{if(p){const g=`youtube${C}`;if(l[g]={url:p},n.length>0){const w=n.find(E=>E.tag===g);w&&(l[g].thumbnail=w.cdn_url)}}return l},{}),h=_.instagram.reduce((l,p,C)=>{if(p){const g=`youtube${C}`;if(l[g]={url:p},n.length>0){const w=n.find(E=>E.tag===g);w&&(l[g].thumbnail=w.cdn_url)}}return l},{}),f={...r,...h},N=Object.keys(f).map(l=>`
      <a href="${f[l].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${f[l].thumbnail}" alt="" />
      </a>
    `).join(`
`);m("data-artist-profile").innerHTML=a,m("data-artist-articles").innerHTML=d,m("data-media-video").innerHTML=N,e.style.display="block",M('#data-artist-info-container a[target="_blank"]',"click",l=>{l.preventDefault();const p=l.currentTarget;window.open(p.href,"_blank")})})}function nt(){let e=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),t=$("header.header").height()||0,s=$("footer.footer").height()||0,i=$(".type_panel-product_view > .panel-footer").height()||0,a=110+i+120+s;e.setTopStart(t+56),e.setBottomStop(a)}function lt(e){const t=u(".js-work_heart");e?t.classList.add("on"):t.classList.remove("on")}async function rt(e){e.preventDefault(),e.stopPropagation();const t=e.currentTarget;t.classList.contains("on")?(t.classList.remove("on"),u(".sns_layer-area").style.display="none"):(t.classList.add("on"),u(".sns_layer-area").style.display="block")}async function ct(){}async function dt(){}async function pt(e){e.preventDefault();const t=D("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${t==null?void 0:t.saleNo}/${t==null?void 0:t.lotNo}`}async function ut(e){e.preventDefault(),await H()}async function ft(e){e.preventDefault();const t=await B({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",beforeClose:s=>{u(".popupfixed-wrap",s).style.display="none"}});!t||(await t.init(),await t.open(s=>{u(".popupfixed-wrap",s).style.display="block"}),v(u(".btn_close",t.root),"click",s=>{s.preventDefault(),t.close(null)}))}async function gt(e){e.preventDefault();const t=await B({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",beforeClose:s=>{s.querySelector(".popupfixed-wrap").style.display="none"}});!t||(await t.init(),await t.open(s=>{s.querySelector(".popupfixed-wrap").style.display="block"}),v(u(".btn_close",t.root),"click",s=>{s.preventDefault(),t.close(null)}))}async function _t(e){if(e.preventDefault(),e.stopPropagation(),!G()){await Y();return}const{saleNo:t,lotNo:s}=D("/auction/online/{saleNo}/{lotNo}"),i=e.currentTarget;i.classList.contains("on")?(await z(t,s),i.classList.add("on")):(await X(t,s),i.classList.remove("on"))}async function mt(e){var a;e.preventDefault(),e.stopPropagation();const t=e.currentTarget,s="online-direct-lot-select";if(!document.getElementById(s)){const o=document.getElementById(`${s}-template`),d=document.importNode(o.content,!0);(a=t.parentNode)==null||a.appendChild(d)}const i=document.getElementById("online-direct-lot-select");t.classList.contains("active")?(t.classList.remove("active"),i.classList.remove("open"),i.style.display="none"):(t.classList.add("active"),i.classList.add("open"),i.style.display="block")}async function vt(e){e.preventDefault()}async function ht(e){var s,i;(s=u(".sns_share"))!=null&&s.classList.contains("on")&&e.target.closest(".sns_layer-area")===null&&(u(".sns_share").classList.remove("on"),u(".sns_layer-area").style.display="none"),(i=document.getElementById("online-direct-lot-select"))!=null&&i.classList.contains("open")&&e.target.closest("#online-direct-lot-select")===null&&(m("toggle-direct-lot-popup").classList.remove("active"),m("online-direct-lot-select").classList.remove("on"),m("online-direct-lot-select").style.display="none");const t=u(".js-dropdown-btn.active");t&&!e.target.closest(".trp-dropdown_list-box")&&(t.classList.remove("active"),u(".trp-dropdown_list-box").style.display="none",u('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function Nt(){x(()=>{const{lang:e,lotNo:t,sale:s,lotDetail:i}=I();if(!s||!i)return;const a=i,d=JSON.parse(a.TITLE_JSON)[e]||"";let c=a.imageList,n=[],_=[];c&&c.length>0&&c.forEach((y,R)=>{const J=`${y.IMAGE_URL}${y.FILE_PATH}/${y.FILE_NAME}`;n.push(`
        <div class="slide images" data-index="${R}">
          <figure class="img-ratio">
            <div class="img-align">
              <img src="${J}" alt="${y.FILE_NAME}" />
            </div>
          </figure>
          <div class="line"></div>
        </div>
      `),_.push(`
        <div class="swiper-slide" data-index="${R}">
          <div class="image-area">
            <figure class="img-ratio">
              <div class="img-align">
                <img src="${J}" alt="${y.FILE_NAME}" />
              </div>
            </figure>
           </div>
        </div>
      `)});let r="";a.ARTIST_NAME_JSON&&(r=JSON.parse(a.ARTIST_NAME_JSON)[e]||"&nbsp;");let h="&nbsp;";a.BORN_YEAR&&a.DIE_YEAR?h=`${a.BORN_YEAR} ~ ${a.DIE_YEAR}`:a.BORN_YEAR&&(h=`b.${a.BORN_YEAR}`);let f;switch(e){case"ko":f=a.TITLE_KO_TXT||"&nbsp;";break;case"en":f=a.TITLE_EN_TXT||"&nbsp;";break;case"zh":f=a.TITLE_EN_TXT||"&nbsp;";break;default:f="&nbsp;";break}let N=[],l="&nbsp;";e==="ko"?l=a.MATE_NM:(e==="en"||e==="zh")&&(l=a.MATE_NM_EN),N.push(l);let p="&nbsp;";a.LOT_SIZE_STRING?p=a.LOT_SIZE_STRING:a.LOT_SIZE_JSON&&(p=U(JSON.parse(a.LOT_SIZE_JSON))),N.push(p);const C=JSON.parse(a.SIGN_INFO_JSON);C[e]&&N.push(C[e]);let g=[];const w=JSON.parse(a.COND_RPT_JSON)[e];w&&g.push(`
        <div class="info-sub-box">
          <div class="tit tt5">CONDITION</div>
          <div class="desc">${w}</div>
        </div>
      `);const E=JSON.parse(a.PROV_INFO_JSON)[e];E&&g.push(`
        <div class="info-sub-box">
          <div class="tit tt5">PROVENANCE</div>
          <div class="desc">${E}</div>
        </div>
      `);const S=JSON.parse(a.LITE_INFO_JSON)[e];S&&g.push(`
        <div class="info-sub-box">
          <div class="tit tt5">LITERATURE</div>
          <div class="desc">${S}</div>
        </div>
      `),JSON.parse(a.EXHI_INFO_JSON)[e]&&g.push(`
        <div class="info-sub-box">
          <div class="tit tt5">EXHIBITED</div>
          <div class="desc">${S}</div>
        </div>
      `);let A="";const k=JSON.parse(a.CMMT_JSON);k[e]&&(A=k[e]),m("data-sale-title").textContent=d,O("data-lot-image",`<div class="swiper-wrapper">${_.join(`
`)}</div>`),O("data-lot-thumbnail",`<div class="swiper-wrapper">${n.join(`
`)}</div>`),m("data-lot-no").textContent=`${t}`,m("data-artist-name").textContent=r,m("data-artist-born-year").textContent=h,m("data-lot-title").textContent=f,O("data-lot-basic-desc",N.filter(Boolean).join("<br/>")),A&&(m("data-lot-description").textContent=A),g.length>0&&O("data-lot-additional-info",g.join(`
`)),a.isFavorite&&lt(a.isFavorite)})}function wt(){x(()=>{const{lotDetail:e}=I();if(!e)return;const t=e,s=t.CURR_CD||"KRW",i=t.EXPE_PRICE_INQ_YN==="Y";let a="";t.EXPE_PRICE_FROM_JSON&&(a=`${L(JSON.parse(t.EXPE_PRICE_FROM_JSON)[s])||0}`);let o="";t.EXPE_PRICE_TO_JSON&&(o=`${L(JSON.parse(t.EXPE_PRICE_TO_JSON)[s])||0}`);let d=`${s} 0`;t.STAT_CD!=="reentry"&&t.START_PRICE&&(d=`${s} ${L(t.START_PRICE)}`);const n=t.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",_=t.LAST_PRICE||0,r=t.BID_CNT&&t.BID_CNT>0?t.BID_CNT:0,h=window.moment(t.TO_DT).format("M/D(ddd) HH:mm"),f=t.LAST_PRICE?V(t.LAST_PRICE*.18):0;O("lot-detail-price-area",`
      <dl class="price-list">
        <dt>\uCD94\uC815\uAC00</dt>
        <dd id="data-expect-price">
          ${i?'<span id="data-expe-no-price">\uCD94\uC815\uAC00 \uBCC4\uB3C4\uBB38\uC758</span>':""}
          ${!i&&(a||o)?`<span id="data-expe-currency">${s}</span>`:""}
          ${!i&&a?`<span id="data-expe-from">${a}</span>`:""}
          ${i?"":"<span> ~ </span>"}
          ${!i&&o?`<span id="data-expe-to">${o}</span>`:""}  
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uC2DC\uC791\uAC00</dt>
        <dd id="data-start-price">${d}</dd>
      </dl>
      <dl class="price-list">
        <dt id="data-last-price-title">${n}</dt>
        <dd>
          <strong id="data-last-price">${s} ${L(_)}</strong>
          <em id="data-bid-count">(\uC751\uCC30 ${L(r)})</em>
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uB9C8\uAC10\uC77C</dt>
        <dd id="data-to-date">${h}</dd>
      </dl>
    `),u(".current-fee").textContent=L(f)})}function Tt(e){const t=new Worker("/js/worker/view-fetcher.js");return t.onmessage=s=>{e(s)},t}async function bt(){const{saleNo:e,lotNo:t}=I();if(!e||!t)return;const s=await q();if(s&&s.IS_LOGIN==="Y"){const n=s.IS_EMPLOYEE==="Y",_=s.IS_MEMBERSHIP==="Y",r=s.CUST_NO;T(b.update({isLogin:!0,isEmployee:n,isMembership:_,custNo:r}))}const i=await W(e);i&&i.CNT>0&&T(b.update({isAuthorized:!0}));const a=await K(e);if(a){let n={...a};a.PREVIEW_JSON&&(n.previewInfo=JSON.parse(a.PREVIEW_JSON)),a.TITLE_JSON&&(n.titleInfo=JSON.parse(a.TITLE_JSON)),T(b.update({sale:n}))}a&&a.CURR_CD&&T(b.update({currency:a.CURR_CD}));const d=(await Z(e)).find(n=>n.LOT_NO===t&&n.INTE_LOT==="Y"&&n.INTE_LOT_DEL==="N"),c=await Q(e,t);if(c){const n={...c,isFavorite:!!d};T(b.update({lotDetail:n}))}if(c!=null&&c.ARTIST_NO){const n=await tt(c.ARTIST_NO);T(b.update({artist:n}))}}function Ct(){let e=document.createElement("style");e.textContent=`    
    .select2-container.select2-container--open {
      z-index: 10;
    }

    .swal2-styled.swal2-confirm:focus {
      box-shadow: 0 0 1px 2px rgba(33, 160, 153, 0.2) !important;
    }

    .sa-popup .swal2-popup {
      width: 50%;
      max-width: 40rem;
    }

    .sa-popup .info-icon {
      padding: 2rem 0;
    }

    .sa-popup .swal2-popup {
      border-top: 6px solid #21a099;
      border-radius: 0;
    }

    .sa-popup .gray-box {
      padding: 25px 30px;
      margin-top: 30px;
      background-color: #f6f6f6;
      font-size: 16px;
      margin-bottom: 1rem;
    }

    .sa-popup .mark_dot-list li {
      text-align: left;
    }

    .sa-popup .query {
      color: #333;
      font-weight: 500;
    }

    .sa-popup .title {
      font-size: 36px;
      font-weight: 600;
      color: #333;
    }

    .sa-popup .swal2-actions {
      flex-direction: row-reverse;
      width: 100%;
    }

    .sa-popup .swal2-actions .swal2-styled.swal2-confirm {
      background-color: #21a099;
      border-radius: 0;
      font-size: 16px;
      flex: 0 0 10rem;
      padding: 1rem 0;
    }

    .sa-popup .swal2-actions .swal2-styled.swal2-cancel {
      background-color: #fff;
      border: 1px solid #333;
      color: #333;
      border-radius: 0;
      font-size: 16px;
      flex: 0 0 10rem;
      padding: 1rem 0;
    }

    @media (max-width: 568px) {
      .sa-popup .swal2-popup {
        width: 93%;
      }

      .sa-popup .info-icon .info-icon {
        padding-bottom: 0.5rem;
      }

      .sa-popup .info-icon .info-icon img {
        width: 4rem;
      }

      .sa-popup .title {
        font-size: 23px;
      }

      .sa-popup .mark_dot-list li {
        font-size: 13px;
      }
    }
  `,document.head.appendChild(e),document.head.insertAdjacentHTML("beforeend",'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />')}window.addEventListener("DOMContentLoaded",Ct);window.onload=async()=>{const e=D("/auction/online/{saleNo}/{lotNo}"),t=e.saleNo?Number(e.saleNo):null,s=e.lotNo?Number(e.lotNo):null,i=P();if(!t||!s){await et({html:"<div>\uC811\uADFC\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4</div>"});return}await T(b.update({viewPolling:!0,saleNo:t,lotNo:s,lang:i})),Nt(),wt(),ot(),await bt(),await st(t,s),await it(t),u(".js-dropdown-btn span").textContent=`LOT ${s}`;const a=Tt(o=>{if(!o.data)return;const d=o.data,c=I().lotDetail;T(b.update({lotDetail:{...c,...d}}))});setInterval(()=>{a.postMessage({saleNo:t,lotNo:s})},2e3),v(".js-dropdown-btn","click",async o=>{o.preventDefault(),o.stopPropagation();const d=o.currentTarget;await at(d)}),v(".sns_share","click",rt),v(".js-share_kakao","click",ct),v(".js-share_url","click",dt),v(".print-btn","click",pt),v(".go-bid-btn","click",ut),M(".bid-fee-btn","click",ft),v(".bid-grow-price-btn","click",gt),v(".js-work_heart","click",_t),v("toggle-direct-lot-popup","click",mt),v(".js-lotbox-btn","click",vt),window.addEventListener("click",ht)};$(window).on("scroll resize",function(){nt()});
