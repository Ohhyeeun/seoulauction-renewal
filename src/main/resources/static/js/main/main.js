
//메인팝업 첨에 하이드를 무조건 시킨다.
$('.main-popupbox').hide();

function Request(){
	this.getParameter = function(param){
    	var requestParam ="";
        var url = unescape(location.href);
        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");

        for(var i = 0 ; i < paramArr.length ; i++){
           var temp = paramArr[i].split("=");
           if(temp[0].toUpperCase() == param.toUpperCase()){
             requestParam = paramArr[i].split("=")[1];
             break;
           }
        }
        return requestParam;
    }
}
var request = new Request();
let isMainPopup = false;

//비밀번호초기화 팝업
if(resetPassword == 'true'){
	var popup_pwsearch6 = $(".js-popup_pwsearch6").trpLayerFixedPopup("#popup_pwsearch6-wrap");
    popup_pwsearch6.open(this); // or false 
    popup_fixation("#popup_pwsearch6-wrap"); // pc 하단 붙이기
}

function closeResetPassword(modYn){
	axios.get('/api/main/resetPassword')
		.then(function(response) {
		    var success = response.data.success;
		    if(!success){
		        alert(response.data.data.msg);
		        popup_pwsearch6.close();
		    } else {
				popup_pwsearch6.close();
				if(modYn == 'Y'){
					// TODO 차후 비밀번호 변경 페이지 개발시 수정
					location.href = '/mypage/passwordModify'
				}
		    }
		})
		.catch(function(error){
		    console.log(error);
    });
}
$("body").on("click", "#popup_pwsearch6-wrap .js-closepop, #popup_pwsearch6-wrap .popup-dim", function($e) {
    $e.preventDefault();
    closeResetPassword();
});

//비밀번호변경180일 팝업
if(modPassword == 'true'){
	var popup_pwsearch5 = $(".js-popup_pwsearch5").trpLayerFixedPopup("#popup_pwsearch5-wrap");
    popup_pwsearch5.open(this); // or false 
    popup_fixation("#popup_pwsearch5-wrap"); // pc 하단 붙이기
}
//30일뒤 재알림
function reAlarm(){
	axios.get('/api/main/reAlarm')
        .then(function(response) {
            var success = response.data.success;
            if(!success){
                alert(response.data.data.msg);
            }
            popup_pwsearch5.close();
        })
        .catch(function(error){
            console.log(error);
        });
}
//일정기간뒤 팝업 닫기 누르면 session 삭제 하는 API
function sleepAlarmNow(){
    axios.get('/api/main/sleepAlarmNow')
        .then(function(response) {
            var success = response.data.success;
            if(!success){
                alert(response.data.data.msg);
            }
            popup_pwsearch5.close();
        })
        .catch(function(error){
            console.log(error);
        });
}
//지금변경하기
function goModPassword(){

    sleepAlarmNow();
	location.href = '/mypage/passwordModify';
}

$("body").on("click", "#popup_pwsearch5-wrap .js-closepop, #popup_pwsearch5-wrap .popup-dim", function($e) {
    $e.preventDefault();
    popup_pwsearch5.close();
});
		

/************* 화면 작업 ***************/
const locale = document.documentElement.lang;
const sleep = (ms) => new Promise(resolve => { setTimeout(resolve, ms) });

//팝업은 미리 하이드.
//$('.main-popupBg').hide();

