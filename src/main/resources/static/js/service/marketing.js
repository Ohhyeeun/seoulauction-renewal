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