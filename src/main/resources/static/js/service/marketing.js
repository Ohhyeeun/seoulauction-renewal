for (let i = 1; i <= 4; i++) {
    $("#popup_marketing"+i).addClass("js-popup_marketing"+i);
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

<!-- PC용 팝업 -->
(function() {
    var popup_marketing_pc = $(".js-popup_marketing_pc").trpLayerFixedPopup("#popup_marketing_pc-wrap");
    $(popup_marketing_pc.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_marketing_pc.open(this); // or false
        popup_fixation("#popup_marketing_pc-wrap"); // pc 스크롤
        popup_motion_open("#popup_marketing_pc-wrap"); // mb 모션

        // 순서로 제어
        /*var tabNum = $(this).index();
        var conTarWrap = $(".tab-con");
        var conTarBtn = $(".tab-list li");

        conTarWrap.hide()
        conTarWrap.eq(tabNum).show();
        conTarBtn.removeClass("active");
        conTarBtn.eq(tabNum).addClass("active"); */

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
})();
<!-- / PC용 팝업 -->


/* 화면 해상도 추가 */

function marketingViewBtn(){
    const marketingViewPcBtn = $('.tab-popup_marketing1', '.tab-popup_marketing2','.tab-popup_marketing3', '.tab-popup_marketing4');
    const marketingViewMBtn = $('.js-popup_marketing1');
    if(matchMedia("all and (min-width: 1024px)").matches) {
        $(marketingViewPcBtn).show();
        $(marketingViewMBtn).hide();
    } else {
        $(marketingViewPcBtn).hide();
        $(marketingViewMBtn).show();
    }
}

marketingViewBtn();

$(window).resize(function(){
    marketingViewBtn();
});

