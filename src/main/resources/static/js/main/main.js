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
var modPassword = request.getParameter("modPassword");
var resetPassword = request.getParameter("resetPassword");

if(modPassword == 'true'){
	//alert('소중한 개인정보 보호를 위해 비밀번호를 변경해 주세요!');
	//TODO 180일 경과 비밀번호 변경 팝업 show
}
if(resetPassword == 'true'){
	//alert('관리자에 의해 비밀번호가 초기화 되었습니다. \n 안전한 개인정보 보호를 위해 비밀번호를 변경해 주세요.');
	//TODO 관리자 비밀번호 변경 팝업 show
}

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

    //띠배너
    loadBeltBanner();



}

// 상단텍스트공지
async function loadTopNotice(){

    await fetch('api/main/topNotice')
    .then(res => res.json())
    .then(res => {
        if (res.success) {
            const content = JSON.parse(res.data[0].content);
            const returnDom = `<a href="${locale === 'en'? content.en_url : content.ko_url}">${locale === 'en'? content.en_text : content.ko_text }<span class="beltbanner-triangle"></span></a>`
            document.querySelector(".header_beltTit").insertAdjacentHTML('beforeend',returnDom);
        }
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
async function loadBeltBanner() {
    const slideArray = [];

    await fetch('/api/main/beltBanners')
        // await sleep(2000);
        .then(res => res.json())
        .then(res => {
            if (res.success) {
                console.log(res);
                const bannerList = res.data;
                bannerList.map(item => {
                    const content = JSON.parse(item.content);
                    const returnDom =  `<div class="swiper-slide platform-bg" style="background-color: ${content.backgroundColor} ">
                                            <a href="${ locale === 'en' ? content.url_en : content.url_ko }" target="_blank" class="platform-img" style="background-image: url('${ locale === 'en' ? content.image_pc_en_url : content.image_pc_ko_url }') " >
<!--                                            추후 img 태그로 변경 필요-->
<!--                                                <img src-set="${item.cdn_url}" onerror="" alt=""/> -->
                                            </a>
                                        </div>`;

                    slideArray.push(returnDom);
                });

                platFormSwiper.appendSlide(slideArray);

            }
        });
}



$(function(){
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
            delay:500000,
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



    /*upcoming*/
    $('.upcoming-img>img').show(function(){
        const img_on = $(window).innerWidth();
        //$('.swiper-slide.upcomingSlide').css('padding-right','40px');
        if(img_on >= 1280){
            $('.swiper-slide.upcomingSlide').css('padding-right','40px');
        } else {
            $('.swiper-slide.upcomingSlide').css('padding-right','20px');
        }
        /* 영문버전 */
        if(img_on <= 1919){
            $('.swiper-slide:lang(en).upcomingSlide').css('padding-right','20px');
        }

        $(this).parent('.upcoming-img').addClass('on').css('display','flex');
    });

    const upcomingSwiper = new Swiper(".upcoming-swiper", {
        slidesPerView: 'auto',
        breakpoints:{
            1439: {
                slidesPerView: 'auto',
                //spaceBetween: 20,
            },
            1023: {
                slidesPerView: 'auto',
                spaceBetween: 0,
                loopedSlides:1,
            },
        }
    });




    /* video */
    const videoSwiper = new Swiper(".video-swiper", {
        slidesPerView: 6,
        spaceBetween: 20,
        loop:true,
        loopFillGroupWithBlank: true,
        navigation: {
            nextEl: ".videoBtn-right",
            prevEl: ".videoBtn-left",
        },
        breakpoints:{
            1919: {
                slidesPerView: 4,
                spaceBetween: 20,
            },
            1279: {
                slidesPerView: 3,
                spaceBetween: 20,
            },
            1023: {
                slidesPerView: 'auto',
                spaceBetween: 20,
                loopedSlides:1,
                loop:false,
                loopFillGroupWithBlank: false,
            },
        }
    });
    //video hover
    $('.video-thumb').mouseenter(function(){
        let videoHover = $(this).index();
        $('.video-thumbHover').removeClass('on');
        $(this).children('.video-thumbHover').eq(videoHover).addClass('on');
    });
    $('.video-thumbHover').mouseleave(function(){
        $(this).removeClass('on');
    });
    /* video 팝업 */

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
	}
});


app.controller('maxSessionPopCtl', function($scope, consts, common) {
	$scope.init = function(){
		
	}
});
