$(function(){

    const locale = document.documentElement.lang;
    const sleep = (ms) => new Promise(resolve => { setTimeout(resolve, ms) });

    console.log(window.innerWidth);

    //진행중 경매리스트
    loadIngAuctionList();

    //gnb메뉴 now표시
    setGnbNowBadge();

    //마이페이지 확장메뉴 now표시
    if(sessionStorage.getItem("is_login") === "true"){
        setMyMenuBadge();
    }

    function loadIngAuctionList(){

        axios.get('api/main/ingAuctions')
            .then(function(response){
                const success =  response.data.success;
                if (success) {
                    const ingAuctionList = response.data.data;
                    ingAuctionList.map(item => {
                        const titleJSON = JSON.parse(item.TITLE_BLOB);
                        const returnDom = `<a href="/auction/${item.SALE_NO}" class="Ingbanner" target="_blank">
                                            <figure class="border-txt-darkg Ingbanner-img">
                                                <img src="https://www.seoulauction.com/nas_img/${item.FILE_PATH}/thum/${item.FILE_NAME}" alt="ing_auction01">
                                            </figure>
                                            <div class="Ingbanner-txt text-over">
                                                <span class="auctionKind-box Ingkind-auction ${item.SALE_KIND === 'LIVE' ? 'on' : ''}">${item.SALE_KIND}</span>
                                                  <p class="text-over">${titleJSON[locale]}</p>
                                                <span class="Ingbanner-arrow"></span>
                                            </div>
                                        </a>`;

                        document.querySelector(".Ingbanner-box").insertAdjacentHTML('beforeend', returnDom);
                    });

                }
            })
            .catch(function(error){
                console.log(error);
            });
    }

    function setGnbNowBadge(){


        axios.get('api/main/ingMenuCount')
            .then(function(response){
                const success =  response.data.success;
                if (success) {
                    const menuCount = response.data.data[0];
                    const badgeHtml = '<span class="currentIng">NOW</span>';
                    if(menuCount.AuctionCount > 0)
                        document.querySelector('#menu_auction').insertAdjacentHTML('beforeend', badgeHtml);
                    if(menuCount.UpcomingCount > 0)
                        document.querySelector('#menu_upcoming').insertAdjacentHTML('beforeend', badgeHtml);
                    if(menuCount.ExhibitionCount > 0)
                        document.querySelector('#menu_exhibit').insertAdjacentHTML('beforeend', badgeHtml);
                    if(menuCount.AcademyCount > 0)
                        document.querySelector('#menu_academy').insertAdjacentHTML('beforeend', badgeHtml);
                }
            })
            .catch(function(error){
                console.log(error);
            });
    }

    function setMyMenuBadge(){

        axios.get('api/main/isHaveToPayWorkExist')
            .then(function(response){
                const success =  response.data.success;
                if (success) {
                    const isExist = response.data.data.isExist;
                    const badgeHtml = '<i class="utility-icon on"></i>';
                    console.log(isExist)
                    if(isExist)
                        document.querySelector('#MyMenuOnlineBadge a').insertAdjacentHTML('beforeend', badgeHtml);
                }
            })
            .catch(function(error){
                console.log(error);
            });
    }

    window.addEventListener('resize', (e) => {
        const width = e.target.innerWidth;
        if (width > 1280) {
            console.log(76767);
            //$('.topsearch>input').attr('placeholder','작가 또는 작품명 검색');
        } else if (width > 720) {
            console.log(35256);
            //$('.topsearch>input').attr('placeholder','검색');
        } else {
            //$('.topsearch>input').attr('placeholder','검색을 입력하세요.');
        }
    });

    /* pc 다크모드 */
    $('.darkmodeBg').click(function(){
        console.log(32423);
        $('*').toggleClass('dark');

        $('.auctionTab-btn').click(function(){
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
    });

    /* mobile 다크모드 */
    $('.modebox').click(function(){
        if($('.mode-toggle>input').is(":checked")){
            $('*').addClass('dark');
        } else {
            $('*').removeClass('dark');
        }
    });

    /* 띠배너 */
    $('.beltclose-btn').click(function(){
        $('.header_beltbox').slideUp(400);
    });

    /*gnb menu */
    let gnb = $(this).index();
    if(matchMedia("all and (min-width: 1024px)").matches) {
        $('.submenuBg').show(function(){
            $('.main-contents').click(function(){
                $('.submenuBg').slideUp();
            });
        });

        $('.header_gnbmenu>li>a').mouseenter(function(){
            $('.header_gnbmenu>li>a').removeClass('on');
            $(".submenuBg").stop().slideDown();
            $(this).eq(gnb).addClass('on');
        });
        $(".submenuBg").mouseleave(function(){
            $(".submenuBg").stop().slideUp();
            $('.header_gnbmenu>li>a').removeClass('on');
        });
        $(".submenuBg").hide();

        /* main gnb fixed */
        $('.header').show(function(){
            $('.main-header').show(function(){
                /*$('.main-contents').css('top','118px'); */
                $('.main-contents').css('margin-top','120px');
            });
            $(this).hasClass('main-header');
        });

        // /* 띠배너 beltbanner */
        // $('.header_beltbox.on').show(function(){
        //     $('.main-contents').css('margin-top','180px');
        // });
        // $('.beltclose-btn').click(function(){
        //     $('.main-contents').css('margin-top','120px');
        // });
    } else { /* 테블릿 */
        /* 모바일 gnb */
        $('.header_gnbmenu>li>a').mouseenter(function(){
            return false;
        });
        $(".submenuBg").mouseleave(function(){
            return false;
        });
        /* mobile gnb bg */
        $('.m-gnbmenu').click(function(){
            $('.gnb_submenuBg').show();
            $('.submenuBg').animate({'right':'0','transition':'ease .5s','display':'block'});
        });
        $('.submenuBg-closeBtn').click(function(){
            $('.gnb_submenuBg').hide();
            $('.submenuBg').animate({'right':'-100%','transition':'ease .3s'});
        });

        /*$('.submenuBg').click(function(){
            $('.gnb_submenuBg').animate({'right':'-100%','transition':'ease .5s'});
            $('.submenuBg').animate({'right':'-100%','transition':'ease .3s'});
        }); */

        $('.subGnbmenu-tit').click(function(){
            let Mobilegnb = $(this).index();

            $('.gnbmenu_arrow>span').removeClass('on');
            $('.gnbmenu_arrow').removeClass('on');
            $('.submenu').stop().slideUp();


            $('.gnbmenu_arrow>span').eq(Mobilegnb).toggleClass('on');
            $('.gnbmenu_arrow').eq(Mobilegnb).addClass('on');
            $('.submenu').eq(Mobilegnb).stop().slideDown();

            $('.modebox').removeClass('on');
        });
        /* main gnb fixed */
        $('.header').show(function(){
            $('.main-header').show(function(){
                /*$('.main-contents').css('top','56px'); */
                $('.main-contents').css('margin-top','56px');
            });
            $(this).hasClass('main-header');
        });

        // /* 띠배너 beltbanner */
        // $('.header_beltbox.on').show(function(){
        //     /*$('.main-contents').css('top','99px');*/
        //     $('.main-contents').css('margin-top','101px');
        // });
        //
        // $('.beltclose-btn').click(function(){
        //     /*$('.main-contents').css('top','56px');*/
        //     $('.main-contents').css('margin-top','58px');
        // });
    }

    /* utility menu */
    /*$('.utility-join').hide();
    $('.utility-login').hide();
    $('.gnb_join').hide();
    $('.gnb_login').hide();*/

    /* 모바일 gnb 유틸리티 */
    $('.gnb_logout').click(function(){
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
    $('.utility-tab').mouseenter(function(){
        $(this).children('a').addClass('on');
        $('.bubble-box').removeClass('on');
        $(this).children('.bubble-box').eq(utilityMenu).addClass('on');
    });
    $('.bubble-box').mouseleave(function(){
        $(this).removeClass('on');
        $('.utility-lang>a').removeClass('on');
    });
    $('.utility-tab').mouseleave(function(){
        $(this).children('a').removeClass('on');
        $('.bubble-box').removeClass('on');
    });
    /* 최근검색 키워드 삭제 */
    $('.keyword-del').click(function(){
        $(this).parent('.recent-keyword').hide();
    });
    /* 최근검색 전체삭제 */
    $('.keyword-all-del').click(function(){
        $('.recent-keyword').hide();
        setCookie("keywordHistory", "", 1);
    });
    /* 모바일 gnb 서치*/
    $('.m-top-search').click(function(){
        $('.topsearch-box>form').animate({'right':'0','transition':'ease .5s'});
        //$('.topsearch-box>form').show();
        $('.topsearch>input').show();
        $('.topsearch-btn').show();
        $('.search-bubble-box').show();
    });
    $('.top-search-closeBtn').click(function(){
        $('.topsearch-box>form').animate({'right':'-100%','transition':'ease .5s'});
    });

    /*top search placeholder */
    const inWidth = window.innerWidth;
    if(inWidth > 1279) {
        $('.topsearch>input').attr('placeholder','작가 또는 작품명 검색');
        $('.topsearch-en>input').attr('placeholder','Search by artist or work name');
        $('.darkmodeBg').hover(function(){
            $('.darkmode').toggleClass('active');
        }, function(){
            $('.darkmode').toggleClass('active');
        });
        $('.darkmodeBg.dark').hover(function(){
            $('.darkmode.dark').toggleClass('active');
        }, function(){
            $('.darkmode.dark').toggleClass('active');
        });
    } else if(inWidth > 720) {
        $('.topsearch>input').attr('placeholder','검색');
        $('.topsearch-en>input').attr('placeholder','Search');
    } else {
        $('.topsearch>input').attr('placeholder','검색을 입력하세요');
        $('.topsearch-en>input').attr('placeholder','Search');
    };

    /* footer family site */
    $('.Familysite').click(function(){
        let familyH = $(this).index();
        $(this).removeClass('on');
        $('.Familysite').eq(familyH).addClass('on');
        $('.familyselect').toggle();
    });

    $('.familyselect>li>a').click(function(){
        $('.Familysite').removeClass('on');
        $('.familyselect').hide();
    });


});

/* scroll top */
$('.scroll-top').click(function(){
    $('html, body').animate({scrollTop: '0'}, 700);
});

/* top search 클릭 할 때 filter 기능 */
$('.topsearch-text').click(function(){
    $('.search-bubble-box').toggleClass('on');
});

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
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
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
    function popupOpen($this){           console.log(">>>  : " + $this);
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

app.requires.push.apply(app.requires, ["ngDialog", "checklist-model"]);
app.controller('headCtl', function($scope, consts, common, locale, $filter) {

    $scope.recommandSearch =  function(){

        //추천 검색어
        axios.get('/api/auction/selectRecommandArtist').then(function (response) {
            console.log(response);
            const success = response.data.success;

            $('.recommend-search-part').empty();

            if (success) {
                const data = response.data.data;
                let html = '<span class="keyword-search-tit">추천검색</span>';
                $('.recommend-search-part').append(html);
                data.map(item => {
                    let innerHtml = '<a href="/sale/search?searchContent=' + item.name + '" class="recommend-keyword">' + item.name + '</a>';
                    $('.recommend-search-part').append(innerHtml);
                });
            }
        }).catch(function (error) {
            console.log(error);
        });
    }
    // 최근 검색어
    let keywords = getCookie("keywordHistory");
    let html = '<span class="keyword-search-tit">최근검색<span class="keyword-all-del">전체삭제</span></span>';
    if(keywords){
        $(".recent-search").empty();
        let keywordsArray = keywords.split(',');
        $.each(keywordsArray , function(idx , el){
            html += '<span class="recent-keyword"><a href="/sale/search?searchContent='+ el +'">'+ el +'</a><span class="keyword-del"></span></span>';
        });

        $(".recent-search").append(html);
    }
});