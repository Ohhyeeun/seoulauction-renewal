/**
 * ----------------------------------------------------------------------------
 * UI
 * ----------------------------------------------------------------------------
 */

// 모바일 LOT 버튼 클릭시 팝업 변경(전체 LOT 보기 팝업)
$(".js-lotbox-btn").on("click", function($e) {
  $(".allview_fixed-wrap.lot .js-fixed_total").addClass("on")
  $(".allview_fixed-wrap.lot").addClass("active");
});

$(".allview_fixed-wrap.lot .js-fixed_total").on("click", function() {
  $(this).removeClass("on");
  $(".allview_fixed-wrap.lot").removeClass("active");
});

// 외부영역 클릭 시 닫힘
$(document).mouseup(function(e) {
  if ($(".js-modal").has(e.target).length === 0) {
    $(".js-modal").parent(".allview_fixed-wrap").removeClass("active");
    $(".js-modal").closest(".js-fixed_total").removeClass("on");
  }
});

// 탭 선택
$('.js-left_mm a').on('click', function(e) {
  e.preventDefault();
  var tar = $(this).position().left;
  var scrollX = tar - ($(".js-left_mm").parents(".tab-area").width() / 2) + $(this).width() / 2;

  if ($(this).parents('li').hasClass('active')) {
    return false;
  } else {
    $(".js-left_mm li").removeClass('active');
    $(this).parents('li').addClass('active');

    $(".js-left_mm").parents(".tab-area").scrollLeft(scrollX);
  }
});

// 셀렉트 드롭다운
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

// 탭 메뉴
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

// PC, Mobile select 값변경
// $(function() {
//   $(window).on("resize", function($e) {
//     select_resize_change();
//   });

//   function select_resize_change() {
//     if ($("body").hasClass("is_mb")) {
//       $(".js-select_page").val("2");
//     } else {
//       $(".js-select_page").val("1");
//     }
//     $(".js-select_page").trigger('change');
//   }
//   select_resize_change();
// });