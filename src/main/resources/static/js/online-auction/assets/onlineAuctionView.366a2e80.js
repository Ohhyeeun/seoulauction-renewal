import{C as B,y as G,c as D,r as R,g as f,s as J,d as w,e as x,a as u,n as k,m as X,G as F,u as g,H as U,o as z,h as V,j as W,t as S,b as I,I as K,v as q,k as L,l as O,w as Z,x as Q,J as tt,K as et,L as at,B as st,D as it,E as nt,F as ot}from"./onContentLoaded.f7b246e0.js";async function H(e){const t=window.localStorage.getItem(`recent-lot-${e}`);return t?JSON.parse(t):[]}async function lt(e,t){const s=Number(t);let a=(await H(e)).filter(n=>n!==s);a.unshift(s),a=a.slice(0,5),window.localStorage.setItem(`recent-lot-${e}`,JSON.stringify(a))}async function rt(e){const t=B(),s=document.getElementById("recent-view-list");s.querySelector("ul").remove();const a=await H(e);if(a.length<1)return;const n=document.createElement("ul");n.classList.add("product-list");const{rows:c,totalCount:d}=await G({saleNo:e,lotList:a},!0);if(d===0)return;let o=a.map(p=>{const l=c.find(r=>r.LOT_NO===p);if(!l)return"";const E=JSON.parse(l.TITLE_JSON)[t],_=l.ARTIST_NAME_JSON?JSON.parse(l.ARTIST_NAME_JSON)[t]:"&nbsp;",N=(l==null?void 0:l.isFavorite)||!1;let C="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in l&&"LOT_IMG_NAME"in l&&(C=D(l.LOT_IMG_PATH,l.LOT_IMG_NAME,"thum")),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${e}/${p}" class="img-align">
                  ${R(C,`${_} - ${E}`)}
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${p} </span>
                  </a>
                  <a class="${N?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${N?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${_}</span></a>
                  </div>
                  <div class="desc"><a href="#"><span>${E}</span></a></div>
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
`)),s.appendChild(n)}function ct(){const e=f("data-artist-info-container");J(()=>{const{lang:t,artist:s,lotDetail:i}=w();if(!i||!s){e.style.display="none";return}const a=s;let n="";const c=JSON.parse(a.PROFILE_JSON);t!=="ko"&&!c[t]?n=c.ko:n=c[t];let d="";const o=JSON.parse(a.ARTICLES_JSON);o&&o.articles.length>0&&(d+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,o.articles.forEach(r=>{const v=t==="en"?r.titleEn:r.titleKo;d+=`<a href="${r.url}" target="_blank" class="sub-links">\u201C${v}\u201D</a>`}));const p=a.imageList,l=JSON.parse(a.MEDIA_JSON),E=l.youtube.reduce((r,v,T)=>{if(v){const m=`youtube${T}`;if(r[m]={url:v},p.length>0){const h=p.find(b=>b.tag===m);h&&(r[m].thumbnail=h.cdn_url)}}return r},{}),_=l.instagram.reduce((r,v,T)=>{if(v){const m=`youtube${T}`;if(r[m]={url:v},p.length>0){const h=p.find(b=>b.tag===m);h&&(r[m].thumbnail=h.cdn_url)}}return r},{}),N={...E,..._},C=Object.keys(N).map(r=>`
      <a href="${N[r].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${N[r].thumbnail}" alt="" />
      </a>
    `).join(`
`);f("data-artist-profile").innerHTML=n,f("data-artist-articles").innerHTML=d,f("data-media-video").innerHTML=C,e.style.display="block",x('#data-artist-info-container a[target="_blank"]',"click",r=>{r.preventDefault();const v=r.currentTarget;window.open(v.href,"_blank")})})}function dt(){let e=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),t=$("header.header").height()||0,s=$("footer.footer").height()||0,i=$(".type_panel-product_view > .panel-footer").height()||0,a=110+i+120+s;e.setTopStart(t+56),e.setBottomStop(a)}function pt(e){const t=u(".js-work_heart");e?t.classList.add("on"):t.classList.remove("on")}async function ut(e){e.preventDefault(),e.stopPropagation();const t=e.currentTarget;t.classList.contains("on")?(t.classList.remove("on"),u(".sns_layer-area").style.display="none"):(t.classList.add("on"),u(".sns_layer-area").style.display="block")}async function ft(){}async function _t(){}async function vt(e){e.preventDefault();const t=k("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${t==null?void 0:t.saleNo}/${t==null?void 0:t.lotNo}`}async function gt(e){e.preventDefault(),await X()}async function Nt(e){e.preventDefault();const t=await F({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",beforeClose:s=>{u(".popupfixed-wrap",s).style.display="none"}});!t||(await t.init(),await t.open(s=>{u(".popupfixed-wrap",s).style.display="block"}),g(u(".btn_close",t.root),"click",s=>{s.preventDefault(),t.close(null)}))}async function Et(e){e.preventDefault();const t=await F({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",beforeClose:s=>{s.querySelector(".popupfixed-wrap").style.display="none"}});!t||(await t.init(),await t.open(s=>{s.querySelector(".popupfixed-wrap").style.display="block"}),g(u(".btn_close",t.root),"click",s=>{s.preventDefault(),t.close(null)}))}async function Tt(e){if(e.preventDefault(),e.stopPropagation(),!U()){await z();return}const{saleNo:t,lotNo:s}=k("/auction/online/{saleNo}/{lotNo}"),i=e.currentTarget;i.classList.contains("on")?(await V(t,s),i.classList.add("on")):(await W(t,s),i.classList.remove("on"))}async function mt(e){var a;e.preventDefault(),e.stopPropagation();const t=e.currentTarget,s="online-direct-lot-select";if(!document.getElementById(s)){const n=document.getElementById(`${s}-template`),c=document.importNode(n.content,!0);(a=t.parentNode)==null||a.appendChild(c)}const i=document.getElementById("online-direct-lot-select");t.classList.contains("active")?(t.classList.remove("active"),i.classList.remove("open"),i.style.display="none"):(t.classList.add("active"),i.classList.add("open"),i.style.display="block")}async function Ct(e){var s,i;(s=u(".sns_share"))!=null&&s.classList.contains("on")&&e.target.closest(".sns_layer-area")===null&&(u(".sns_share").classList.remove("on"),u(".sns_layer-area").style.display="none"),(i=document.getElementById("online-direct-lot-select"))!=null&&i.classList.contains("open")&&e.target.closest("#online-direct-lot-select")===null&&(f("toggle-direct-lot-popup").classList.remove("active"),f("online-direct-lot-select").classList.remove("on"),f("online-direct-lot-select").style.display="none");const t=u(".js-dropdown-btn.active");t&&!e.target.closest(".trp-dropdown_list-box")&&(t.classList.remove("active"),u(".trp-dropdown_list-box").style.display="none",u('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function ht(){J(()=>{const{lang:e,lotNo:t,sale:s,lotDetail:i}=w();if(!s||!i)return;const a=i,c=JSON.parse(a.TITLE_JSON)[e]||"";let d=a.imageList,o=[],p=[];d&&d.length>0&&d.forEach((y,M)=>{const j=D(y.FILE_PATH,y.FILE_NAME,"detail");o.push(`
          <div class="slide images" data-index="${M}">
            <figure class="img-ratio">
              <div class="img-align">
                ${R(j)}
              </div>
            </figure>
            <div class="line"></div>
          </div>
        `);const Y=D(y.FILE_PATH,y.FILE_NAME,"detail");p.push(`
          <div class="swiper-slide" data-index="${M}">
            <div class="image-area">
              <figure class="img-ratio">
                <div class="img-align">
                  ${R(Y)}
                </div>
              </figure>
            </div>
          </div>
        `)});let l="";a.ARTIST_NAME_JSON&&(l=JSON.parse(a.ARTIST_NAME_JSON)[e]||"&nbsp;");let E="";a.BORN_YEAR&&a.DIE_YEAR?E=`${a.BORN_YEAR} ~ ${a.DIE_YEAR}`:a.BORN_YEAR&&(E=`b.${a.BORN_YEAR}`);let _;switch(e){case"ko":_=a.TITLE_KO_TXT||"&nbsp;";break;case"en":_=a.TITLE_EN_TXT||"&nbsp;";break;case"zh":_=a.TITLE_EN_TXT||"&nbsp;";break;default:_="&nbsp;";break}let N=[],C="&nbsp;";e==="ko"?C=a.MATE_NM:(e==="en"||e==="zh")&&(C=a.MATE_NM_EN),N.push(C);let r="";a.LOT_SIZE_STRING?r=a.LOT_SIZE_STRING:a.LOT_SIZE_JSON&&(r=js_size_text_cm(JSON.parse(a.LOT_SIZE_JSON))),N.push(r);const v=JSON.parse(a.SIGN_INFO_JSON);v[e]&&N.push(v[e]);let T=[];const m=JSON.parse(a.COND_RPT_JSON)[e];m&&T.push(`
        <div class="info-sub-box">
          <div class="tit tt5">CONDITION</div>
          <div class="desc">${m}</div>
        </div>
      `);const h=JSON.parse(a.PROV_INFO_JSON)[e];h&&T.push(`
        <div class="info-sub-box">
          <div class="tit tt5">PROVENANCE</div>
          <div class="desc">${h}</div>
        </div>
      `);const b=JSON.parse(a.LITE_INFO_JSON)[e];b&&T.push(`
        <div class="info-sub-box">
          <div class="tit tt5">LITERATURE</div>
          <div class="desc">${b}</div>
        </div>
      `),JSON.parse(a.EXHI_INFO_JSON)[e]&&T.push(`
        <div class="info-sub-box">
          <div class="tit tt5">EXHIBITED</div>
          <div class="desc">${b}</div>
        </div>
      `);let A="";const P=JSON.parse(a.CMMT_JSON);P[e]&&(A=P[e]),f("data-sale-title").textContent=c,S("data-lot-image",`<div class="swiper-wrapper">${p.join(`
`)}</div>`),S("data-lot-thumbnail",`<div class="swiper-wrapper">${o.join(`
`)}</div>`),f("data-lot-no").textContent=`${t}`,f("data-artist-name").textContent=l,f("data-artist-born-year").textContent=E,f("data-lot-title").textContent=_,S("data-lot-basic-desc",N.filter(Boolean).join("<br/>")),A&&(f("data-lot-description").textContent=A),T.length>0&&S("data-lot-additional-info",T.join(`
`)),a.isFavorite&&pt(a.isFavorite)})}function Lt(){J(()=>{const{lotDetail:e}=w();if(!e)return;const t=e,s=t.CURR_CD||"KRW",i=t.EXPE_PRICE_INQ_YN==="Y";let a="";t.EXPE_PRICE_FROM_JSON&&(a=`${I(JSON.parse(t.EXPE_PRICE_FROM_JSON)[s])||0}`);let n="";t.EXPE_PRICE_TO_JSON&&(n=`${I(JSON.parse(t.EXPE_PRICE_TO_JSON)[s])||0}`);let c=`${s} 0`;t.STAT_CD!=="reentry"&&t.START_PRICE&&(c=`${s} ${I(t.START_PRICE)}`);const o=t.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",p=t.LAST_PRICE||0,l=t.BID_CNT&&t.BID_CNT>0?t.BID_CNT:0,E=window.moment(t.TO_DT).format("M/D(ddd) HH:mm"),_=t.LAST_PRICE?K(t.LAST_PRICE*.18):0;S("lot-detail-price-area",`
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
        <dd id="data-start-price">${c}</dd>
      </dl>
      <dl class="price-list">
        <dt id="data-last-price-title">${o}</dt>
        <dd>
          <strong id="data-last-price">${s} ${I(p)}</strong>
          <em id="data-bid-count">(\uC751\uCC30 ${I(l)})</em>
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uB9C8\uAC10\uC77C</dt>
        <dd id="data-to-date">${E}</dd>
      </dl>
    `),u(".current-fee").textContent=I(_)})}function Ot(e){const t=new Worker("/js/worker/view-fetcher.js");return t.onmessage=s=>{e(s)},t}async function bt(){const{saleNo:e,lotNo:t}=w();if(!e||!t)return;const s=await q();if(s&&s.IS_LOGIN==="Y"){const o=s.IS_EMPLOYEE==="Y",p=s.IS_MEMBERSHIP==="Y",l=s.CUST_NO;L(O.update({isLogin:!0,isEmployee:o,isMembership:p,custNo:l}))}const i=await Z(e);i&&L(O.update({isAuthorized:i.CNT>0,phoneNo:i.HP}));const a=await Q(e);if(a){let o={...a};a.PREVIEW_JSON&&(o.previewInfo=JSON.parse(a.PREVIEW_JSON)),a.TITLE_JSON&&(o.titleInfo=JSON.parse(a.TITLE_JSON));const p=a.END_DT,l=window.moment(p).isBefore(window.moment());L(O.update({sale:o,isEnd:l}))}a&&a.CURR_CD&&L(O.update({currency:a.CURR_CD}));const c=(await tt(e)).find(o=>o.LOT_NO===t&&o.INTE_LOT==="Y"&&o.INTE_LOT_DEL==="N"),d=await et(e,t);if(d){const o={...d,isFavorite:!!c};L(O.update({lotDetail:o}))}if(d!=null&&d.ARTIST_NO){const o=await at(d.ARTIST_NO);L(O.update({artist:o}))}}window.addEventListener("DOMContentLoaded",st);window.onload=async()=>{const e=k("/auction/online/{saleNo}/{lotNo}"),t=e.saleNo?Number(e.saleNo):null,s=e.lotNo?Number(e.lotNo):null,i=B();if(!t||!s){await it({html:"<div>\uC811\uADFC\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4</div>"});return}await L(O.update({viewPolling:!0,saleNo:t,lotNo:s,lang:i})),ht(),Lt(),ct(),await bt(),await lt(t,s),await rt(t),u(".js-dropdown-btn span").textContent=`LOT ${s}`;const a=Ot(n=>{if(!n.data)return;const c=n.data,d=w().lotDetail;L(O.update({lotDetail:{...d,...c}}))});setInterval(()=>{const{viewPolling:n,isEnd:c}=w();c||!n||a.postMessage({saleNo:t,lotNo:s})},2e3),g(".js-dropdown-btn","click",async n=>{n.preventDefault(),n.stopPropagation();const c=n.currentTarget;await nt(c)}),g(".sns_share","click",ut),g(".js-share_kakao","click",ft),g(".js-share_url","click",_t),g(".print-btn","click",vt),g(".go-bid-btn","click",gt),x(".bid-fee-btn","click",Nt),g(".bid-grow-price-btn","click",Et),g(".js-work_heart","click",Tt),g("toggle-direct-lot-popup","click",mt),g(".js-lotbox-btn","click",async n=>{n.preventDefault(),await ot()}),window.addEventListener("click",Ct)};$(window).on("scroll resize",function(){dt()});
