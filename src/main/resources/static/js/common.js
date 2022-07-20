$(function() {

    const locale = document.documentElement.lang;


    const sleep = (ms) => new Promise(resolve => {
        setTimeout(resolve, ms)
    });

    //진행중 경매리스트
    loadIngAuctionList();

    //gnb메뉴 now표시
    setGnbNowBadge();

    //마이페이지 확장메뉴 now표시
    if (sessionStorage.getItem("is_login") === "true") {
        setMyMenuBadge();
    }


    function loadIngAuctionList() {


        axios.get('api/main/ingAuctions')
            .then(function (response) {
                const success = response.data.success;
                if (success) {
                    const ingAuctionList = response.data.data;
                    ingAuctionList.map(item => {
                        const titleJSON = JSON.parse(item.TITLE_BLOB);
                        const titleText = localeOrdinal(item.SALE_TH, locale) + titleJSON[locale];
                        const path = `${item.SALE_KIND === 'LIVE'? 'live/' : ''}`;
                        const returnDom = `<a href='/auction/${path}list/${item.SALE_NO}' class="Ingbanner" target="_blank">
                                            <figure class="border-txt-darkg Ingbanner-img">
                                                <img src="${item.DEFAULT_IMAGE_PATH !== "" ? item.DEFAULT_IMAGE_PATH : ``}" 
                                                     onerror="${item.DEFAULT_IMAGE_PATH}"
                                                    alt="ing_auction01">
                                            </figure>
                                            <div class="Ingbanner-txt text-over">
                                                <span class="auctionKind-box Ingkind-auction ${item.SALE_KIND === 'LIVE' ? 'on' : ''}">${item.SALE_KIND}</span>
                                                  <p class="text-over" title="${titleText}">${titleText}</p>
                                                <span class="Ingbanner-arrow"></span>
                                            </div>
                                        </a>`;
                        // this.src='/images/pc/thumbnail/gnb_thubnatil_ready.jpg'
                        document.querySelector(".Ingbanner-box").insertAdjacentHTML('beforeend', returnDom);
                    });

                }
            })
            .catch(function (error) {
                console.log(error);
            });
    }

    function setGnbNowBadge() {


        axios.get('api/main/ingMenuCount')
            .then(function (response) {
                const success = response.data.success;
                if (success) {
                    const menuCount = response.data.data;
                    const badgeHtml = '<span class="currentIng">NOW</span>';
                    if (menuCount.AuctionCount > 0)
                        document.querySelector('#menu_auction').insertAdjacentHTML('beforeend', badgeHtml);
                    if (menuCount.UpcomingCount > 0)
                        document.querySelector('#menu_upcoming').insertAdjacentHTML('beforeend', badgeHtml);
                    if (menuCount.ExhibitionCount > 0)
                        document.querySelector('#menu_exhibit').insertAdjacentHTML('beforeend', badgeHtml);
                    if (locale === 'ko' && menuCount.AcademyCount > 0)
                        document.querySelector('#menu_academy').insertAdjacentHTML('beforeend', badgeHtml);
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    }

    function setMyMenuBadge() {

        axios.get('api/main/isHaveToPayWorkExist')
            .then(function (response) {
                const success = response.data.success;
                if (success) {
                    const isExist = response.data.data.isExist;
                    const badgeHtml = '<i class="utility-icon on"></i>';
                    console.log(isExist)
                    if (isExist)
                        document.querySelector('#MyMenuOnlineBadge a').insertAdjacentHTML('beforeend', badgeHtml);
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    }


    /* pc 다크모드 */
    $('.darkmodeBg').click(function () {

        $('*').toggleClass('dark');

        $('.auctionTab-btn').click(function () {
            const darkIngTab = $(this).index();
            $('.auctionTab-btn').removeClass('dark');
            $('.auctionTab-contents').removeClass('dark');

            $(this).addClass('dark');
            $(".auctionTab-contents").eq(darkIngTab).addClass('dark');
        });

        $('.darktxt').text('다크모드로 보기');
        $('.darktxt.dark').text('라이트모드로 보기');
        $('.darktxt-en').text('Dark Mode');
        $('.darktxt-en.dark').text('Light Mode');

        const theme = localStorage.getItem('theme');
        if (theme) {
            localStorage.removeItem('theme');
        } else {
            localStorage.setItem('theme', 'dark');
        }
    });

    /* mobile 다크모드 */
    $('.modebox').click(function () {
        console.log(53455345);
        if ($('.mode-toggle>input').is(":checked")) {
            console.log(3424);
            $('*').addClass('dark');
        } else {
            console.log(75467454);
            $('*').removeClass('dark');
        }

        const theme = localStorage.getItem('theme');
        if (theme) {
            localStorage.removeItem('theme');
        } else {
            localStorage.setItem('theme', 'dark');
        }
    });

    /* 다크모드 새로고침 시 */
    window.addEventListener('DOMContentLoaded', () => {
        // console.log("theme ", localStorage.getItem('theme'));

        $('*').toggleClass(localStorage.getItem('theme'));

        $('.auctionTab-btn').click(function () {
            const darkIngTab = $(this).index();
            $('.auctionTab-btn').removeClass('dark');
            $('.auctionTab-contents').removeClass('dark');

            $(this).addClass('dark');
            $(".auctionTab-contents").eq(darkIngTab).addClass('dark');
        });

        $('.darktxt').text('다크모드로 보기');
        $('.darktxt.dark').text('라이트모드로 보기');
        $('.darktxt-en').text('Dark Mode');
        $('.darktxt-en.dark').text('Ligth Mode');

        $('.mode-toggle>input').addClass(localStorage.getItem('theme'));
    });

    /* 다크모드 버튼 hover */
    $('.darkmodeBg').hover(function () {
        $('.darkmode').toggleClass('active');
    }, function () {
        $('.darkmode').toggleClass('active');
    });
    $('.darkmodeBg.dark').hover(function () {
        $('.darkmode.dark').toggleClass('active');
    }, function () {
        $('.darkmode.dark').toggleClass('active');
    });



    /* 띠배너 */
    $('.beltclose-btn').click(function () {
        $('.header_beltbox').stop().slideUp(400);
        $('.header_beltbox').removeClass('on');
    });

    /*gnb menu */
    let gnb = $(this).index();
    if (matchMedia("all and (min-width: 1024px)").matches) {

        $('.header_gnbmenu>li>a').mouseenter(function () {

            $('.main-contents').click(function () {
                $(".submenuBg").stop().slideUp();
                $('.header_gnbmenu>li>a').removeClass('on');
            });

            $('.header_gnbmenu>li>a').removeClass('on');
            $(".submenuBg").stop().slideDown(function () {
                $(this).css({'top': '61px'});
            });
            $(this).eq(gnb).addClass('on');
        });
        $(".submenuBg").mouseleave(function () {
            $(".submenuBg").stop().slideUp();
            $('.header_gnbmenu>li>a').removeClass('on');
        });

        /* main gnb fixed */
        // $('.header').show(function () {
        //     $('.main-header').show(function () {
        //         /*$('.main-contents').css('top','118px'); */
        //         $('.main-contents').css('margin-top', '102px');
        //     });
        //     $(this).hasClass('main-header');
        // });

        /* 띠배너 beltbanner */
        $('.header_beltbox.on').show(function () {
            $('.main-contents').css('margin-top', '162px');
        });
        $('.beltclose-btn').click(function () {
            $('.main-contents').css('margin-top', '102px');
        });
        /* 오프라인 라이브응찰 화면(pc) */
        $('.bidding_pc').show();
        $('.bidding_mo').hide();

        /*$('.submenuBg').show(function(){
            $('.main-contents').click(function(){
                $('.submenuBg').slideUp();
            });
        });*/

        // /* 띠배너 beltbanner */
        // $('.header_beltbox.on').show(function(){
        //     $('.main-contents').css('margin-top','162px');
        // });
    } else { /* 테블릿 */

        $('.header_gnbmenu>li>a').mouseenter(false);
        $(".submenuBg").mouseleave(false);

        /* mobile gnb bg */
        $('.m-gnbmenu').off('click');
        $('.m-gnbmenu').click(function () {

            $('.gnb_submenuBg').addClass('on');
            $('.submenuBg').addClass('on');
            $('body').css({'overflow': 'hidden'});
            $('.submenuBg').animate({'right': '0', 'transition': 'ease .3s', 'display': 'block'}, function () {


                $('.gnb_submenuBg').off('click');
                $('.gnb_submenuBg').click(function () {

                    $('body').css({'overflow': 'visible'});
                    $('.submenu').stop().slideUp(function () {
                        $('.gnbmenu_arrow').removeClass('on');
                    });
                    $('.submenuBg').animate({'right': '-100%', 'transition': 'ease .2s'}, function () {
                        $(this).removeClass('on');
                        $('.gnb_submenuBg').removeClass('on');
                    });
                });

                $('.subGnbmenu-tit').off('click');
                $('.subGnbmenu-tit').click(function () {


                    let Mobilegnb = $(this).index();

                    $('.gnbmenu_arrow>span').removeClass('on');
                    $('.gnbmenu_arrow').removeClass('on');
                    $('.submenu').stop().slideUp();


                    $('.gnbmenu_arrow>span').eq(Mobilegnb).toggleClass('on');
                    $('.gnbmenu_arrow').eq(Mobilegnb).addClass('on');
                    $('.submenu').eq(Mobilegnb).stop().slideDown();

                    $('.modebox').removeClass('on');
                });
            });
        });
        $('.submenuBg-closeBtn').off('click');
        $('.submenuBg-closeBtn').click(function () {

            $('body').css({'overflow': 'visible'});
            $('.gnbmenu_arrow').removeClass('on');
            $('.submenuBg').animate({'right': '-100%', 'transition': 'ease .2s'}, function () {
                $(this).removeClass('on');
                $('.gnb_submenuBg').removeClass('on');
            });
        });

        /* main gnb fixed */
        // $('.header').show(function () {
        //     $('.main-header').show(function () {
        //         /*$('.main-contents').css('top','56px'); */
        //         $('.main-contents').css('margin-top', '56px');
        //     });
        //     $(this).hasClass('main-header');
        // });

        /* 오프라인 라이브응찰 화면(mo) */
        $('.bidding_mo').show();
        $('.bidding_pc').hide();
    }

    /* utility menu */
    /*$('.utility-join').hide();
    $('.utility-login').hide();
    $('.gnb_join').hide();
    $('.gnb_login').hide();*/

    /* 모바일 gnb 유틸리티 */
    $('.gnb_logout').click(function () {
        $('.gnb_join').show();
        $('.gnb_member').hide();
        $('.gnb_login').show();
        $(this).hide();
    });

    /*pc 유틸리티 */
    /*$('.utility-logout').click(function(){
        $('.utility-join').show();
        $('.utility-account').hide();
        $('.utility-login').show();
        $(this).hide();
    });*/
    let utilityMenu = $(this).index();
    $('.utility-tab').mouseenter(function () {
        $(this).children('a').addClass('on');
        $('.bubble-box').removeClass('on');
        $(this).children('.bubble-box').eq(utilityMenu).addClass('on');
    });
    $('.bubble-box').mouseleave(function () {
        $(this).removeClass('on');
        $('.utility-lang>a').removeClass('on');
    });
    $('.utility-tab').mouseleave(function () {
        $(this).children('a').removeClass('on');
        $('.bubble-box').removeClass('on');
    });

    /* top search 유틸리티 겹침X */
    $('.topsearch-text').click(function () {
        if ($('.search-bubble-box').hasClass('on')) {
            $('.bubble-box01').eq(utilityMenu).removeClass('hide');
            $('.bubble-box02').eq(utilityMenu).removeClass('hide');
            $('.search-bubble-box').addClass('on');
        } else { /* 검색기능 보여질 때 겹침X */
            $('.bubble-box01').addClass('hide');
            $('.bubble-box02').addClass('hide');
            $('.search-bubble-box').removeClass('on');
            $('.main-contents, #contents').click(function(){
                $('.search-bubble-box').removeClass('on');
                $('.bubble-box01').eq(utilityMenu).removeClass('hide');
                $('.bubble-box02').eq(utilityMenu).removeClass('hide');
            });
        };
        $('.search-bubble-box').toggleClass('on');
    });

    /* 최근검색 키워드 삭제 */
    $('.keyword-del').click(function () {
        let id = $(this).attr("searchContent");
        $(this).parent('.recent-keyword').hide();
        var items = getCookie("keywordHistory");

        if(items){
            var itemArray = items.split(',');
            let index = itemArray.indexOf(id);
            itemArray.splice(index, 1)
            items = itemArray.join(',');
            setCookie("keywordHistory", items, 1);
        }
    });
    /* 최근검색 전체삭제 */
    $('.keyword-all-del').click(function () {
        $('.recent-keyword').hide();
        setCookie("keywordHistory", "", 1);
    });
    /* 모바일 gnb 서치*/
    $('.m-top-search').click(function () {
        $('.topsearch-box>form').animate({'right': '0', 'transition': 'ease .5s'});
        $('body').css({'overflow':'hidden'});
        //$('.topsearch-box>form').show();
        $('.topsearch>input').show();
        $('.topsearch-btn').show();
        $('.search-bubble-box').show();
    });
    $('.top-search-closeBtn').click(function () {
        $('.topsearch-box>form').animate({'right': '-100%', 'transition': 'ease .5s'});
        $('body').css({'overflow':'visible'});
    });

    /*top search placeholder */
    $('.topsearch>input').attr('placeholder', '작가,작품명 검색'); /* placeholder 초기값 */
    $('.topsearch-en>input').attr('placeholder', 'Search');

    // $(window).resize(function () {
    //     const windowWidth1279 = window.matchMedia('screen and (min-width:1279px)');
    //     const windowWidth1024 = window.matchMedia('screen and (min-width:1024px)');
    //     const windowWidth1023 = window.matchMedia('screen and (max-width:1023px)');
    //
    //     if (windowWidth1279.matches) {
    //         $('.topsearch>input').attr('placeholder', '작가 또는 작품명 검색');
    //         $('.topsearch-en>input').attr('placeholder', 'Search by artist or work name');
    //     } else if (windowWidth1024.matches) {
    //         $('.topsearch>input').attr('placeholder', '검색');
    //         $('.topsearch-en>input').attr('placeholder', 'Search');
    //     } else if (windowWidth1023.matches) {
    //         $('.topsearch>input').attr('placeholder', '검색을 입력하세요');
    //         $('.topsearch-en>input').attr('placeholder', 'Search');
    //     }
    // });

    /* footer family site */
    $('.Familysite-selectbox').click(function () {
        // let familyH = $(this).index();
        // $('.innerfooter').removeClass('on');
        // $(this).removeClass('on');
        // $('.innerfooter').eq(familyH).addClass('on');
        // $('.Familysite').eq(familyH).addClass('on');

        if ($('.familyselect').hasClass('on')) { /* familyselet 탭 닫기 */
            // $('.familyselect').addClass('on');
            $('.Familysite').removeClass('on'); /* 화살표 */
        } else {
            $('.innerfooter').click(function(){
                $('.familyselect').removeClass('on');
                $('.Familysite').removeClass('on'); /* 화살표 */
            });
            $('.Familysite').addClass('on'); /* 화살표 */
        };
        $('.familyselect').toggleClass('on');
    });

    //모바일 한글/영문 변환 버튼 
    let lang = getCookie('lang');
    if (!lang || lang === 'ko') {
        $("#mb_common_lang").append('<a href=' + $(location).attr('pathname')  +'?lang=en>ENG</a>');
    } else if ( lang === 'en'){
        $("#mb_common_lang").append('<a href=' + $(location).attr('pathname')  +'?lang=ko>KOR</a>');
    }
});

//각 서비스 별 조회수 증가 기능.
function addReadCount(id , type){

    axios.post('api/main/addReadCount/'+id +'?type=' + type)
        .then(function (response) {
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });
}

//로그인 여부를 체크해서 로그인이 안되어있을경우 로그인 페이지로 보냄.
function checkLogin(){
    if(sessionStorage.getItem("is_login") === 'false'){
        let login_message = ( getCookie('lang') === "" ||  getCookie('lang') === 'ko' ) ?
            '로그인을 진행해주세요.' : 'Please Login in.';
        alert(login_message);
        location.href= '/login';
        return false;
    }
    return true;
}

// 세션로그아웃
function logout(loginId) {
	console.log(loginId)
	location.href = "/processLogout";
}

// locale변경
function changeLang(url, param, locale) {
	param = param.replace("lang=ko", "").replace("lang=en","").replaceAll("&", "");
	param = param == '' ? '' : "&" + param
	url += "?lang=" + locale + param;
	location.href = url;
}


/* top search filter 기능 */
function searchFilter() {
    if(window.Event.keyCode == 13){
        $('.topsearch-btn').trigger("click");
        $('.search-bubble-box').removeClass('on');
    } else if($('.topsearch-text').val().length == 0) {
        $('.search-bubble-box').removeClass('on');
    } else {
        $('.search-bubble-box').addClass('on');
    };
}

function closeToday(cookieName){
    setCookie(cookieName, 'done', 1);
}

// 쿠키 가져오기
function getCookie(name) {
    const nameOfCookie = name + "=";
    let x = 0;
    while (x <= document.cookie.length) {
        const y = (x + nameOfCookie.length);
        if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x) + 1;
        if (x == 0)
            break;
    }
    return "";
}

// 만료 후 클릭한 시간까지 쿠키 설정
function setCookie(name, value, expiredays) {
    const todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//숫자를 천단위마다 콤마 해줌.
function numberWithCommas(x) {
    if(x === undefined){
        return x;
    }
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

//영수증 출력 함수
function receiptPopup (pay) {
		var _width = '420';
   		var _height = '540';
		var _left = Math.ceil(( window.screen.width - _width )/2);
    	var _top = Math.ceil(( window.screen.height - _height )/2);
		var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540,top="+_top+",left="+_left; 
        var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+pay.getAttribute('data-id')+"&type="+pay.getAttribute('data-type'); 
        //type  값  세팅  ::  매출전표: 0,  현금영수증: 1 
       window.open(url,"popupIssue",status); 
}

function onlyNumber(obj, type) {
    const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
    if (regExp.test(obj.value)) {
        obj.value = obj.value.replace(regExp, '');
    }
    if (type) {
        const regExp2 = /[^0-9]/gi;
        if (regExp2.test(obj.value)) {
            obj.value = obj.value.replace(regExp2, '');
        }
    }
}

function phoneNumber(obj) {
    if (event.keyCode < 48 || event.keyCode > 57) {
        event.returnValue = false;
    }

    let mobile_len = obj.value.length;
    if (event.keyCode == 8) {
        obj.value = obj.value.slice(0, mobile_len);
        return 0;
    } else if (mobile_len == 3 || mobile_len == 8) {
        obj.value += '-';
    }
}

function phoneNumberBlur(obj) {
   if(obj.value.length == 11 && obj.value.indexOf('-')== -1){
		obj.value = obj.value.slice(0,3) + '-' +obj.value.slice(3,7)+ '-' +obj.value.slice(7,11)
	}
}


function telNumber(obj){
	if (obj.value != '') {
		obj.value = obj.value.replaceAll("-", "");
		if (obj.value.length == 11) {
			obj.value = obj.value.substring(0, 3) + "-" + obj.value.substring(3, 7) + "-" + obj.value.substring(7);
		} else if (obj.value.length == 8) {
			obj.value = obj.value.substring(0, 4) + "-" + obj.value.substring(4);
		} else if (obj.value.length == 10) {
			if (obj.value.startsWith("02")) {
				obj.value = obj.value.substring(0, 2) + "-" + obj.value.substring(2, 6) + "-" + obj.value.substring(6);
			}else{
				obj.value = obj.value.substring(0, 3) + "-" + obj.value.substring(3, 6) + "-" + obj.value.substring(6);
			}
		} else {
			if (obj.value.startsWith("02")) {
				obj.value = obj.value.substring(0, 2) + "-" + obj.value.substring(2, 5) + "-" + obj.value.substring(5);
			} else { // 그외는 012-123-1345
				obj.value = obj.value.substring(0, 3) + "-" + obj.value.substring(3, 6) + "-" + obj.value.substring(6);
			}
		}
	}
}

/* 공통 login 팝업 */
/*
 * trpLayerFixedPopup		: 레이어 팝업띄움
 * @param  $tarPopup		: $tarPopup(팝업타겟)
 * @method  open		    : 팝업 띄우기
 * @method  close		    : 팝업 닫기
 * @method  openToday($this, $cookieName)  : 팝업 띄우기 오늘하루 열지 않기 
 * @method  closeToday($cookieName)        : 팝업 닫기   오늘하루 열지 않기 
 * @method  getBtn		    : 팝업 버튼
 */
var trpLayerFixedPopupScroll_top = 0;
jQuery.fn.trpLayerFixedPopup = function( $tarPopup ){
    var _self       = this;             // 팝업열기버튼 & 팝업닫을대 돌아갈타겟
    var _selfOff    = true;				// 오픈시 포커스 사용안함.
    var _isShow     = false;			// 팝업 열려 있는지 상태.
    //var trpLayerFixedPopupScroll_top = $(window).scrollTop();
    var _tarPopup   = ( $tarPopup )?_tarPopup=$tarPopup : _tarPopup="" ;
    var _dim = $('<div class="popup-dim"></div>');
    var _dim_class = "";
 

    // 팝업 열기
    function popupOpen($this){
      if( $this ){_self = $this; }else{ _selfOff = false; }
      if(_tarPopup == ""){ _tarPopup =  $(_self).attr('href'); } // 타겟값이 없다면 a태그로 인식해서 href적용

      _dim_class = _tarPopup.replace(/\#/g,'')
      _dim.addClass(_dim_class).css({ display:"none" });
      $(_tarPopup).before(_dim);
      _dim.fadeIn(300);
      //$(_tarPopup).fadeIn(300);

      $(_tarPopup).show();
      $(_tarPopup).find(".popup-layer").hide().fadeIn(300);

      if( $(".popupfixed-wrap").filter(":visible").length == 1){
        trpLayerFixedPopupScroll_top = $(window).scrollTop();
        $("html, body").scrollTop(0);
        $(".wrapper").css({ position:"fixed",     top: (trpLayerFixedPopupScroll_top * -1) });
        $(".wrapper").attr("data-pop", "on");
        //$("html, body").css({ overflow : "hidden"});
      }

      return false;
    }


    // 팝업 닫기
    function popupClose($completeFn){
        if( $(".popupfixed-wrap").filter(":visible").length == 0){ return false; }

        $(_dim).fadeOut(300, function(){
          _dim.remove();            
        });
        $(_tarPopup).fadeOut(300 ,function(){
          if( $(".popupfixed-wrap").filter(":visible").length == 0){
              $(".wrapper").css({ position:"relative",  top:"0" });
              $("html, body").scrollTop(trpLayerFixedPopupScroll_top);
              $(".wrapper").attr("data-pop", "off");
              //$("html, body").css({ overflow : "initial"});
          }
          if(_selfOff)$(_self).focus(); 
          if ( $completeFn != undefined && typeof $completeFn == 'function') { // 함수인지 체크해서 호출
            $completeFn();  
          }
          
        });
        return $(_tarPopup); 
    }

    return { 
        open:function($this){            // 팝업 열기
          if (!_isShow ){                // false 값일때 열림
            _isShow = true;
            popupOpen($this);
          }
        }
        ,close:function($completeFn){                     // 팝업 닫기
          _isShow = false;
          return popupClose($completeFn);
        }
        ,openToday:function($this, $cookieName){			// 팝업 오늘하루 열기
          var isShow = trpGetCookie($cookieName)=='true'?true:false;
          if (!isShow ){						// false 값일때 열림
            _isShow = true;
            
            if( $this == "" || $this == false ){ $this = false };
            popupOpen($this);
          }
        }      
        ,closeToday:function($cookieName, $completeFn){			// 팝업 오늘하루 닫기
          _isShow = false;
          
          if( $cookieName == "" || $cookieName == false ){ $cookieName = false };
          if($cookieName){
			var _cookieName = $cookieName;
			if(_cookieName){trpSetCookie(_cookieName,'true',1);}	// 오늘하루 안열기
		  }
          return popupClose($completeFn);
        }     
        ,getBtn: _self
        ,getPopup: _tarPopup

    }; // return//

};// trpLayerFixedPopup


/**
 * trpBgDim			: 딤드 전체 영역, 투명도, 색상
 * @param $opacity  : 투명도(0.3)
 * @param $bgColor  : 배경색(#000)
 * #opacity  : #popup_dim {position: fixed; top: 0; left: 0; width:100%; height:100%; background: #000; opacity: .7; filter: alpha(opacity=70);  z-index:9990;}
 */
jQuery.fn.trpBgDim = function($opacity,$bgColor){
	//console.log($(this))
	var _docW,_docH, _opacityO , _opacityE, _bgColor;
	//_docW=$(document).width(); 		// dim 크기
	//_docH=$(document).height();		// dim 크기
	_docW="100%";
	_docH="100%";

	_opacityO = ($opacity)? $opacity : 0.7 ;	 // 투명도
	_opacityE = _opacityO *100;					 // ie 투명도
	_bgColor  = ($bgColor)?  $bgColor : "#000" ; // 색상
	$(this).css({ "position":"fixed", top:0, left:0 ,"width":_docW, "height":_docH , opacity:_opacityO, "background-color": _bgColor ,
		"-ms-filter":"progid:DXImageTransform.Microsoft.Alpha(Opacity="+ _opacityE +") !important", "filter": "alpha(opacity="+ _opacityE +") !important"
	});
};

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

//pc, mobile 구분
function checkPlatform(ua) {
    if(ua === undefined) {
        ua = window.navigator.userAgent;
    }

    ua = ua.toLowerCase();
    var platform = {};
    var matched = {};
    var userPlatform = "pc";
    var platform_match = /(ipad)/.exec(ua) || /(ipod)/.exec(ua)
        || /(windows phone)/.exec(ua) || /(iphone)/.exec(ua)
        || /(kindle)/.exec(ua) || /(silk)/.exec(ua) || /(android)/.exec(ua)
        || /(win)/.exec(ua) || /(mac)/.exec(ua) || /(linux)/.exec(ua)
        || /(cros)/.exec(ua) || /(playbook)/.exec(ua)
        || /(bb)/.exec(ua) || /(blackberry)/.exec(ua)
        || [];

    matched.platform = platform_match[0] || "";

    if(matched.platform) {
        platform[matched.platform] = true;
    }

    if(platform.android || platform.bb || platform.blackberry
        || platform.ipad || platform.iphone
        || platform.ipod || platform.kindle
        || platform.playbook || platform.silk
        || platform["windows phone"]) {
        userPlatform = "mobile";
    }

    if(platform.cros || platform.mac || platform.linux || platform.win) {
        userPlatform = "pc";
    }

    return userPlatform;
}


function dotSubString(str,len){
    let result ='';
    if(str.length > len){
        result = str.substring(0,len)+'...';
    }else{
        result = str;
    }
    return result;
}
//숫자를 한국어로
function num2han(num) {
    num = parseInt((num + '').replace(/[^0-9]/g, ''), 10) + '';  // 숫자/문자/돈 을 숫자만 있는 문자열로 변환
    if (num == '0')
        return '영';
    let number = ['영', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구'];
    let unit = ['', '만', '억', '조'];
    let smallUnit = ['천', '백', '십', ''];
    let result = [];  //변환된 값을 저장할 배열
    let unitCnt = Math.ceil(num.length / 4);  //단위 갯수. 숫자 10000은 일단위와 만단위 2개이다.
    num = num.padStart(unitCnt * 4, '0')  //4자리 값이 되도록 0을 채운다
    let regexp = /[\w\W]{4}/g;  //4자리 단위로 숫자 분리
    let array = num.match(regexp);  //낮은 자릿수에서 높은 자릿수 순으로 값을 만든다(그래야 자릿수 계산이 편하다)
    for (let i = array.length - 1, unitCnt = 0; i >= 0; i--, unitCnt++) {
        let hanValue = _makeHan(array[i]);  //한글로 변환된 숫자
        if (hanValue == '')  //값이 없을땐 해당 단위의 값이 모두 0이란 뜻.
            continue;
        result.unshift(hanValue + unit[unitCnt]);
    }
    //여기로 들어오는 값은 무조건 네자리이다. 1234 -> 일천이백삼십사
    function _makeHan(text) {
        var str = '';
        for (var i = 0; i < text.length; i++) {
            var num = text[i];
            if (num == '0')  //0은 읽지 않는다
                continue;
            str += number[num] + smallUnit[i];
        }
        return str;
    }
  return result.join('');
}
//오프라인 가격의 호가를 정해서 알려줌
function growPriceForOffline(price){

    let growPrice;

    if(price < 1000000 ){
        growPrice = 50000;
    } else if (price >= 1000000 && price < 2000000 ){
        growPrice = 100000;
    } else if (price >= 2000000 && price < 4000000 ){
        growPrice = 200000;
    } else if (price >= 4000000 && price < 10000000 ){
        growPrice = 300000;
    } else if (price >= 10000000 && price < 20000000 ){
        growPrice = 500000;
    } else if (price >= 20000000 && price < 30000000 ){
        growPrice = 1000000;
    } else if (price >= 30000000 && price < 50000000 ){
        growPrice = 2000000;
    } else if (price >= 50000000 && price < 100000000 ){
        growPrice = 3000000;
    } else if (price >= 100000000 && price < 200000000 ){
        growPrice = 5000000;
    } else if (price >= 200000000 && price < 300000000 ){
        growPrice = 10000000;
    } else if (price >= 300000000 && price < 500000000 ){
        growPrice = 20000000;
    } else if (price >= 500000000 && price < 1000000000 ){
        growPrice = 30000000;
    } else if (price >= 1000000000 && price < 2000000000 ){
        growPrice = 50000000;
    } else if (price >= 2000000000){
        growPrice = 100000000;
    }

    return growPrice;
}

//영어 요일을 한글 요일로
function enDayToHanDay(enDay){
    let hanDay;
    switch (enDay){
        case 'Mon' : hanDay = '월'; break;
        case 'Tue' : hanDay = '화'; break;
        case 'Wed' : hanDay = '수'; break;
        case 'Thu' : hanDay = '목'; break;
        case 'Fri' : hanDay = '금'; break;
        case 'Sat' : hanDay = '토'; break;
        case 'Sun' : hanDay = '일'; break;
    }

    return hanDay;
}


/* 반응형 resize */ 
$(window).resize(function(){

    let gnb = $(this).index();

     //$('.submenuBg').hide();

    if(matchMedia("all and (min-width: 1024px)").matches) {

        // if($('.submenuBg').show()){
        //     $('.submenuBg').hide();
        // }

        $('.header_gnbmenu>li>a').off('mouseenter');
        $('.header_gnbmenu>li>a').mouseenter(function(){
            $('.main-contents').click(function(){ /* 외부 클릭시 닫기 */
                $(".submenuBg").stop().slideUp('fast', function(){
                    $(this).css({'top':'61px'});
                });
                $('.header_gnbmenu>li>a').removeClass('on');
            });

            $('.submenuBg').css({'right':'auto','height':'auto','background-color':'#f2f2f2','top':'61px'}).stop().slideDown();

            /*$('.gnb_submenuBg').removeClass('on').css({'right':'-100%'}); */
            $('.gnb_submenuBg').show(function(){
                $(this).css({'right':'-100%'});
            });

           // $('.subGnbmenu-tit').unbind().click();
            $('.gnbmenu_arrow').removeClass('on');
            /*$('.submenu').unbind.stop().slideUp(); */
            $('.submenu').css({'display':'block'});


            $('.header_gnbmenu>li>a').removeClass('on');
            $(".submenuBg").stop().slideDown();
            $(this).eq(gnb).addClass('on');

            $('.subGnbmenu-tit').off('click');
            $('.submenu').css({'margin-top':'0'});
        });

        $(".submenuBg").mouseleave(function(){
            $(".submenuBg").stop().slideUp();
            $('.header_gnbmenu>li>a').removeClass('on');
        });

        $('.bubble-box').mouseleave(function(){
            $(this).removeClass('on');
            $('.utility-lang>a').removeClass('on');
        });

        $('.utility-tab').mouseleave(function(){
            $(this).children('a').removeClass('on');
            $('.bubble-box').removeClass('on');
        });

        //$('.gnb_submenuBg').hide();
        $('.submenuBg').hide(); 

        $('.header_beltbox.on').show(function(){
            $('.main-contents').css('margin-top','162px');
        });
        /* main gnb fixed */
        $('.header').show(function(){
            $('.main-header').show(function(){
                /*$('.main-contents').css('top','56px'); */
                $('.main-contents').css('margin-top','102px');
            });
            $(this).hasClass('main-header');
        });
        $('.beltclose-btn').click(function(){
            $('.header_beltbox').stop().slideUp(400);
            $('.main-contents').css('margin-top','102px');
            $('.header_beltbox').removeClass('on');
        });

        /* 모바일 메뉴 open 된 채로 resize 될 때 gnb 닫힘 */
        $('.gnb_submenuBg').removeClass('on');
        $('.submenuBg').removeClass('on');

        /* top search right 위치 */
        // $('.topsearch-box>form').animate({'right': '0'});  
        $('.main-contents, #contents').click(function(){
            $('.search-bubble-box').removeClass('on');
            $('.bubble-box01').eq(utilityMenu).removeClass('hide');
            $('.bubble-box02').eq(utilityMenu).removeClass('hide');
        });

        /* 오프라인 라이브응찰 화면(pc) */
        $('.bidding_pc').show();
        $('.bidding_mo').hide();

    } else {
        $(".submenuBg").off('mouseleave');
        $('.submenuBg').off('mouseenter');
        $('.header_gnbmenu>li>a').off('mouseenter');
        $('.submenu').hide();

        $('.m-gnbmenu').off('click');
        $('.m-gnbmenu').click(function(){

            if($('.header_beltbox').hasClass('on')){ /* on */
                $('.submenuBg').animate({'top':'-43px'});
            } else {
                $('.submenuBg').animate({'top':'0'});
            };

            $('.submenuBg').removeAttr("style");
            $('.submenuBg').hide();

            $('.gnb_submenuBg').addClass('on');
            $('.submenuBg').addClass('on');
            $('body').css({'overflow':'hidden'});
            $('.submenuBg').css({'right':'-100%'});
            $('.submenuBg').show();
            $('.submenuBg').animate({'right':'0','transition':'ease .3s'}, function(){


                //$('.gnb_submenuBg').show();
                $('.gnb_submenuBg').off('click');
                $('.gnb_submenuBg').click(function(){


                    $('body').css({'overflow':'visible'});
                    $('.submenu').stop().slideUp(function(){
                        $('.gnbmenu_arrow').removeClass('on');
                    });
                    $('.submenuBg').animate({'right':'-100%','transition':'ease .2s'}, function(){
                        $(this).removeClass('on');
                        $('.gnb_submenuBg').removeClass('on');
                    });
                });

                $('.subGnbmenu-tit').off('click');
                $('.subGnbmenu-tit').click(function(){

                    let Mobilegnb = $(this).index();

                    $('.gnbmenu_arrow>span').removeClass('on');
                    $('.gnbmenu_arrow').removeClass('on');
                    $('.submenu').stop().slideUp();


                    $('.gnbmenu_arrow>span').eq(Mobilegnb).toggleClass('on');
                    $('.gnbmenu_arrow').eq(Mobilegnb).addClass('on');
                    $('.submenu').eq(Mobilegnb).stop().slideDown();

                    $('.submenu').css({
                        'margin-top':'29.5px',
                    })

                    $('.modebox').removeClass('on');
                });
            });

            /* 오프라인 라이브응찰 화면(mobile) */
            $('.bidding_mo').show();
            $('.bidding_pc').hide();
        });

        /* 띠배너 beltbanner */
        $('.header_beltbox.on').show(function(){
            $('.main-contents').css('margin-top','100px');
        });
        $('.beltclose-btn').click(function(){
            $('.main-contents').css('margin-top','56px');
            $('.gnb_submenuBg').css('overflow','visible');
            $('.header_beltbox').removeClass('on');
        });

        /* main gnb fixed */
        $('.header').show(function(){
            $('.main-header').show(function(){
                /*$('.main-contents').css('top','56px'); */
                $('.main-contents').css('margin-top','56px');
            });
            $(this).hasClass('main-header');
        });

        $('.submenuBg-closeBtn').off('click');
        /* 닫기 버튼 */
        $('.submenuBg-closeBtn').click(function(){
            $('body').css({'overflow':'visible'});
            $('.gnbmenu_arrow').removeClass('on');
            $('.submenuBg').animate({'right':'-100%','transition':'none'}, function(){

                $(this).removeClass('on');
                $('.gnb_submenuBg').removeClass('on');
            });
            $('.gnb_submenuBg').animate({'right': '-100%','transition':'.2s'});
        });

        /* top search box */
        // $('.topsearch-box>form').animate({'right': '-100%', 'transition':'none'});

        /* 오프라인 라이브응찰 화면(mobile) */
        $('.bidding_pc').hide();
        $('.bidding_mo').show();
    }; 

    /* top search place holder */
    // const windowWidth1279 = window.matchMedia('screen and (min-width:1279px)');
    // const windowWidth1024 = window.matchMedia('screen and (min-width:1024px)');
    // const windowWidth1023 = window.matchMedia('screen and (max-width:1023px)');
    //
    // if(windowWidth1279.matches){
    //     $('.topsearch>input').attr('placeholder','작가 또는 작품명 검색');
    //     $('.topsearch-en>input').attr('placeholder','Search by artist or work name');
    //     $('.darkmodeBg').hover(function(){
    //         $('.darkmode').toggleClass('active');
    //     }, function(){
    //         $('.darkmode').toggleClass('active');
    //     });
    //     $('.darkmodeBg.dark').hover(function(){
    //         $('.darkmode.dark').toggleClass('active');
    //     }, function(){
    //         $('.darkmode.dark').toggleClass('active');
    //     });
    // } else if(windowWidth1024.matches) {
    //     $('.topsearch>input').attr('placeholder','검색');
    //     $('.topsearch-en>input').attr('placeholder','Search');
    // } else if(windowWidth1023.matches){
    //     $('.topsearch>input').attr('placeholder','검색을 입력하세요');
    //     $('.topsearch-en>input').attr('placeholder','Search');
    // };

    /* pc 다크모드 */
    $('.darkmodeBg').click(function (){

        $('*').toggleClass('dark');

        $('.auctionTab-btn').click(function () {
            const darkIngTab = $(this).index();
            $('.auctionTab-btn').removeClass('dark');
            $('.auctionTab-contents').removeClass('dark');

            $(this).addClass('dark');
            $(".auctionTab-contents").eq(darkIngTab).addClass('dark');
        });

        $('.darktxt').text('다크모드로 보기');
        $('.darktxt.dark').text('라이트모드로 보기');
        $('.darktxt-en').text('Dark Mode');
        $('.darktxt-en.dark').text('Light Mode');

        const theme = localStorage.getItem('theme');
        if (theme) {
            localStorage.removeItem('theme');
        } else {
            localStorage.setItem('theme', 'dark');
        }
    });

    /* mobile 다크모드 */
    $('.modebox').click(function () {
        if ($('.mode-toggle>input').is(":checked")) {
            $('*').addClass('dark');
        } else {
            $('*').removeClass('dark');
        }

        const theme = localStorage.getItem('theme');
        if (theme) {
            localStorage.removeItem('theme');
        } else {
            localStorage.setItem('theme', 'dark');
        }
    });  
});

/* 새로고침 */
// window.onresize=function(){
//     document.location.reload(); 
// }

//경매 회차 필터
function localeOrdinal(n, l) {
    if(!l) l = locale;
    if (n != "" && typeof n != 'undefined')
    {
        if(l == "ko" ) return "제" + n + "회 ";

        var s = ["th","st","nd","rd"],
            v = n % 100;

        return n+(s[(v-20)%10]||s[v]||s[0]);
    }else{
        return "";
    }
}
//json 로캐일 별로 분기.
function localeValue(val){
    if (val === undefined) {
        return '';
    }
    return locale === 'ko' ? val.ko : val.en;
}
//오브젝트 비었나 확인.
function isNotObjectEmpty (param) {

    if(param === undefined){
        return false;
    }
    return param.constructor === Object && Object.keys(param).length !== 0;
}

/* 이미지 우클릭 방지 */
$(document).ready(function(){
    document.addEventListener("contextmenu", c=> {
        c.target.matches("img","gif","png") && c.preventDefault();
    });

    // 안드로이드 저장 막기
    // document.oncontextmenu="return false style='-webkit-touch-callout:none'";
});

//오브젝트 or 배열 비었는지 확인
function isNotObjectEmpty(param) {
    return Object.keys(param).length !== 0 && param.constructor === Object;
}
