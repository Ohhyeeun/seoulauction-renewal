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


    /*Auction*/
    /*auction Tab 버튼*/
    $('.auctionTab-btn').click(function(){
        const IngTab = $(this).index();

        $('.auctionTab-btn').removeClass('on');
        $('.auctionTab-contents').removeClass('on');

        $('#AllAuction').hide();
        $('#MoreAuction').show();

        $(this).addClass('on');
        $(".auctionTab-contents").eq(IngTab).addClass('on');
    });

    /* auction thumbnail hover 기능 */
    $('.auction-thumbbox').mouseenter(function(){
        $('.auction-thumbbox>.auction-thumb').removeClass('on');
        $(this).children('.auction-thumb').addClass('on');
    });
    $('.auction-thumb').mouseleave(function(){
        $(this).removeClass('on');
    });
    //auction haert 버튼
    $('.wish_heart').click(function(){
        $(this).toggleClass('on');
    });
    //auction 더보기 버튼
    $('#AllAuction').hide();
    $('#MoreAuction').click(function(){
        $('#AllAuction').show();
        $('#MoreAuction').hide();
        $(".auctionTab-contents.on").css('height','100%');
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

    /* platform */
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

    /* video popup */
    $(".video-slide>a").click(function() {
        console.log(34234);
        $(".video-popup").addClass("reveal"),
            $(".video-popup .video-wrapper").remove(),
            $(".video-popup").append("<div class='video-wrapper'><img class='videoclose_btn' src='/images/icon/close_white_24dp.svg'><div class='videoBox'><iframe width='1280' height='720' src='https://youtube.com/embed/" + $(this).data("video") + "' allow='autoplay; encrypted-media' allowfullscreen></iframe></div></div>"),
            $(".video-popup").find("img.videoclose_btn").click(function(){// 닫기버튼 추가 (2021.11.30 em) ,
                $(".video-popup .video-wrapper").remove(),
                    $(".video-popup").removeClass("reveal")
            });
    }),
        $(".video-popup-closer").click(function() {
            $(".video-popup .video-wrapper").remove(),
                $(".video-popup").removeClass("reveal")
        });
});



