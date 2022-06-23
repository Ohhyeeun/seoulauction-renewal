
$(function() {



    $(".js-work_heart").trpToggleBtn(function($this) {
        $($this).addClass("on");
    }, function($this) {
        $($this).removeClass("on");
    });

    var dropdown = $(".js-dropdown-btn").trpDropdown({
        list: ".trp-dropdown_list-box",
        area: ".trp-dropdown-area"
    });
    $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
        $e.preventDefault();
        var _this = $(this);
        _this.closest("ul").find("li").removeClass("on");
        _this.closest("li").addClass("on");
        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
        dropdown.getClose();
    });

    $('.js-list_tab a').on('click', function(e) {
        e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-list_tab").parents(".tab-area").width() / 2) + $(this).width() / 2;

        if ($(this).parents('li').hasClass('active')) {
            return false;
        } else {
            $(".js-list_tab li").removeClass('active');
            $(this).parents('li').addClass('active');

            $(".js-list_tab").parents(".tab-area").scrollLeft(scrollX);
        }

    });

    $(window).on("resize", function($e) {
     //   select_resize_change();
    });

    function select_resize_change() {
        if ($("body").hasClass("is_mb")) {
            $(".js-select_page").val("2");
        } else {
            $(".js-select_page").val("1");
        }
        $(".js-select_page").trigger('change');
    }
   //select_resize_change();
});
