// Swiper 세팅
var swiper_academy;
var onceFn = $(".width_check").trpUtilityChangeOnceFn(
    function($name) {
        swiper_setting()
    }
);

function swiper_setting() {
    if (swiper_academy) {
        swiper_academy.destroy()
    };

    swiper_academy = new Swiper('.js-swiper_academy .gallery_container', {
        autoplay: 3000,
        loop: true,
        pagination: ".js-swiper_academy .pagination",
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