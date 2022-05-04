"use strict";

/* ==================================== 초기UI 실행 함수 호출  ==================================== */
function PubUI() {
    /* 해더 높이 자동 */
    this.gnb_footer = function() {
        //$("#contents").css({ "margin-top" : _topH });
        gnb_footer_resize($("header.header").innerHeight());
    }, this.base = function() {
        var vh = .01 * window.innerHeight;
        document.documentElement.style.setProperty("--vh", "".concat(vh, "px")), window.addEventListener("resize", function() {
            var vh = .01 * window.innerHeight;
            document.documentElement.style.setProperty("--vh", "".concat(vh, "px"));
        });
    }, this.forms = function() {
        /* input del */
        function inputdel_fn($this) {
            ///console.log('$this.val()', $this.val());
            var _noneDisable = !$this.prop("disabled");
            "" != $this.val() && _noneDisable ? ($this.siblings("button").css({
                display: "block"
            }), $this.siblings("button").one("click", function() {
                $this.val(""), $this.siblings("button").css({
                    display: "none"
                });
            })) : $this.siblings("button").css({
                display: "none"
            });
        }
        $("body").on("focusout", ".input_del input", function() {
            inputdel_fn($(this));
        }), $("body .input_del input").each(function($i) {
            inputdel_fn($(this));
        }), 
        /* select - box */
        $(".select2Basic").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        }), $(".select2Basic42").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        }), $(".select2Basic_aa").select2({
            minimumResultsForSearch: 1 / 0,
            dropdownCssClass: "select_none_line"
            /*theme: "basic"*/        }), $(".select2Basic56_line").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        });
    }, this.hartMotion = function() {
        //www.npmjs.com/package/mo-js
        /* var _hartMotion = new mojs.Burst({ left: 0, top: 0, count: 6,
      className : "mojs_hart",
    radius:   { 5: 20 },
    children: { 
    easing: 'cubic.out',
    fill:   "#4DADA7"  ,
    		duration: 500,
    }
    });  */
        $(".js-work_heart").on("click", function($e) {
            $e.preventDefault(), $(this).toggleClass("on");
        });
    }, this.scrollTop = function() {
        $(".js-scroll_top").on("click", function($e) {
            $e.preventDefault();
            ///$(selector).offset();
            $("html, body").animate({
                scrollTop: 0
            }, 370);
        });
    }, 
    /* 초기실행 스크립트 */
    this.append_script = function() {///$("body").append( $(".js-append-script") );
    };
}

/* ==================================== 초기실행 함수 호출  ==================================== */$(function() {
    /* ==================================== 초기UI 실행 호출함수 호출  ==================================== */
    window.pubUI = new PubUI(), window.pubUI.gnb_footer(), ///window.pubUI.base();       // 기본실행
    window.pubUI.forms(), // 폼요소
    window.pubUI.hartMotion(), // 하트 모션
    window.pubUI.scrollTop(), // 스크롤탑
    window.pubUI.append_script(), // 스크립트 애드
    /* 리싸이즈 공통 */
    $(window).on("resize", function() {
        responsiveDevices(), // width  : pc, mobile 체크    
        window.pubUI.gnb_footer();
    }), responsiveDevices(), window.pubUI.gnb_footer();
});

var _szTB = 1439, _szMB = 1023, _szMS = 760;

 //
//
/* 호출 */
function responsiveDevices() {
    var _temp_width = window.innerWidth, //console.log(_change_width)
    _temp_width = _szTB < _temp_width || _szMB < _temp_width ? "is_pc" : "is_mb";
 //  $(window).innerWidth(); //
    return $("body").hasClass(_temp_width) || ($("body").removeClass("is_pc is_tb is_mb is_ms"), 
    $("body").addClass(_temp_width), $("body").attr("data-device", _temp_width), console.log("===============responsiveDevices=====================")), 
    _temp_width;
}

/* PC,MB images resize */function imagesResizePcMb() {
    var _tar = $(".imageViewer");
 ///document.querySelector(".imageViewer");
    console.log("googooowwww: ", _tar[0].naturalWidth, _tar.length);
    for (var i = 0; i < _tar.length; i++) {
        if (!_tar[i]) return !1;
        var _orgW = _tar[i].naturalWidth, _orgH = _tar[i].naturalHeight;
        $("body").hasClass("is_mb") ? (_tar[i].width = .55 * _orgW, _tar[i].height = .55 * _orgH) : (_tar[i].width = _orgW, 
        _tar[i].height = _orgH);
    }
 /// console.log("=========imgresize=========", _orgW, _orgH, $("body").hasClass("is_mb"))
}

/* 팝업높이계산 */function popup_fixation($this) {
    var _this = $this, conH = $(".pop-body>.section", _this).outerHeight() + 166, winH = $(window).height();
    function resizeFn() {
        winH = $(window).height(), 
        /* 모바일일때 && mode-mb_full 경우 사용안함 */
        (!$("body").hasClass("is_mb") || !$(".popup-align", _this).hasClass("mode-mb_full")) && winH <= conH ? $(".popup-align", _this).addClass("footer_fixed") : $(".popup-align", _this).removeClass("footer_fixed");
    }
    $(window).on("resize", function() {
        resizeFn();
    }), resizeFn();
}

/* 모바일 모션 팝업 */function popup_motion_open($this) {
    $("body").hasClass("is_mb") && ($(".pop-panel", $this).css({
        bottom: "-110vh"
    }), $(".pop-panel", $this).animate({
        bottom: 0
    }, 370));
}

function popup_motion_close($this) {
    $("body").hasClass("is_mb") && $(".pop-panel", $this).animate({
        bottom: "-110vh"
    }, 370);
}

/* 윈도우 팝업 닫기 
onclick="window.open('biddingOffline_ko-pc4.html', '','_blank');" 
onclick="javascript:window_close();"
*/
/* ========== 바디 높이 조절 ========== */function gnb_footer_resize($h) {
    /*  $('.main-contents') */
    var _h = $("header.header").innerHeight();
    $h ? $("#contents").css({
        "padding-top": $h
    }) : $("#contents").css({
        "padding-top": _h
    });
}

function trpScrollTop($selector, _position) {
    _position = $($selector).offset().top - ($("header.header").innerHeight() + _position);
    $("html, body").animate({
        scrollTop: _position
    }, 300);
}
//# sourceMappingURL=maps/pages_common_ko.js.map