$(function() {

    <!-- 응찰방법 -->
    $(".js-bidding_method .btn_item").on("click", function($e) {
        $(".js-bidding_method .btn_item").removeClass("active");
        $(this).addClass("active");
    });

    <!-- [0516] 셀렉트 드롭다운 -->
    let dropdown = $(".js-dropdown-btn").trpDropdown({
        list: ".trp-dropdown_list-box",
        area: ".trp-dropdown-area"
    });
    $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
        $e.preventDefault();
        var _this = $(this);
        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn em").text($("em", _this).text());
        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
        dropdown.getClose();
    });


    <!-- 약관 -->
    let accordion_toggle;
        accordion_toggle = $(".js-accordion_btn").trpToggleBtn(
        function($this) {
        $($this).addClass("on");
        $($this).closest(".check_all-wrap").find(".gray-box").slideDown("fast");
    },
        function($this) {
        $($this).removeClass("on");
        $($this).closest(".check_all-wrap").find(".gray-box").slideUp("fast");
    });
        accordion_toggle.setBtn(0);

    $(".js_all-1").trpCheckBoxAllsImg(".js_all", ".js_item");




});