window.onload = function(){

    //팝업.
    loadPopup();

    //빅배너
    loadBigBanner();

    //상단텍스트공지
    loadTopNotice();

    //업커밍
    loadUpcomings();

    //띠배너
    loadBeltBanner();

}
/* visual */
const visualSwiper = new Swiper('.visual-swiper', {
    effect:'fade',
    initialSlide : 1,
    loop: true,
    autoplay: {
        // speed: 3000,
        delay: 5000,
        disableOnInteraction: false,
    },
    pagination: {
        el: '.visual-pagaination',
        type: 'fraction',
    },
    breakpoints: {
        1023: {
            pagination: {
                el: '.visual-pagaination',
                type: 'bullets',
                clickable: true,
            },
        },
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    on: {
        init: function () {
            $(".swiper-progressbar").removeClass("animate");
            $(".swiper-progressbar").removeClass("active");
            $(".swiper-progressbar").eq(0).addClass("animate");
            $(".swiper-progressbar").eq(0).addClass("active");
        },
        slideChangeTransitionStart: function () {
            $(".swiper-progressbar").removeClass("animate");
            $(".swiper-progressbar").removeClass("active");
            $(".swiper-progressbar").eq(0).addClass("active");
        },
        slideChangeTransitionEnd: function () {
            $(".swiper-progressbar").eq(0).addClass("animate");
        },
    },
});

async function movePageOnBanner(url, target, id){
    await addReadCount(id, 'main_banner');
    if(target === '_blank'){
       await openWebBrowser(url);
    }else{
        location.href = url;
    }
}

function  loadBigBanner (){
    const slideArray = [];
    axios.get('/api/main/bigBanners')
        .then(function(response){
            const success =  response.data.success;
            if (success) {
                const bannerList = response.data.data;
                bannerList.map(item => {
                    item.content = JSON.parse(item.content);
                   if(!(locale === 'en' && item.content.banner_kind === 'academy') ) {
                        let btnListHtml = "";
                       item.content.button_list.forEach((button) => {
                            const btnUrl = locale === 'en' ? button.url_ko : button.url_en;
                            btnListHtml +=  `<a onclick="movePageOnBanner('${btnUrl}', '${button.target}', ${item.id});"
                                                class="commonbtn visual-commonbtn ${button.className}">
                                                    ${locale === 'en' ? button.text_en : button.text_ko }
                                            </a>`;
                        });

                       const titleTextColor = item.content.title_color ==='B'? '#000000' : '#FFFFFF';

                         const returnDom = `<div class="swiper-slide"> 
                                                <figure class="visual_img">
                                                    <img src="${item.image.pc_url}" alt="slide" class="pc-ver">
                                                    <img src="${item.image.mo_url}" alt="slide" class="m-ver">
                                                </figure>
                                                <figurecaption class="visual_caption">
                                                    <div>
                                                        <h1 class="slide-tit" style="color:${titleTextColor}">${item.content.title[locale]}</h1>
                                                        <p style="color:${titleTextColor}">
                                                            ${item.content.sub_title[locale]}
                                                        </p>
                                                        <div class="visual_btn">
                                                            ${btnListHtml}
                                                        </div>
                                                    </div>
                                                </figurecaption>
                                        </div>`
                        slideArray.push(returnDom);
                   }

                });

                visualSwiper.appendSlide(slideArray);

                document.querySelector(".playBtn").addEventListener("click", function(e){
                    visualSwiper.autoplay.start('fast');
                    $(this).css({'display': 'none'});
                    $('.stopBtn').css({'display': 'block'});
                });
                document.querySelector(".stopBtn").addEventListener("click", function(e){
                    visualSwiper.autoplay.stop();
                    $(this).css({'display': 'none'});
                    $('.playBtn').css({'display': 'block'});
                });
            }
        })
        .catch(function(error){
            console.log(error);
        });
}

// 상단텍스트공지
const beltNoticeSwiper = new Swiper(".belt-swiper", {
    autoplay: {
        delay: 4000,
    },
    initialSlide : 1,
    allowTouchMove:false, /* 마우스 및 손가락 터치 시 슬라이드 이동 가능여부 */
    touchMoveStopPropagation: true,   /* touchmove 중지 */
    direction:'vertical',
    loop: true,
});

function loadTopNotice(){
    const slideArray = [];

    axios.get('api/main/topNotice')
    .then(function(response){
        const success =  response.data.success;
        if (success) {
            const data = response.data.data;
            if(!getCookie('top-notice') && data.length > 0) {
                document.querySelector(".header_beltbox").classList.add("on");

                data.map(item => {
                     const content = JSON.parse(item.content);
                     const url = locale === 'en' ? content.en_url : content.ko_url;
                     const returnDom = `<div class="swiper-slide"> <!-- slide 구간 -->
                                            <span class="header_beltTit">
                                                <a onclick="movePageOnBanner('${url}', '_self', ${item.id})">
                                                    <span class="text-over belt_tit">
                                                        ${locale === 'en' ? content.en_text : content.ko_text}
                                                    </span>
                                                </a>
                                            </span>
                                        </div>`;
                    slideArray.push(returnDom);
                });

                beltNoticeSwiper.appendSlide(slideArray);

                document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                    $('.header_beltbox').slideUp(400);
                    closeToday('top-notice');
                });

                if(matchMedia("all and (min-width: 1024px)").matches) {//pc
                    $('.main-contents').css({'margin-top': '162px'});
                } else {//mo
                    $('.submenuBg').css({'top':'-43px'});
                    $('.main-contents').css({'margin-top': '100px'});
                }

            }else{

                if(matchMedia("all and (min-width: 1024px)").matches) {//pc
                    $('.main-contents').css({'margin-top':'102px'});
                } else {//mo
                    $('.submenuBg').css({'top':'0px'});
                    $('.main-contents').css({'margin-top': '56px'});
                }

            }

        }
    })
    .catch(function(error){
        console.log(error);
    });
}

