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

//이중접속 팝업
var maxSession = request.getParameter("maxSession");
if(maxSession.startsWith('true')){
	var popup_concurrent = $(".js-popup_concurrent").trpLayerFixedPopup("#popup_concurrent-wrap");
	popup_concurrent.open(this); // or false   
	popup_fixation("#popup_concurrent-wrap"); // pc_하단붙이기
}

$("body").on("click", "#popup_concurrent-wrap .js-closepop, #popup_concurrent-wrap .popup-dim, #confirmMaxSession", function($e) {
    $e.preventDefault();
    popup_concurrent.close();
    location.href="/"
});

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
console.log(modPassword)
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
//지금변경하기
function goModPassword(){
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
$('.main-popupBg').hide();

window.onload = function(){

    //빅배너
    loadBigBanner();

    //상단텍스트공지
    loadTopNotice();

    //업커밍
    loadUpcomings();

    //띠배너
    loadBeltBanner();

    //팝업.
    loadPopup();

}

/* visual */
const visualSwiper = new Swiper('.visual-swiper', {
    initialSlide : 1,
    loop: true,
    autoplay: {
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



function  loadBigBanner (){
    const slideArray = [];
    axios.get('/api/main/bigBanners')
        // await sleep(2000);
        .then(function(response){
            const success =  response.data.success;
            if (success) {
                const bannerList = response.data.data;
                // console.log(bannerList);
                bannerList.map(item => {
                    console.log(item)
                    item.content = JSON.parse(item.content);
                   if(!(locale == 'en' && item.content.banner_kind == 'academy') ) {
                        let btnListHtml = "";
                       item.content.button_list.forEach((button) => {
                            // console.log(button);
                            btnListHtml +=  `<a href="${locale === 'en' ? button.url_ko : button.url_en }" target="${button.target}" class="commonbtn visual-commonbtn ${button.className}">${locale === 'en' ? button.text_en : button.text_ko }</a>`;
                        });

                         const returnDom = `<div class="swiper-slide"> 
                                                <figure class="visual_img">
                                                    <img src="${item.image.pc_url}" alt="slide" class="pc-ver">
                                                    <img src="${item.image.mo_url}" alt="slide" class="m-ver">
                                                </figure>
                                                <figurecaption class="visual_caption">
                                                    <div>
                                                        <h1 class="slide-tit">${item.content.title[locale]}</h1>
                                                        <p>
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
const topNoticeSwiper = new Swiper(".beltbox-swiper", {
    direction : "vertical",
    autoplay : {
        delay: 2500,
        disableOnInteraction: false
    }
});

function loadTopNotice(){
    let resultHtml = "";

    axios.get('api/main/topNotice')
    .then(function(response){
        const success =  response.data.success;
        if (success) {
            const data = response.data.data;
            if(!getCookie('top-notice') && data) {
                data.map(item => {
                    const content = JSON.parse(item.content);
                     resultHtml += `<span class="header_beltTit">
                                            <a href="${locale === 'en' ? content.en_url : content.ko_url}">
                                                <span class="text-over belt_tit"> ${locale === 'en' ? content.en_text : content.ko_text}</span>
                                            </a>
                                        </span>`;
                });

                document.querySelector(".belttxtbox").insertAdjacentHTML('beforeend', resultHtml);

                /* 상단 텍스트 동적 생성으로 인한 스타일 변경 및 이벤트 바인딩 */
                document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                    $('.header_beltbox').slideUp(400);
                    closeToday('top-notice');
                });

                if(matchMedia("all and (min-width: 1024px)").matches) {
                    document.querySelector(".main-contents").style.marginTop = '162px';
                    document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                        document.querySelector(".main-contents").style.marginTop = '100px';
                    });
                } else { /* 모바일, 테블릿 */
                    /* main gnb fixed */
                    document.querySelector(".main-contents").style.marginTop = '100px';
                    $('.main-contents').css('margin-top','101px');
                    document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                        document.querySelector(".main-contents").style.marginTop = '56px'; 
                    });
                }
            }else{
                document.querySelector(".header_beltbox").classList.remove("on");
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
    //$('.swiper-slide.upcomingSlide').css('padding-right','40px');
    if (img_on >= 1280) {
        $('.swiper-slide.upcomingSlide').css('padding-right', '40px');
    } else {
        $('.swiper-slide.upcomingSlide').css('padding-right', '20px');
    }
    /* 영문버전 */
    if (img_on <= 1919) {
        $('.swiper-slide:lang(en).upcomingSlide').css('padding-right', '20px');
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
            spaceBetween: 0,
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
                    const open_dt = moment(item.OPEN_DT);
                    const returnDom =  ` <div class="swiper-slide upcomingSlide " style="padding-right: 40px;">
                                            <a href="#">
                                                <div class="upcoming-caption">
                                                    <span class="auctionKind-box ${ item.SALE_KIND === 'LIVE' ? 'on' : ''}">
                                                        ${item.SALE_KIND} 
                                                    </span>
                                                    ${ item.D_DAY <=7 ? 
                                                        `<span class="d-day on">
                                                            ${ item.D_DAY <= 0 ? "TODAY" : "D-" + item.D_DAY }
                                                        </span>` 
                                                    : ``}
                                                    <h4 class="text-over">${ titleJSON[locale] }</h4>
                                                    <div class="upcoming-datebox">
                                                        ${ locale === 'en'?
                                                            `<p class="upcoming-open on"> <!-- today 일때만 오픈일 생성 --> 
                                                                <span>OPEN</span><span>${ open_dt.format('DD MMMM')}</span>
                                                            </p>
                                                            <p class="upcoming-preview">
                                                                <span>PREVIEW</span><span>${ from_dt.format('DD MMMM') +" - " +  to_dt.format('DD MMMM')}</span>
                                                            </p>
                                                            <p class="upcoming-date">
                                                                <span>AUCTION</span><span>${ to_dt.format('DD MMMM hh:mm')}</span>
                                                            </p>`
                                                            :
                                                            `<p class="upcoming-open"> 
                                                                <span>오픈일</span><span>${ open_dt.format('MM/DD(ddd)')}</span>
                                                            </p>
                                                            <p class="upcoming-preview">
                                                                <span>프리뷰</span><span>${ from_dt.format('MM/DD(ddd)') +" ~ " +  to_dt.format('MM/DD(ddd)')}</span>
                                                            </p>
                                                            <p class="upcoming-date">
                                                                <span>경매일</span><span>${ to_dt.format('MM/DD(ddd) hh:mm')}</span>
                                                            </p>`
                                                        }
                                                    </div>
                                                </div>
                                                <figure class="upcoming-img on" style="display: flex; width:160px; height:160px; overflow: hidden;">
                                                    <!--<span class="upcomingImg"></span>-->
<!--                                                    <img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">-->
<!--                                                    <img src="https://www.seoulauction.com/nas_img/front/online0688/thum/ea39a8bb-c1b9-427d-a250-62117dcc07f5.jpg" alt="alet">-->
                                                    <img src="https://www.seoulauction.com/nas_img/${item.FILE_PATH}/thum/${item.FILE_NAME}" 
                                                        style="object-fit: cover"
                                                        onerror="this.parentNode.remove ? this.parentNode.remove() : this.parentNode.removeNode();" 
                                                        alt="" >
                                                </figure>
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
    autoplay: {
        delay: 10000000,
    },
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
                    const returnDom =  `<div class="swiper-slide platform-bg" style="background-color: ${content.backgroundColor} ">
                                            <a href="${ locale === 'en' ? content.url_en : content.url_ko }" target="_blank"  >
                                                <img src="${locale === 'en' ? item.image.pc_en_url : item.image.pc_ko_url }" alt="beltPcBanner" class="beltBannerImg-pc platform-img" >
                                                <img src="${locale === 'en' ? item.image.mo_en_url : item.image.mo_ko_url }" alt="beltMobileBanner" class="beltBannerImg-mo platform-img" >
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
    console.log(window.innerWidth);
    /* window.addEventListener('resize', (e) => {
         const width = e.target.innerWidth;
         if (width > 1280) {
             console.log(23423);

         } else if (width < 720) {
             //
             console.log(8687);
         }
     });
     */




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
    const instar = window.open('https://www.instagram.com/', name="_blank", width="700");
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
$('#main_popup_today_stop_btn').on('click',function (){
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
                    $('#main_popup_title').html(data.title);
                    $('#main_popup_content').html(data.content);
                    $('#main_popup_img').attr('src', data.image);

                    $('.main-popupBg').show();

                    $('.main-popup-close, .main-popupBg').click(function () {
                        $('.main-popupbox').addClass('down');
                        $('.main-popupBg').fadeOut();
                    });
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    }
}


