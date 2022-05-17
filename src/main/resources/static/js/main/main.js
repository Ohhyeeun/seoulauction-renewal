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
var maxSession = request.getParameter("maxSession");

function logout(loginId){
	console.log(loginId)
	//TODO 소셜타입에 따른 SNS로그아웃처리
	sessionLogout();
}

// 세션로그아웃
function sessionLogout() {
	window.location.href = "/processLogout";
}

/************* 화면 작업 ***************/
const locale = document.documentElement.lang;
const sleep = (ms) => new Promise(resolve => { setTimeout(resolve, ms) });

window.onload = function(){

    //상단텍스트공지
    loadTopNotice();

    //업커밍
    loadUpcomings();

    //띠배너
    loadBeltBanner();

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
    const slideArray = [];

    axios.get('api/main/topNotice')
    .then(function(response){
        const success =  response.data.success;
        if (success) {
            const data = response.data.data;
            if(!getCookie('top-notice') && data) {
                data.map(item => {
                    const content = JSON.parse(item.content);
                    const returnDom = `<div class="swiper-slide header_beltbox on"> <!--class="on" block-->
                                        <div class="wrap belttxtbox wrap_padding">
                                            <span class="header_beltTit">
                                                <a href="${locale === 'en' ? content.en_url : content.ko_url}">
                                                    <span class="text-over belt_tit"> ${locale === 'en' ? content.en_text : content.ko_text}</span>
                                                    <!--<span class="beltbanner-triangle"></span>--> 
                                                </a>
                                            </span> 
                                            <span class="beltclose-btn closebtn closebtn-w"></span>
                                        </div>
                                   </div>`

                    slideArray.push(returnDom);
                });

                topNoticeSwiper.appendSlide(slideArray);

                /* 상단 텍스트 동적 생성으로 인한 스타일 변경 및 이벤트 바인딩 */
                document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                    $('.header_beltbox').slideUp(400);
                    closeToday('top-notice');
                });

                if(matchMedia("all and (min-width: 1024px)").matches) {
                    document.querySelector(".main-contents").style.marginTop = '180px';
                    document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                        document.querySelector(".main-contents").style.marginTop = '120px';
                    });
                } else { /* 모바일, 테블릿 */
                    /* main gnb fixed */
                    document.querySelector(".main-contents").style.marginTop = '101px';
                    $('.main-contents').css('margin-top','101px');
                    document.querySelector(".beltclose-btn").addEventListener("click", function(e){
                        document.querySelector(".main-contents").style.marginTop = '58px';
                    });
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
                                                            ${ item.D_DAY === 0 ? "TODAY" : "D-" + item.D_DAY }
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
                                                <img src="${locale === 'en' ? content.image_pc_en_url : content.image_pc_ko_url }" alt="beltPcBanner" class="beltBannerImg-pc platform-img" >
                                                <img src="${locale === 'en' ? content.image_mo_en_url : content.image_mo_ko_url }" alt="beltMobileBanner" class="beltBannerImg-mo platform-img" >
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
    /* visual */
    const visualSwiper = new Swiper('.visual-swiper', {
        autoplay: {
            delay: 500000,
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
        loop: true,
    });
    $('.playBtn').on('click', function () {
        visualSwiper.autoplay.start('fast');
        $(this).css({'display': 'none'});
        $('.stopBtn').css({'display': 'block'});
    });
    $('.stopBtn').on('click', function () {
        visualSwiper.autoplay.stop();
        $(this).css({'display': 'none'});
        $('.playBtn').css({'display': 'block'});
    });



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
app.controller('mainCtl', function($scope, consts, common, ngDialog) {
	$scope.init = function(){
		if(maxSession == 'true'){
			$modal = ngDialog.open({
				template: '/maxSession',
				controller: 'maxSessionPopCtl',
				closeByDocument: false,
				showClose: false,
				animationEndSupport: false,
			});
		}

		if(resetPassword == 'true'){
			$modal = ngDialog.open({
				template: '/resetPassword',
				controller: 'resetPasswordPopCtl',
				closeByDocument: false,
				showClose: false,
				animationEndSupport: false,
			});
		}

		console.log(modPassword)
		if(modPassword == 'true'){
			$modal = ngDialog.open({
				template: '/modPassword',
				controller: 'modPasswordPopCtl',
				closeByDocument: false,
				showClose: false,
				animationEndSupport: false,
			});
		}
	}
});

app.controller('maxSessionPopCtl', function($scope, consts, common) {
	$scope.init = function() {

    }
});

app.controller('resetPasswordPopCtl', function($scope, consts, common) {
    $scope.closePopup = function(modYn){
		axios.get('/api/main/resetPassword')
            .then(function(response) {
                var success = response.data.success;
                if(!success){
                    alert(response.data.data.msg);
                    $scope.closeThisDialog();
                } else {
					$scope.closeThisDialog();
					if(modYn == 'Y'){
						// TODO 차후 비밀번호 변경 페이지 개발시 수정
						location.href = '/'
					}
                }
            })
            .catch(function(error){
                console.log(error);
            });
	}
});


app.controller('modPasswordPopCtl', function($scope, consts, common) {
    $scope.reAlarm = function(){
		axios.get('/api/main/reAlarm')
            .then(function(response) {
                var success = response.data.success;
                if(!success){
                    alert(response.data.data.msg);
                }
                $scope.closeThisDialog();
            })
            .catch(function(error){
                console.log(error);
            });
	}

	$scope.modPassword = function(){
		// TODO 차후 비밀번호 변경 페이지 개발시 수정
		location.href = '/';
	}
});

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
$('#subscript_check').click(function(){
    $('.newsAgree-close').click(function(){
        $('.newsletter-terms').fadeOut();
        $('.newsletter-blackBg').fadeOut('fast');
    });
    $('.newsletter-terms').fadeIn();
    $('.newsletter-blackBg').fadeIn('fast');
});

$('.subscriptBtn').click(function(){
    $('.newsAgree-comfirmbtn').click(function(){
        $('.newsletter-comfirmbox').fadeOut();
        $('.newsletter-blackBg').fadeOut('fast');
    });
    $('.newsletter-comfirmbox').fadeIn();
    $('.newsletter-blackBg').fadeIn('fast');
});

/* 메인 레이어 팝업 */
$('.main-popup-img').hide();
$('.main-popup-txt').hide(); /* flexbox 처리로 hide */

$('.main-popup-img.on').show();
$('.main-popup-txt.on').show();

$('.main-popup-close, .main-popupBg').click(function(){
    $('.main-popupbox').addClass('down');
    $('.main-popupBg').fadeOut();
});