/*upcoming*/
$('.upcoming-img>img').show(function () {
    const img_on = $(window).innerWidth();
     $('.swiper-slide.upcomingSlide').css('padding-right','40px');
    if (img_on >= 1280) {
        $('.swiper-slide.upcomingSlide').css('padding-right', '40px');
    } else {
        $('.swiper-slide.upcomingSlide').css('padding-right', '10px');
    }
    /* 영문버전 */
    if (img_on <= 1280) {
        $('.swiper-slide.upcomingSlide:lang(en).upcomingSlide').css('padding-right', '20px');
    }

    $(this).parent('.upcoming-img').addClass('on').css('display', 'flex');
});

const upcomingSwiper = new Swiper(".upcoming-swiper", {
    slidesPerView: 'auto',
    breakpoints: {
        1439: {
            slidesPerView: 'auto',
            //spaceBetween: 20,
        },
        1023: {
            slidesPerView: 'auto',
            spaceBetween: 10,
            loopedSlides: 1,
        },
    }
});



//업커밍 바인딩
function loadUpcomings() {
    const slideArray = [];

    axios.get('/api/main/upcomings')
        // await sleep(2000);
        .then(function(response){
            const success =  response.data.success;
            if (success) {
                const bannerList = response.data.data;
                bannerList.map(item => {
                    const titleJSON = JSON.parse(item.TITLE_BLOB);
                    const from_dt = moment(item.FROM_DT);
                    const to_dt = moment(item.TO_DT);
                    const prev_from_dt = moment(item.PREV_FROM_DT);
                    const prev_to_dt = moment(item.PREV_TO_DT);
                    const returnDom =  ` <div class="swiper-slide upcomingSlide "> 
                                            <a href="/auction/upcoming/${item.SALE_NO}"> 
                                                <div class="upcoming-caption text-over">  
                                                    <span class="auctionKind-box ${ item.SALE_KIND === 'LIVE' ? 'on' : ''}">
                                                        ${item.SALE_KIND} 
                                                    </span>
                                                    ${ item.D_DAY <= 7 ? 
                                                        `<span class="d-day on">
                                                            ${ item.D_DAY <= 0 ? "TODAY" : "D-" + item.D_DAY }
                                                        </span>` 
                                                    : ``}
                                                    <h4 class="text-over">${localeOrdinal(item.SALE_TH,locale) + titleJSON[locale] }</h4>
                                                    <div class="upcoming-datebox">
                                                        ${ locale === 'en'?
                                                            `<p class="upcoming-open on">
                                                                <span>OPEN</span><span>${ from_dt.format('DD MMMM')}</span>
                                                            </p>
                                                            <p class="upcoming-preview">
                                                                <span>PREVIEW</span><span>${ prev_from_dt.format('DD MMMM') +" - " +  prev_to_dt.format('DD MMMM')}</span>
                                                            </p>
                                                            <p class="upcoming-date">
                                                                <span>AUCTION</span><span>${ to_dt.format('DD MMMM hh:mm')}</span>
                                                            </p>`
                                                            :
                                                            `<p class="upcoming-open on"> 
                                                                <span>오픈일</span><span>${ from_dt.format('MM/DD(ddd)')}</span>
                                                            </p>
                                                            <p class="upcoming-preview">
                                                                <span>프리뷰</span><span>${ prev_from_dt.format('MM/DD(ddd)') +" ~ " +  prev_to_dt.format('MM/DD(ddd)')}</span>
                                                            </p>
                                                            <p class="upcoming-date">
                                                                <span>경매일</span><span>${ to_dt.format('MM/DD(ddd) hh:mm')}</span>
                                                            </p>`
                                                        }
                                                    </div>
                                                </div>
                                                ${item.FILE_PATH !== null && item.FILE_NAME !== null ?
                                                `<figure class="upcoming-img on">
                                                    <img src="https://www.seoulauction.com/nas_img/${item.FILE_PATH}/thum/${item.FILE_NAME}" 
                                                        style="object-fit: cover"
                                                        onerror="this.parentNode.remove ? this.parentNode.remove() : this.parentNode.removeNode();" 
                                                        alt="" >
                                                </figure>` :``}
                                            </a>
                                        </div>`;
                    slideArray.push(returnDom);
                });

                upcomingSwiper.appendSlide(slideArray);

            }
        })
        .catch(function(error){
            console.log(error);
        });
}


