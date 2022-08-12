"use strict";

/* ==================================== 초기UI 실행 함수 호출  ==================================== */
function PubUI() {
    var o = this;
    /* 해더 높이 자동 */    o.gnb_footer = function() {
        gnb_footer_resize($("header.header").innerHeight(), $("footer.footer").innerHeight());
    }, o.base = function() {
        var o = .01 * window.innerHeight;
        document.documentElement.style.setProperty("--vh", "".concat(o, "px")), window.addEventListener("resize", function() {
            var o = .01 * window.innerHeight;
            document.documentElement.style.setProperty("--vh", "".concat(o, "px"));
        });
    }, o.forms = function() {
        /* input del */
        function e(o) {
            ///console.log('$this.val()', $this.val());
            var e = !o.prop("disabled");
            "" != o.val() && e ? (o.siblings("button").css({
                display: "block"
            }), o.siblings("button").one("click", function() {
                o.val(""), o.siblings("button").css({
                    display: "none"
                });
            })) : o.siblings("button").css({
                display: "none"
            });
        }
        $("body").on("focusout", ".input_del input", function() {
            e($(this));
        }), $("body .input_del input").each(function(o) {
            e($(this));
        }), 
        /* select - box */
        $(".select2Basic").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        }), $(".select2Basic42").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        }), $(".select2Basic50").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        }), $(".select2Basic_aa").select2({
            minimumResultsForSearch: 1 / 0,
            dropdownCssClass: "select_none_line"
            /*theme: "basic"*/        }), $(".select2Basic56_line").select2({
            minimumResultsForSearch: 1
            /*theme: "basic"*/ / 0
        });
    }, o.hartMotion = function() {
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
        $(".js-work_heart").on("click", function(o) {
            o.preventDefault(), $(this).toggleClass("on");
        });
    }, o.scrollTop = function() {
        $(".js-scroll_top").on("click", function(o) {
            o.preventDefault();
            ///$(selector).offset();
            $("html, body").animate({
                scrollTop: 0
            }, 370);
        });
    }, o.mobileBack = function() {
        $(".js-history_back").click(function() {
            window.history.back();
        });
    }, 
    /* 초기실행 스크립트 */
    o.append_script = function() {///$("body").append( $(".js-append-script") );
    };
}

/* ==================================== 초기실행 함수 호출  ==================================== */$(function() {
    /* ==================================== 초기UI 실행 호출함수 호출  ==================================== */
    window.pubUI = new PubUI(), window.pubUI.gnb_footer(), // 높이 설정
    ///window.pubUI.base();       // 기본실행
    window.pubUI.forms(), // 폼요소
    window.pubUI.hartMotion(), // 하트 모션
    window.pubUI.scrollTop(), // 스크롤탑
    window.pubUI.mobileBack(), // 모바일 뒤로가기
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
    var o = window.innerWidth, //console.log(_change_width)
    o = _szTB < o || _szMB < o ? "is_pc" : "is_mb";
 //  $(window).innerWidth(); //
    return $("body").hasClass(o) || ($("body").removeClass("is_pc is_tb is_mb is_ms"), 
    $("body").addClass(o), $("body").attr("data-device", o)), o;
}

/* PC,MB images resize */function imagesResizePcMb() {
    ///document.querySelector(".imageViewer");
    ///console.log("googooowwww: " , _tar[0].naturalWidth, _tar.length);
    for (var o = $(".imageViewer"), e = 0; e < o.length; e++) {
        if (!o[e]) return !1;
        /*  
     [2022-0707]원복 /[2022-0701] 고객사요청  */        var n = o[e].naturalWidth, i = o[e].naturalHeight;
        $("body").hasClass("is_mb") ? (o[e].width = .55 * n, o[e].height = .55 * i) : (o[e].width = n, 
        o[e].height = i)
        /* var z = ((parseFloat($(window).width() / 1024) >= 1)?1:parseFloat($(window).width() / 1024));    
    var w = (parseFloat(parseInt($(_tar[i]).attr("size2"))) / 250) * 500 * z;
    _tar[i].width = w; */
        /* // [2022-0701] 고객사요청 */;
    }
 /// console.log("=========imgresize=========", _orgW, _orgH, $("body").hasClass("is_mb"))
}

/* 팝업높이계산 */function popup_fixation(o) {
    var e = o, n = $(".pop-body>.section", e).outerHeight() + 166, i = $(window).height();
    function t() {
        i = $(window).height(), 
        /* 모바일일때 && mode-mb_full 경우 사용안함 */
        (!$("body").hasClass("is_mb") || !$(".popup-align", e).hasClass("mode-mb_full")) && i <= n ? $(".popup-align", e).addClass("footer_fixed") : $(".popup-align", e).removeClass("footer_fixed");
    }
    $(window).on("resize", function() {
        t();
    }), t();
}

/* 모바일 모션 팝업 */function popup_motion_open(o) {
    $("body").hasClass("is_mb") && ($(".pop-panel", o).css({
        bottom: "-110vh"
    }), $(".pop-panel", o).animate({
        bottom: 0
    }, 370));
}

function popup_motion_close(o) {
    $("body").hasClass("is_mb") && $(".pop-panel", o).animate({
        bottom: "-110vh"
    }, 370);
}

/* 윈도우 팝업 닫기 
onclick="window.open('biddingOffline_ko-pc4.html', '','_blank');" 
onclick="javascript:window_close();"
*/
/* ========== 바디 높이 조절 ========== */function gnb_footer_resize(o, e) {
    /*  $('.main-contents') */
    var n = $("header.header").innerHeight(), i = $("footer.footer").innerHeight();
    o ? ($("#contents").css({
        "padding-top": o,
        "padding-bottom": e
    }), $("footer.footer").css({
        "margin-top": -e
    })) : ($("#contents").css({
        "padding-top": n,
        "padding-bottom": i
    }), $("footer.footer").css({
        "margin-top": -i
    }));
}

function trpScrollTop(o, e) {
    e = $(o).offset().top - ($("header.header").innerHeight() + e);
    $("html, body").animate({
        scrollTop: e
    }, 300);
}
//# sourceMappingURL=maps/pages_common_en.js.map