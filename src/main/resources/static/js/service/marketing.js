// Swiper 세팅
var swiper_academy;
if($(".width_check").length > 0) {
    var onceFn = $(".width_check").trpUtilityChangeOnceFn(
        function($name) {
            swiper_setting()
        }
    );
}

function swiper_setting() {
    if (swiper_academy) {
        swiper_academy.destroy()
    };

    swiper_academy = new Swiper('.js-swiper_academy .gallery_container', {
        autoplay: 3000,
        loop: true,
        /* [0705]수정
                pagination: ".js-swiper_academy .pagination", */
        pagination: {
            el: ".js-swiper_academy .pagination"
        },
        paginationClickable: true,
        breakpoints: {
            1023: {
                grabCursor: true,
                initialSlide: 0,
                centeredSlides: true,
                slidesPerView: "auto",
                spaceBetween: 10
            }
        },
        onSlideChangeEnd: function(swiper) { // 움직임이 끝나면 실행
        }
    });
    $('.js-swiper_academy .btn-prev').on('click', function(e) {
        e.preventDefault();
        swiper_academy.slidePrev();
    })
    $('.js-swiper_academy .btn-next').on('click', function(e) {
        e.preventDefault();
        swiper_academy.slideNext();
    })

}

$(window).on("resize", function() {
    var _device = $("body").attr("data-device")
    onceFn.setChange(_device);
});
swiper_setting();

if(checkPlatform(window.navigator.userAgent) == "mobile") {
    for (let i = 1; i <= 4; i++) {
        $("#popup_marketing"+i).addClass("js-popup_marketing"+i);
    }
} else {
    $("#popup_marketing1, #popup_marketing2, #popup_marketing3, #popup_marketing4").addClass("js-popup_marketing_pc");
}

for (let i = 1; i <= 4; i++) {
    const popup_marketing = $(`.js-popup_marketing` + i).trpLayerFixedPopup("#popup_marketing" + i + "-wrap");
    $(popup_marketing.getBtn).on("click", function ($e) {
        $e.preventDefault();
        popup_marketing.open(this); // or false
        popup_fixation("#popup_marketing" + i + "-wrap"); // pc 스크롤
        popup_motion_open("#popup_marketing" + i + "-wrap"); // mb 모션
    });

    $("body").on("click", "#popup_marketing" + i + "-wrap .js-closepop, #popup_marketing" + i + "-wrap .popup-dim", function ($e) {
        $e.preventDefault();
        popup_marketing.close();
        popup_motion_close("#popup_marketing" + i + "-wrap");
    });
}
<!-- / 모바일용 팝업 -->

var popup_marketing_pc = $(".js-popup_marketing_pc").trpLayerFixedPopup("#popup_marketing_pc-wrap");
$(popup_marketing_pc.getBtn).on("click", function($e) {
    $e.preventDefault();
    popup_marketing_pc.open(this); // or false
    popup_fixation("#popup_marketing_pc-wrap"); // pc 스크롤
    popup_motion_open("#popup_marketing_pc-wrap"); // mb 모션

    // 아이디로 제어
    var trgName = $(this).attr("id");
    $(".tab-con." + trgName).show().siblings().hide();
    $(".tab-" + trgName).addClass("active").siblings().removeClass("active");

});

$("body").on("click", "#popup_marketing_pc-wrap .js-closepop, #popup_marketing_pc-wrap .popup-dim", function($e) {
    $e.preventDefault();
    popup_marketing_pc.close();
    popup_motion_close("#popup_marketing_pc-wrap");
});

/* 팝업 텝메뉴 */
$('.js-left_mm a').on('click', function(e) {
    e.preventDefault();
    var tar = $(this).position().left;
    var scrollX = tar - ($(".js-left_mm").parents(".tab-area").width() / 2) + $(this).width() / 2;

    var tabNum = $(this).parent("li").index();
    var conTarWrap = $(".tab-con");

    if ($(this).parents('li').hasClass('active')) {
        return false;
    } else {
        $(".js-left_mm li").removeClass('active');
        $(this).parents('li').addClass('active');

        $(".js-left_mm").parents(".tab-area").scrollLeft(scrollX);

        conTarWrap.hide()
        conTarWrap.eq(tabNum).show();
    }
});
<!-- / PC용 팝업 -->