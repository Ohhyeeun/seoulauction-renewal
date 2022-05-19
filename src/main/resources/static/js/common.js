$(function(){ 
    console.log(window.innerWidth);
    
    document.documentElement.clientWidth
    window.innerWidth
    window.outerWidth 
    
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
                $('.main-contents').css('margin-top','100px'); 
            });
            $(this).hasClass('main-header');  
        }); 
        
        /* 띠배너 beltbanner */ 
        $('.header_beltbox.on').show(function(){  
            $('.main-contents').css('margin-top','162px');
        }); 
        $('.beltclose-btn').click(function(){ 
            $('.main-contents').css('margin-top','100px');
        });     
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
            /*$('.gnb_submenuBg').animate({'right':'0','transition':'ease .3s'}); */
            $('.gnb_submenuBg').show();   
            $('.submenuBg').animate({'right':'0','transition':'ease .5s','display':'block'});
        });
        $('.submenuBg-closeBtn').click(function(){ 
            /*$('.gnb_submenuBg').animate({'right':'-100%','transition':'ease .5s'});*/ 
            $('.gnb_submenuBg').hide(); 
            $('.submenuBg').animate({'right':'-100%','transition':'ease .2s'});  
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
        
        /* 띠배너 beltbanner */ 
        $('.header_beltbox.on').show(function(){  
            $('.main-contents').css('margin-top','100px'); 
        }); 
        $('.beltclose-btn').click(function(){ 
            $('.main-contents').css('margin-top','56px');
        }); 
    } 
    
    /* utility menu */
    /*$('.utility-join').hide();
    $('.utility-login').hide();  
    $('.gnb_join').hide(); 
    $('.gnb_login').hide();*/
    $('.utility-icon').hide(); 
    
    $('.utility-icon.on').show();
    
    /* 모바일 gnb 유틸리티 */
    /*$('.gnb_logout').click(function(){
        $('.gnb_join').show();  
        $('.gnb_member').hide(); 
        $('.gnb_login').show();  
        $(this).hide(); 
    });*/
    
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
        $('.innerfooter').removeClass('on');
        $(this).removeClass('on'); 
        $('.innerfooter').eq(familyH).addClass('on')
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

/* login 팝업 */
(function() {
    var popup_idsearch1 = $(".js-popup_idsearch1").trpLayerFixedPopup("#popup_idsearch1-wrap");
    $(popup_idsearch1.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_idsearch1.open(this); // or false   
        popup_fixation("#popup_idsearch1-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_idsearch1-wrap .js-closepop, #popup_idsearch1-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_idsearch1.close();
    });
})(); 

(function() { 
    var popup_idsearch2 = $(".js-popup_idsearch2").trpLayerFixedPopup("#popup_idsearch2-wrap");
    $(popup_idsearch2.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_idsearch2.open(this); // or false   
        popup_fixation("#popup_idsearch2-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_idsearch2-wrap .js-closepop, #popup_idsearch2-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_idsearch2.close();
        popup_motion_close("#popup_idsearch2-wrap"); //  mb 모션 
    });
})();

(function() {
    var popup_idsearch3 = $(".js-popup_idsearch3").trpLayerFixedPopup("#popup_idsearch3-wrap");
    $(popup_idsearch3.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_idsearch3.open(this); // or false   
        //popup_fixation("#popup_idsearch3-wrap");    // pc_하단붙이기
        //popup_motion_open("#popup_idsearch3-wrap");  // mb 모션 
    });

    $("body").on("click", "#popup_idsearch3-wrap .js-closepop, #popup_idsearch3-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_idsearch3.close();
        //popup_motion_close("#popup_idsearch3-wrap");  //  mb 모션 
    }); 
})();

(function() {
    var popup_idsearch4 = $(".js-popup_idsearch4").trpLayerFixedPopup("#popup_idsearch4-wrap");
    $(popup_idsearch4.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_idsearch4.open(this); // or false   
        popup_fixation("#popup_idsearch4-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_idsearch4-wrap .js-closepop, #popup_idsearch4-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_idsearch4.close();
    });
})();

