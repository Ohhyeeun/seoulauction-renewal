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

    /*뉴스레터 구독하기 팝업 */
    $(document).ready(function(){
        $('#subscript_check').click(function(){
            const subscript = $('#subscript_check').prop('checked');
            const newsAgree = $('#newsAgree').prop('checked');

            if(subscript) {
                console.log(subscript);
                $('#subscript_check').prop('checked',true);
                $('.subscriptBtn').prop('disabled',false);

                /*구독하기*/
                $('.subscriptBtn').click(function(){
                    $('.newsletter-blackBg').fadeIn('fast');
                    $('.newsAgree-close').click(function(){  /*닫기 버튼 */
                        $('.newsletter-blackBg').fadeOut('fast');
                    });
                });
            } else {
                console.log(newsAgree);
                $('#subscript_check').prop('checked',false);
                $('.subscriptBtn').prop('disabled',true);
            };
        });

        /* 뉴스레터 개인정보 동의 팝업 */
        $('#newsAgree').click(function(){
            const subscript = $('#subscript_check').prop('checked');
            const newsAgree = $('#newsAgree').prop('checked');


            if(newsAgree){
                $('#newsAgree').prop('checked',true);
                $('.newsAgree-btn').prop('disabled',false);
                $('.newsAgree-comfirmbtn').prop('disabled',false);

                $('.newsAgree-btn').click(function(){
                    $('.newsAgree-comfirmbtn').click(function(){
                        $('.newsletter-blackBg').fadeOut('fast');
                    });
                    $('.newsletter-terms').hide();
                    $('.newsletter-comfirmbox').fadeIn(400);
                });
            } else {
                $('#newsAgree').prop('checked',false);
                $('.newsAgree-btn').prop('disabled',true);
            }
        });
    });

    /* video 팝업 */

});

