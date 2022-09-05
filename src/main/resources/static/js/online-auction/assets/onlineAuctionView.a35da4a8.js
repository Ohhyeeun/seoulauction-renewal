import{y as x,w as U,c as A,r as k,g as v,s as y,d as b,e as F,a as p,n as B,H as j,I as K,o as X,h as W,j as z,u as I,b as S,J as V,K as Z,k as T,l as h,L as q,M as Q,N as tt,O as et,P as at,f as st,x as nt,z as it,D as ot,v as C,F as lt,m as rt,G as ct}from"./polling.8a3265ad.js";async function H(e){const t=window.localStorage.getItem(`recent-lot-${e}`);return t?JSON.parse(t):[]}async function dt(e,t){const s=Number(t);let a=(await H(e)).filter(n=>n!==s);a.unshift(s),a=a.slice(0,5),window.localStorage.setItem(`recent-lot-${e}`,JSON.stringify(a))}async function pt(e){const t=x(),s=document.getElementById("recent-view-list");s.querySelector("ul").remove();const a=await H(e);if(a.length<1)return;const n=document.createElement("ul");n.classList.add("product-list");const{rows:c,totalCount:l}=await U({saleNo:e,lotList:a},!0);if(l===0)return;let o=a.map(u=>{const r=c.find(d=>d.LOT_NO===u);if(!r||r.STAT_CD==="reentry")return"";const E=JSON.parse(r.TITLE_JSON)[t],m=r.ARTIST_NAME_JSON?JSON.parse(r.ARTIST_NAME_JSON)[t]:"&nbsp;",g=(r==null?void 0:r.isFavorite)||!1;let N="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in r&&"LOT_IMG_NAME"in r&&(N=A(r.LOT_IMG_PATH,r.LOT_IMG_NAME,"thum")),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${e}/${u}" class="img-align">
                  ${k(N,`${m} - ${E}`)}
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${u} </span>
                  </a>
                  <a class="${g?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${g?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${m}</span></a>
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
`)),s.appendChild(n)}function ut(){const e=v("data-artist-info-container");y(()=>{const{lang:t,artist:s,lotDetail:i}=b();if(!i||!s){e.style.display="none";return}const a=s;let n="";const c=JSON.parse(a.PROFILE_JSON);t!=="ko"&&!c[t]?n=c.ko:n=c[t];let l="";const o=JSON.parse(a.ARTICLES_JSON);o&&o.articles.length>0&&(l+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,o.articles.forEach(d=>{const _=t==="en"?d.titleEn:d.titleKo;l+=`<a href="${d.url}" target="_blank" class="sub-links">\u201C${_}\u201D</a>`}));const u=a.imageList,r=JSON.parse(a.MEDIA_JSON),E=r.youtube.reduce((d,_,O)=>{if(_){const f=`youtube${O}`;if(d[f]={url:_},u.length>0){const L=u.find(w=>w.tag===f);L&&(d[f].thumbnail=L.cdn_url)}}return d},{}),m=r.instagram.reduce((d,_,O)=>{if(_){const f=`youtube${O}`;if(d[f]={url:_},u.length>0){const L=u.find(w=>w.tag===f);L&&(d[f].thumbnail=L.cdn_url)}}return d},{}),g={...E,...m},N=Object.keys(g).map(d=>`
      <a href="${g[d].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${g[d].thumbnail}" alt="" />
      </a>
    `).join(`
`);v("data-artist-profile").innerHTML=n,v("data-artist-articles").innerHTML=l,v("data-media-video").innerHTML=N,e.style.display="block",F('#data-artist-info-container a[target="_blank"]',"click",d=>{d.preventDefault();const _=d.currentTarget;window.open(_.href,"_blank")})})}function ft(){let e=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),t=$("header.header").height()||0,s=$("footer.footer").height()||0,i=$(".type_panel-product_view > .panel-footer").height()||0,a=110+i+120+s;e.setTopStart(t+56),e.setBottomStop(a)}function _t(e){const t=p(".js-work_heart");e?t.classList.add("on"):t.classList.remove("on")}async function vt(e){e.preventDefault(),e.stopPropagation();const t=e.currentTarget;t.classList.contains("on")?(t.classList.remove("on"),p(".sns_layer-area").style.display="none"):(t.classList.add("on"),p(".sns_layer-area").style.display="block")}async function gt(e){e.preventDefault();const t=B("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${t==null?void 0:t.saleNo}/${t==null?void 0:t.lotNo}`}async function mt(e){e.preventDefault();const t=await j({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",closeBtnSelector:[".js-closepop"],beforeClose:n=>{p(".popupfixed-wrap",n).style.display="none",p(".pop-panel",n).classList.remove("open")}});if(!t)return;const{root:s,init:i,open:a}=t;await i(),p(".popupfixed-wrap",s).style.display="block",p(".pop-panel",s).classList.add("open"),await a()}async function Nt(e){e.preventDefault();const t=await j({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",closeBtnSelector:[".js-closepop"],beforeClose:n=>{p(".popupfixed-wrap",n).style.display="none",p(".pop-panel",n).classList.remove("open")}});if(!t)return;const{root:s,init:i,open:a}=t;await i(),p(".popupfixed-wrap",s).style.display="block",p(".pop-panel",s).classList.add("open"),await a()}async function Ct(e){if(e.preventDefault(),e.stopPropagation(),!K()){await X();return}const{saleNo:t,lotNo:s}=B("/auction/online/{saleNo}/{lotNo}"),i=e.currentTarget;i.classList.contains("on")?(await W(t,s),i.classList.add("on")):(await z(t,s),i.classList.remove("on"))}async function Et(e){var a;e.preventDefault(),e.stopPropagation();const t=e.currentTarget,s="online-direct-lot-select";if(!document.getElementById(s)){const n=document.getElementById(`${s}-template`),c=document.importNode(n.content,!0);(a=t.parentNode)==null||a.appendChild(c)}const i=document.getElementById("online-direct-lot-select");t.classList.contains("active")?(t.classList.remove("active"),i.classList.remove("open"),i.style.display="none"):(t.classList.add("active"),i.classList.add("open"),i.style.display="block")}async function Lt(e){var s,i;(s=p(".sns_share"))!=null&&s.classList.contains("on")&&e.target.closest(".sns_layer-area")===null&&(p(".sns_share").classList.remove("on"),p(".sns_layer-area").style.display="none"),(i=document.getElementById("online-direct-lot-select"))!=null&&i.classList.contains("open")&&e.target.closest("#online-direct-lot-select")===null&&(v("toggle-direct-lot-popup").classList.remove("active"),v("online-direct-lot-select").classList.remove("on"),v("online-direct-lot-select").style.display="none");const t=p(".js-dropdown-btn.active");t&&!e.target.closest(".trp-dropdown_list-box")&&(t.classList.remove("active"),p(".trp-dropdown_list-box").style.display="none",p('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function Tt(){y(()=>{const{lang:e,lotNo:t,sale:s,lotDetail:i}=b();if(!s||!i)return;const a=i,c=JSON.parse(a.TITLE_JSON)[e]||"";let l=a.imageList,o=[],u=[];l&&l.length>0&&l.forEach((D,M)=>{const Y=A(D.FILE_PATH,D.FILE_NAME,"detail");o.push(`
          <div class="slide images" data-index="${M}">
            <figure class="img-ratio">
              <div class="img-align">
                ${k(Y)}
              </div>
            </figure>
            <div class="line"></div>
          </div>
        `);const G=A(D.FILE_PATH,D.FILE_NAME,"detail");u.push(`
          <div class="swiper-slide" data-index="${M}">
            <div class="image-area">
              <figure class="img-ratio">
                <div class="img-align">
                  ${k(G)}
                </div>
              </figure>
            </div>
          </div>
        `)});let r="";a.ARTIST_NAME_JSON&&(r=JSON.parse(a.ARTIST_NAME_JSON)[e]||"&nbsp;");const E=!!r.match(/(김환기|박수근|(Kim WhanKi)|(Park SooKeun)|金煥基|朴壽根)/gi);let m="";a.BORN_YEAR&&a.DIE_YEAR?m=`${a.BORN_YEAR} ~ ${a.DIE_YEAR}`:a.BORN_YEAR&&(m=`b.${a.BORN_YEAR}`);let g;switch(e){case"ko":g=a.TITLE_KO_TXT||"&nbsp;";break;case"en":g=a.TITLE_EN_TXT||"&nbsp;";break;case"zh":g=a.TITLE_EN_TXT||"&nbsp;";break;default:g="&nbsp;";break}let N=[],d="&nbsp;";e==="ko"?d=a.MATE_NM:(e==="en"||e==="zh")&&(d=a.MATE_NM_EN),N.push(d);let _="";a.LOT_SIZE_STRING?_=a.LOT_SIZE_STRING:a.LOT_SIZE_JSON&&(_=js_size_text_cm(JSON.parse(a.LOT_SIZE_JSON))),N.push(_);const O=JSON.parse(a.SIGN_INFO_JSON);O[e]&&N.push(O[e]);let f=[];const L=JSON.parse(a.COND_RPT_JSON)[e];L&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">CONDITION</div>
          <div class="desc">${L}</div>
        </div>
      `);const w=JSON.parse(a.PROV_INFO_JSON)[e];w&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">PROVENANCE</div>
          <div class="desc">${w}</div>
        </div>
      `);const J=JSON.parse(a.LITE_INFO_JSON)[e];J&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">LITERATURE</div>
          <div class="desc">${J}</div>
        </div>
      `),JSON.parse(a.EXHI_INFO_JSON)[e]&&f.push(`
        <div class="info-sub-box">
          <div class="tit tt5">EXHIBITED</div>
          <div class="desc">${J}</div>
        </div>
      `);let R="";const P=JSON.parse(a.CMMT_JSON);P[e]&&(R=P[e]),v("data-sale-title").textContent=c,I("data-lot-image",`<div class="swiper-wrapper">${u.join(`
`)}</div>`),I("data-lot-thumbnail",`<div class="swiper-wrapper">${o.join(`
`)}</div>`),v("data-lot-no").textContent=`${t}`,v("data-artist-name").textContent=r,v("data-artist-born-year").textContent=m,v("data-lot-title").textContent=g,I("data-lot-basic-desc",N.filter(Boolean).join("<br/>")),E&&p(".view_scale-area").remove(),R&&(v("data-lot-description").textContent=R),f.length>0&&I("data-lot-additional-info",f.join(`
`)),a.isFavorite&&_t(a.isFavorite)})}function ht(){y(()=>{const{lotDetail:e}=b();if(!e)return;const t=e,s=t.CURR_CD||"KRW",i=t.EXPE_PRICE_INQ_YN==="Y";let a="";t.EXPE_PRICE_FROM_JSON&&(a=`${S(JSON.parse(t.EXPE_PRICE_FROM_JSON)[s])||0}`);let n="";t.EXPE_PRICE_TO_JSON&&(n=`${S(JSON.parse(t.EXPE_PRICE_TO_JSON)[s])||0}`);let c=`${s} 0`;t.STAT_CD!=="reentry"&&t.START_PRICE&&(c=`${s} ${S(t.START_PRICE)}`);const o=t.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",u=t.LAST_PRICE||0,r=t.BID_CNT&&t.BID_CNT>0?t.BID_CNT:0,E=window.moment(t.TO_DT).format("M/D(ddd) HH:mm"),m=t.LAST_PRICE?V(t.LAST_PRICE*.18):0;I("lot-detail-price-area",`
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
          <strong id="data-last-price">${s} ${S(u)}</strong>
          <em id="data-bid-count">(\uC751\uCC30 ${S(r)})</em>
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uB9C8\uAC10\uC77C</dt>
        <dd id="data-to-date">${E}</dd>
      </dl>
    `),p(".current-fee").textContent=S(m)})}function bt(e){const t=new Worker("/js/worker/view-fetcher.js");return t.onmessage=s=>{e(s)},t}async function Ot(){const{saleNo:e,lotNo:t}=b();if(!e||!t)return;const s=await Z();if(s&&s.IS_LOGIN==="Y"){const o=s.IS_EMPLOYEE==="Y",u=s.IS_MEMBERSHIP==="Y",r=s.CUST_NO;T(h.update({isLogin:!0,isEmployee:o,isMembership:u,custNo:r}))}const i=await q(e);i&&T(h.update({isAuthorized:i.CNT>0,phoneNo:i.HP}));const a=await Q(e);if(a){let o={...a};a.PREVIEW_JSON&&(o.previewInfo=JSON.parse(a.PREVIEW_JSON)),a.TITLE_JSON&&(o.titleInfo=JSON.parse(a.TITLE_JSON));const u=a.END_DT,r=window.moment(u).isBefore(window.moment());T(h.update({sale:o,isEnd:r}))}a&&a.CURR_CD&&T(h.update({currency:a.CURR_CD}));const c=(await tt(e)).find(o=>o.LOT_NO===t&&o.INTE_LOT==="Y"&&o.INTE_LOT_DEL==="N"),l=await et(e,t);if(l){const o={...l,isFavorite:!!c};T(h.updateLotDetail(o))}if(l!=null&&l.ARTIST_NO){const o=await at(l.ARTIST_NO);T(h.update({artist:o}))}}function wt(){y(()=>{const{lotDetail:e}=b();if(!e)return;const t=p(".go-bid-btn"),s=p(".go-bid-btn span");e.END_YN==="Y"||e.TO_DT&&!st(e.TO_DT).isAfter?(t.classList.replace("btn_point","btn_gray"),s.textContent="\uACBD\uB9E4 \uACB0\uACFC\uBCF4\uAE30"):(t.classList.replace("btn_gray","btn_point"),s.textContent="\uC751\uCC30\uD558\uAE30")})}function St(){y(()=>{var u;const{sale:e,lotDetail:t,lang:s}=b();if(!e||!t||!t.imageList||((u=t.imageList)==null?void 0:u.length)===0)return;const i=t,{FILE_PATH:a,FILE_NAME:n}=t.imageList[0],c=A(a,n,"detail"),l=JSON.parse(e.TITLE_JSON)[s],o=JSON.parse(i.TITLE_JSON)[s];Kakao.init("cf2233f55e74d6d0982ab74909c97835"),Kakao.Link.createDefaultButton({container:"#kakao-share",objectType:"feed",content:{title:l,description:o,imageUrl:c,link:{mobileWebUrl:window.location.href,webUrl:window.location.href}},social:{likeCount:286,commentCount:45,sharedCount:845}})})}window.addEventListener("DOMContentLoaded",nt);window.onload=async()=>{const e=B("/auction/online/{saleNo}/{lotNo}"),t=e.saleNo?Number(e.saleNo):null,s=e.lotNo?Number(e.lotNo):null,i=x();if(!t||!s){await it({html:"<div>\uC811\uADFC\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4</div>"});return}await T(h.update({viewPolling:!0,saleNo:t,lotNo:s,lang:i})),Tt(),ht(),wt(),ut(),await Ot(),await dt(t,s),await pt(t),p(".js-dropdown-btn span").textContent=`LOT ${s}`,St();const a=bt(n=>{if(!n.data)return;const c=n.data,{lotDetail:l}=b();!l||T(h.updateLotDetail(c))});setInterval(()=>{const{viewPolling:n,isEnd:c}=b();c||!n||a.postMessage({saleNo:t,lotNo:s})},2e3),ot(),C(".js-dropdown-btn","click",async n=>{n.preventDefault(),n.stopPropagation();const c=n.currentTarget;await lt(c)}),C(".sns_share","click",vt),C(".js-share_url","click",n=>{n.preventDefault();let c=location.href,l=$("<input>");$("body").append(l),l.val(c).select(),document.execCommand("copy"),l.remove(),alert("URL\uC774 \uBCF5\uC0AC\uB418\uC5C8\uC2B5\uB2C8\uB2E4.")}),C(".print-btn","click",gt),C(".go-bid-btn","click",async n=>{n.preventDefault(),await rt()}),F(".bid-fee-btn","click",mt),C(".bid-grow-price-btn","click",Nt),C(".js-work_heart","click",Ct),C("toggle-direct-lot-popup","click",Et),C(".js-lotbox-btn","click",async n=>{n.preventDefault(),await ct()}),window.addEventListener("click",Lt)};$(window).on("scroll resize",function(){ft()});