/* 띠배너 */
const platFormSwiper = new Swiper('.platform-swiper', {
    effect: 'fade',
    autoplay: {
        delay: 5000,
    },
    initialSlide : 1,
    slidesPerView: 1,
    spaceBetween: 10,
    keyboard: {
        enabled: true,
    },
    pagination: {
        el: '.platform-pagination',
        type: 'bullets',
        clickable: true,
    },
    navigation: {
        nextEl: '.platformBtn-right',
        prevEl: '.platformBtn-left',
    },
    loop: true,
    breakpoints : {
        1023: {
            CenteredSlidesBounds:true,
            centeredSlides:true,
            effect: 'fade',
            autoplay: {
                delay: 5000,
            },
            pagination: {
                el: '.platform-pagination',
                type: 'bullets',
                clickable: true,
            },
        },
    },
});


//띠배너 바인딩
function loadBeltBanner() {
    const slideArray = [];

    axios.get('/api/main/beltBanners')
        // await sleep(2000);
        .then(function(response){
            const success =  response.data.success;
            if (success) {
                const bannerList = response.data.data;
                bannerList.map(item => {
                    const content = JSON.parse(item.content);
                    const url = locale === 'en' ? content.url_en : content.url_ko;

                    const returnDom =  `<div class="swiper-slide platform-bg" style="background-color: ${content.backgroundColor} ">
                                            <a onclick="movePageOnBanner('${url}', '${content.target}' , ${item.id});" >
                                                <img src="${locale === 'en' ? item.image.pc_en_url : item.image.pc_ko_url }" alt="beltPcBanner" class="beltBannerImg-pc platform-img" >
                                                <img src="${locale === 'en' ? item.image.mo_en_url : item.image.mo_ko_url }" alt="beltMobileBanner" class="beltBannerImg-mo platform-img"> 
                                            </a>
                                        </div>`;

                    slideArray.push(returnDom);
                });

                platFormSwiper.appendSlide(slideArray);

                if(matchMedia("all and (min-width: 1024px)").matches) {
                    $(".beltBannerImg-pc").show();
                    $(".beltBannerImg-mo").hide();
                }else{
                    $(".beltBannerImg-mo").show();
                    $(".beltBannerImg-pc").hide();

                }

            }
        })

        .catch(function(error){
            console.log(error);
        });
}


$(function() {
    /* video */
    //video hover
    $('.video-thumb').mouseenter(function () {
        let videoHover = $(this).index();
        $('.video-thumbHover').removeClass('on');
        $(this).children('.video-thumbHover').eq(videoHover).addClass('on');
    });
    $('.video-thumbHover').mouseleave(function () {
        $(this).removeClass('on');
    });
    /* video 팝업 */
});
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);