(function() {
    var popup_pwsearch1 = $(".js-popup_pwsearch1").trpLayerFixedPopup("#popup_pwsearch1-wrap");
    $(popup_pwsearch1.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_pwsearch1.open(this); // or false   
        popup_fixation("#popup_pwsearch1-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_pwsearch1-wrap .js-closepop, #popup_pwsearch1-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch1.close();
    });
})(); 

(function() { 
    var popup_pwsearch2 = $(".js-popup_pwsearch2").trpLayerFixedPopup("#popup_pwsearch2-wrap");
    $(popup_pwsearch2.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_pwsearch2.open(this); // or false   
        popup_fixation("#popup_pwsearch2-wrap"); // pc_하단붙이기
    });


    $("body").on("click", "#popup_pwsearch2-wrap .js-closepop, #popup_pwsearch2-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch2.close();
    });
})();

(function() {
    var popup_pwsearch3 = $(".js-popup_pwsearch3").trpLayerFixedPopup("#popup_pwsearch3-wrap");
    $(popup_pwsearch3.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_pwsearch3.open(this); // or false   
        popup_fixation("#popup_pwsearch3-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_pwsearch3-wrap .js-closepop, #popup_pwsearch3-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch3.close();
    });
})();

(function() {
    var popup_pwsearch4 = $(".js-popup_pwsearch4").trpLayerFixedPopup("#popup_pwsearch4-wrap");
    $(popup_pwsearch4.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_pwsearch4.open(this); // or false   
        popup_fixation("#popup_pwsearch4-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_pwsearch4-wrap .js-closepop, #popup_pwsearch4-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch4.close();
    });
})(); 

(function() {
    var popup_pwsearch5 = $(".js-popup_pwsearch5").trpLayerFixedPopup("#popup_pwsearch5-wrap");
    $(popup_pwsearch5.getBtn).on("click", function($e) {
        $e.preventDefault();
        console.log("open11")
        popup_pwsearch5.open(this); // or false 
        popup_fixation("#popup_pwsearch5-wrap"); // pc 하단 붙이기
    });

    $("body").on("click", "#popup_pwsearch5-wrap .js-closepop, #popup_pwsearch5-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch5.close();
    });

})(); 

(function() {
    var popup_pwsearch6 = $(".js-popup_pwsearch6").trpLayerFixedPopup("#popup_pwsearch6-wrap");
    $(popup_pwsearch6.getBtn).on("click", function($e) {
        $e.preventDefault();
        console.log("open11")
        popup_pwsearch6.open(this); // or false 
        popup_fixation("#popup_pwsearch6-wrap"); // pc 하단 붙이기
    });

    $("body").on("click", "#popup_pwsearch6-wrap .js-closepop, #popup_pwsearch6-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch6.close();
    });
})(); 

(function() {
    var popup_pwsearch6 = $(".js-popup_pwsearch6").trpLayerFixedPopup("#popup_pwsearch6-wrap");
    $(popup_pwsearch6.getBtn).on("click", function($e) {
        $e.preventDefault();
        console.log("open11")
        popup_pwsearch6.open(this); // or false 
        popup_fixation("#popup_pwsearch6-wrap"); // pc 하단 붙이기
    });

    $("body").on("click", "#popup_pwsearch6-wrap .js-closepop, #popup_pwsearch6-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_pwsearch6.close(); 
    }); 
})();  

(function() {  
    var popup_concurrent = $(".js-popup_concurrent").trpLayerFixedPopup("#popup_concurrent-wrap");
    $(popup_concurrent.getBtn).on("click", function($e) {
        $e.preventDefault();
        popup_concurrent.open(this); // or false   
        popup_fixation("#popup_concurrent-wrap"); // pc_하단붙이기
    });

    $("body").on("click", "#popup_concurrent-wrap .js-closepop, #popup_concurrent-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_concurrent.close();
    });
})()