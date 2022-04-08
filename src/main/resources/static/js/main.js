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
    
    
    /*Auction*/ 
    /*auction Tab 버튼*/ 
    $('.auctionTab-btn').click(function(){ 
        const IngTab = $(this).index();  
        
        $('.auctionTab-btn').removeClass('on'); 
        $('.auctionTab-contents').removeClass('on');   
        
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
    $('#MoreAuction').click(function(){  
        $(".auctionTab-contents.on").css('height','100%');    
    });  
    
    /*upcoming*/
    $('.upcoming-img>img').show(function(){  
        const img_on = $(window).innerWidth(); 
        //$('.swiper-slide.upcomingSlide').css('padding-right','40px');   
        if(img_on >= 1024){     
            $('.swiper-slide.upcomingSlide').css('padding-right','40px');  
        } else {        
            $('.swiper-slide.upcomingSlide').css('padding-right','20px');   
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
            delay: 3000,
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
    
    /* family site */ 
});