/* video 리스트*/
$('.video-btn').click(function(){
    $('.video-blackBg').fadeIn();
});

/* 인스타 팝업 */
$('.instar-btn').click(function(){
    // openWebBrowser('https://www.instagram.com/')
    // const instar = window.open('https://www.instagram.com/', name="_blank", width="700");
});

/* video 팝업 */
$('.video-closebtn').click(function(){
    $('.video-blackBg').fadeOut('fast');
});

/*뉴스레터 신청 관련*/
// $('#subscript_check').click(function(){
//     $('.newsAgree-close').click(function(){
//         $('.newsletter-terms').fadeOut();
//         $('.newsletter-blackBg').fadeOut('fast');
//     });
//     $('.newsletter-terms').fadeIn();
//     $('.newsletter-blackBg').fadeIn('fast');
// });
//
// $('.subscriptBtn').click(function(){
//     $('.newsAgree-comfirmbtn').click(function(){
//         $('.newsletter-comfirmbox').fadeOut();
//         $('.newsletter-blackBg').fadeOut('fast');
//     });
//     $('.newsletter-comfirmbox').fadeIn();
//     $('.newsletter-blackBg').fadeIn('fast');
// });

/* 메인 레이어 팝업 */

//오늘 하루 그만보기 기능.
$('#main_popup_today_stop_btn').on('click', function(){
    closeToday('main-popup');
});
//메인 팝업 불러오기.
function loadPopup(){

    //오늘 하루 쿠키가 없을 때.
    if(!getCookie('main-popup')) {
        axios.get('api/main/popup')
            .then(function (response) {
                const success = response.data.success;
                if (success) {
                    const data = response.data.data;
                    if(data) {

                        isMainPopup = true;
                        //메인팝업 보이기.
                        $('.main-popupbox').show();

                        let jsonData = JSON.parse(data.content);
                        let popupType = data.popup_type;



                        //모바일 일때
                        let localeTitle = locale === 'ko' ? jsonData.title.ko : jsonData.title.en;
                        let localeContent = locale === 'ko' ? jsonData.content.ko.content : jsonData.content.en.content;
                        let localeUrl = locale === 'ko' ? jsonData.content.ko.url : jsonData.content.en.url;

                        $('#main_popup_a_link').hide()
                        $('#main_popup_text_a_link').hide();

                        if(popupType === 'image'){

                            let imgUrl;
                            ///////////// 이미지 선택 //////////////////
                            //모바일이 아닐때만 .
                            if (matchMedia("all and (min-width: 1024px)").matches) {

                                $.each(data.image , function(lotIdx , el){

                                    if(locale === 'ko' && el.tag === 'pcKo'){
                                        imgUrl = el.cdn_url;
                                    } else if (locale === 'en' && el.tag === 'pcEn'){
                                        imgUrl = el.cdn_url;
                                    }
                                });
                            //모바일일때만.
                            } else {

                                $.each(data.image , function(lotIdx , el){

                                    if(locale === 'ko' && el.tag === 'moKo'){
                                        imgUrl = el.cdn_url;
                                    } else if (locale === 'en' && el.tag === 'moEn'){
                                        imgUrl = el.cdn_url;
                                    }
                                });
                            }
                            if(data.image !== "") {
                                $('#main_popup_a_link').attr("href",localeUrl);
                                $('#main_popup_img').attr('src', imgUrl);
                                $('#main_popup_a_link').show();
                            }

                        } else if (popupType === 'text'){
                            $('#main_popup_text_a_link').attr("href",localeUrl);
                            $('#main_popup_text_a_link').show();
                            $('#main_popup_title').html(localeTitle);
                            $('#main_popup_content').html(localeContent);
                        }

                        // $('.main-popupBg').addClass('on'); //line663 으로 옮김.

                        $('.main-popup-close, .main-popupBg').click(function () {
                            $('.main-popupbox').addClass('down');
                            $('.main-popupBg').fadeOut('1000', function(){
                                $(this).removeClass('on');
                                $('.main-popupwrap').removeClass('on');
                                $('body').css('overflow','visible');
                            });
                        });
                        //데이터가 없을때 팝업 닫음.
                    } else {
                        $('.main-popupBg').removeClass('on');
                        $('.main-popupwrap').removeClass('on');
                        $('body').css('overflow','visible');
                    }
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    } else {
        $('.main-popupBg').removeClass('on');
        $('.main-popupwrap').removeClass('on');
        $('body').css('overflow','visible');
    }
}

//경매 회차 필터
function localeOrdinal(n, l) {
    if(!l) l = locale;
    if (n != "" && typeof n != 'undefined')
    {
        if(l == "ko" ) return "제" + n + "회 ";

        var s = ["th","st","nd","rd"],
            v = n % 100;

        return n+(s[(v-20)%10]||s[v]||s[0]);
    }else{
        return "";
    }

}

/* main에서만 사용되는 */
if (matchMedia("all and (min-width: 1024px)").matches) {
    /* visual swiper hover 추가 */
    $('.visual-swiper > .swiper-wrapper,.swiper-button-next.slide-btnright, .swiper-button-prev.slide-btnleft').off('mouseenter');
    $('.visual-swiper > .swiper-wrapper, .swiper-button-next.slide-btnright, .swiper-button-prev.slide-btnleft').on('mouseenter' ,function(){
        $(this).hover(function(){
            $('.swiper-button-next.slide-btnright, .swiper-button-prev.slide-btnleft').css({
                "background-color": "rgba(0,0,0,0.3)",
                "border":"0",
                "border-radius": "100%",
                "display": "flex",
                "align-items": "center",
                "justify-content": "center", 
            });
            $('.swiper-button-prev.slide-btnleft').css("left","40px");
        });

        $('.visual-swiper > .swiper-wrapper').on('mouseleave', function(){
            $('.swiper-button-next.slide-btnright, .swiper-button-prev.slide-btnleft').css("background-color",'transparent');
        });
    });

    /* 메인팝업 pc 없음 */
    $('.main-popupBg').removeClass('on');
    $('.main-popupwrap').removeClass('on');

} else {
    /* 메인팝업 mobile 있음 */
    if (isMainPopup) {
        $('.main-popupBg').addClass('on');
    }
    $('.main-popupwrap').addClass('on');

    /* 띠배너 beltbanner */
    $('.header_beltbox.on').show(function () {
        $('.main-contents').css('margin-top', '100px');
        $('.m-gnbmenu').click(function(){
            $('.submenuBg').css({'top':'0'});    
        });
    });
    $('.beltclose-btn').click(function () {
        $('.main-contents').css('margin-top', '56px');
        $('.m-gnbmenu').click(function(){
            $('.submenuBg').css({'top':'0'});
        });
    });

    if($('.main-popupBg').hasClass('on')){
         $('body').css({'overflow':'hidden'});
    }
    $('main-popupBg').toggleClass('on');
}

/* 반응형 resize 추가 */
$(window).resize(function(){
    /* 해상도 확인용 */
    const innerW = window.innerWidth;
    console.log(innerW);

    /* gnb */
    if (matchMedia("all and (min-width: 1024px)").matches) {
        /* 쿠키가 있을 때 dim 없는  main 레이어팝업 */
        $('.main-popupBg').removeClass('on');

        /* 반응형 margin-top 조정 */
        if($('.header_beltbox').hasClass('on')) {
            $('.main-contents').css({'margin-top': '162px'});
        } else {
            $('.main-popupBg').removeClass('on');
            $('.main-contents').css({'margin-top': '102px'});
        }
    } else {
        /* 쿠키가 없을 때 dim 있는 main 레이어팝업 */
        if (isMainPopup) {
            $('.main-popupBg').addClass('on');
        }
        /* 쿠키 상관없이 그냥 닫았을 때 resize */
        if($('.main-popupbox').hasClass('down')){ /* down */
            $('.main-popupBg').removeClass('on');
            $('.main-popupwrap').removeClass('on');
        } 

        /* 띠배너 beltbanner */
        $('.header_beltbox.on').show(function () {
            $('.main-contents').css('margin-top', '100px');
            $('.m-gnbmenu').click(function(){
                $('.submenuBg').css({'top':'-43px'});
            });
        });
        $('.beltclose-btn').click(function () {
            $('.main-contents').css('margin-top', '56px');
            $('.m-gnbmenu').click(function() {
                $('.submenuBg').css({'top':'0'});
            });
        });

        /* visual hover none */
        $('.visual-swiper > .swiper-wrapper, .swiper-button-next.slide-btnright, .swiper-button-prev.slide-btnleft').off('mouseenter');
    };

    /* visual */
    const visualSwiper = new Swiper('.visual-swiper', {
        effect: 'fade',
        autoplay: {
            // speed : 2000,
            delay:5000,
            disableOnInteraction:false,
        },
        pagination: {
            el: '.visual-pagaination',
            type:'fraction',
        },
        breakpoints: {
            1023:{
                pagination: {
                    el: '.visual-pagaination',
                    type:'bullets',
                    clickable:true,
                },
            },
        },
        navigation: {
            nextEl: '.slide-btnright',
            prevEl: '.slide-btnleft',
        },
        on: {
            init: function () {
                $(".swiper-progressbar").removeClass("animate");
                $(".swiper-progressbar").removeClass("active");
                $(".swiper-progressbar").eq(0).addClass("animate");
                $(".swiper-progressbar").eq(0).addClass("active");
            },
            slideChangeTransitionStart: function () {
                $(".swiper-progressbar").removeClass("animate");
                $(".swiper-progressbar").removeClass("active");
                $(".swiper-progressbar").eq(0).addClass("active");
            },
            slideChangeTransitionEnd: function () {
                $(".swiper-progressbar").eq(0).addClass("animate");
            },
        },
        loop:true,
    });
    $('.playBtn').on('click', function(){
        visualSwiper.autoplay.start('fast');
        $(this).css({'display':'none'});
        $('.stopBtn').css({'display':'block'});
    });
    $('.stopBtn').on('click', function(){
        visualSwiper.autoplay.stop();
        $(this).css({'display':'none'});
        $('.playBtn').css({'display':'block'});
    });

    const platFormSwiper = new Swiper('.platform-swiper', {
        effect: 'fade',
        autoplay: {
            delay: 5000,
        },
        initialSlide : 1,
        slidesPerView: 1, 
        spaceBetween: 10,
        keyboard: {
            enabled: true,
        },
        pagination: {
            el: '.platform-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.platformBtn-right',
            prevEl: '.platformBtn-left',
        },
        loop: true,
        breakpoints : {
            1023: {
                CenteredSlidesBounds:true,
                centeredSlides:true,
                effect: 'fade',
                autoplay: {
                    delay: 5000,
                },
            },
        },
    });
}); 


/* scroll top */
$('.scroll-top').click(function () {
    $('html, body').animate({scrollTop  : '0'}, 700);
});

/* 스크롤시 scroll top btn 나오게 함. */
const initHeight = window.innerHeight;
window.addEventListener('scroll', () => {
    if (document.body.scrollTop > initHeight || document.documentElement.scrollTop > initHeight) {
        document.querySelector('.scroll-top').classList.add('show');
    } else {
        document.querySelector('.scroll-top').classList.remove('show');
    }
});

/* 다크모드 새로고침 시 */
window.addEventListener('DOMContentLoaded', () => {
    // console.log("theme ", localStorage.getItem('theme'));

    $('*').toggleClass(localStorage.getItem('theme'));

    $('.auctionTab-btn').click(function () {
        const darkIngTab = $(this).index();
        $('.auctionTab-btn').removeClass('dark');
        $('.auctionTab-contents').removeClass('dark');

        $(this).addClass('dark');
        $(".auctionTab-contents").eq(darkIngTab).addClass('dark');
    });

    $('.darktxt').text('다크모드로 보기');
    $('.darktxt.dark').text('라이트모드로 보기');
    $('.darktxt-en').text('Dark Mode');
    $('.darktxt-en.dark').text('Ligth Mode');

    $('.mode-toggle>input').addClass(localStorage.getItem('theme'));
});

