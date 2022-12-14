import{z as F,x as K,c as y,r as k,g as f,s as A,d as C,e as z,a as p,n as J,I as H,J as Y,b as S,K as W,o as X,h as Z,j as q,v as D,L as Q,k as b,l as T,M as ee,N as te,O as ie,P as ae,Q as se,f as ne,R as x,y as oe,A as j,E as le,w as h,G as re,m as ce,H as de}from"./polling.4bd96d8d.js";async function G(t){const e=window.localStorage.getItem(`recent-lot-${t}`);return e?JSON.parse(e):[]}async function pe(t,e){const i=Number(e);let a=(await G(t)).filter(s=>s!==i);a.unshift(i),a=a.slice(0,5),window.localStorage.setItem(`recent-lot-${t}`,JSON.stringify(a))}async function ue(t){const e=F(),i=document.getElementById("recent-view-list");i.querySelector("ul").remove();const a=await G(t);if(a.length<1)return;const s=document.createElement("ul");s.classList.add("product-list");const{rows:c,totalCount:r}=await K({saleNo:t,lotList:a},!0);if(r===0)return;let o=a.map(l=>{const d=c.find(u=>u.LOT_NO===l);if(!d||d.STAT_CD==="reentry")return"";const _=JSON.parse(d.TITLE_JSON)[e],w=d.ARTIST_NAME_JSON?JSON.parse(d.ARTIST_NAME_JSON)[e]:"&nbsp;",v=(d==null?void 0:d.isFavorite)||!1;let L="/images/bg/no_image.jpg";return"LOT_IMG_PATH"in d&&"LOT_IMG_NAME"in d&&(L=y(d.LOT_IMG_PATH,d.LOT_IMG_NAME,"thum")),`
      <li>
         <div class="li-inner">
           <article class="item-article">
            <div class="image-area">
              <figure class="img-ratio">
                <a href="/auction/online/${t}/${l}" class="img-align">
                  ${k(L,`${w} - ${_}`)}
                </a>
              </figure>
            </div>
            <div class="typo-area">
              <div class="product_info">
                <div class="num_heart-box">
                  <a href="#">
                    <span class="num">${l} </span>
                  </a>
                  <a class="${v?"heart js-work_heart on":"heart js-work_heart"}">
                    <i class="${v?"icon-heart_on":"icon-heart_off"}"></i>
                  </a>
                </div>
                <div class="info-box">
                  <div class="title"><a href="#"><span>${w}</span></a>
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
    `});s.insertAdjacentHTML("beforeend",o.join(`
`)),i.appendChild(s)}function fe(){const t=f("data-artist-info-container");A(()=>{const{lang:e,artist:i,lotDetail:n}=C();if(!n||!i){t.style.display="none";return}const a=i;let s="";const c=JSON.parse(a.PROFILE_JSON);e!=="ko"&&!c[e]?s=c.ko:s=c[e];let r="";const o=JSON.parse(a.ARTICLES_JSON);o&&o.articles.length>0&&(r+=`<b>\uCC38\uACE0\uC790\uB8CC</b><br />
`,o.articles.forEach(u=>{const g=e==="en"?u.titleEn:u.titleKo;r+=`<a href="${u.url}" target="_blank" class="sub-links">\u201C${g}\u201D</a>`}));const l=a.imageList,d=JSON.parse(a.MEDIA_JSON),_=d.youtube.reduce((u,g,I)=>{if(g){const m=`youtube${I}`;if(u[m]={url:g},l.length>0){const E=l.find(O=>O.tag===m);E&&(u[m].thumbnail=E.cdn_url)}}return u},{}),w=d.instagram.reduce((u,g,I)=>{if(g){const m=`youtube${I}`;if(u[m]={url:g},l.length>0){const E=l.find(O=>O.tag===m);E&&(u[m].thumbnail=E.cdn_url)}}return u},{}),v={..._,...w},L=Object.keys(v).map(u=>`
      <a href="${v[u].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${v[u].thumbnail}" alt="" />
      </a>
    `).join(`
`);f("data-artist-profile").innerHTML=s,f("data-artist-articles").innerHTML=r,f("data-media-video").innerHTML=L,t.style.display="block",z('#data-artist-info-container a[target="_blank"]',"click",u=>{u.preventDefault();const g=u.currentTarget;window.open(g.href,"_blank")})})}function me(){let t=$(".js-product_detail-article").trpScrollSyncTopView({topStart:172,topMagin:172,bottomStop:1065}),e=$("header.header").height()||0,i=$("footer.footer").height()||0,n=$(".type_panel-product_view > .panel-footer").height()||0,a=110+n+120+i;t.setTopStart(e+56),t.setBottomStop(a)}function ge(t){const e=p(".js-work_heart");t?e.classList.add("on"):e.classList.remove("on")}async function ve(t){t.preventDefault(),t.stopPropagation();const e=t.currentTarget;e.classList.contains("on")?(e.classList.remove("on"),p(".sns_layer-area").style.display="none"):(e.classList.add("on"),p(".sns_layer-area").style.display="block")}async function _e(t){t.preventDefault();const e=J("/auction/online/{saleNo}/{lotNo}");window.location.href=`/auction/view/print/${e==null?void 0:e.saleNo}/${e==null?void 0:e.lotNo}`}async function we(t){t.preventDefault();const{lotDetail:e}=C();let i=0;e&&e.LAST_PRICE&&(i=H(e.LAST_PRICE*.18));const n=await Y({selector:"#auction-fee-popup",onCloseSelector:".popup-layer",closeBtnSelector:[".js-closepop"],beforeClose:r=>{p(".popupfixed-wrap",r).style.display="none",p(".pop-panel",r).classList.remove("open")}});if(!n)return;const{root:a,init:s,open:c}=n;await s(),p(".popupfixed-wrap",a).style.display="block",p(".pop-panel",a).classList.add("open"),p(".current-bid-fee",a).textContent=`\uD604\uC7AC\uAC00 \uAE30\uC900 ${S(i)}\uC6D0`,await c()}async function Ce(t){t.preventDefault();const e=await Y({selector:"#auction-grow-price-popup",onCloseSelector:".popup-layer",closeBtnSelector:[".js-closepop"],beforeClose:s=>{p(".popupfixed-wrap",s).style.display="none",p(".pop-panel",s).classList.remove("open")}});if(!e)return;const{root:i,init:n,open:a}=e;await n(),p(".popupfixed-wrap",i).style.display="block",p(".pop-panel",i).classList.add("open"),await a()}async function Le(t){if(t.preventDefault(),t.stopPropagation(),!W()){await X();return}const{saleNo:e,lotNo:i}=J("/auction/online/{saleNo}/{lotNo}"),n=t.currentTarget;n.classList.contains("on")?(await Z(e,i),n.classList.add("on")):(await q(e,i),n.classList.remove("on"))}async function he(t){var a;t.preventDefault(),t.stopPropagation();const e=t.currentTarget,i="online-direct-lot-select";if(!document.getElementById(i)){const s=document.getElementById(`${i}-template`),c=document.importNode(s.content,!0);(a=e.parentNode)==null||a.appendChild(c)}const n=document.getElementById("online-direct-lot-select");e.classList.contains("active")?(e.classList.remove("active"),n.classList.remove("open"),n.style.display="none"):(e.classList.add("active"),n.classList.add("open"),n.style.display="block")}async function Ee(t){var i,n;(i=p(".sns_share"))!=null&&i.classList.contains("on")&&t.target.closest(".sns_layer-area")===null&&(p(".sns_share").classList.remove("on"),p(".sns_layer-area").style.display="none"),(n=document.getElementById("online-direct-lot-select"))!=null&&n.classList.contains("open")&&t.target.closest("#online-direct-lot-select")===null&&(f("toggle-direct-lot-popup").classList.remove("active"),f("online-direct-lot-select").classList.remove("on"),f("online-direct-lot-select").style.display="none");const e=p(".js-dropdown-btn.active");e&&!t.target.closest(".trp-dropdown_list-box")&&(e.classList.remove("active"),p(".trp-dropdown_list-box").style.display="none",p('.trp-dropdown_list-box .search-box input[type="search"]').value="")}async function be(){A(()=>{const{lang:t,lotNo:e,sale:i,lotDetail:n}=C();if(!i||!n)return;const a=n,c=JSON.parse(a.TITLE_JSON)[t]||"";let r=a.imageList,o=[],l=[];r&&r.length>0&&r.forEach((N,M)=>{const U=y(N.FILE_PATH,N.FILE_NAME,"detail");o.push(`
          <div class="slide images" data-index="${M}">
            <figure class="img-ratio">
              <div class="img-align">
                ${k(U)}
              </div>
            </figure>
            <div class="line"></div>
          </div>
        `);const V=y(N.FILE_PATH,N.FILE_NAME,"detail");l.push(`
          <div class="swiper-slide" data-index="${M}">
            <div class="image-area">
              <figure class="img-ratio">
                <div class="img-align">
                  ${k(V)}
                </div>
              </figure>
            </div>
          </div>
        `)});let d="";a.ARTIST_NAME_JSON&&(d=JSON.parse(a.ARTIST_NAME_JSON)[t]||"&nbsp;");const _=!!d.match(/(?????????|?????????|(Kim WhanKi)|(Park SooKeun)|?????????|?????????)/gi);let w="";a.BORN_YEAR&&a.DIE_YEAR?w=`${a.BORN_YEAR} ~ ${a.DIE_YEAR}`:a.BORN_YEAR&&(w=`b.${a.BORN_YEAR}`);let v;switch(t){case"ko":v=a.TITLE_KO_TXT||"&nbsp;";break;case"en":v=a.TITLE_EN_TXT||"&nbsp;";break;case"zh":v=a.TITLE_EN_TXT||"&nbsp;";break;default:v="&nbsp;";break}let L=[],u="&nbsp;";t==="ko"?u=a.MATE_NM:(t==="en"||t==="zh")&&(u=a.MATE_NM_EN),L.push(u);let g="";a.LOT_SIZE_STRING?g=a.LOT_SIZE_STRING:a.LOT_SIZE_JSON&&(g=js_size_text_cm(JSON.parse(a.LOT_SIZE_JSON))),L.push(g);const I=JSON.parse(a.SIGN_INFO_JSON);I[t]&&L.push(I[t]);let m=[];const E=JSON.parse(a.COND_RPT_JSON)[t];E&&m.push(`
        <div class="info-sub-box">
          <div class="tit tt5">CONDITION</div>
          <div class="desc">${E}</div>
        </div>
      `);const O=JSON.parse(a.PROV_INFO_JSON)[t];O&&m.push(`
        <div class="info-sub-box">
          <div class="tit tt5">PROVENANCE</div>
          <div class="desc">${O}</div>
        </div>
      `);const R=JSON.parse(a.LITE_INFO_JSON)[t];R&&m.push(`
        <div class="info-sub-box">
          <div class="tit tt5">LITERATURE</div>
          <div class="desc">${R}</div>
        </div>
      `),JSON.parse(a.EXHI_INFO_JSON)[t]&&m.push(`
        <div class="info-sub-box">
          <div class="tit tt5">EXHIBITED</div>
          <div class="desc">${R}</div>
        </div>
      `);let P="";const B=JSON.parse(a.CMMT_JSON);if(B[t]&&(P=B[t]),f("data-sale-title").textContent=c,D("data-lot-image",`<div class="swiper-wrapper">${l.join(`
`)}</div>`),D("data-lot-thumbnail",`<div class="swiper-wrapper">${o.join(`
`)}</div>`),f("data-lot-no").textContent=`${e}`,f("data-artist-name").textContent=d,f("data-artist-born-year").textContent=w,f("data-lot-title").textContent=v,D("data-lot-basic-desc",L.filter(Boolean).join("<br/>")),_){p(".view_scale-area").remove();const N=p(".js-view_visual");N&&N.classList.remove("js-view_visual")}P?(f("data-lot-description-title").style.display="block",f("data-lot-description").textContent=P):(f("data-lot-description-title").style.display="none",f("data-lot-description").textContent=""),m.length>0&&D("data-lot-additional-info",m.join(`
`)),a.isFavorite&&ge(a.isFavorite)})}function Te(){A(()=>{const{lotDetail:t}=C();if(!t)return;const e=t,i=e.CURR_CD||"KRW",n=e.EXPE_PRICE_INQ_YN==="Y";let a="";e.EXPE_PRICE_FROM_JSON&&(a=`${S(JSON.parse(e.EXPE_PRICE_FROM_JSON)[i])||0}`);let s="";e.EXPE_PRICE_TO_JSON&&(s=`${S(JSON.parse(e.EXPE_PRICE_TO_JSON)[i])||0}`);let c=`${i} 0`;e.STAT_CD!=="reentry"&&e.START_PRICE&&(c=`${i} ${S(e.START_PRICE)}`);const o=e.END_YN==="Y"?"\uB099\uCC30\uAC00":"\uD604\uC7AC\uAC00",l=e.LAST_PRICE||0,d=e.BID_CNT&&e.BID_CNT>0?e.BID_CNT:0,_=window.moment(e.TO_DT).format("M/D(ddd) HH:mm"),w=e.LAST_PRICE?H(e.LAST_PRICE*.18):0;D("lot-detail-price-area",`
      <dl class="price-list">
        <dt>\uCD94\uC815\uAC00</dt>
        <dd id="data-expect-price">
          ${n?'<span id="data-expe-no-price">\uCD94\uC815\uAC00 \uBCC4\uB3C4\uBB38\uC758</span>':""}
          ${!n&&(a||s)?`<span id="data-expe-currency">${i}</span>`:""}
          ${!n&&a?`<span id="data-expe-from">${a}</span>`:""}
          ${n?"":"<span> ~ </span>"}
          ${!n&&s?`<span id="data-expe-to">${s}</span>`:""}  
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uC2DC\uC791\uAC00</dt>
        <dd id="data-start-price">${c}</dd>
      </dl>
      <dl class="price-list">
        <dt id="data-last-price-title">${o}</dt>
        <dd>
          <strong id="data-last-price">${i} ${S(l)}</strong>
          <em id="data-bid-count">(\uC751\uCC30 ${S(d)})</em>
        </dd>
      </dl>
      <dl class="price-list">
        <dt>\uB9C8\uAC10\uC77C</dt>
        <dd id="data-to-date">${_}</dd>
      </dl>
    `),p(".current-fee").textContent=S(w)})}function Ne(t){const e=new Worker("/js/worker/view-fetcher.js");return e.onmessage=i=>{t(i)},e}async function Se(){const{saleNo:t,lotNo:e}=C();if(!t||!e)return;const i=await Q();if(i&&i.IS_LOGIN==="Y"){const o=i.IS_EMPLOYEE==="Y",l=i.IS_MEMBERSHIP==="Y",d=i.IS_CUST_REQUIRED==="Y",_=i.CUST_NO;b(T.update({isLogin:!0,isEmployee:o,isMembership:l,isCertificated:d,custNo:_}))}const n=await ee(t);n&&b(T.update({isAuthorized:n.CNT>0,phoneNo:n.HP}));const a=await te(t);if(a){let o={...a};a.PREVIEW_JSON&&(o.previewInfo=JSON.parse(a.PREVIEW_JSON)),a.TITLE_JSON&&(o.titleInfo=JSON.parse(a.TITLE_JSON));const l=a.END_DT,d=window.moment(l).isBefore(window.moment());b(T.update({sale:o,isEnd:d}))}a&&a.CURR_CD&&b(T.update({currency:a.CURR_CD}));const c=(await ie(t)).find(o=>o.LOT_NO===e&&o.INTE_LOT==="Y"&&o.INTE_LOT_DEL==="N"),r=await ae(t,e);if(r){const o={...r,isFavorite:!!c};b(T.updateLotDetail(o))}if(r!=null&&r.ARTIST_NO){const o=await se(r.ARTIST_NO);b(T.update({artist:o}))}}function Ie(){A(()=>{const{lotDetail:t}=C();if(!t)return;const e=p(".go-bid-btn"),i=p(".go-bid-btn span");t.END_YN==="Y"||t.TO_DT&&!ne(t.TO_DT).isAfter?(e.classList.replace("btn_point","btn_gray"),i.textContent="\uACBD\uB9E4 \uACB0\uACFC\uBCF4\uAE30"):(e.classList.replace("btn_gray","btn_point"),i.textContent="\uC751\uCC30\uD558\uAE30")})}function Oe(){var l;const{sale:t,lotDetail:e,lang:i}=C();if(!t||!e||!e.imageList||((l=e.imageList)==null?void 0:l.length)===0)return;const n=e,{FILE_PATH:a,FILE_NAME:s}=e.imageList[0],c=y(a,s,"detail"),r=JSON.parse(t.TITLE_JSON)[i],o=JSON.parse(n.TITLE_JSON)[i];try{Kakao.init("cf2233f55e74d6d0982ab74909c97835"),Kakao.Link.createDefaultButton({container:"#kakao-share",objectType:"feed",content:{title:r,description:o,imageUrl:c,link:{mobileWebUrl:window.location.href,webUrl:window.location.href}},social:{likeCount:286,commentCount:45,sharedCount:845}})}catch(d){console.log(d)}}function ye(){var t=$(".js-view_visual").trpLayerFixedPopup("#popup_images-wrap");$(t.getBtn).on("click",function(o){o.preventDefault(),$("#popup_images-wrap .pop-panel").css("opacity",1),t.open(this),imagesResizePcMb(),window.imagesSwiper.update(),window.imagesSwiper.slideTo(1,0)}),$("body").on("click","#popup_images-wrap .js-closepop, #popup_images-wrap .popup-dim",function(o){o.preventDefault(),t.close()});var e=document.querySelector(".js-zoom_inout"),i="";function n(){i=Panzoom(e,{maxScale:4,minScale:1}),$(".js-zoomin").on("click",function(){i.zoomIn()}),$(".js-zoomout").on("click",function(){i.zoomOut()}),i.zoom(1,{animate:!0})}function a(){i.reset(),i.destroy(),i="",$(".js-zoomin").off("click"),$(".js-zoomout").off("click")}$("body").hasClass("is_pc")&&n();var s=0;window.imagesSwiper=new Swiper(".js-imagesSwiper .gallery_center",{loop:!0,simulateTouch:!0,pagination:{el:".js-imagesSwiper_pagination",type:"bullets"},paginationClickable:!0,breakpoints:{1023:{effect:"slide",simulateTouch:!0,slidesPerView:1,spaceBetween:10}},on:{transitionStart:function(){imagesResizePcMb(),$("body").hasClass("is_pc")&&i.reset()},transitionEnd:function(){window.imagesSwiper!=null&&(s=imagesSwiper.realIndex),imagesResizePcMb(),c()}}}),$(".images-popup .page_prev").on("click",function(o){o.preventDefault(),window.imagesSwiper.slidePrev()}),$(".images-popup .page_next").on("click",function(o){o.preventDefault(),window.imagesSwiper.slideNext()}),$(".js-thumbnail-list a").on("click",function(o){o.preventDefault(),s=$(this).closest("li").index(),window.imagesSwiper.slideTo(s+1),c()});function c(){$(".js-thumbnail-list li").removeClass("active"),$(".js-thumbnail-list li").eq(s).addClass("active")}$(window).on("resize",function(){imagesResizePcMb(),$("body").hasClass("is_mb")?i!=""&&a():i==""&&n()}),e.addEventListener("wheel",function(o){o.preventDefault(),i.zoomWithWheel(event),r(i.getScale())});function r(o){var l=trpRangeRatio(1,4,o,0,100);$(".js-slider").slider("value",l)}}function $e(){const t=f("popup_images-wrap");!t||A(()=>{const{lotDetail:e}=C();if(!e||!e.imageList||e.imageList.length<1)return;const i=e.imageList,n=i.map(l=>y(l.FILE_PATH,l.FILE_NAME)),a=p(".js-imagesSwiper .swiper-wrapper",t),s=n.map(l=>`
        <div class="swiper-slide">
          <div class="img-area">
            <div class="img-box">
              <div class="images">
                <img class="imageViewer" src="${l}" alt="${l}" />
              </div>
            </div>
          </div>
        </div>      
      `);x(a),a.insertAdjacentHTML("beforeend",s.join(`
`));const c=i.map(l=>y(l.FILE_PATH,l.FILE_NAME,"thum")),r=p(".thumbnail-article .thumbnail-list",t),o=c.map(l=>`
        <li>
          <a href="#">
            <div class="imgs-item">
              <figure class="img-ratio">
                <div class="img-align">
                  <img src="${l}" alt="${l}" />
                </div>
              </figure>
              <div class="line"></div>
            </div>
          </a>
        </li>
      `);x(r),r.insertAdjacentHTML("beforeend",o.join(`
`)),ye()})}function De(){var t=$(".js-popup_image_viewer").trpLayerFixedPopup("#popup_image_viewer-wrap");$(t.getBtn).on("click",function(i){i.preventDefault(),t.open(this),$("#popup_image_viewer-wrap .pop-panel").css("opacity",1),imagesResizePcMb(),e.update(),e.slideTo(1,0)}),$("body").on("click","#popup_image_viewer-wrap .js-closepop, #popup_image_viewer-wrap .popup-dim",function(i){i.preventDefault(),t.close()}),$(".js-size_btn").trpToggleBtn(function(i){$(i).closest(".viewer-article").addClass("active")},function(i){$(i).closest(".viewer-article").removeClass("active")});var e=new Swiper(".js-image_viewer .gallery_center",{loop:!0,on:{transitionStart:function(){imagesResizePcMb()},transitionEnd:function(){imagesResizePcMb()}}});$(".view_paging-area .page_prev").on("click",function(i){i.preventDefault(),e.slidePrev()}),$(".view_paging-area .page_next").on("click",function(i){i.preventDefault(),e.slideNext()}),$(window).on("resize",function(){imagesResizePcMb()})}window.addEventListener("DOMContentLoaded",oe);window.onload=async()=>{const t=J("/auction/online/{saleNo}/{lotNo}"),e=t.saleNo?Number(t.saleNo):null,i=t.lotNo?Number(t.lotNo):null,n=F();if(!e||!i){await j({html:"<div>\uC811\uADFC\uC774 \uC62C\uBC14\uB974\uC9C0 \uC54A\uC2B5\uB2C8\uB2E4</div>"});return}await b(T.update({viewPolling:!0,saleNo:e,lotNo:i,lang:n})),be(),Te(),Ie(),fe(),$e(),await Se(),await pe(e,i),await ue(e),p(".js-dropdown-btn span").textContent=`LOT ${i}`,Oe();const a=Ne(s=>{if(!s.data)return;const c=s.data,{lotDetail:r}=C();!r||b(T.updateLotDetail(c))});setInterval(()=>{const{viewPolling:s,isEnd:c}=C();!s||c||a.postMessage({saleNo:e,lotNo:i})},2e3),le(),h(".js-dropdown-btn","click",async s=>{s.preventDefault(),s.stopPropagation();const c=s.currentTarget;await re(c)}),De(),h(".sns_share","click",ve),h(".js-share_url","click",s=>{s.preventDefault();let c=location.href,r=$("<input>");$("body").append(r),r.val(c).select(),document.execCommand("copy"),r.remove(),j({html:"URL\uC774 \uBCF5\uC0AC\uB418\uC5C8\uC2B5\uB2C8\uB2E4"})}),h(".print-btn","click",_e),h(".go-bid-btn","click",s=>{s.preventDefault(),ce()}),z(".bid-fee-btn","click",we),h(".bid-grow-price-btn","click",Ce),h(".js-work_heart","click",Le),h("toggle-direct-lot-popup","click",he),h(".js-lotbox-btn","click",async s=>{s.preventDefault(),await de()}),window.addEventListener("click",Ee)};$(window).on("scroll resize",function(){me()});
